#!/bin/bash

set -e
set -x

BDIR=~/llvm-build/llvm

cd $BDIR/runtimes/runtimes-bins

$BDIR/./bin/clang++ --target=x86_64-unknown-linux-gnu -fPIC -fno-semantic-interposition -fvisibility-inlines-hidden -Werror=date-time -Werror=unguarded-availability-new -Wall -Wextra -Wno-unused-parameter -Wwrite-strings -Wcast-qual -Wmissing-field-initializers -Wimplicit-fallthrough -Wcovered-switch-default -Wno-noexcept-type -Wnon-virtual-dtor -Wdelete-non-virtual-dtor -Wsuggest-override -Wstring-conversion -Wmisleading-indentation -Wctad-maybe-unsupported -fdiagnostics-color -ffunction-sections -fdata-sections -O3 -DNDEBUG -fuse-ld=lld -Wl,--color-diagnostics    -nostdlib -static libc/startup/gpu/amdgpu/CMakeFiles/libc.startup.gpu.amdgpu.crt1.dir/start.cpp.o libc/test/src/stdio/CMakeFiles/libc.test.src.stdio.snprintf_test.__hermetic__.__build__.dir/snprintf_test.cpp.o -o libc/test/src/stdio/libc.test.src.stdio.snprintf_test.__hermetic__.__build__  libc/test/UnitTest/libLibcTest.hermetic.a  libc/test/UnitTest/libLibcHermeticTestSupport.hermetic.a  libc/test/src/stdio/liblibc.test.src.stdio.snprintf_test.__hermetic__.libc.a  -mcpu=gfx1030  --target=amdgcn-amd-amdhsa  -flto  -Wl,-mllvm,-amdgpu-lower-global-ctor-dtor=0  -Wl,-mllvm,-amdhsa-code-object-version=4 -Wl,-save-temps

cp ./libc/test/src/stdio/libc.test.src.stdio.snprintf_test.__hermetic__.__build__.0.5.precodegen.bc .

$BDIR/bin/llvm-dis libc.test.src.stdio.snprintf_test.__hermetic__.__build__.0.5.precodegen.bc

echo "Errors?"
$BDIR/bin/llc -mcpu=gfx1030 libc.test.src.stdio.snprintf_test.__hermetic__.__build__.0.5.precodegen.bc

$BDIR/bin/opt  -mcpu=gfx1030 libc.test.src.stdio.snprintf_test.__hermetic__.__build__.0.5.precodegen.ll -expand-va-intrinsics-all -S -o post-expand.ll
