; ModuleID = 'bugpoint-reduced-simplified.bc'
source_filename = "llvm-link"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8"
target triple = "amdgcn-amd-amdhsa"

%"class.__llvm_libc::cpp::BlockStore" = type { %"struct.__llvm_libc::cpp::BlockStore<__llvm_libc::(anonymous namespace)::AtExitUnit, 32, true>::Block", ptr, i64 }
%"struct.__llvm_libc::cpp::BlockStore<__llvm_libc::(anonymous namespace)::AtExitUnit, 32, true>::Block" = type { [512 x i8], ptr }
%"struct.__llvm_libc::rpc::Client" = type { %"struct.__llvm_libc::rpc::Process" }
%"struct.__llvm_libc::rpc::Process" = type { i64, ptr, ptr, ptr, [64 x %"struct.__llvm_libc::cpp::Atomic"] }
%"struct.__llvm_libc::cpp::Atomic" = type { i32 }
%"struct.__llvm_libc::Mutex" = type { i8 }
%"struct.__llvm_libc::FileIOResult" = type <{ i64, i32, [4 x i8] }>
%"struct.__llvm_libc::rpc::Port" = type <{ ptr, i64, i64, i32, i8, i8, [2 x i8] }>



$_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE5closeEv = comdat any

@.str = private unnamed_addr addrspace(4) constant [15 x i8] c"what the hell\0A\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__llvm_libc_rpc_client = protected local_unnamed_addr addrspace(1) global ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE to ptr), align 8
@_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE = internal addrspace(1) global %"class.__llvm_libc::cpp::BlockStore" { %"struct.__llvm_libc::cpp::BlockStore<__llvm_libc::(anonymous namespace)::AtExitUnit, 32, true>::Block" zeroinitializer, ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE to ptr), i64 0 }, align 8
@__llvm_libc_clock_freq = protected local_unnamed_addr addrspace(4) global i64 0, align 8
@.str.3 = private unnamed_addr addrspace(4) constant [2 x i8] c"\0A\00", align 1
@_ZN11__llvm_libc3ptrE = hidden local_unnamed_addr addrspace(1) global ptr null, align 8
@_ZN11__llvm_libc3rpc6clientE = hidden addrspace(1) global %"struct.__llvm_libc::rpc::Client" zeroinitializer, align 8

@_ZN11__llvm_libcL5StdInE = internal addrspace(1) global { ptr, ptr, ptr, ptr, %"struct.__llvm_libc::Mutex", i8, ptr, i64, i32, i8, i32, i64, i8, i64, i8, i8, i64 } { ptr @_ZN11__llvm_libc12_GLOBAL__N_110write_funcEPNS_4FileEPKvm, ptr null, ptr null, ptr @_ZN11__llvm_libc12_GLOBAL__N_110close_funcEPNS_4FileE, %"struct.__llvm_libc::Mutex" undef, i8 0, ptr null, i64 0, i32 2, i8 0, i32 1, i64 0, i8 0, i64 0, i8 0, i8 0, i64 0 }, align 8
@_ZN11__llvm_libcL6StdOutE = internal addrspace(1) global { ptr, ptr, ptr, ptr, %"struct.__llvm_libc::Mutex", i8, ptr, i64, i32, i8, i32, i64, i8, i64, i8, i8, i64 } { ptr @_ZN11__llvm_libc12_GLOBAL__N_110write_funcEPNS_4FileEPKvm, ptr null, ptr null, ptr @_ZN11__llvm_libc12_GLOBAL__N_110close_funcEPNS_4FileE, %"struct.__llvm_libc::Mutex" undef, i8 0, ptr null, i64 0, i32 2, i8 0, i32 4, i64 0, i8 0, i64 0, i8 0, i8 0, i64 0 }, align 8
@_ZN11__llvm_libcL6StdErrE = internal addrspace(1) global { ptr, ptr, ptr, ptr, %"struct.__llvm_libc::Mutex", i8, ptr, i64, i32, i8, i32, i64, i8, i64, i8, i8, i64 } { ptr @_ZN11__llvm_libc12_GLOBAL__N_110write_funcEPNS_4FileEPKvm, ptr null, ptr null, ptr @_ZN11__llvm_libc12_GLOBAL__N_110close_funcEPNS_4FileE, %"struct.__llvm_libc::Mutex" undef, i8 0, ptr null, i64 0, i32 2, i8 0, i32 4, i64 0, i8 0, i64 0, i8 0, i8 0, i64 0 }, align 8



@_ZN11__llvm_libc6mallocEm = hidden alias ptr (i64), ptr @malloc

@_ZN11__llvm_libc4putsEPKc = hidden alias i32 (ptr), ptr @puts

; Function Attrs: noreturn nounwind
define hidden i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call i32 @puts(ptr noundef addrspacecast (ptr addrspace(4) @.str to ptr)) #20
  tail call void @llvm.trap()
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: nofree nounwind
define internal %"struct.__llvm_libc::FileIOResult" @_ZN11__llvm_libc12_GLOBAL__N_110write_funcEPNS_4FileEPKvm(ptr noundef readonly %f, ptr nocapture noundef readonly %data, i64 noundef %size) #2 {
  unreachable
}

; Function Attrs: nofree nounwind
define internal noundef i32 @_ZN11__llvm_libc12_GLOBAL__N_110close_funcEPNS_4FileE(ptr nocapture noundef readonly %file) #2 {
  unreachable
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare i64 @llvm.read_register.i64(metadata) #4

; Function Attrs: convergent nocallback nofree nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.ballot.i32(i1) #5

; Function Attrs: convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.wave.barrier() #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.cttz.i64(i64, i1 immarg) #7

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #7

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #7


; Function Attrs: nofree nounwind
define internal noundef ptr @malloc(i64 noundef %size) #2 {
  unreachable
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #12

; Function Attrs: nounwind
define internal noundef i32 @atexit(ptr noundef %callback) #10 {
entry:
  %0 = load i64, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 2), align 8, !tbaa !4
  %cmp.i.i.i = icmp eq i64 %0, 32
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %entry.if.end7_crit_edge.i.i.i

entry.if.end7_crit_edge.i.i.i:                    ; preds = %entry
  %.pre.i.i.i = load ptr, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 1), align 8, !tbaa !11
  br label %if.end7.i.i.i

if.then.i.i.i:                                    ; preds = %entry
  %call.i.i.i.i.i = tail call ptr @malloc(i64 noundef 520) #20
  %cmp.i.i.not.i.i.i = icmp eq ptr %call.i.i.i.i.i, null
  br i1 %cmp.i.i.not.i.i.i, label %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7new_objEv.exit.i.i, label %new.notnull.i.i.i

new.notnull.i.i.i:                                ; preds = %if.then.i.i.i
  br label %arrayinit.body.i.i.i.i

arrayinit.body.i.i.i.i:                           ; preds = %arrayinit.body.i.i.i.i, %new.notnull.i.i.i
  %arrayinit.cur.idx.i.i.i.i = phi i64 [ 1, %new.notnull.i.i.i ], [ %arrayinit.cur.add.i.i.i.i.6, %arrayinit.body.i.i.i.i ]

  %arrayinit.cur.add.i.i.i.i = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 1

  %arrayinit.cur.add.i.i.i.i.1 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 2

  %arrayinit.cur.add.i.i.i.i.2 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 3

  %arrayinit.cur.add.i.i.i.i.3 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 4

  %arrayinit.cur.add.i.i.i.i.4 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 5

  %arrayinit.cur.add.i.i.i.i.5 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 6

  %arrayinit.cur.add.i.i.i.i.6 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 7
  %arrayinit.done.i.i.i.i.6 = icmp eq i64 %arrayinit.cur.add.i.i.i.i.6, 512
  br i1 %arrayinit.done.i.i.i.i.6, label %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i, label %arrayinit.body.i.i.i.i

_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i: ; preds = %arrayinit.body.i.i.i.i
  %next.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::BlockStore<__llvm_libc::(anonymous namespace)::AtExitUnit, 32, true>::Block", ptr %call.i.i.i.i.i, i64 0, i32 1
  %1 = load ptr, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 1), align 8, !tbaa !11
  br label %if.end7.i.i.i

if.end7.i.i.i:                                    ; preds = %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i, %entry.if.end7_crit_edge.i.i.i
  %2 = phi i64 [ %0, %entry.if.end7_crit_edge.i.i.i ], [ 0, %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i ]
  %3 = phi ptr [ %.pre.i.i.i, %entry.if.end7_crit_edge.i.i.i ], [ %call.i.i.i.i.i, %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i ]
  %mul.i.i.i = shl i64 %2, 4
  %add.ptr.i.i.i = getelementptr inbounds i8, ptr %3, i64 %mul.i.i.i
  %inc.i.i.i = add i64 %2, 1
  br label %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7new_objEv.exit.i.i

_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7new_objEv.exit.i.i: ; preds = %if.end7.i.i.i, %if.then.i.i.i
  %retval.1.i.i.i = phi ptr [ %add.ptr.i.i.i, %if.end7.i.i.i ], [ null, %if.then.i.i.i ]
  %cmp.i.not.i = icmp eq ptr %retval.1.i.i.i, null
  br i1 %cmp.i.not.i, label %_ZN11__llvm_libcL15add_atexit_unitERKNS_12_GLOBAL__N_110AtExitUnitE.exit, label %if.end.i.i

if.end.i.i:                                       ; preds = %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7new_objEv.exit.i.i
  %ref.tmp.sroa.4.0.retval.1.i.i.i.sroa_idx = getelementptr inbounds i8, ptr %retval.1.i.i.i, i64 8
  br label %_ZN11__llvm_libcL15add_atexit_unitERKNS_12_GLOBAL__N_110AtExitUnitE.exit

_ZN11__llvm_libcL15add_atexit_unitERKNS_12_GLOBAL__N_110AtExitUnitE.exit: ; preds = %if.end.i.i, %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7new_objEv.exit.i.i
  %..i = sext i1 %cmp.i.not.i to i32
  ret i32 %..i
}



; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #14


; Function Attrs: cold nocallback nofree noreturn nounwind
declare void @llvm.amdgcn.endpgm() #18

; Function Attrs: mustprogress nounwind
define protected amdgpu_kernel void @_start(i32 noundef %argc, ptr noundef %argv, ptr noundef %envp, ptr nocapture noundef %ret) local_unnamed_addr #19 {
entry:
  ret void
}

; Function Attrs: nounwind
define internal noundef i32 @puts(ptr noalias noundef %str) #10 {
  unreachable
}


attributes #0 = { noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { nofree nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(read) }
attributes #5 = { convergent nocallback nofree nounwind willreturn memory(none) }
attributes #6 = { convergent nocallback nofree nounwind willreturn }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nocallback nofree nosync nounwind willreturn }
attributes #9 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #10 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #11 = { mustprogress nobuiltin nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #12 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #13 = { mustprogress noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #14 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #15 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #16 = { inlinehint mustprogress nofree nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #17 = { inlinehint mustprogress nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #18 = { cold nocallback nofree noreturn nounwind }
attributes #19 = { mustprogress nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #20 = { nobuiltin nounwind "no-builtins" }

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
!11 = !{!5, !9, i64 520}
