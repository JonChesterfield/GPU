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

# This shouldn't work - there are no unresolved symbols in the first file to justify linking files from the archive
# nevertheless it does, should raise a bug for that. Expected to need to say that _start was a required symbol
$IDIR/bin/clang++ $AMDGPU varargs.cpp libc.$ARCH.a -o varargs.gcn.out

# $IDIR/bin/llvm-nm --extern-only varargs.gcn.out

# This invocation might return non-zero
set +e
$LOADER varargs.gcn.out
RC=$?
set -e

echo "Varargs returned $RC"
exit $RC
