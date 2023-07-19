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
%"struct.__llvm_libc::rpc::Packet" = type { %"struct.__llvm_libc::rpc::Header", %"struct.__llvm_libc::rpc::Payload", [48 x i8] }
%"struct.__llvm_libc::rpc::Header" = type { i64, i16 }
%"struct.__llvm_libc::rpc::Payload" = type { [32 x %"struct.__llvm_libc::rpc::Buffer"] }
%"struct.__llvm_libc::rpc::Buffer" = type { [8 x i64] }
%"class.__llvm_libc::GPUFile" = type { %"class.__llvm_libc::File.base", i64 }
%"class.__llvm_libc::File.base" = type <{ ptr, ptr, ptr, ptr, %"struct.__llvm_libc::Mutex", i8, [6 x i8], ptr, i64, i32, i8, [3 x i8], i32, [4 x i8], i64, i8, [7 x i8], i64, i8, i8 }>
%"struct.__llvm_libc::rpc::Port" = type <{ ptr, i64, i64, i32, i8, i8, [2 x i8] }>
%"class.__llvm_libc::File" = type <{ ptr, ptr, ptr, ptr, %"struct.__llvm_libc::Mutex", i8, [6 x i8], ptr, i64, i32, i8, [3 x i8], i32, [4 x i8], i64, i8, [7 x i8], i64, i8, i8, [6 x i8] }>

$_ZN11__llvm_libc3rpc6Client4openILt1EEENS0_4PortILb0ENS0_6PacketILj32EEEEEv = comdat any

$_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE5closeEv = comdat any

@.str = private unnamed_addr addrspace(4) constant [15 x i8] c"what the hell\0A\00", align 1
@llvm.global_ctors = appending global [0 x { i32, ptr, ptr }] zeroinitializer
@__llvm_libc_rpc_client = protected local_unnamed_addr addrspace(1) global ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE to ptr), align 8
@_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE = internal addrspace(1) global %"class.__llvm_libc::cpp::BlockStore" { %"struct.__llvm_libc::cpp::BlockStore<__llvm_libc::(anonymous namespace)::AtExitUnit, 32, true>::Block" zeroinitializer, ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE to ptr), i64 0 }, align 8
@__llvm_libc_clock_freq = protected local_unnamed_addr addrspace(4) global i64 0, align 8
@.str.3 = private unnamed_addr addrspace(4) constant [2 x i8] c"\0A\00", align 1
@_ZN11__llvm_libc3ptrE = hidden local_unnamed_addr addrspace(1) global ptr null, align 8
@_ZN11__llvm_libc3rpc6clientE = hidden addrspace(1) global %"struct.__llvm_libc::rpc::Client" zeroinitializer, align 8
@_ZN11__llvm_libc5stdinE = hidden local_unnamed_addr addrspace(1) global ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libcL5StdInE to ptr), align 8
@_ZN11__llvm_libc6stdoutE = hidden local_unnamed_addr addrspace(1) global ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libcL6StdOutE to ptr), align 8
@_ZN11__llvm_libc6stderrE = hidden local_unnamed_addr addrspace(1) global ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libcL6StdErrE to ptr), align 8
@stdin = hidden local_unnamed_addr addrspace(1) global ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libcL5StdInE to ptr), align 8
@stderr = hidden local_unnamed_addr addrspace(1) global ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libcL6StdErrE to ptr), align 8
@stdout = hidden local_unnamed_addr addrspace(1) global ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libcL6StdOutE to ptr), align 8
@_ZN11__llvm_libcL5StdInE = internal addrspace(1) global { ptr, ptr, ptr, ptr, %"struct.__llvm_libc::Mutex", i8, ptr, i64, i32, i8, i32, i64, i8, i64, i8, i8, i64 } { ptr @_ZN11__llvm_libc12_GLOBAL__N_110write_funcEPNS_4FileEPKvm, ptr null, ptr null, ptr @_ZN11__llvm_libc12_GLOBAL__N_110close_funcEPNS_4FileE, %"struct.__llvm_libc::Mutex" undef, i8 0, ptr null, i64 0, i32 2, i8 0, i32 1, i64 0, i8 0, i64 0, i8 0, i8 0, i64 0 }, align 8
@_ZN11__llvm_libcL6StdOutE = internal addrspace(1) global { ptr, ptr, ptr, ptr, %"struct.__llvm_libc::Mutex", i8, ptr, i64, i32, i8, i32, i64, i8, i64, i8, i8, i64 } { ptr @_ZN11__llvm_libc12_GLOBAL__N_110write_funcEPNS_4FileEPKvm, ptr null, ptr null, ptr @_ZN11__llvm_libc12_GLOBAL__N_110close_funcEPNS_4FileE, %"struct.__llvm_libc::Mutex" undef, i8 0, ptr null, i64 0, i32 2, i8 0, i32 4, i64 0, i8 0, i64 0, i8 0, i8 0, i64 0 }, align 8
@_ZN11__llvm_libcL6StdErrE = internal addrspace(1) global { ptr, ptr, ptr, ptr, %"struct.__llvm_libc::Mutex", i8, ptr, i64, i32, i8, i32, i64, i8, i64, i8, i8, i64 } { ptr @_ZN11__llvm_libc12_GLOBAL__N_110write_funcEPNS_4FileEPKvm, ptr null, ptr null, ptr @_ZN11__llvm_libc12_GLOBAL__N_110close_funcEPNS_4FileE, %"struct.__llvm_libc::Mutex" undef, i8 0, ptr null, i64 0, i32 2, i8 0, i32 4, i64 0, i8 0, i64 0, i8 0, i8 0, i64 0 }, align 8

@_ZN11__llvm_libc6atexitEPFvvE = hidden alias i32 (ptr), ptr @atexit
@_ZN11__llvm_libc4exitEi = hidden alias void (i32), ptr @exit
@_ZN11__llvm_libc6mallocEm = hidden alias ptr (i64), ptr @malloc
@_ZN11__llvm_libc4freeEPv = hidden alias void (ptr), ptr @free
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

; Function Attrs: nounwind
define internal void @_ZN11__llvm_libc8internal19call_exit_callbacksEv() local_unnamed_addr #10 {
unreachable
}

; Function Attrs: mustprogress nobuiltin nounwind
define internal void @__llvm_libc_delete(ptr noundef %mem) local_unnamed_addr #11 {
entry:
  tail call void @free(ptr noundef %mem) #20
  ret void
}

; Function Attrs: nofree nounwind
define internal void @free(ptr noundef %ptr) #2 {
  unreachable
}

; Function Attrs: nofree nounwind
define internal noundef ptr @malloc(i64 noundef %size) #2 {
  unreachable
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #12

; Function Attrs: nounwind
define internal noundef i32 @atexit(ptr noundef %callback) #10 {
entry:
  %0 = load i64, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 2), align 8, !tbaa !94
  %cmp.i.i.i = icmp eq i64 %0, 32
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %entry.if.end7_crit_edge.i.i.i

entry.if.end7_crit_edge.i.i.i:                    ; preds = %entry
  %.pre.i.i.i = load ptr, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 1), align 8, !tbaa !98
  br label %if.end7.i.i.i

if.then.i.i.i:                                    ; preds = %entry
  %call.i.i.i.i.i = tail call ptr @malloc(i64 noundef 520) #20
  %cmp.i.i.not.i.i.i = icmp eq ptr %call.i.i.i.i.i, null
  br i1 %cmp.i.i.not.i.i.i, label %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7new_objEv.exit.i.i, label %new.notnull.i.i.i

new.notnull.i.i.i:                                ; preds = %if.then.i.i.i
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(520) %call.i.i.i.i.i, i8 0, i64 520, i1 false)
  br label %arrayinit.body.i.i.i.i

arrayinit.body.i.i.i.i:                           ; preds = %arrayinit.body.i.i.i.i, %new.notnull.i.i.i
  %arrayinit.cur.idx.i.i.i.i = phi i64 [ 1, %new.notnull.i.i.i ], [ %arrayinit.cur.add.i.i.i.i.6, %arrayinit.body.i.i.i.i ]
  %arrayinit.cur.ptr.i.i.i.i = getelementptr inbounds i8, ptr %call.i.i.i.i.i, i64 %arrayinit.cur.idx.i.i.i.i
  store i8 0, ptr %arrayinit.cur.ptr.i.i.i.i, align 1, !tbaa !112
  %arrayinit.cur.add.i.i.i.i = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 1
  %arrayinit.cur.ptr.i.i.i.i.1 = getelementptr inbounds i8, ptr %call.i.i.i.i.i, i64 %arrayinit.cur.add.i.i.i.i
  store i8 0, ptr %arrayinit.cur.ptr.i.i.i.i.1, align 1, !tbaa !112
  %arrayinit.cur.add.i.i.i.i.1 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 2
  %arrayinit.cur.ptr.i.i.i.i.2 = getelementptr inbounds i8, ptr %call.i.i.i.i.i, i64 %arrayinit.cur.add.i.i.i.i.1
  store i8 0, ptr %arrayinit.cur.ptr.i.i.i.i.2, align 1, !tbaa !112
  %arrayinit.cur.add.i.i.i.i.2 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 3
  %arrayinit.cur.ptr.i.i.i.i.3 = getelementptr inbounds i8, ptr %call.i.i.i.i.i, i64 %arrayinit.cur.add.i.i.i.i.2
  store i8 0, ptr %arrayinit.cur.ptr.i.i.i.i.3, align 1, !tbaa !112
  %arrayinit.cur.add.i.i.i.i.3 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 4
  %arrayinit.cur.ptr.i.i.i.i.4 = getelementptr inbounds i8, ptr %call.i.i.i.i.i, i64 %arrayinit.cur.add.i.i.i.i.3
  store i8 0, ptr %arrayinit.cur.ptr.i.i.i.i.4, align 1, !tbaa !112
  %arrayinit.cur.add.i.i.i.i.4 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 5
  %arrayinit.cur.ptr.i.i.i.i.5 = getelementptr inbounds i8, ptr %call.i.i.i.i.i, i64 %arrayinit.cur.add.i.i.i.i.4
  store i8 0, ptr %arrayinit.cur.ptr.i.i.i.i.5, align 1, !tbaa !112
  %arrayinit.cur.add.i.i.i.i.5 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 6
  %arrayinit.cur.ptr.i.i.i.i.6 = getelementptr inbounds i8, ptr %call.i.i.i.i.i, i64 %arrayinit.cur.add.i.i.i.i.5
  store i8 0, ptr %arrayinit.cur.ptr.i.i.i.i.6, align 1, !tbaa !112
  %arrayinit.cur.add.i.i.i.i.6 = add nuw nsw i64 %arrayinit.cur.idx.i.i.i.i, 7
  %arrayinit.done.i.i.i.i.6 = icmp eq i64 %arrayinit.cur.add.i.i.i.i.6, 512
  br i1 %arrayinit.done.i.i.i.i.6, label %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i, label %arrayinit.body.i.i.i.i

_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i: ; preds = %arrayinit.body.i.i.i.i
  %next.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::BlockStore<__llvm_libc::(anonymous namespace)::AtExitUnit, 32, true>::Block", ptr %call.i.i.i.i.i, i64 0, i32 1
  %1 = load ptr, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 1), align 8, !tbaa !98
  store ptr %1, ptr %next.i.i.i.i, align 8, !tbaa !97
  store ptr %call.i.i.i.i.i, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 1), align 8, !tbaa !98
  br label %if.end7.i.i.i

if.end7.i.i.i:                                    ; preds = %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i, %entry.if.end7_crit_edge.i.i.i
  %2 = phi i64 [ %0, %entry.if.end7_crit_edge.i.i.i ], [ 0, %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i ]
  %3 = phi ptr [ %.pre.i.i.i, %entry.if.end7_crit_edge.i.i.i ], [ %call.i.i.i.i.i, %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockC2Ev.exit.i.i.i ]
  %mul.i.i.i = shl i64 %2, 4
  %add.ptr.i.i.i = getelementptr inbounds i8, ptr %3, i64 %mul.i.i.i
  %inc.i.i.i = add i64 %2, 1
  store i64 %inc.i.i.i, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 2), align 8, !tbaa !94
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


; Function Attrs: mustprogress noreturn nounwind
define internal void @exit(i32 noundef %status) #14 {
  unreachable
}

; Function Attrs: mustprogress noreturn nounwind
define internal void @_ZN11__llvm_libc10quick_exitEi(i32 noundef %status) local_unnamed_addr #14 {
  unreachable
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #15

; Function Attrs: inlinehint nounwind
define internal %"struct.__llvm_libc::rpc::Port" @_ZN11__llvm_libc3rpc6Client4openILt1EEENS0_4PortILb0ENS0_6PacketILj32EEEEEv(ptr noundef nonnull align 8 dereferenceable(288) %this) local_unnamed_addr #16 comdat align 2 {
entry:
  unreachable
}

; Function Attrs: inlinehint mustprogress nofree nounwind
define internal fastcc void @"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE13send_and_recvIZNS_10quick_exitEiE3$_0ZNS_10quick_exitEiE3$_1EEvT_T0_"(ptr nocapture noundef nonnull align 8 dereferenceable(30) %this) unnamed_addr #17 align 2 {
  unreachable
}

; Function Attrs: inlinehint mustprogress nofree nounwind
define internal fastcc void @"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_10quick_exitEiE3$_2EEvT_"(ptr nocapture noundef nonnull align 8 dereferenceable(30) %this, ptr nocapture readonly %fill.coerce) unnamed_addr #17 align 2 {
  unreachable
}

; Function Attrs: inlinehint mustprogress nounwind
define internal void @_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(30) %this) local_unnamed_addr #18 comdat align 2 {
unreachable
}

; Function Attrs: cold nocallback nofree noreturn nounwind
declare void @llvm.amdgcn.endpgm() #19

; Function Attrs: mustprogress nounwind
define protected amdgpu_kernel void @_start(i32 noundef %argc, ptr noundef %argv, ptr noundef %envp, ptr nocapture noundef %ret) local_unnamed_addr #13 {
entry:
  %ret.global = addrspacecast ptr %ret to ptr addrspace(1)
  %call = tail call i32 @main(i32 noundef %argc, ptr noundef %argv, ptr noundef %envp) #20
  %0 = atomicrmw or ptr addrspace(1) %ret.global, i32 %call monotonic, align 4
  ret void
}

; Function Attrs: nounwind
define internal noundef i32 @puts(ptr noalias noundef %str) #10 {
unreachable
}

; Function Attrs: nounwind
define internal %"struct.__llvm_libc::FileIOResult" @_ZN11__llvm_libc4File14write_unlockedEPKvm(ptr noundef nonnull align 8 dereferenceable(98) %this, ptr noundef %data, i64 noundef %len) local_unnamed_addr #10 align 2 {
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
attributes #13 = { mustprogress nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #14 = { mustprogress noreturn nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #15 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #16 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #17 = { inlinehint mustprogress nofree nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #18 = { inlinehint mustprogress nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx1010" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dpp,+gfx10-insts,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+wavefrontsize32" }
attributes #19 = { cold nocallback nofree noreturn nounwind }
attributes #20 = { nobuiltin nounwind "no-builtins" }
attributes #21 = { convergent }
attributes #22 = { builtin nobuiltin nounwind "no-builtins" }
attributes #23 = { nounwind }
attributes #24 = { nobuiltin "no-builtins" }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!llvm.linker.options = !{}

!0 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git f717c2d4f2b7663317e46af069aaf88edca760de)"}
!1 = !{i32 1, !"amdgpu_code_object_version", i32 400}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 8, !"PIC Level", i32 2}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !11, i64 0}
!9 = !{!"_ZTSN11__llvm_libc3rpc6ClientE", !10, i64 0}
!10 = !{!"_ZTSN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEEE", !11, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !6, i64 32}
!11 = !{!"long long", !6, i64 0}
!12 = !{!13}
!13 = distinct !{!13, !14, !"_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv: %agg.result"}
!14 = distinct !{!14, !"_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv"}
!15 = !{!"exec"}
!16 = !{!10, !5, i64 8}
!17 = !{!10, !5, i64 16}
!18 = !{i64 0, i64 65}
!19 = !{!9, !5, i64 24}
!20 = !{!21, !23, i64 8}
!21 = !{!"_ZTSN11__llvm_libc3rpc6PacketILj32EEE", !22, i64 0, !24, i64 16}
!22 = !{!"_ZTSN11__llvm_libc3rpc6HeaderE", !11, i64 0, !23, i64 8}
!23 = !{!"short", !6, i64 0}
!24 = !{!"_ZTSN11__llvm_libc3rpc7PayloadILj32EEE", !6, i64 0}
!25 = !{!21, !11, i64 0}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.mustprogress"}
!28 = distinct !{!28, !27}
!29 = !{!10, !5, i64 24}
!30 = !{!11, !11, i64 0}
!31 = !{!32}
!32 = distinct !{!32, !33, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %dst"}
!33 = distinct !{!33, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm"}
!34 = !{!35}
!35 = distinct !{!35, !33, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %src"}
!36 = !{!37, !37, i64 0}
!37 = !{!"_ZTSN11__llvm_libc3cpp4byteE", !6, i64 0}
!38 = distinct !{!38, !27, !39}
!39 = !{!"llvm.loop.unroll.disable"}
!40 = distinct !{!40, !27}
!41 = !{!42}
!42 = distinct !{!42, !43, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %dst"}
!43 = distinct !{!43, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm"}
!44 = !{!45}
!45 = distinct !{!45, !43, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %src"}
!46 = distinct !{!46, !27}
!47 = !{!48, !48, i64 0}
!48 = !{!"int", !6, i64 0}
!49 = !{!50}
!50 = distinct !{!50, !51, !"_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv: %agg.result"}
!51 = distinct !{!51, !"_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv"}
!52 = distinct !{!52, !27}
!53 = distinct !{!53, !27}
!54 = !{!55}
!55 = distinct !{!55, !56, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %dst"}
!56 = distinct !{!56, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm"}
!57 = !{!58}
!58 = distinct !{!58, !56, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %src"}
!59 = !{!60}
!60 = distinct !{!60, !61, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %dst"}
!61 = distinct !{!61, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm"}
!62 = !{!63}
!63 = distinct !{!63, !61, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %src"}
!64 = !{!65, !68, i64 104}
!65 = !{!"_ZTSN11__llvm_libc7GPUFileE", !66, i64 0, !68, i64 104}
!66 = !{!"_ZTSN11__llvm_libc4FileE", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !67, i64 32, !6, i64 33, !5, i64 40, !68, i64 48, !48, i64 56, !69, i64 60, !48, i64 64, !68, i64 72, !70, i64 80, !68, i64 88, !69, i64 96, !69, i64 97}
!67 = !{!"_ZTSN11__llvm_libc5MutexE"}
!68 = !{!"long", !6, i64 0}
!69 = !{!"bool", !6, i64 0}
!70 = !{!"_ZTSN11__llvm_libc4File6FileOpE", !6, i64 0}
!71 = !{!72}
!72 = distinct !{!72, !73, !"_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv: %agg.result"}
!73 = distinct !{!73, !"_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv"}
!74 = distinct !{!74, !27}
!75 = distinct !{!75, !27}
!76 = !{!68, !68, i64 0}
!77 = !{!78}
!78 = distinct !{!78, !79, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %dst"}
!79 = distinct !{!79, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm"}
!80 = !{!81}
!81 = distinct !{!81, !79, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %src"}
!82 = !{!83}
!83 = distinct !{!83, !84, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %dst"}
!84 = distinct !{!84, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm"}
!85 = !{!86}
!86 = distinct !{!86, !84, !"_ZN11__llvm_libc13inline_memcpyEPvPKvm: %src"}
!87 = !{!88}
!88 = distinct !{!88, !89, !"_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv: %agg.result"}
!89 = distinct !{!89, !"_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv"}
!90 = distinct !{!90, !27}
!91 = distinct !{!91, !27}
!92 = !{i64 0, i64 8, !4, i64 8, i64 8, !4}
!93 = !{i64 0, i64 8, !4}
!94 = !{!95, !68, i64 528}
!95 = !{!"_ZTSN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EEE", !96, i64 0, !5, i64 520, !68, i64 528}
!96 = !{!"_ZTSN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE5BlockE", !6, i64 0, !5, i64 512}
!97 = !{!96, !5, i64 512}
!98 = !{!95, !5, i64 520}
!99 = distinct !{!99, !27}
!100 = distinct !{!100, !27}
!101 = !{!102}
!102 = distinct !{!102, !103, !"_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv: %agg.result"}
!103 = distinct !{!103, !"_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv"}
!104 = distinct !{!104, !27}
!105 = distinct !{!105, !27}
!106 = !{!107}
!107 = distinct !{!107, !108, !"_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv: %agg.result"}
!108 = distinct !{!108, !"_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv"}
!109 = distinct !{!109, !27}
!110 = distinct !{!110, !27}
!111 = distinct !{!111, !27}
!112 = !{!6, !6, i64 0}
!113 = !{!114}
!114 = distinct !{!114, !115, !"_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv: %agg.result"}
!115 = distinct !{!115, !"_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv"}
!116 = distinct !{!116, !27}
!117 = distinct !{!117, !27}
!118 = !{!119, !69, i64 29}
!119 = !{!"_ZTSN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEEE", !5, i64 0, !11, i64 8, !11, i64 16, !48, i64 24, !69, i64 28, !69, i64 29}
!120 = !{i8 0, i8 2}
!121 = !{}
!122 = !{!119, !48, i64 24}
!123 = !{!119, !11, i64 16}
!124 = !{!119, !5, i64 0}
!125 = distinct !{!125, !27}
!126 = !{!119, !69, i64 28}
!127 = !{!119, !11, i64 8}
!128 = distinct !{!128, !27}
!129 = !{!66, !48, i64 64}
!130 = !{!66, !70, i64 80}
!131 = !{!66, !5, i64 0}
!132 = !{!66, !69, i64 97}
