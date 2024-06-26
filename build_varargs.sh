#!/bin/bash

set -x
set -e

IDIR=$HOME/llvm-install
BDIR=$HOME/llvm-build

DEBUG_IDIR=$HOME/llvm-build-debug/llvm

ARCH=gfx1030

LIBCNAME="libc.$ARCH.a"

# Quoting, looks like -I<install>/include/gpu-none-llvm is where the gpu libc headers are
# clang++ input.cpp --target=amdgcn-amd-amdhsa -mcpu=gfx1030 -flto libc.a start.cpp.o -o image -I<install>/include/gpu-none-llvm
# $(find -name amdhsa_loader) image
# The loader isn't installed, can dig it out of build

GCN="--target=amdgcn-amd-amdhsa -march=$ARCH -mcpu=$ARCH -Xclang -fconvergent-functions -nogpulib -ffreestanding -fno-builtin -fno-exceptions -fno-rtti -nostdinc  -Wl,-mllvm,-amdgpu-lower-global-ctor-dtor=0 -Xclang -mcode-object-version=4"
X64="-ffreestanding -fno-builtin -fno-exceptions -fno-rtti -nostdinc -mavx"
X86="-m32 -ffreestanding -fno-builtin -fno-exceptions -fno-rtti -nostdinc -mavx"

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

LUAIMPL="thirdparty/lua"
if [[ -d $LUAIMPL ]]
then
    echo "Using existing lua"
else
    echo "Cloning lua"
    git clone https://github.com/JonChesterfield/lua-bodge.git $LUAIMPL
    gcc -O2 $LUAIMPL/lua-amalgamation.c -lm -ldl -o lua
fi
LUA=./lua


$LUA varargs.lua &> varargs.cpp

$LUA varargs_pairs.lua &> varargs_pairs.cpp

EXPANDNONE="-expand-variadics-override=disable"

EXPANDALL="-expand-variadics-override=lowering"

PASSNAME="--passes=expand-variadics"

DEBUG="-g -gdwarf-4"
DEBUG=""

$IDIR/bin/clang++ $X64 $DEBUG -mllvm $EXPANDNONE varargs.cpp -O1 -emit-llvm -S -o varargs.x64.ll -Wno-varargs
$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs.x64.ll  -S -o varargs.lowered.x64.ll

$IDIR/bin/opt $EXPANDNONE -O2  varargs.lowered.x64.ll  -S -o varargs.opt.x64.ll

$IDIR/bin/clang++ $X64 $DEBUG varargs.opt.x64.ll -S -o varargs.x64.s
$IDIR/bin/clang++ $X64 $DEBUG varargs.opt.x64.ll -o varargs.x64.out

$IDIR/bin/clang++ $X64 $DEBUG -mllvm $EXPANDNONE varargs_pairs.cpp -O1 -emit-llvm -S -o varargs_pairs.x64.ll -Wno-varargs
$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs_pairs.x64.ll  -S -o varargs_pairs.lowered.x64.ll
$IDIR/bin/opt $EXPANDNONE -O2  varargs_pairs.lowered.x64.ll  -S -o varargs_pairs.opt.x64.ll
$IDIR/bin/clang++ $X64 $DEBUG varargs_pairs.opt.x64.ll -S -o varargs_pairs.x64.s
$IDIR/bin/clang++ $X64 $DEBUG varargs_pairs.opt.x64.ll -o varargs_pairs.x64.out

$IDIR/bin/clang++ $X86 $DEBUG -mllvm $EXPANDNONE varargs_pairs.cpp -O1 -emit-llvm -S -o varargs_pairs.x86.ll -Wno-varargs
$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs_pairs.x86.ll  -S -o varargs_pairs.lowered.x86.ll
$IDIR/bin/opt $EXPANDNONE -O2  varargs_pairs.lowered.x86.ll  -S -o varargs_pairs.opt.x86.ll
$IDIR/bin/clang++ $X86 $DEBUG varargs_pairs.opt.x86.ll -S -o varargs_pairs.x86.s
$IDIR/bin/clang++ $X86 $DEBUG varargs_pairs.opt.x86.ll -o varargs_pairs.x86.out


$IDIR/bin/clang++ $GCN $DEBUG -mllvm $EXPANDNONE varargs_pairs.cpp -O1 -emit-llvm -S -o varargs_pairs.gcn.ll -Wno-varargs
$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs_pairs.gcn.ll  -S -o varargs_pairs.lowered.gcn.ll
$IDIR/bin/opt $EXPANDNONE -O2  varargs_pairs.lowered.gcn.ll  -S -o varargs_pairs.opt.gcn.ll
$IDIR/bin/clang++ $GCN $DEBUG varargs_pairs.opt.gcn.ll -S -o varargs_pairs.gcn.s
$IDIR/bin/clang++ $GCN $DEBUG varargs_pairs.opt.gcn.ll -o varargs_pairs.gcn.out

set +e

./varargs_pairs.x64.out
RC=$?
echo "X64 ret $RC"

./varargs_pairs.x86.out
RC=$?
echo "X86 ret $RC"


exit 0

echo "$LOADER varargs_pairs.gcn.out"

set +e
./varargs.x64.out
RC=$?
set -e

echo "X64 ret $RC"

# build pairs first
$IDIR/bin/clang++ $GCN $DEBUG -mllvm $EXPANDNONE varargs_pairs.cpp -O1 -emit-llvm -S -o varargs_pairs.gcn.ll -Wno-varargs
$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs_pairs.gcn.ll  -S -o varargs_pairs.lowered.gcn.ll
$IDIR/bin/opt $EXPANDNONE -O1  varargs_pairs.lowered.gcn.ll  -S -o - &> varargs_pairs.opt.gcn.ll
$IDIR/bin/clang++ $GCN $DEBUG varargs_pairs.opt.gcn.ll -S -o varargs_pairs.gcn.s
$IDIR/bin/clang++ $GCN $DEBUG varargs_pairs.opt.gcn.ll $LIBCNAME -o varargs_pairs.gcn.out


ONLY_VARIADIC="-DEMIT_UNDEF_SYMBOLS=1 -DEMIT_MAIN_SYMBOL=0 -DEMIT_VARIADIC_SYMBOLS=1 -DEMIT_VALIST_SYMBOLS=0"

ONLY_VALIST="-DEMIT_UNDEF_SYMBOLS=1 -DEMIT_MAIN_SYMBOL=0 -DEMIT_VARIADIC_SYMBOLS=0 -DEMIT_VALIST_SYMBOLS=1"



# emit varidic&valist for comparison

$IDIR/bin/clang++ $GCN $DEBUG -mllvm $EXPANDNONE $ONLY_VARIADIC varargs_pairs.cpp -O1 -emit-llvm -S  -Wno-varargs -o varargs_pairs.variadic.gcn.ll

$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs_pairs.variadic.gcn.ll  -S -o varargs_pairs.variadic.lowered.gcn.ll
$IDIR/bin/opt $EXPANDNONE -O1  varargs_pairs.variadic.lowered.gcn.ll  -S -o - &> varargs_pairs.variadic.opt.gcn.ll
$IDIR/bin/clang++ $GCN $DEBUG varargs_pairs.variadic.opt.gcn.ll -S -o varargs_pairs.variadic.gcn.s

$IDIR/bin/clang++ $GCN $DEBUG -mllvm $EXPANDNONE $ONLY_VALIST varargs_pairs.cpp -O1 -emit-llvm -S  -Wno-varargs -o varargs_pairs.valist.gcn.ll

$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs_pairs.valist.gcn.ll  -S -o varargs_pairs.valist.lowered.gcn.ll
$IDIR/bin/opt $EXPANDNONE -O1  varargs_pairs.valist.lowered.gcn.ll  -S -o - &> varargs_pairs.valist.opt.gcn.ll
$IDIR/bin/clang++ $GCN $DEBUG varargs_pairs.valist.opt.gcn.ll -S -o varargs_pairs.valist.gcn.s


$IDIR/bin/clang++ $X64 $DEBUG -mllvm $EXPANDNONE $ONLY_VARIADIC varargs_pairs.cpp -O1 -emit-llvm -S  -Wno-varargs -o varargs_pairs.variadic.x64.ll

$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs_pairs.variadic.x64.ll  -S -o varargs_pairs.variadic.lowered.x64.ll
$IDIR/bin/opt $EXPANDNONE -O1  varargs_pairs.variadic.lowered.x64.ll  -S -o - &> varargs_pairs.variadic.opt.x64.ll
$IDIR/bin/clang++ $X64 $DEBUG varargs_pairs.variadic.opt.x64.ll -S -o varargs_pairs.variadic.x64.s

$IDIR/bin/clang++ $X64 $DEBUG -mllvm $EXPANDNONE $ONLY_VALIST varargs_pairs.cpp -O1 -emit-llvm -S  -Wno-varargs -o varargs_pairs.valist.x64.ll

$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs_pairs.valist.x64.ll  -S -o varargs_pairs.valist.lowered.x64.ll
$IDIR/bin/opt $EXPANDNONE -O1  varargs_pairs.valist.lowered.x64.ll  -S -o - &> varargs_pairs.valist.opt.x64.ll
$IDIR/bin/clang++ $X64 $DEBUG varargs_pairs.valist.opt.x64.ll -S -o varargs_pairs.valist.x64.s




# This shouldn't work - there are no unresolved symbols in the first file to justify linking files from the archive
# nevertheless it does, should raise a bug for that. Expected to need to say that _start was a required symbol
$IDIR/bin/clang++ $GCN $DEBUG -mllvm $EXPANDNONE varargs.cpp -O1 -emit-llvm -S -o varargs.gcn.ll -Wno-varargs
$IDIR/bin/opt $PASSNAME $EXPANDALL  varargs.gcn.ll  -S -o varargs.lowered.gcn.ll
$IDIR/bin/opt $EXPANDNONE -O1  varargs.lowered.gcn.ll  -S -o - &> varargs.opt.gcn.ll
$IDIR/bin/clang++ $GCN $DEBUG varargs.opt.gcn.ll -S -o varargs.gcn.s
$IDIR/bin/clang++ $GCN $DEBUG varargs.opt.gcn.ll $LIBCNAME -o varargs.gcn.out

# $IDIR/bin/llvm-nm --extern-only varargs.gcn.out



echo "Not going to try running the GCN one, tired of rebooting the machine"

echo "$LOADER varargs_pairs.gcn.out"
exit 0

# This invocation might return non-zero
set +e
$LOADER varargs.gcn.out
RC=$?
set -e

echo "GCN ret $RC"
exit $RC

