#!/bin/bash
set -x
set -e
set -o pipefail

DIR=$HOME/llvm-build/llvm
ARCH=`$DIR/bin/amdgpu-arch`

cd $DIR
# this doesn't build by default at present
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
                   -o libc.bc

$DIR/bin/clang --target=amdgcn-amd-amdhsa -march=$ARCH -mcpu=$ARCH -nogpulib -fno-exceptions -fno-rtti -ffreestanding main.c -emit-llvm -c -o main.bc

$DIR/bin/llvm-link main.bc libc.bc -o merged.bc

$DIR/bin/clang --target=amdgcn-amd-amdhsa -march=$ARCH -nogpulib merged.bc -o a.out

$DIR/runtimes/runtimes-bins/libc/utils/gpu/loader/amdgpu/amdhsa_loader a.out 



           
exit 0


LIBCGPU=`find $DIR -iname libcgpu.a`

$DIR/bin/clang-offload-packager $LIBCGPU --archive --image=file=libc.$ARCH.a,arch=$ARCH


mv libc.$ARCH.a tmp
cd tmp
$DIR/bin/llvm-ar x libc.$ARCH.a
$DIR/bin/llvm-link *.cpp.o -o libc.$ARCH.bc
