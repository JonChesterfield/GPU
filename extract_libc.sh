#!/bin/bash

# libcgpu.a is a collection of x64 binaries containing GPU code for convenience of openmp et al
# take it apart and splice in the start.cpp.o which is missing, thieved from the build tree
# as it isn't installed (which means libcgpu is not directly usable from install tree at present)
# The amdgpu loader isn't installed either, but that's a problem for the user of this libc.a

set -x
set -e

IDIR=$HOME/llvm-install
BDIR=$HOME/llvm-build

ARCH=gfx1030
TMPDIR="tmp_"$ARCH"_libc"
LIBCNAME="libc.$ARCH.a"

rm -rf $TMPDIR && mkdir $TMPDIR && cd $TMPDIR
$IDIR/bin/clang-offload-packager $IDIR/lib/libcgpu.a --image=file=$LIBCNAME,arch=$ARCH --archive

# will fail if multiple arch compiled, asked Joe why start isn't in the archive already

$IDIR/bin/llvm-ar r $LIBCNAME `find $BDIR -type f  -name start.cpp.o`

mv $LIBCNAME ../
rm -rf $TMPDIR
