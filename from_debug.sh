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

LIBCINC="-I$SDIR/libc -I$SDIR/libc/include -I$SDIR/libc/utils/gpu/loader"

clang++ -std=c++20 -O2 $LDFLAGS -I$HSAINC $LIBCINC $SDIR/libc/utils/gpu/loader/amdgpu/Loader.cpp $SDIR/libc/utils/gpu/loader/Main.cpp $SDIR/libc/utils/gpu/server/rpc_server.cpp -Wl,--rpath=$DIR/lib -o amdhsa_loader

LIBCFREESTANDINGINC="-nostdinc -I$DIR/runtimes/runtimes-bins/libc/include/ -I$DIR/lib/clang/18/include"



cd $DIR
# this doesn't build by default at present
# note: can't do this unless the build succeeded and stopped running, or ninja
# tries to do a bunch of different work
# todo: build start.cpp.o directly
# ninja -C runtimes/runtimes-bins libc.startup.gpu.amdgpu.crt1
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
$BITCODEDIR/src/__support/OSUtil/gpu/CMakeFiles/libc.src.__support.OSUtil.gpu.gpu_util.io.cpp.gfx1010.dir/io.cpp.o \
$BITCODEDIR/src/stdio/CMakeFiles/libc.src.stdio.snprintf.snprintf.cpp.gfx1010.dir/snprintf.cpp.o \
$BITCODEDIR/src/stdio/printf_core/CMakeFiles/libc.src.stdio.printf_core.printf_main.printf_main.cpp.gfx1010.dir/printf_main.cpp.o \
$BITCODEDIR/src/stdio/printf_core/CMakeFiles/libc.src.stdio.printf_core.converter.converter.cpp.gfx1010.dir/converter.cpp.o \
$BITCODEDIR/src/stdio/printf_core/CMakeFiles/libc.src.stdio.printf_core.parser.parser.cpp.gfx1010.dir/parser.cpp.o \
$BITCODEDIR/src/stdio/printf_core/CMakeFiles/libc.src.stdio.printf_core.writer.writer.cpp.gfx1010.dir/writer.cpp.o \
$BITCODEDIR/src/stdio/gpu/CMakeFiles/libc.src.stdio.gpu.fputs.fputs.cpp.gfx1010.dir/fputs.cpp.o \
$BITCODEDIR/src/stdio/gpu/CMakeFiles/libc.src.stdio.gpu.stdout.stdout.cpp.gfx1010.dir/stdout.cpp.o \
$BITCODEDIR/src/stdio/gpu/CMakeFiles/libc.src.stdio.gpu.stderr.stderr.cpp.gfx1010.dir/stderr.cpp.o \
                   -o libc.bc


# $DIR/bin/llvm-nm --demangle $BITCODEDIR/src/stdio/CMakeFiles/libc.src.stdio.snprintf.snprintf.cpp.gfx1010.dir/snprintf.cpp.o
# $BITCODEDIR/src/__support/File/CMakeFiles/libc.src.__support.File.file.file.cpp.gfx1010.dir/file.cpp.o \
# $BITCODEDIR/src/__support/File/gpu/CMakeFiles/libc.src.__support.File.gpu.gpu_file.file.cpp.gfx1010.dir/file.cpp.o \
# $BITCODEDIR/src/stdio/CMakeFiles/libc.src.stdio.puts.puts.cpp.gfx1010.dir/puts.cpp.o \



$DIR/bin/llvm-nm libc.bc --undefined-only --demangle

ARCH=gfx1010
#ARCH=`$DIR/bin/amdgpu-arch`

# main is hanging at O0 or O1

$IDIR/bin/clang++ $LIBCINC $LIBCFREESTANDINGINC -O2 --target=amdgcn-amd-amdhsa -march=$ARCH -mcpu=$ARCH -nogpulib -fno-exceptions -fno-rtti -ffreestanding main.cpp -emit-llvm -c -o main.bc


SYMBOLS='_start,_begin,_end,puts,snprintf,fputs,stdout,write_to_stderr,main,_ZN11__llvm_libc15write_to_stderrENS_3cpp11string_viewE'

$IDIR/bin/opt -passes='default<O2>,internalize,globaldce,adce,instcombine' --internalize-public-api-list=$SYMBOLS libc.bc -o libc.opt.bc

$DIR/bin/llvm-link main.bc libc.opt.bc -o merged.bc


$IDIR/bin/opt -O2 merged.bc -o merged.opt.bc

$IDIR/bin/opt -passes=expand-va-intrinsics merged.bc -o expanded.merged.bc
$IDIR/bin/opt -O2 expanded.merged.bc -o merged.opt.bc
# cp expanded.merged.bc merged.opt.bc


$IDIR/bin/llvm-dis merged.opt.bc

# $IDIR/bin/clang   --target=amdgcn-amd-amdhsa -march=$ARCH -nogpulib merged.opt.bc -o a.out -###

PRINT="-print-after-all -filter-print-funcs=main,_start"

$IDIR/bin/opt -passes='metarenamer' merged.opt.bc -o merged.renamed.bc
# $IDIR/bin/llc -O1 -mcpu=$ARCH merged.renamed.bc -filetype=obj -o renamed.O1.o $PRINT &> llc.O1
# $IDIR/bin/llc -O0 -mcpu=$ARCH merged.renamed.bc -filetype=obj -o renamed.O0.o $PRINT &> llc.O0

COMMON=`./lua common.lua llc.O0 llc.O1`
echo $COMMON

tail -n +$COMMON llc.O0 > llc.trunc.O0
tail -n +$COMMON llc.O1 > llc.trunc.O1

$IDIR/bin/llc -O1 -mcpu=$ARCH merged.renamed.bc -o renamed.O1.s
$IDIR/bin/llc -O0 -mcpu=$ARCH merged.renamed.bc -o renamed.O0.s


# hang at O0, works at O1, regardless of whether opt has already run passes on it
# shotgun killing passes to see if I can stumble on a single one that breaks things
$IDIR/bin/llvm-dis merged.opt.bc -o merged.opt.ll
$IDIR/bin/llc -O2 -mcpu=$ARCH merged.opt.bc -o merged.s

$IDIR/bin/llc -O2 -mcpu=$ARCH merged.opt.bc -filetype=obj -o merged.o


# don't run IR passes in the linker, got enough to debug already
$IDIR/bin/ld.lld merged.o --no-undefined -shared -o a.out


./amdhsa_loader a.out 

           
exit 0


# bugpoint stuff

$IDIR/bin/bugpoint merged.bc --safe-run-llc --safe-tool-args -mtriple=amdgcn-amd-amdhsa
$IDIR/bin/llvm-dis bugpoint-reduced-simplified.bc 

# changed functions to internal, deleted begin/end kernels
# globaldce helped

$IDIR/bin/llc -O1 -mcpu=$ARCH bugpoint-reduced-simplified.ll -o bugpoint.s
$IDIR/bin/opt -mtriple=amdgcn-amd-amdhsa -amdgpu-attributor bugpoint-reduced-simplified.ll 


# failed attempts to extract bitcode from libc
LIBCGPU=`find $DIR -iname libcgpu.a`

$DIR/bin/clang-offload-packager $LIBCGPU --archive --image=file=libc.$ARCH.a,arch=$ARCH


mv libc.$ARCH.a tmp
cd tmp
$DIR/bin/llvm-ar x libc.$ARCH.a
$DIR/bin/llvm-link *.cpp.o -o libc.$ARCH.bc
