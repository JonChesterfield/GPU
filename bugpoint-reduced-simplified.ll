target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8"
target triple = "amdgcn-amd-amdhsa"

%struct.foo = type { %struct.pluto, ptr, i64 }
%struct.pluto = type { [512 x i8], ptr }

@global.2 = internal addrspace(1) global %struct.foo { %struct.pluto zeroinitializer, ptr addrspacecast (ptr addrspace(1) @global.2 to ptr), i64 0 }

; Function Attrs: nounwind
define internal void @hoge(ptr noundef %arg)  {
bb:
  %load = load i64, ptr addrspace(1) getelementptr inbounds (%struct.foo, ptr addrspace(1) @global.2, i64 0, i32 2), align 8

  ret void
}

!0 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git f717c2d4f2b7663317e46af069aaf88edca760de)"}
