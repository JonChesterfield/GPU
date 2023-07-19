#!/bin/bash
set -x
set -e
set -o pipefail

SDIR=$HOME/llvm-project
IDIR=$HOME/llvm-install

DIR=$HOME/llvm-build/llvm


# Build the loader directly, much easier than winning the fight with libc cmake

# dlopened hsa is branching to 0 during hsa_init, so I guess lets not dlopen it
HSAINC="$SDIR/dynamic_hsa/include/" 
LDFLAGS="-ldl"

HSAINC="$SDIR/ROCR-Runtime/src/inc/"
HSALIBDIR="$IDIR/lib"
HSALIB="$HSALIBDIR/libhsa-runtime64.so"
LDFLAGS="$HSALIB -Wl,-rpath=$HSALIBDIR -lelf"

LIBCINC="-I$SDIR/libc -I$SDIR/libc/include -I$SDIR/libc/utils/gpu/loader "
clang++ -std=c++20 $LDFLAGS -I$HSAINC $LIBCINC $SDIR/libc/utils/gpu/loader/amdgpu/Loader.cpp $SDIR/libc/utils/gpu/loader/Main.cpp $SDIR/libc/utils/gpu/server/rpc_server.cpp -Wl,--rpath=$DIR/lib -o amdhsa_loader


cd $DIR
# this doesn't build by default at present
# note: can't do this unless the build succeeded and stopped running, or ninja
# tries to do a bunch of different work
# todo: build start.cpp.o directly
ninja -C runtimes/runtimes-bins libc.startup.gpu.amdgpu.crt1
cd -



BITCODEDIR=$DIR/runtimes/runtimes-bins/libc

$DIR/bin/llvm-link \
$BITCODEDIR/src/__support/RPC/CMakeFiles/libc.src.__support.RPC.rpc_client.rpc_client.cpp.gfx1010.dir/rpc_client.cpp.o \
$BITCODEDIR/src/stdlib/CMakeFiles/libc.src.stdlib.atexit.atexit.cpp.gfx1010.dir/atexit.cpp.o \
$BITCODEDIR/src/stdlib/CMakeFiles/libc.src.stdlib.exit.exit.cpp.gfx1010.dir/exit.cpp.o \
$BITCODEDIR/src/__support/OSUtil/gpu/CMakeFiles/libc.src.__support.OSUtil.gpu.gpu_util.quick_exit.cpp.gfx1010.dir/quick_exit.cpp.o \
$BITCODEDIR/startup/gpu/amdgpu/CMakeFiles/libc.startup.gpu.amdgpu.crt1.dir/start.cpp.o \
$BITCODEDIR/src/__support/CPP/CMakeFiles/libc.src.__support.CPP.new.new.cpp.gfx1010.dir/new.cpp.o \
$BITCODEDIR/src/stdlib/gpu/CMakeFiles/libc.src.stdlib.gpu.malloc.malloc.cpp.gfx1010.dir/malloc.cpp.o \
$BITCODEDIR/src/stdlib/gpu/CMakeFiles/libc.src.stdlib.gpu.free.free.cpp.gfx1010.dir/free.cpp.o \
$BITCODEDIR/src/stdio/CMakeFiles/libc.src.stdio.puts.puts.cpp.gfx1010.dir/puts.cpp.o \
$BITCODEDIR/src/__support/File/gpu/CMakeFiles/libc.src.__support.File.gpu.gpu_file.file.cpp.gfx1010.dir/file.cpp.o \
$BITCODEDIR/src/__support/File/CMakeFiles/libc.src.__support.File.file.file.cpp.gfx1010.dir/file.cpp.o \
 -o libc.bc

$DIR/bin/llvm-nm libc.bc --undefined-only --demangle

ARCH=gfx1010
#ARCH=`$DIR/bin/amdgpu-arch`

# main is hanging at O0 or O1

$IDIR/bin/clang -O2 --target=amdgcn-amd-amdhsa -march=$ARCH -mcpu=$ARCH -nogpulib -fno-exceptions -fno-rtti -ffreestanding main.c -emit-llvm -c -o main.bc

$DIR/bin/llvm-link main.bc libc.bc -o merged.bc

## O1 or O2 here blows up in the attributor
# 2.	Running pass 'AMDGPU Attributor' on module 'merged.bc'.
  #0 0x000000000311bbf7 llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) (/scratch/jon/llvm-build/llvm/bin/clang-17+0x311bbf7)
  #1 0x000000000311987e llvm::sys::RunSignalHandlers() (/scratch/jon/llvm-build/llvm/bin/clang-17+0x311987e)
  #2 0x000000000311c29f SignalHandler(int) Signals.cpp:0:0
  #3 0x00007f20f79ad140 __restore_rt (/lib/x86_64-linux-gnu/libpthread.so.0+0x13140)
  #4 0x0000000001061ea5 (anonymous namespace)::AMDGPUInformationCache::getConstantAccess(llvm::Constant const*) AMDGPUAttributor.cpp:0:0
  #5 0x00000000010620b4 (anonymous namespace)::AMDGPUInformationCache::getConstantAccess(llvm::Constant const*) AMDGPUAttributor.cpp:0:0
  #6 0x00000000010620b4 (anonymous namespace)::AMDGPUInformationCache::getConstantAccess(llvm::Constant const*) AMDGPUAttributor.cpp:0:0
  #7 0x00000000010620b4 (anonymous namespace)::AMDGPUInformationCache::getConstantAccess(llvm::Constant const*) AMDGPUAttributor.cpp:0:0
  #8 0x00000000010620b4 (anonymous namespace)::AMDGPUInformationCache::getConstantAccess(llvm::Constant const*) AMDGPUAttributor.cpp:0:0
  #9 0x00000000010620b4 (anonymous namespace)::AMDGPUInformationCache::getConstantAccess(llvm::Constant const*) AMDGPUAttributor.cpp:0:0
 #10 0x00000000010620b4 (anonymous namespace)::AMDGPUInformationCache::getConstantAccess(llvm::Constant const*) AMDGPUAttributor.cpp:0:0
# ...
#255 0x00000000010620b4 (anonymous namespace)::AMDGPUInformationCache::getConstantAccess(llvm::Constant const*) AMDGPUAttributor.cpp:0:0
# clang: error: unable to execute command: Segmentation fault

$IDIR/bin/clang  --target=amdgcn-amd-amdhsa -march=$ARCH -nogpulib merged.bc -o a.out


# $IDIR/bin/llc -O1 -mcpu=$ARCH merged.bc -o a.out




# $IDIR/bin/bugpoint merged.bc --safe-run-llc --safe-tool-args -mtriple=amdgcn-amd-amdhsa
# $IDIR/bin/llvm-dis bugpoint-reduced-simplified.bc 

# changed functions to internal, deleted begin/end kernels
# globaldce helped

# $IDIR/bin/llc -O1 -mcpu=$ARCH bugpoint-reduced-simplified.ll -o bugpoint.s
$IDIR/bin/opt -mtriple=amdgcn-amd-amdhsa -amdgpu-attributor bugpoint-reduced-simplified.ll 


exit 0



./amdhsa_loader a.out 



           
exit 0


LIBCGPU=`find $DIR -iname libcgpu.a`

$DIR/bin/clang-offload-packager $LIBCGPU --archive --image=file=libc.$ARCH.a,arch=$ARCH


mv libc.$ARCH.a tmp
cd tmp
$DIR/bin/llvm-ar x libc.$ARCH.a
$DIR/bin/llvm-link *.cpp.o -o libc.$ARCH.bc
