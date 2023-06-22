#!/bin/bash
set -x
set -e
set -o pipefail



RDIR=$HOME/llvm-install

if [[ -d "$RDIR" ]]
then
    echo "Using RDIR = $RDIR"
else
    RDIR=$(dirname $(dirname $(which clang)))
fi

if [[ -d "$RDIR" ]]
then
    echo "Using RDIR = $RDIR"
else
    echo "Failed to find a root toolchain directory"
    exit 1
fi


have_nvptx=0
if [ -e "/dev/nvidiactl" ]; then
    have_nvptx=1
fi

have_amdgcn=0
if [ -e "/dev/kfd" ]; then
    have_amdgcn=1
fi

if (($have_nvptx)); then
    if [[ -f "$RDIR/bin/llvm-omp-device-info" ]] ; then
        echo "Setting PTXGFX using llvm-omp-device-info"
        PTXGFX=`$RDIR/bin/llvm-omp-device-info | awk '/Compute Capabilities/{print "sm_"$3}'`
    else
        echo "No llvm-omp-device-info, disabling nvptx offloading"
        have_nvptx=0
    fi
fi

if (($have_amdgcn)); then
    if [[ -f "$RDIR/bin/amdgpu-arch" ]] ; then
        echo "Setting GCNGFX using amdgpu-arch"
        GCNGFX=`$RDIR/bin/amdgpu-arch | uniq`
    else
        echo "No amdgpu-arch, disabling amdgpu offloading"
        have_amdgcn=0
    fi
fi


PTXGFXNUM=$(echo "$PTXGFX" | sed 's/sm_//')
GCNGFXNUM=$(echo "$GCNGFX" | sed 's/gfx//')

MSGPACKINCLUDE="thirdparty/msgpack"
if [[ -d $MSGPACKINCLUDE ]]
then
    echo "Using existing msgpack"
else
    echo "Cloning msgpack"
    git clone https://github.com/jonchesterfield/msgpack.git $MSGPACKINCLUDE
fi

EVILUNITINCLUDE="thirdparty/EvilUnit"
if [[ -d $EVILUNITINCLUDE ]]
then
    echo "Using existing evilunit"
else
    echo "Cloning evilunit"
    git clone https://github.com/jonchesterfield/evilunit.git $EVILUNITINCLUDE
fi


CLANG="$RDIR/bin/clang"
CLANGXX="$RDIR/bin/clang++"
LLC="$RDIR/bin/llc"
DIS="$RDIR/bin/llvm-dis"
LINK="$RDIR/bin/llvm-link"
OPT="$RDIR/bin/opt"
NM="$RDIR/bin/llvm-nm"
EXTRACT="$RDIR/bin/llvm-extract"

HSAINC="$RDIR/hsa/include/"
HSALIBDIR="$RDIR/lib"
HSALIB="$HSALIBDIR/libhsa-runtime64.so" # $RDIR/lib/libomptarget.rtl.hsa.so"

LDFLAGS="$HSALIB -Wl,-rpath=$HSALIBDIR -lelf"

CXXVER='-std=c++20'
OPTLEVEL='-O0 -g -gdwarf-4 '

CXX="$CLANGXX $CXXVER $OPTLEVEL -Wall -Wextra "

AMDGPU="--target=amdgcn-amd-amdhsa -march=$GCNGFX -mcpu=$GCNGFX -Xclang -fconvergent-functions -nogpulib -ffreestanding -fno-builtin -fno-exceptions -fno-rtti -nostdinc -isystem $RDIR/include -isystem $RDIR/lib/clang/17/include"

$CXX token_allocate.cpp -o token_allocate.x64.exe && valgrind ./token_allocate.x64.exe

$CXX -g0 -O3 -DNDEBUG token_codegen.cpp -S -emit-llvm -o token_allocate.x64.ll

$LLC token_allocate.x64.ll -o token_allocate.x64.s

LIBCINC="-Ilibc -Ilibc/include -Ilibc/utils/gpu/loader "


$CXX $LDFLAGS -I$HSAINC $LIBCINC  libc/utils/gpu/loader/amdgpu/Loader.cpp libc/utils/gpu/loader/Main.cpp libc/utils/gpu/server/rpc_server.cpp -o amdgpu_loader.exe

# rpc.h is created from a rpc.h.def but ends up defining an enum

rm -rf build && mkdir -p build
$CXX $AMDGPU $LIBCINC libc/startup/gpu/amdgpu/start.cpp -c -emit-llvm -o build/amdgpu_start.bc


$CXX $AMDGPU $LIBCINC libc/src/stdlib/exit.cpp -c -emit-llvm -o build/exit.bc
$CXX $AMDGPU $LIBCINC libc/src/stdlib/atexit.cpp -c -emit-llvm -o build/atexit.bc
$CXX $AMDGPU $LIBCINC libc/src/__support/OSUtil/quick_exit.cpp -c -emit-llvm -o build/quick_exit.bc

$CXX $AMDGPU $LIBCINC libc/src/__support/OSUtil/gpu/io.cpp -c -emit-llvm -o build/io.bc

$CXX $AMDGPU $LIBCINC libc/src/__support/RPC/rpc_client.cpp -c -emit-llvm -o build/rpc_client.bc

$LINK build/amdgpu_start.bc build/exit.bc build/atexit.bc build/quick_exit.bc build/io.bc build/rpc_client.bc -o build/amdgpu.bc


$CXX $AMDGPU $LIBCINC main.cpp -c -emit-llvm -o build/main.bc

$CXX $AMDGPU build/main.bc build/amdgpu.bc -o main.exe
