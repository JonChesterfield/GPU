#!/bin/bash

set -x

LLVMDIR=~/llvm-build/llvm/bin
DSTDIR=~/llvm-project/llvm/test/CodeGen

SRCFILENAME=CodeGen/expand-variadic-call.c

clang_regen.sh $SRCFILENAME

SRCFILE=~/llvm-project/clang/test/$SRCFILENAME

CLANG=$LLVMDIR/clang

GENERIC="-std=c23 $SRCFILE -O1 -mllvm -expand-variadics-disable=true -emit-llvm -S -ffreestanding -nogpulib"


OUTSUBDIR=''
TRIPLE=''
TESTSUFFIX=''
TESTNAME=expand-variadic-call


func () {


OUTFILE=$OUTSUBDIR/$TESTNAME$TESTSUFFIX.ll
OUTFILEDIR=$DSTDIR/$OUTFILE
echo '; NOTE: Assertions have been autogenerated by utils/update_test_checks.py' > $OUTFILEDIR
echo '; RUN: opt -S --expand-variadics < %s | FileCheck %s' >> $OUTFILEDIR
$CLANG $GENERIC --target=$TRIPLE -o - | egrep -v 'source_filename|; ModuleID' | egrep -v 'llvm.ident|clang version' | egrep -v 'oclc_ABI_version' | egrep -v '; Function Attrs:' >> $OUTFILEDIR
llvm_regen.sh CodeGen/$OUTFILE
}

OUTSUBDIR=NVPTX
TRIPLE=nvptx64-nvidia-cuda
TESTSUFFIX=''
func

OUTSUBDIR=AMDGPU
TRIPLE=amdgcn-amd-amdhsa
TESTSUFFIX=''
func

OUTSUBDIR=X86
TRIPLE=i386-unknown-linux-gnu
TESTSUFFIX='-i386-linux'
func

OUTSUBDIR=X86
TRIPLE=x86_64-linux-gnu
TESTSUFFIX='-x64-linux'
func

OUTSUBDIR=X86
TRIPLE=x86_64-unknown-windows-msvc
TESTSUFFIX='-x64-msvc'
func

