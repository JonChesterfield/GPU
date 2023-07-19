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

$DIR/bin/llvm-link $DIR/runtimes/runtimes-bins/libc/src/__support/RPC/CMakeFiles/libc.src.__support.RPC.rpc_client.__internal__.dir/rpc_client.cpp.o $DIR/runtimes/runtimes-bins/libc/src/stdlib/CMakeFiles/libc.src.stdlib.atexit.__internal__.dir/atexit.cpp.o $DIR/runtimes/runtimes-bins/libc/src/stdlib/CMakeFiles/libc.src.stdlib.exit.__internal__.dir/exit.cpp.o $DIR/runtimes/runtimes-bins/libc/src/__support/OSUtil/gpu/CMakeFiles/libc.src.__support.OSUtil.gpu.gpu_util.__internal__.dir/quick_exit.cpp.o $DIR/runtimes/runtimes-bins/libc/startup/gpu/amdgpu/CMakeFiles/libc.startup.gpu.amdgpu.crt1.dir/start.cpp.o -o libc.bc

$DIR/bin/clang --target=amdgcn-amd-amdhsa -march=$ARCH -mcpu=$ARCH -nogpulib main.c -emit-llvm -c -o main.bc

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
