#!/bin/bash

set -x
set -e

IDIR=$HOME/llvm-install
BDIR=$HOME/llvm-build

ARCH=gfx1030

LIBCNAME="libc.$ARCH.a"

# Quoting, looks like -I<install>/include/gpu-none-llvm is where the gpu libc headers are
# clang++ input.cpp --target=amdgcn-amd-amdhsa -mcpu=gfx1030 -flto libc.a start.cpp.o -o image -I<install>/include/gpu-none-llvm
# $(find -name amdhsa_loader) image
# The loader isn't installed, can dig it out of build

AMDGPU="--target=amdgcn-amd-amdhsa -march=$ARCH -mcpu=$ARCH -Xclang -fconvergent-functions -nogpulib -ffreestanding -fno-builtin -fno-exceptions -fno-rtti -nostdinc  -Wl,-mllvm,-amdgpu-lower-global-ctor-dtor=0"
X64="-ffreestanding -fno-builtin -fno-exceptions -fno-rtti -nostdinc"

LOADER=$(find ~/llvm-build/ -type f -iname 'amdhsa_loader')

if [ ! -f "$LIBCNAME" ]
then
    echo "Try to make a libc.a"
    ./extract_libc.sh
fi

if [ ! -f "$LIBCNAME" ]
then
    echo "Missing libc"
    exit 1
fi

./varargs.lua &> varargs.cpp

EXPANDNONE="-expand-va-intrinsics-disable=true"
EXPANDALL="-expand-va-intrinsics-split=true -expand-va-intrinsics-calls=true -expand-va-intrinsics-operations=true -expand-va-intrinsics-abi=true"

$IDIR/bin/clang++ $X64 -g -gdwarf-4 -mllvm $EXPANDNONE varargs.cpp -O1 -emit-llvm -S -o varargs.x64.ll -Wno-varargs
$IDIR/bin/opt -expand-va-intrinsics $EXPANDALL  varargs.x64.ll  -S -o varargs.lowered.x64.ll
$IDIR/bin/opt $EXPANDNONE -O3  varargs.lowered.x64.ll  -S -o varargs.opt.x64.ll
$IDIR/bin/clang++ $X64 varargs.opt.x64.ll -S -o varargs.x64.s
$IDIR/bin/clang++ $X64 varargs.opt.x64.ll -o varargs.x64.out

set +e
./varargs.x64.out
RC=$?
set -e

echo "X64 ret $RC"

# This shouldn't work - there are no unresolved symbols in the first file to justify linking files from the archive
# nevertheless it does, should raise a bug for that. Expected to need to say that _start was a required symbol
$IDIR/bin/clang++ $AMDGPU -mllvm $EXPANDNONE varargs.cpp -O1 -emit-llvm -S -o varargs.gcn.ll -Wno-varargs
$IDIR/bin/opt -expand-va-intrinsics $EXPANDALL  varargs.gcn.ll  -S -o varargs.lowered.gcn.ll
$IDIR/bin/opt $EXPANDNONE -O3  varargs.lowered.gcn.ll  -S -o varargs.opt.gcn.ll
$IDIR/bin/clang++ $AMDGPU varargs.opt.gcn.ll -S -o varargs.gcn.s
$IDIR/bin/clang++ $AMDGPU varargs.opt.gcn.ll -o varargs.gcn.out

# $IDIR/bin/llvm-nm --extern-only varargs.gcn.out

# This invocation might return non-zero
set +e
$LOADER varargs.gcn.out
RC=$?
set -e

echo "GCN ret $RC"
exit $RC

