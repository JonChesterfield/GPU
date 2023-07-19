; ModuleID = 'bugpoint-reduced-simplified.ll'
source_filename = "llvm-link"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8"
target triple = "amdgcn-amd-amdhsa"

%struct.foo = type { %struct.pluto, ptr, i64 }
%struct.pluto = type { [512 x i8], ptr }



@global.2 = internal addrspace(1) global %struct.foo { %struct.pluto zeroinitializer, ptr addrspacecast (ptr addrspace(1) @global.2 to ptr), i64 0 }, align 8



; Function Attrs: nounwind
define internal noundef i32 @hoge(ptr noundef %arg) #2 {
bb:
  %load = load i64, ptr addrspace(1) getelementptr inbounds (%struct.foo, ptr addrspace(1) @global.2, i64 0, i32 2), align 8, !tbaa !4

  %icmp4 = icmp eq ptr null, null
  %icmp14 = icmp eq ptr null, null
  %sext = sext i1 %icmp14 to i32
  ret i32 %sext
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #3


attributes #0 = { noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #1 = { nofree nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nobuiltin nounwind "no-builtins" }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!llvm.linker.options = !{}

!0 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git f717c2d4f2b7663317e46af069aaf88edca760de)"}
!1 = !{i32 1, !"amdgpu_code_object_version", i32 400}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 8, !"PIC Level", i32 2}
!4 = !{!5, !10, i64 528}
!5 = !{!"_ZTSN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EEE", !6, i64 0, !9, i64 520, !10, i64 528}
!6 = !{!"_ZTSN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockE", !7, i64 0, !9, i64 512}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!"any pointer", !7, i64 0}
!10 = !{!"long", !7, i64 0}
