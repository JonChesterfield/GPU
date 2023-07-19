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
entry:
  %0 = load ptr, ptr addrspace(1) @_ZN11__llvm_libc6stdoutE, align 8, !tbaa !4
  %cmp = icmp eq ptr %0, %f
  br i1 %cmp, label %for.cond.i.i, label %if.else

for.cond.i.i:                                     ; preds = %cleanup.cont.i.i, %entry
  %p.sroa.9.0.i.i = phi i32 [ %p.sroa.9.1.i.i, %cleanup.cont.i.i ], [ undef, %entry ]
  %p.sroa.7.0.i.i = phi i64 [ %p.sroa.7.1.i.i, %cleanup.cont.i.i ], [ undef, %entry ]
  %p.sroa.5.0.i.i = phi i64 [ %p.sroa.5.1.i.i, %cleanup.cont.i.i ], [ undef, %entry ]
  %p.sroa.0.0.i.i = phi ptr [ %p.sroa.0.1.i.i, %cleanup.cont.i.i ], [ undef, %entry ]
  %retval.sroa.4.0.i.i = phi i32 [ %retval.sroa.4.1.i.i, %cleanup.cont.i.i ], [ undef, %entry ]
  %retval.sroa.3.0.i.i = phi i64 [ %retval.sroa.3.1.i.i, %cleanup.cont.i.i ], [ undef, %entry ]
  %retval.sroa.2.0.i.i = phi i64 [ %retval.sroa.2.1.i.i, %cleanup.cont.i.i ], [ undef, %entry ]
  %retval.sroa.0.0.i.i = phi ptr [ %retval.sroa.0.1.i.i, %cleanup.cont.i.i ], [ undef, %entry ]
  %1 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !12
  %cmp.not52.not.i.i.i = icmp eq i64 %1, 0
  br i1 %cmp.not52.not.i.i.i, label %for.end.i.i.i, label %for.body.lr.ph.i.i.i

for.body.lr.ph.i.i.i:                             ; preds = %for.cond.i.i
  %2 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %sh_prom.i.i.i.i = zext i32 %2 to i64
  %shl.i.i.i.i = shl nuw i64 1, %sh_prom.i.i.i.i
  br label %for.body.i.i.i

for.body.i.i.i:                                   ; preds = %for.inc.critedge.i.i.i, %for.body.lr.ph.i.i.i
  %index.053.i.i.i = phi i64 [ 0, %for.body.lr.ph.i.i.i ], [ %inc.i.i.i, %for.inc.critedge.i.i.i ]
  %3 = tail call i64 @llvm.read_register.i64(metadata !15) #21, !noalias !12
  %and.i.i.i.i = and i64 %3, %shl.i.i.i.i
  %tobool.i.i.i.i = icmp ne i64 %and.i.i.i.i, 0
  %arrayidx.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 4, i64 %index.053.i.i.i
  %conv.i.i.i.i = zext i1 %tobool.i.i.i.i to i32
  %4 = atomicrmw or ptr addrspace(1) %arrayidx.i.i.i.i, i32 %conv.i.i.i.i monotonic, align 4, !noalias !12
  %tobool4.i.i.i.i = icmp ne i32 %4, 0
  %5 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %tobool4.i.i.i.i)
  %conv.i.i.i.i.i = zext i32 %5 to i64
  %and.i.i.i.i.i = and i64 %3, %conv.i.i.i.i.i
  %cmp.i.not.i.i.i = icmp eq i64 %and.i.i.i.i.i, %3
  br i1 %cmp.i.not.i.i.i, label %for.inc.critedge.i.i.i, label %if.then.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %for.body.i.i.i
  fence acquire
  %6 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 1), align 8, !tbaa !16, !noalias !12
  %arrayidx.i41.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %6, i64 %index.053.i.i.i
  %7 = load atomic i32, ptr %arrayidx.i41.i.i.i monotonic, align 4, !noalias !12
  %8 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 2), align 8, !tbaa !17, !noalias !12
  %arrayidx.i42.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %8, i64 %index.053.i.i.i
  %9 = load atomic i32, ptr %arrayidx.i42.i.i.i monotonic, align 4, !noalias !12
  %cmp.i43.not.i.i.i = icmp eq i32 %7, %9
  br i1 %cmp.i43.not.i.i.i, label %if.end12.i.i.i, label %if.then10.i.i.i

if.then10.i.i.i:                                  ; preds = %if.then.i.i.i.i
  fence release
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !12
  %10 = tail call i64 @llvm.cttz.i64(i64 %3, i1 true), !range !18
  %iszero.i.i.i.i.i.i = icmp ne i64 %3, 0
  %cmp2.i.i.i.i.i = icmp eq i64 %10, %sh_prom.i.i.i.i
  %cmp.i.i.i.i.i = select i1 %iszero.i.i.i.i.i.i, i1 %cmp2.i.i.i.i.i, i1 false
  %cond.i.i.i.i = zext i1 %cmp.i.i.i.i.i to i32
  %not.i.i.i.i = xor i32 %cond.i.i.i.i, -1
  %11 = atomicrmw and ptr addrspace(1) %arrayidx.i.i.i.i, i32 %not.i.i.i.i monotonic, align 4, !noalias !12
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !12
  br label %for.inc.critedge.i.i.i

if.end12.i.i.i:                                   ; preds = %if.then.i.i.i.i
  %12 = tail call i64 @llvm.cttz.i64(i64 %3, i1 true), !range !18
  %iszero.i.i.i.i.i = icmp ne i64 %3, 0
  %cmp2.i.i.i.i = icmp eq i64 %12, %sh_prom.i.i.i.i
  %cmp.i47.i.i.i = select i1 %iszero.i.i.i.i.i, i1 %cmp2.i.i.i.i, i1 false
  br i1 %cmp.i47.i.i.i, label %if.then14.i.i.i, label %if.end20.i.i.i

if.then14.i.i.i:                                  ; preds = %if.end12.i.i.i
  %13 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 3), align 8, !tbaa !19, !noalias !12
  %opcode.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %13, i64 %index.053.i.i.i, i32 0, i32 1
  store i16 2, ptr %opcode.i.i.i, align 8, !tbaa !20, !noalias !12
  %arrayidx18.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %13, i64 %index.053.i.i.i
  store i64 %3, ptr %arrayidx18.i.i.i, align 64, !tbaa !25, !noalias !12
  br label %if.end20.i.i.i

if.end20.i.i.i:                                   ; preds = %if.then14.i.i.i, %if.end12.i.i.i
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !12
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i

for.inc.critedge.i.i.i:                           ; preds = %if.then10.i.i.i, %for.body.i.i.i
  %inc.i.i.i = add nuw i64 %index.053.i.i.i, 1
  %14 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !12
  %cmp.not.i.i.i = icmp ult i64 %inc.i.i.i, %14
  br i1 %cmp.not.i.i.i, label %for.body.i.i.i, label %for.end.i.i.i, !llvm.loop !26

for.end.i.i.i:                                    ; preds = %for.inc.critedge.i.i.i, %for.cond.i.i
  %15 = ptrtoint ptr %p.sroa.0.0.i.i to i64
  %p.sroa.0.0.insert.mask.i.i = and i64 %15, -256
  %16 = inttoptr i64 %p.sroa.0.0.insert.mask.i.i to ptr
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i

_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i: ; preds = %for.end.i.i.i, %if.end20.i.i.i
  %tobool.i.i.i.i.i = phi i1 [ false, %for.end.i.i.i ], [ true, %if.end20.i.i.i ]
  %p.sroa.9.1.i.i = phi i32 [ %p.sroa.9.0.i.i, %for.end.i.i.i ], [ %7, %if.end20.i.i.i ]
  %p.sroa.7.1.i.i = phi i64 [ %p.sroa.7.0.i.i, %for.end.i.i.i ], [ %index.053.i.i.i, %if.end20.i.i.i ]
  %p.sroa.5.1.i.i = phi i64 [ %p.sroa.5.0.i.i, %for.end.i.i.i ], [ %3, %if.end20.i.i.i ]
  %p.sroa.0.1.i.i = phi ptr [ %16, %for.end.i.i.i ], [ addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE to ptr), %if.end20.i.i.i ]
  br i1 %tobool.i.i.i.i.i, label %if.then.i.i, label %cleanup.i.i

if.then.i.i:                                      ; preds = %_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i
  br label %cleanup.i.i

cleanup.i.i:                                      ; preds = %if.then.i.i, %_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i
  %retval.sroa.4.1.i.i = phi i32 [ %p.sroa.9.1.i.i, %if.then.i.i ], [ %retval.sroa.4.0.i.i, %_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  %retval.sroa.3.1.i.i = phi i64 [ %p.sroa.7.1.i.i, %if.then.i.i ], [ %retval.sroa.3.0.i.i, %_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  %retval.sroa.2.1.i.i = phi i64 [ %p.sroa.5.1.i.i, %if.then.i.i ], [ %retval.sroa.2.0.i.i, %_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  %retval.sroa.0.1.i.i = phi ptr [ %p.sroa.0.1.i.i, %if.then.i.i ], [ %retval.sroa.0.0.i.i, %_ZN11__llvm_libc3rpc6Client8try_openILt2EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  br i1 %tobool.i.i.i.i.i, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i, label %cleanup.cont.i.i

cleanup.cont.i.i:                                 ; preds = %cleanup.i.i
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %for.cond.i.i, !llvm.loop !28

_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i: ; preds = %cleanup.i.i
  fence acquire
  %packet.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i, i64 0, i32 3
  %17 = load ptr, ptr %packet.i.i.i.i, align 8, !tbaa !29
  %payload.i.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %17, i64 %retval.sroa.3.1.i.i, i32 1
  %18 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %idxprom.i.i.i.i.i = zext i32 %18 to i64
  %arrayidx.i14.i.i.i.i = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i.i.i.i, i64 0, i64 %idxprom.i.i.i.i.i
  store i64 %size, ptr %arrayidx.i14.i.i.i.i, align 8, !tbaa !30
  %spec.select.i.i.i.i.i.i = tail call i64 @llvm.umin.i64(i64 %size, i64 56)
  %arrayidx6.i.i.i.i.i.i = getelementptr inbounds [8 x i64], ptr %arrayidx.i14.i.i.i.i, i64 0, i64 1
  tail call void @llvm.experimental.noalias.scope.decl(metadata !31)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !34)
  %cmp5.i.not.i.i.i.i.i.i.i = icmp eq i64 %spec.select.i.i.i.i.i.i, 0
  br i1 %cmp5.i.not.i.i.i.i.i.i.i, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i, label %for.body.i.i.i.i.i.i.i.i

for.body.i.i.i.i.i.i.i.i:                         ; preds = %for.body.i.i.i.i.i.i.i.i, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i
  %offset.addr.06.i.i.i.i.i.i.i.i = phi i64 [ %inc.i.i.i.i.i.i.i.i, %for.body.i.i.i.i.i.i.i.i ], [ 0, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i ]
  %arrayidx.i.i.i.i.i.i.i.i = getelementptr inbounds i8, ptr %data, i64 %offset.addr.06.i.i.i.i.i.i.i.i
  %19 = load i8, ptr %arrayidx.i.i.i.i.i.i.i.i, align 1, !tbaa !36, !alias.scope !34, !noalias !31
  %arrayidx1.i.i.i.i.i.i.i.i = getelementptr inbounds i8, ptr %arrayidx6.i.i.i.i.i.i, i64 %offset.addr.06.i.i.i.i.i.i.i.i
  store i8 %19, ptr %arrayidx1.i.i.i.i.i.i.i.i, align 1, !tbaa !36, !alias.scope !31, !noalias !34
  %inc.i.i.i.i.i.i.i.i = add nuw nsw i64 %offset.addr.06.i.i.i.i.i.i.i.i, 1
  %exitcond.not.i.i.i.i.i.i.i = icmp eq i64 %inc.i.i.i.i.i.i.i.i, %spec.select.i.i.i.i.i.i
  br i1 %exitcond.not.i.i.i.i.i.i.i, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i, label %for.body.i.i.i.i.i.i.i.i, !llvm.loop !38

_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i: ; preds = %for.body.i.i.i.i.i.i.i.i, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i
  %tobool.not.i.i.i.i.i = icmp eq i32 %retval.sroa.4.1.i.i, 0
  %conv.i.i.i.i2.i = zext i1 %tobool.not.i.i.i.i.i to i32
  fence release
  %outbox.i.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i, i64 0, i32 2
  %20 = load ptr, ptr %outbox.i.i.i.i.i, align 8, !tbaa !17
  %arrayidx.i15.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %20, i64 %retval.sroa.3.1.i.i
  store atomic i32 %conv.i.i.i.i2.i, ptr %arrayidx.i15.i.i.i.i monotonic, align 4
  %21 = load ptr, ptr %packet.i.i.i.i, align 8, !tbaa !29
  %arrayidx.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %21, i64 %retval.sroa.3.1.i.i
  %22 = load i64, ptr %arrayidx.i.i.i, align 64, !tbaa !25
  %inbox.i.i42.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i, i64 0, i32 1
  br label %while.cond.i.i.i

while.cond.i.i.i:                                 ; preds = %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i
  %port.sroa.29.0.i = phi i32 [ %conv.i.i.i.i2.i, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i ], [ %conv.i.i29.i.i.i, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i ]
  %idx.0.i.i.i = phi i64 [ 56, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i ], [ %add.i.i.i, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i ]
  %cmp.i.i.i = icmp ult i64 %idx.0.i.i.i, %size
  %23 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %cmp.i.i.i)
  %conv.i.i.i3.i = zext i32 %23 to i64
  %and.i.i.i4.i = and i64 %22, %conv.i.i.i3.i
  %tobool.not.i.i.i = icmp eq i64 %and.i.i.i4.i, 0
  %24 = load ptr, ptr %inbox.i.i42.i.i.i, align 8, !tbaa !16
  %arrayidx.i17.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %24, i64 %retval.sroa.3.1.i.i
  %25 = load atomic i32, ptr %arrayidx.i17.i.i monotonic, align 4
  %cmp.i.not3.i.i.i = icmp eq i32 %25, %port.sroa.29.0.i
  br i1 %tobool.not.i.i.i, label %cond.false.i.i, label %cond.false.i40.i.i.i

cond.false.i40.i.i.i:                             ; preds = %while.cond.i.i.i
  br i1 %cmp.i.not3.i.i.i, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i, label %while.body.i.i17.i.i.i

while.body.i.i17.i.i.i:                           ; preds = %while.body.i.i17.i.i.i, %cond.false.i40.i.i.i
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %26 = load ptr, ptr %inbox.i.i42.i.i.i, align 8, !tbaa !16
  %arrayidx.i.i.i18.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %26, i64 %retval.sroa.3.1.i.i
  %27 = load atomic i32, ptr %arrayidx.i.i.i18.i.i.i monotonic, align 4
  %cmp.i.not.i.i19.i.i.i = icmp eq i32 %27, %port.sroa.29.0.i
  br i1 %cmp.i.not.i.i19.i.i.i, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i, label %while.body.i.i17.i.i.i, !llvm.loop !40

_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i: ; preds = %while.body.i.i17.i.i.i, %cond.false.i40.i.i.i
  fence acquire
  %28 = load ptr, ptr %packet.i.i.i.i, align 8, !tbaa !29
  %payload.i.i23.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %28, i64 %retval.sroa.3.1.i.i, i32 1
  %arrayidx.i14.i25.i.i.i = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i23.i.i.i, i64 0, i64 %idxprom.i.i.i.i.i
  %sub.i.i.i.i.i.i = sub i64 %size, %idx.0.i.i.i
  %spec.select.i.i.i26.i.i.i = tail call i64 @llvm.umin.i64(i64 %sub.i.i.i.i.i.i, i64 64)
  br i1 %cmp.i.i.i, label %if.then.i.i.i.i.i.i, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i

if.then.i.i.i.i.i.i:                              ; preds = %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i
  %add.ptr.i.i.i.i.i.i.i = getelementptr inbounds i8, ptr %data, i64 %idx.0.i.i.i
  tail call void @llvm.experimental.noalias.scope.decl(metadata !41)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !44)
  %cmp5.i.not.i.i.i.i33.i.i.i = icmp eq i64 %spec.select.i.i.i26.i.i.i, 0
  br i1 %cmp5.i.not.i.i.i.i33.i.i.i, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i, label %for.body.i.i.i.i.i34.i.i.i

for.body.i.i.i.i.i34.i.i.i:                       ; preds = %for.body.i.i.i.i.i34.i.i.i, %if.then.i.i.i.i.i.i
  %offset.addr.06.i.i.i.i.i35.i.i.i = phi i64 [ %inc.i.i.i.i.i38.i.i.i, %for.body.i.i.i.i.i34.i.i.i ], [ 0, %if.then.i.i.i.i.i.i ]
  %arrayidx.i.i.i.i.i36.i.i.i = getelementptr inbounds i8, ptr %add.ptr.i.i.i.i.i.i.i, i64 %offset.addr.06.i.i.i.i.i35.i.i.i
  %29 = load i8, ptr %arrayidx.i.i.i.i.i36.i.i.i, align 1, !tbaa !36, !alias.scope !44, !noalias !41
  %arrayidx1.i.i.i.i.i37.i.i.i = getelementptr inbounds i8, ptr %arrayidx.i14.i25.i.i.i, i64 %offset.addr.06.i.i.i.i.i35.i.i.i
  store i8 %29, ptr %arrayidx1.i.i.i.i.i37.i.i.i, align 1, !tbaa !36, !alias.scope !41, !noalias !44
  %inc.i.i.i.i.i38.i.i.i = add nuw nsw i64 %offset.addr.06.i.i.i.i.i35.i.i.i, 1
  %exitcond.not.i.i.i.i39.i.i.i = icmp eq i64 %inc.i.i.i.i.i38.i.i.i, %spec.select.i.i.i26.i.i.i
  br i1 %exitcond.not.i.i.i.i39.i.i.i, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i, label %for.body.i.i.i.i.i34.i.i.i, !llvm.loop !38

_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i: ; preds = %for.body.i.i.i.i.i34.i.i.i, %if.then.i.i.i.i.i.i, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i
  %conv.i.i29.i.i.i = xor i32 %port.sroa.29.0.i, 1
  fence release
  %30 = load ptr, ptr %outbox.i.i.i.i.i, align 8, !tbaa !17
  %arrayidx.i15.i31.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %30, i64 %retval.sroa.3.1.i.i
  store atomic i32 %conv.i.i29.i.i.i, ptr %arrayidx.i15.i31.i.i.i monotonic, align 4
  %add.i.i.i = add i64 %idx.0.i.i.i, 64
  br label %while.cond.i.i.i, !llvm.loop !46

cond.false.i.i:                                   ; preds = %while.cond.i.i.i
  br i1 %cmp.i.not3.i.i.i, label %_ZN11__llvm_libc12_GLOBAL__N_115write_to_stdoutEPKvm.exit, label %while.body.i.i.i

while.body.i.i.i:                                 ; preds = %while.body.i.i.i, %cond.false.i.i
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %31 = load ptr, ptr %inbox.i.i42.i.i.i, align 8, !tbaa !16
  %arrayidx.i.i.i8.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %31, i64 %retval.sroa.3.1.i.i
  %32 = load atomic i32, ptr %arrayidx.i.i.i8.i monotonic, align 4
  %cmp.i.not.i.i9.i = icmp eq i32 %32, %port.sroa.29.0.i
  br i1 %cmp.i.not.i.i9.i, label %_ZN11__llvm_libc12_GLOBAL__N_115write_to_stdoutEPKvm.exit, label %while.body.i.i.i, !llvm.loop !40

_ZN11__llvm_libc12_GLOBAL__N_115write_to_stdoutEPKvm.exit: ; preds = %while.body.i.i.i, %cond.false.i.i
  fence acquire
  %33 = load ptr, ptr %packet.i.i.i.i, align 8, !tbaa !29
  %payload.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %33, i64 %retval.sroa.3.1.i.i, i32 1
  %arrayidx.i18.i.i = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i.i, i64 0, i64 %idxprom.i.i.i.i.i
  %.val1.i.i.i = load i32, ptr %arrayidx.i18.i.i, align 8, !tbaa !47
  fence release
  tail call void @llvm.amdgcn.wave.barrier()
  %34 = tail call i64 @llvm.cttz.i64(i64 %retval.sroa.2.1.i.i, i1 true), !range !18
  %iszero.i.i.i.i11.i = icmp ne i64 %retval.sroa.2.1.i.i, 0
  %cmp2.i.i.i12.i = icmp eq i64 %34, %idxprom.i.i.i.i.i
  %cmp.i.i.i.i = select i1 %iszero.i.i.i.i11.i, i1 %cmp2.i.i.i12.i, i1 false
  %cond.i.i.i = zext i1 %cmp.i.i.i.i to i32
  %not.i.i.i = xor i32 %cond.i.i.i, -1
  %arrayidx.i.i13.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i, i64 0, i32 4, i64 %retval.sroa.3.1.i.i
  %35 = atomicrmw and ptr %arrayidx.i.i13.i, i32 %not.i.i.i monotonic, align 4
  tail call void @llvm.amdgcn.wave.barrier()
  br label %if.end7

if.else:                                          ; preds = %entry
  %36 = load ptr, ptr addrspace(1) @_ZN11__llvm_libc6stderrE, align 8, !tbaa !4
  %cmp1 = icmp eq ptr %36, %f
  br i1 %cmp1, label %for.cond.i.i20, label %if.else4

for.cond.i.i20:                                   ; preds = %cleanup.cont.i.i68, %if.else
  %p.sroa.9.0.i.i21 = phi i32 [ %p.sroa.9.1.i.i59, %cleanup.cont.i.i68 ], [ undef, %if.else ]
  %p.sroa.7.0.i.i22 = phi i64 [ %p.sroa.7.1.i.i60, %cleanup.cont.i.i68 ], [ undef, %if.else ]
  %p.sroa.5.0.i.i23 = phi i64 [ %p.sroa.5.1.i.i61, %cleanup.cont.i.i68 ], [ undef, %if.else ]
  %p.sroa.0.0.i.i24 = phi ptr [ %p.sroa.0.1.i.i62, %cleanup.cont.i.i68 ], [ undef, %if.else ]
  %retval.sroa.4.0.i.i25 = phi i32 [ %retval.sroa.4.1.i.i64, %cleanup.cont.i.i68 ], [ undef, %if.else ]
  %retval.sroa.3.0.i.i26 = phi i64 [ %retval.sroa.3.1.i.i65, %cleanup.cont.i.i68 ], [ undef, %if.else ]
  %retval.sroa.2.0.i.i27 = phi i64 [ %retval.sroa.2.1.i.i66, %cleanup.cont.i.i68 ], [ undef, %if.else ]
  %retval.sroa.0.0.i.i28 = phi ptr [ %retval.sroa.0.1.i.i67, %cleanup.cont.i.i68 ], [ undef, %if.else ]
  %37 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !49
  %cmp.not52.not.i.i.i29 = icmp eq i64 %37, 0
  br i1 %cmp.not52.not.i.i.i29, label %for.end.i.i.i56, label %for.body.lr.ph.i.i.i30

for.body.lr.ph.i.i.i30:                           ; preds = %for.cond.i.i20
  %38 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %sh_prom.i.i.i.i31 = zext i32 %38 to i64
  %shl.i.i.i.i32 = shl nuw i64 1, %sh_prom.i.i.i.i31
  br label %for.body.i.i.i33

for.body.i.i.i33:                                 ; preds = %for.inc.critedge.i.i.i53, %for.body.lr.ph.i.i.i30
  %index.053.i.i.i34 = phi i64 [ 0, %for.body.lr.ph.i.i.i30 ], [ %inc.i.i.i54, %for.inc.critedge.i.i.i53 ]
  %39 = tail call i64 @llvm.read_register.i64(metadata !15) #21, !noalias !49
  %and.i.i.i.i35 = and i64 %39, %shl.i.i.i.i32
  %tobool.i.i.i.i36 = icmp ne i64 %and.i.i.i.i35, 0
  %arrayidx.i.i.i.i37 = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 4, i64 %index.053.i.i.i34
  %conv.i.i.i.i38 = zext i1 %tobool.i.i.i.i36 to i32
  %40 = atomicrmw or ptr addrspace(1) %arrayidx.i.i.i.i37, i32 %conv.i.i.i.i38 monotonic, align 4, !noalias !49
  %tobool4.i.i.i.i39 = icmp ne i32 %40, 0
  %41 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %tobool4.i.i.i.i39)
  %conv.i.i.i.i.i40 = zext i32 %41 to i64
  %and.i.i.i.i.i41 = and i64 %39, %conv.i.i.i.i.i40
  %cmp.i.not.i.i.i42 = icmp eq i64 %and.i.i.i.i.i41, %39
  br i1 %cmp.i.not.i.i.i42, label %for.inc.critedge.i.i.i53, label %if.then.i.i.i.i43

if.then.i.i.i.i43:                                ; preds = %for.body.i.i.i33
  fence acquire
  %42 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 1), align 8, !tbaa !16, !noalias !49
  %arrayidx.i41.i.i.i44 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %42, i64 %index.053.i.i.i34
  %43 = load atomic i32, ptr %arrayidx.i41.i.i.i44 monotonic, align 4, !noalias !49
  %44 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 2), align 8, !tbaa !17, !noalias !49
  %arrayidx.i42.i.i.i45 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %44, i64 %index.053.i.i.i34
  %45 = load atomic i32, ptr %arrayidx.i42.i.i.i45 monotonic, align 4, !noalias !49
  %cmp.i43.not.i.i.i46 = icmp eq i32 %43, %45
  br i1 %cmp.i43.not.i.i.i46, label %if.end12.i.i.i137, label %if.then10.i.i.i47

if.then10.i.i.i47:                                ; preds = %if.then.i.i.i.i43
  fence release
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !49
  %46 = tail call i64 @llvm.cttz.i64(i64 %39, i1 true), !range !18
  %iszero.i.i.i.i.i.i48 = icmp ne i64 %39, 0
  %cmp2.i.i.i.i.i49 = icmp eq i64 %46, %sh_prom.i.i.i.i31
  %cmp.i.i.i.i.i50 = select i1 %iszero.i.i.i.i.i.i48, i1 %cmp2.i.i.i.i.i49, i1 false
  %cond.i.i.i.i51 = zext i1 %cmp.i.i.i.i.i50 to i32
  %not.i.i.i.i52 = xor i32 %cond.i.i.i.i51, -1
  %47 = atomicrmw and ptr addrspace(1) %arrayidx.i.i.i.i37, i32 %not.i.i.i.i52 monotonic, align 4, !noalias !49
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !49
  br label %for.inc.critedge.i.i.i53

if.end12.i.i.i137:                                ; preds = %if.then.i.i.i.i43
  %48 = tail call i64 @llvm.cttz.i64(i64 %39, i1 true), !range !18
  %iszero.i.i.i.i.i138 = icmp ne i64 %39, 0
  %cmp2.i.i.i.i139 = icmp eq i64 %48, %sh_prom.i.i.i.i31
  %cmp.i47.i.i.i140 = select i1 %iszero.i.i.i.i.i138, i1 %cmp2.i.i.i.i139, i1 false
  br i1 %cmp.i47.i.i.i140, label %if.then14.i.i.i142, label %if.end20.i.i.i141

if.then14.i.i.i142:                               ; preds = %if.end12.i.i.i137
  %49 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 3), align 8, !tbaa !19, !noalias !49
  %opcode.i.i.i143 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %49, i64 %index.053.i.i.i34, i32 0, i32 1
  store i16 3, ptr %opcode.i.i.i143, align 8, !tbaa !20, !noalias !49
  %arrayidx18.i.i.i144 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %49, i64 %index.053.i.i.i34
  store i64 %39, ptr %arrayidx18.i.i.i144, align 64, !tbaa !25, !noalias !49
  br label %if.end20.i.i.i141

if.end20.i.i.i141:                                ; preds = %if.then14.i.i.i142, %if.end12.i.i.i137
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !49
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i

for.inc.critedge.i.i.i53:                         ; preds = %if.then10.i.i.i47, %for.body.i.i.i33
  %inc.i.i.i54 = add nuw i64 %index.053.i.i.i34, 1
  %50 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !49
  %cmp.not.i.i.i55 = icmp ult i64 %inc.i.i.i54, %50
  br i1 %cmp.not.i.i.i55, label %for.body.i.i.i33, label %for.end.i.i.i56, !llvm.loop !52

for.end.i.i.i56:                                  ; preds = %for.inc.critedge.i.i.i53, %for.cond.i.i20
  %51 = ptrtoint ptr %p.sroa.0.0.i.i24 to i64
  %p.sroa.0.0.insert.mask.i.i57 = and i64 %51, -256
  %52 = inttoptr i64 %p.sroa.0.0.insert.mask.i.i57 to ptr
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i

_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i: ; preds = %for.end.i.i.i56, %if.end20.i.i.i141
  %tobool.i.i.i.i.i58 = phi i1 [ false, %for.end.i.i.i56 ], [ true, %if.end20.i.i.i141 ]
  %p.sroa.9.1.i.i59 = phi i32 [ %p.sroa.9.0.i.i21, %for.end.i.i.i56 ], [ %43, %if.end20.i.i.i141 ]
  %p.sroa.7.1.i.i60 = phi i64 [ %p.sroa.7.0.i.i22, %for.end.i.i.i56 ], [ %index.053.i.i.i34, %if.end20.i.i.i141 ]
  %p.sroa.5.1.i.i61 = phi i64 [ %p.sroa.5.0.i.i23, %for.end.i.i.i56 ], [ %39, %if.end20.i.i.i141 ]
  %p.sroa.0.1.i.i62 = phi ptr [ %52, %for.end.i.i.i56 ], [ addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE to ptr), %if.end20.i.i.i141 ]
  br i1 %tobool.i.i.i.i.i58, label %if.then.i.i136, label %cleanup.i.i63

if.then.i.i136:                                   ; preds = %_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i
  br label %cleanup.i.i63

cleanup.i.i63:                                    ; preds = %if.then.i.i136, %_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i
  %retval.sroa.4.1.i.i64 = phi i32 [ %p.sroa.9.1.i.i59, %if.then.i.i136 ], [ %retval.sroa.4.0.i.i25, %_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  %retval.sroa.3.1.i.i65 = phi i64 [ %p.sroa.7.1.i.i60, %if.then.i.i136 ], [ %retval.sroa.3.0.i.i26, %_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  %retval.sroa.2.1.i.i66 = phi i64 [ %p.sroa.5.1.i.i61, %if.then.i.i136 ], [ %retval.sroa.2.0.i.i27, %_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  %retval.sroa.0.1.i.i67 = phi ptr [ %p.sroa.0.1.i.i62, %if.then.i.i136 ], [ %retval.sroa.0.0.i.i28, %_ZN11__llvm_libc3rpc6Client8try_openILt3EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  br i1 %tobool.i.i.i.i.i58, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i69, label %cleanup.cont.i.i68

cleanup.cont.i.i68:                               ; preds = %cleanup.i.i63
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %for.cond.i.i20, !llvm.loop !53

_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i69: ; preds = %cleanup.i.i63
  fence acquire
  %packet.i.i.i.i70 = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i67, i64 0, i32 3
  %53 = load ptr, ptr %packet.i.i.i.i70, align 8, !tbaa !29
  %payload.i.i.i.i.i71 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %53, i64 %retval.sroa.3.1.i.i65, i32 1
  %54 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %idxprom.i.i.i.i.i72 = zext i32 %54 to i64
  %arrayidx.i14.i.i.i.i73 = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i.i.i.i71, i64 0, i64 %idxprom.i.i.i.i.i72
  store i64 %size, ptr %arrayidx.i14.i.i.i.i73, align 8, !tbaa !30
  %spec.select.i.i.i.i.i.i74 = tail call i64 @llvm.umin.i64(i64 %size, i64 56)
  %arrayidx6.i.i.i.i.i.i75 = getelementptr inbounds [8 x i64], ptr %arrayidx.i14.i.i.i.i73, i64 0, i64 1
  tail call void @llvm.experimental.noalias.scope.decl(metadata !54)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !57)
  %cmp5.i.not.i.i.i.i.i.i.i76 = icmp eq i64 %spec.select.i.i.i.i.i.i74, 0
  br i1 %cmp5.i.not.i.i.i.i.i.i.i76, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i83, label %for.body.i.i.i.i.i.i.i.i77

for.body.i.i.i.i.i.i.i.i77:                       ; preds = %for.body.i.i.i.i.i.i.i.i77, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i69
  %offset.addr.06.i.i.i.i.i.i.i.i78 = phi i64 [ %inc.i.i.i.i.i.i.i.i81, %for.body.i.i.i.i.i.i.i.i77 ], [ 0, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i69 ]
  %arrayidx.i.i.i.i.i.i.i.i79 = getelementptr inbounds i8, ptr %data, i64 %offset.addr.06.i.i.i.i.i.i.i.i78
  %55 = load i8, ptr %arrayidx.i.i.i.i.i.i.i.i79, align 1, !tbaa !36, !alias.scope !57, !noalias !54
  %arrayidx1.i.i.i.i.i.i.i.i80 = getelementptr inbounds i8, ptr %arrayidx6.i.i.i.i.i.i75, i64 %offset.addr.06.i.i.i.i.i.i.i.i78
  store i8 %55, ptr %arrayidx1.i.i.i.i.i.i.i.i80, align 1, !tbaa !36, !alias.scope !54, !noalias !57
  %inc.i.i.i.i.i.i.i.i81 = add nuw nsw i64 %offset.addr.06.i.i.i.i.i.i.i.i78, 1
  %exitcond.not.i.i.i.i.i.i.i82 = icmp eq i64 %inc.i.i.i.i.i.i.i.i81, %spec.select.i.i.i.i.i.i74
  br i1 %exitcond.not.i.i.i.i.i.i.i82, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i83, label %for.body.i.i.i.i.i.i.i.i77, !llvm.loop !38

_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i83: ; preds = %for.body.i.i.i.i.i.i.i.i77, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i69
  %tobool.not.i.i.i.i.i84 = icmp eq i32 %retval.sroa.4.1.i.i64, 0
  %conv.i.i.i.i2.i85 = zext i1 %tobool.not.i.i.i.i.i84 to i32
  fence release
  %outbox.i.i.i.i.i86 = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i67, i64 0, i32 2
  %56 = load ptr, ptr %outbox.i.i.i.i.i86, align 8, !tbaa !17
  %arrayidx.i15.i.i.i.i87 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %56, i64 %retval.sroa.3.1.i.i65
  store atomic i32 %conv.i.i.i.i2.i85, ptr %arrayidx.i15.i.i.i.i87 monotonic, align 4
  %57 = load ptr, ptr %packet.i.i.i.i70, align 8, !tbaa !29
  %arrayidx.i.i.i88 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %57, i64 %retval.sroa.3.1.i.i65
  %58 = load i64, ptr %arrayidx.i.i.i88, align 64, !tbaa !25
  %inbox.i.i42.i.i.i89 = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i67, i64 0, i32 1
  br label %while.cond.i.i.i90

while.cond.i.i.i90:                               ; preds = %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i108, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i83
  %port.sroa.29.0.i91 = phi i32 [ %conv.i.i.i.i2.i85, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i83 ], [ %conv.i.i29.i.i.i109, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i108 ]
  %idx.0.i.i.i92 = phi i64 [ 56, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i83 ], [ %add.i.i.i111, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i108 ]
  %cmp.i.i.i93 = icmp ult i64 %idx.0.i.i.i92, %size
  %59 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %cmp.i.i.i93)
  %conv.i.i.i3.i94 = zext i32 %59 to i64
  %and.i.i.i4.i95 = and i64 %58, %conv.i.i.i3.i94
  %tobool.not.i.i.i96 = icmp eq i64 %and.i.i.i4.i95, 0
  %60 = load ptr, ptr %inbox.i.i42.i.i.i89, align 8, !tbaa !16
  %arrayidx.i17.i.i122 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %60, i64 %retval.sroa.3.1.i.i65
  %61 = load atomic i32, ptr %arrayidx.i17.i.i122 monotonic, align 4
  %cmp.i.not3.i.i.i123 = icmp eq i32 %61, %port.sroa.29.0.i91
  br i1 %tobool.not.i.i.i96, label %cond.false.i.i121, label %cond.false.i40.i.i.i97

cond.false.i40.i.i.i97:                           ; preds = %while.cond.i.i.i90
  br i1 %cmp.i.not3.i.i.i123, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i103, label %while.body.i.i17.i.i.i100

while.body.i.i17.i.i.i100:                        ; preds = %while.body.i.i17.i.i.i100, %cond.false.i40.i.i.i97
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %62 = load ptr, ptr %inbox.i.i42.i.i.i89, align 8, !tbaa !16
  %arrayidx.i.i.i18.i.i.i101 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %62, i64 %retval.sroa.3.1.i.i65
  %63 = load atomic i32, ptr %arrayidx.i.i.i18.i.i.i101 monotonic, align 4
  %cmp.i.not.i.i19.i.i.i102 = icmp eq i32 %63, %port.sroa.29.0.i91
  br i1 %cmp.i.not.i.i19.i.i.i102, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i103, label %while.body.i.i17.i.i.i100, !llvm.loop !40

_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i103: ; preds = %while.body.i.i17.i.i.i100, %cond.false.i40.i.i.i97
  fence acquire
  %64 = load ptr, ptr %packet.i.i.i.i70, align 8, !tbaa !29
  %payload.i.i23.i.i.i104 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %64, i64 %retval.sroa.3.1.i.i65, i32 1
  %arrayidx.i14.i25.i.i.i105 = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i23.i.i.i104, i64 0, i64 %idxprom.i.i.i.i.i72
  %sub.i.i.i.i.i.i106 = sub i64 %size, %idx.0.i.i.i92
  %spec.select.i.i.i26.i.i.i107 = tail call i64 @llvm.umin.i64(i64 %sub.i.i.i.i.i.i106, i64 64)
  br i1 %cmp.i.i.i93, label %if.then.i.i.i.i.i.i112, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i108

if.then.i.i.i.i.i.i112:                           ; preds = %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i103
  %add.ptr.i.i.i.i.i.i.i113 = getelementptr inbounds i8, ptr %data, i64 %idx.0.i.i.i92
  tail call void @llvm.experimental.noalias.scope.decl(metadata !59)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !62)
  %cmp5.i.not.i.i.i.i33.i.i.i114 = icmp eq i64 %spec.select.i.i.i26.i.i.i107, 0
  br i1 %cmp5.i.not.i.i.i.i33.i.i.i114, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i108, label %for.body.i.i.i.i.i34.i.i.i115

for.body.i.i.i.i.i34.i.i.i115:                    ; preds = %for.body.i.i.i.i.i34.i.i.i115, %if.then.i.i.i.i.i.i112
  %offset.addr.06.i.i.i.i.i35.i.i.i116 = phi i64 [ %inc.i.i.i.i.i38.i.i.i119, %for.body.i.i.i.i.i34.i.i.i115 ], [ 0, %if.then.i.i.i.i.i.i112 ]
  %arrayidx.i.i.i.i.i36.i.i.i117 = getelementptr inbounds i8, ptr %add.ptr.i.i.i.i.i.i.i113, i64 %offset.addr.06.i.i.i.i.i35.i.i.i116
  %65 = load i8, ptr %arrayidx.i.i.i.i.i36.i.i.i117, align 1, !tbaa !36, !alias.scope !62, !noalias !59
  %arrayidx1.i.i.i.i.i37.i.i.i118 = getelementptr inbounds i8, ptr %arrayidx.i14.i25.i.i.i105, i64 %offset.addr.06.i.i.i.i.i35.i.i.i116
  store i8 %65, ptr %arrayidx1.i.i.i.i.i37.i.i.i118, align 1, !tbaa !36, !alias.scope !59, !noalias !62
  %inc.i.i.i.i.i38.i.i.i119 = add nuw nsw i64 %offset.addr.06.i.i.i.i.i35.i.i.i116, 1
  %exitcond.not.i.i.i.i39.i.i.i120 = icmp eq i64 %inc.i.i.i.i.i38.i.i.i119, %spec.select.i.i.i26.i.i.i107
  br i1 %exitcond.not.i.i.i.i39.i.i.i120, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i108, label %for.body.i.i.i.i.i34.i.i.i115, !llvm.loop !38

_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i108: ; preds = %for.body.i.i.i.i.i34.i.i.i115, %if.then.i.i.i.i.i.i112, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i103
  %conv.i.i29.i.i.i109 = xor i32 %port.sroa.29.0.i91, 1
  fence release
  %66 = load ptr, ptr %outbox.i.i.i.i.i86, align 8, !tbaa !17
  %arrayidx.i15.i31.i.i.i110 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %66, i64 %retval.sroa.3.1.i.i65
  store atomic i32 %conv.i.i29.i.i.i109, ptr %arrayidx.i15.i31.i.i.i110 monotonic, align 4
  %add.i.i.i111 = add i64 %idx.0.i.i.i92, 64
  br label %while.cond.i.i.i90, !llvm.loop !46

cond.false.i.i121:                                ; preds = %while.cond.i.i.i90
  br i1 %cmp.i.not3.i.i.i123, label %_ZN11__llvm_libc12_GLOBAL__N_115write_to_stderrEPKvm.exit, label %while.body.i.i.i124

while.body.i.i.i124:                              ; preds = %while.body.i.i.i124, %cond.false.i.i121
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %67 = load ptr, ptr %inbox.i.i42.i.i.i89, align 8, !tbaa !16
  %arrayidx.i.i.i8.i125 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %67, i64 %retval.sroa.3.1.i.i65
  %68 = load atomic i32, ptr %arrayidx.i.i.i8.i125 monotonic, align 4
  %cmp.i.not.i.i9.i126 = icmp eq i32 %68, %port.sroa.29.0.i91
  br i1 %cmp.i.not.i.i9.i126, label %_ZN11__llvm_libc12_GLOBAL__N_115write_to_stderrEPKvm.exit, label %while.body.i.i.i124, !llvm.loop !40

_ZN11__llvm_libc12_GLOBAL__N_115write_to_stderrEPKvm.exit: ; preds = %while.body.i.i.i124, %cond.false.i.i121
  fence acquire
  %69 = load ptr, ptr %packet.i.i.i.i70, align 8, !tbaa !29
  %payload.i.i.i127 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %69, i64 %retval.sroa.3.1.i.i65, i32 1
  %arrayidx.i18.i.i128 = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i.i127, i64 0, i64 %idxprom.i.i.i.i.i72
  %.val1.i.i.i129 = load i32, ptr %arrayidx.i18.i.i128, align 8, !tbaa !47
  fence release
  tail call void @llvm.amdgcn.wave.barrier()
  %70 = tail call i64 @llvm.cttz.i64(i64 %retval.sroa.2.1.i.i66, i1 true), !range !18
  %iszero.i.i.i.i11.i130 = icmp ne i64 %retval.sroa.2.1.i.i66, 0
  %cmp2.i.i.i12.i131 = icmp eq i64 %70, %idxprom.i.i.i.i.i72
  %cmp.i.i.i.i132 = select i1 %iszero.i.i.i.i11.i130, i1 %cmp2.i.i.i12.i131, i1 false
  %cond.i.i.i133 = zext i1 %cmp.i.i.i.i132 to i32
  %not.i.i.i134 = xor i32 %cond.i.i.i133, -1
  %arrayidx.i.i13.i135 = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i67, i64 0, i32 4, i64 %retval.sroa.3.1.i.i65
  %71 = atomicrmw and ptr %arrayidx.i.i13.i135, i32 %not.i.i.i134 monotonic, align 4
  tail call void @llvm.amdgcn.wave.barrier()
  br label %if.end7

if.else4:                                         ; preds = %if.else
  %file.i = getelementptr inbounds %"class.__llvm_libc::GPUFile", ptr %f, i64 0, i32 1
  %72 = load i64, ptr %file.i, align 8, !tbaa !64
  br label %for.cond.i.i145

for.cond.i.i145:                                  ; preds = %cleanup.cont.i.i193, %if.else4
  %p.sroa.9.0.i.i146 = phi i32 [ undef, %if.else4 ], [ %p.sroa.9.1.i.i184, %cleanup.cont.i.i193 ]
  %p.sroa.7.0.i.i147 = phi i64 [ undef, %if.else4 ], [ %p.sroa.7.1.i.i185, %cleanup.cont.i.i193 ]
  %p.sroa.5.0.i.i148 = phi i64 [ undef, %if.else4 ], [ %p.sroa.5.1.i.i186, %cleanup.cont.i.i193 ]
  %p.sroa.0.0.i.i149 = phi ptr [ undef, %if.else4 ], [ %p.sroa.0.1.i.i187, %cleanup.cont.i.i193 ]
  %retval.sroa.4.0.i.i150 = phi i32 [ undef, %if.else4 ], [ %retval.sroa.4.1.i.i189, %cleanup.cont.i.i193 ]
  %retval.sroa.3.0.i.i151 = phi i64 [ undef, %if.else4 ], [ %retval.sroa.3.1.i.i190, %cleanup.cont.i.i193 ]
  %retval.sroa.2.0.i.i152 = phi i64 [ undef, %if.else4 ], [ %retval.sroa.2.1.i.i191, %cleanup.cont.i.i193 ]
  %retval.sroa.0.0.i.i153 = phi ptr [ undef, %if.else4 ], [ %retval.sroa.0.1.i.i192, %cleanup.cont.i.i193 ]
  %73 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !71
  %cmp.not52.not.i.i.i154 = icmp eq i64 %73, 0
  br i1 %cmp.not52.not.i.i.i154, label %for.end.i.i.i181, label %for.body.lr.ph.i.i.i155

for.body.lr.ph.i.i.i155:                          ; preds = %for.cond.i.i145
  %74 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %sh_prom.i.i.i.i156 = zext i32 %74 to i64
  %shl.i.i.i.i157 = shl nuw i64 1, %sh_prom.i.i.i.i156
  br label %for.body.i.i.i158

for.body.i.i.i158:                                ; preds = %for.inc.critedge.i.i.i178, %for.body.lr.ph.i.i.i155
  %index.053.i.i.i159 = phi i64 [ 0, %for.body.lr.ph.i.i.i155 ], [ %inc.i.i.i179, %for.inc.critedge.i.i.i178 ]
  %75 = tail call i64 @llvm.read_register.i64(metadata !15) #21, !noalias !71
  %and.i.i.i.i160 = and i64 %75, %shl.i.i.i.i157
  %tobool.i.i.i.i161 = icmp ne i64 %and.i.i.i.i160, 0
  %arrayidx.i.i.i.i162 = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 4, i64 %index.053.i.i.i159
  %conv.i.i.i.i163 = zext i1 %tobool.i.i.i.i161 to i32
  %76 = atomicrmw or ptr addrspace(1) %arrayidx.i.i.i.i162, i32 %conv.i.i.i.i163 monotonic, align 4, !noalias !71
  %tobool4.i.i.i.i164 = icmp ne i32 %76, 0
  %77 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %tobool4.i.i.i.i164)
  %conv.i.i.i.i.i165 = zext i32 %77 to i64
  %and.i.i.i.i.i166 = and i64 %75, %conv.i.i.i.i.i165
  %cmp.i.not.i.i.i167 = icmp eq i64 %and.i.i.i.i.i166, %75
  br i1 %cmp.i.not.i.i.i167, label %for.inc.critedge.i.i.i178, label %if.then.i.i.i.i168

if.then.i.i.i.i168:                               ; preds = %for.body.i.i.i158
  fence acquire
  %78 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 1), align 8, !tbaa !16, !noalias !71
  %arrayidx.i41.i.i.i169 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %78, i64 %index.053.i.i.i159
  %79 = load atomic i32, ptr %arrayidx.i41.i.i.i169 monotonic, align 4, !noalias !71
  %80 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 2), align 8, !tbaa !17, !noalias !71
  %arrayidx.i42.i.i.i170 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %80, i64 %index.053.i.i.i159
  %81 = load atomic i32, ptr %arrayidx.i42.i.i.i170 monotonic, align 4, !noalias !71
  %cmp.i43.not.i.i.i171 = icmp eq i32 %79, %81
  br i1 %cmp.i43.not.i.i.i171, label %if.end12.i.i.i245, label %if.then10.i.i.i172

if.then10.i.i.i172:                               ; preds = %if.then.i.i.i.i168
  fence release
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !71
  %82 = tail call i64 @llvm.cttz.i64(i64 %75, i1 true), !range !18
  %iszero.i.i.i.i.i.i173 = icmp ne i64 %75, 0
  %cmp2.i.i.i.i.i174 = icmp eq i64 %82, %sh_prom.i.i.i.i156
  %cmp.i.i.i.i.i175 = select i1 %iszero.i.i.i.i.i.i173, i1 %cmp2.i.i.i.i.i174, i1 false
  %cond.i.i.i.i176 = zext i1 %cmp.i.i.i.i.i175 to i32
  %not.i.i.i.i177 = xor i32 %cond.i.i.i.i176, -1
  %83 = atomicrmw and ptr addrspace(1) %arrayidx.i.i.i.i162, i32 %not.i.i.i.i177 monotonic, align 4, !noalias !71
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !71
  br label %for.inc.critedge.i.i.i178

if.end12.i.i.i245:                                ; preds = %if.then.i.i.i.i168
  %84 = tail call i64 @llvm.cttz.i64(i64 %75, i1 true), !range !18
  %iszero.i.i.i.i.i246 = icmp ne i64 %75, 0
  %cmp2.i.i.i.i247 = icmp eq i64 %84, %sh_prom.i.i.i.i156
  %cmp.i47.i.i.i248 = select i1 %iszero.i.i.i.i.i246, i1 %cmp2.i.i.i.i247, i1 false
  br i1 %cmp.i47.i.i.i248, label %if.then14.i.i.i250, label %if.end20.i.i.i249

if.then14.i.i.i250:                               ; preds = %if.end12.i.i.i245
  %85 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 3), align 8, !tbaa !19, !noalias !71
  %opcode.i.i.i251 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %85, i64 %index.053.i.i.i159, i32 0, i32 1
  store i16 4, ptr %opcode.i.i.i251, align 8, !tbaa !20, !noalias !71
  %arrayidx18.i.i.i252 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %85, i64 %index.053.i.i.i159
  store i64 %75, ptr %arrayidx18.i.i.i252, align 64, !tbaa !25, !noalias !71
  br label %if.end20.i.i.i249

if.end20.i.i.i249:                                ; preds = %if.then14.i.i.i250, %if.end12.i.i.i245
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !71
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i

for.inc.critedge.i.i.i178:                        ; preds = %if.then10.i.i.i172, %for.body.i.i.i158
  %inc.i.i.i179 = add nuw i64 %index.053.i.i.i159, 1
  %86 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !71
  %cmp.not.i.i.i180 = icmp ult i64 %inc.i.i.i179, %86
  br i1 %cmp.not.i.i.i180, label %for.body.i.i.i158, label %for.end.i.i.i181, !llvm.loop !74

for.end.i.i.i181:                                 ; preds = %for.inc.critedge.i.i.i178, %for.cond.i.i145
  %87 = ptrtoint ptr %p.sroa.0.0.i.i149 to i64
  %p.sroa.0.0.insert.mask.i.i182 = and i64 %87, -256
  %88 = inttoptr i64 %p.sroa.0.0.insert.mask.i.i182 to ptr
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i

_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i: ; preds = %for.end.i.i.i181, %if.end20.i.i.i249
  %tobool.i.i.i.i.i183 = phi i1 [ false, %for.end.i.i.i181 ], [ true, %if.end20.i.i.i249 ]
  %p.sroa.9.1.i.i184 = phi i32 [ %p.sroa.9.0.i.i146, %for.end.i.i.i181 ], [ %79, %if.end20.i.i.i249 ]
  %p.sroa.7.1.i.i185 = phi i64 [ %p.sroa.7.0.i.i147, %for.end.i.i.i181 ], [ %index.053.i.i.i159, %if.end20.i.i.i249 ]
  %p.sroa.5.1.i.i186 = phi i64 [ %p.sroa.5.0.i.i148, %for.end.i.i.i181 ], [ %75, %if.end20.i.i.i249 ]
  %p.sroa.0.1.i.i187 = phi ptr [ %88, %for.end.i.i.i181 ], [ addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE to ptr), %if.end20.i.i.i249 ]
  br i1 %tobool.i.i.i.i.i183, label %if.then.i.i244, label %cleanup.i.i188

if.then.i.i244:                                   ; preds = %_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i
  br label %cleanup.i.i188

cleanup.i.i188:                                   ; preds = %if.then.i.i244, %_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i
  %retval.sroa.4.1.i.i189 = phi i32 [ %p.sroa.9.1.i.i184, %if.then.i.i244 ], [ %retval.sroa.4.0.i.i150, %_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  %retval.sroa.3.1.i.i190 = phi i64 [ %p.sroa.7.1.i.i185, %if.then.i.i244 ], [ %retval.sroa.3.0.i.i151, %_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  %retval.sroa.2.1.i.i191 = phi i64 [ %p.sroa.5.1.i.i186, %if.then.i.i244 ], [ %retval.sroa.2.0.i.i152, %_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  %retval.sroa.0.1.i.i192 = phi ptr [ %p.sroa.0.1.i.i187, %if.then.i.i244 ], [ %retval.sroa.0.0.i.i153, %_ZN11__llvm_libc3rpc6Client8try_openILt4EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i.i ]
  br i1 %tobool.i.i.i.i.i183, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_12_GLOBAL__N_115write_to_streamEmPKvmE3$_0EEvT_.exit.i", label %cleanup.cont.i.i193

cleanup.cont.i.i193:                              ; preds = %cleanup.i.i188
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %for.cond.i.i145, !llvm.loop !75

"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_12_GLOBAL__N_115write_to_streamEmPKvmE3$_0EEvT_.exit.i": ; preds = %cleanup.i.i188
  fence acquire
  %packet.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i192, i64 0, i32 3
  %89 = load ptr, ptr %packet.i.i, align 8, !tbaa !29
  %payload.i.i.i194 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %89, i64 %retval.sroa.3.1.i.i190, i32 1
  %90 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %idxprom.i.i.i = zext i32 %90 to i64
  %arrayidx.i14.i.i = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i.i194, i64 0, i64 %idxprom.i.i.i
  store i64 %72, ptr %arrayidx.i14.i.i, align 8, !tbaa !76
  %tobool.not.i.i.i195 = icmp eq i32 %retval.sroa.4.1.i.i189, 0
  %conv.i.i.i = zext i1 %tobool.not.i.i.i195 to i32
  fence release
  %outbox.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i192, i64 0, i32 2
  %91 = load ptr, ptr %outbox.i.i.i, align 8, !tbaa !17
  %arrayidx.i15.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %91, i64 %retval.sroa.3.1.i.i190
  store atomic i32 %conv.i.i.i, ptr %arrayidx.i15.i.i monotonic, align 4
  %inbox.i.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i192, i64 0, i32 1
  %92 = load ptr, ptr %inbox.i.i.i.i.i, align 8, !tbaa !16
  %arrayidx.i.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %92, i64 %retval.sroa.3.1.i.i190
  %93 = load atomic i32, ptr %arrayidx.i.i.i.i.i monotonic, align 4
  %cmp.i.not3.i.i.i.i.i = icmp eq i32 %93, %conv.i.i.i
  br i1 %cmp.i.not3.i.i.i.i.i, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i196, label %while.body.i.i.i.i.i

while.body.i.i.i.i.i:                             ; preds = %while.body.i.i.i.i.i, %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_12_GLOBAL__N_115write_to_streamEmPKvmE3$_0EEvT_.exit.i"
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %94 = load ptr, ptr %inbox.i.i.i.i.i, align 8, !tbaa !16
  %arrayidx.i.i.i.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %94, i64 %retval.sroa.3.1.i.i190
  %95 = load atomic i32, ptr %arrayidx.i.i.i.i.i.i monotonic, align 4
  %cmp.i.not.i.i.i.i.i = icmp eq i32 %95, %conv.i.i.i
  br i1 %cmp.i.not.i.i.i.i.i, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i196, label %while.body.i.i.i.i.i, !llvm.loop !40

_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i196: ; preds = %while.body.i.i.i.i.i, %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_12_GLOBAL__N_115write_to_streamEmPKvmE3$_0EEvT_.exit.i"
  fence acquire
  %96 = load ptr, ptr %packet.i.i, align 8, !tbaa !29
  %payload.i.i.i.i.i197 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %96, i64 %retval.sroa.3.1.i.i190, i32 1
  %arrayidx.i14.i.i.i.i198 = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i.i.i.i197, i64 0, i64 %idxprom.i.i.i
  store i64 %size, ptr %arrayidx.i14.i.i.i.i198, align 8, !tbaa !30
  %spec.select.i.i.i.i.i.i199 = tail call i64 @llvm.umin.i64(i64 %size, i64 56)
  %arrayidx6.i.i.i.i.i.i200 = getelementptr inbounds [8 x i64], ptr %arrayidx.i14.i.i.i.i198, i64 0, i64 1
  tail call void @llvm.experimental.noalias.scope.decl(metadata !77)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !80)
  %cmp5.i.not.i.i.i.i.i.i.i201 = icmp eq i64 %spec.select.i.i.i.i.i.i199, 0
  br i1 %cmp5.i.not.i.i.i.i.i.i.i201, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i208, label %for.body.i.i.i.i.i.i.i.i202

for.body.i.i.i.i.i.i.i.i202:                      ; preds = %for.body.i.i.i.i.i.i.i.i202, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i196
  %offset.addr.06.i.i.i.i.i.i.i.i203 = phi i64 [ %inc.i.i.i.i.i.i.i.i206, %for.body.i.i.i.i.i.i.i.i202 ], [ 0, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i196 ]
  %arrayidx.i.i.i.i.i.i.i.i204 = getelementptr inbounds i8, ptr %data, i64 %offset.addr.06.i.i.i.i.i.i.i.i203
  %97 = load i8, ptr %arrayidx.i.i.i.i.i.i.i.i204, align 1, !tbaa !36, !alias.scope !80, !noalias !77
  %arrayidx1.i.i.i.i.i.i.i.i205 = getelementptr inbounds i8, ptr %arrayidx6.i.i.i.i.i.i200, i64 %offset.addr.06.i.i.i.i.i.i.i.i203
  store i8 %97, ptr %arrayidx1.i.i.i.i.i.i.i.i205, align 1, !tbaa !36, !alias.scope !77, !noalias !80
  %inc.i.i.i.i.i.i.i.i206 = add nuw nsw i64 %offset.addr.06.i.i.i.i.i.i.i.i203, 1
  %exitcond.not.i.i.i.i.i.i.i207 = icmp eq i64 %inc.i.i.i.i.i.i.i.i206, %spec.select.i.i.i.i.i.i199
  br i1 %exitcond.not.i.i.i.i.i.i.i207, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i208, label %for.body.i.i.i.i.i.i.i.i202, !llvm.loop !38

_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i208: ; preds = %for.body.i.i.i.i.i.i.i.i202, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i.i.i.i196
  %tobool.not.i.i.i.i.i209 = xor i1 %tobool.not.i.i.i195, true
  %conv.i.i.i.i6.i = zext i1 %tobool.not.i.i.i.i.i209 to i32
  fence release
  %98 = load ptr, ptr %outbox.i.i.i, align 8, !tbaa !17
  %arrayidx.i15.i.i.i.i210 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %98, i64 %retval.sroa.3.1.i.i190
  store atomic i32 %conv.i.i.i.i6.i, ptr %arrayidx.i15.i.i.i.i210 monotonic, align 4
  %99 = load ptr, ptr %packet.i.i, align 8, !tbaa !29
  %arrayidx.i.i7.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %99, i64 %retval.sroa.3.1.i.i190
  %100 = load i64, ptr %arrayidx.i.i7.i, align 64, !tbaa !25
  br label %while.cond.i.i.i211

while.cond.i.i.i211:                              ; preds = %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i225, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i208
  %port.sroa.35.0.i = phi i32 [ %conv.i.i.i.i6.i, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i208 ], [ %conv.i.i29.i.i.i226, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i225 ]
  %idx.0.i.i.i212 = phi i64 [ 56, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE_EEvT_.exit.i.i.i208 ], [ %add.i.i.i228, %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i225 ]
  %cmp.i.i.i213 = icmp ult i64 %idx.0.i.i.i212, %size
  %101 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %cmp.i.i.i213)
  %conv.i.i.i8.i = zext i32 %101 to i64
  %and.i.i.i9.i = and i64 %100, %conv.i.i.i8.i
  %tobool.not.i.i10.i = icmp eq i64 %and.i.i.i9.i, 0
  %102 = load ptr, ptr %inbox.i.i.i.i.i, align 8, !tbaa !16
  %arrayidx.i17.i.i238 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %102, i64 %retval.sroa.3.1.i.i190
  %103 = load atomic i32, ptr %arrayidx.i17.i.i238 monotonic, align 4
  %cmp.i.not3.i.i24.i = icmp eq i32 %103, %port.sroa.35.0.i
  br i1 %tobool.not.i.i10.i, label %cond.false.i20.i, label %cond.false.i40.i.i.i214

cond.false.i40.i.i.i214:                          ; preds = %while.cond.i.i.i211
  br i1 %cmp.i.not3.i.i24.i, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i220, label %while.body.i.i17.i.i.i217

while.body.i.i17.i.i.i217:                        ; preds = %while.body.i.i17.i.i.i217, %cond.false.i40.i.i.i214
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %104 = load ptr, ptr %inbox.i.i.i.i.i, align 8, !tbaa !16
  %arrayidx.i.i.i18.i.i.i218 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %104, i64 %retval.sroa.3.1.i.i190
  %105 = load atomic i32, ptr %arrayidx.i.i.i18.i.i.i218 monotonic, align 4
  %cmp.i.not.i.i19.i.i.i219 = icmp eq i32 %105, %port.sroa.35.0.i
  br i1 %cmp.i.not.i.i19.i.i.i219, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i220, label %while.body.i.i17.i.i.i217, !llvm.loop !40

_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i220: ; preds = %while.body.i.i17.i.i.i217, %cond.false.i40.i.i.i214
  fence acquire
  %106 = load ptr, ptr %packet.i.i, align 8, !tbaa !29
  %payload.i.i23.i.i.i221 = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %106, i64 %retval.sroa.3.1.i.i190, i32 1
  %arrayidx.i14.i25.i.i.i222 = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i23.i.i.i221, i64 0, i64 %idxprom.i.i.i
  %sub.i.i.i.i.i.i223 = sub i64 %size, %idx.0.i.i.i212
  %spec.select.i.i.i26.i.i.i224 = tail call i64 @llvm.umin.i64(i64 %sub.i.i.i.i.i.i223, i64 64)
  br i1 %cmp.i.i.i213, label %if.then.i.i.i.i.i.i229, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i225

if.then.i.i.i.i.i.i229:                           ; preds = %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i220
  %add.ptr.i.i.i.i.i.i.i230 = getelementptr inbounds i8, ptr %data, i64 %idx.0.i.i.i212
  tail call void @llvm.experimental.noalias.scope.decl(metadata !82)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !85)
  %cmp5.i.not.i.i.i.i33.i.i.i231 = icmp eq i64 %spec.select.i.i.i26.i.i.i224, 0
  br i1 %cmp5.i.not.i.i.i.i33.i.i.i231, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i225, label %for.body.i.i.i.i.i34.i.i.i232

for.body.i.i.i.i.i34.i.i.i232:                    ; preds = %for.body.i.i.i.i.i34.i.i.i232, %if.then.i.i.i.i.i.i229
  %offset.addr.06.i.i.i.i.i35.i.i.i233 = phi i64 [ %inc.i.i.i.i.i38.i.i.i236, %for.body.i.i.i.i.i34.i.i.i232 ], [ 0, %if.then.i.i.i.i.i.i229 ]
  %arrayidx.i.i.i.i.i36.i.i.i234 = getelementptr inbounds i8, ptr %add.ptr.i.i.i.i.i.i.i230, i64 %offset.addr.06.i.i.i.i.i35.i.i.i233
  %107 = load i8, ptr %arrayidx.i.i.i.i.i36.i.i.i234, align 1, !tbaa !36, !alias.scope !85, !noalias !82
  %arrayidx1.i.i.i.i.i37.i.i.i235 = getelementptr inbounds i8, ptr %arrayidx.i14.i25.i.i.i222, i64 %offset.addr.06.i.i.i.i.i35.i.i.i233
  store i8 %107, ptr %arrayidx1.i.i.i.i.i37.i.i.i235, align 1, !tbaa !36, !alias.scope !82, !noalias !85
  %inc.i.i.i.i.i38.i.i.i236 = add nuw nsw i64 %offset.addr.06.i.i.i.i.i35.i.i.i233, 1
  %exitcond.not.i.i.i.i39.i.i.i237 = icmp eq i64 %inc.i.i.i.i.i38.i.i.i236, %spec.select.i.i.i26.i.i.i224
  br i1 %exitcond.not.i.i.i.i39.i.i.i237, label %_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i225, label %for.body.i.i.i.i.i34.i.i.i232, !llvm.loop !38

_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS4_6send_nEPKPKvPyEUlPNS0_6BufferEjE0_EEvT_.exit.i.i.i225: ; preds = %for.body.i.i.i.i.i34.i.i.i232, %if.then.i.i.i.i.i.i229, %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit.i20.i.i.i220
  %conv.i.i29.i.i.i226 = xor i32 %port.sroa.35.0.i, 1
  fence release
  %108 = load ptr, ptr %outbox.i.i.i, align 8, !tbaa !17
  %arrayidx.i15.i31.i.i.i227 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %108, i64 %retval.sroa.3.1.i.i190
  store atomic i32 %conv.i.i29.i.i.i226, ptr %arrayidx.i15.i31.i.i.i227 monotonic, align 4
  %add.i.i.i228 = add i64 %idx.0.i.i.i212, 64
  br label %while.cond.i.i.i211, !llvm.loop !46

cond.false.i20.i:                                 ; preds = %while.cond.i.i.i211
  br i1 %cmp.i.not3.i.i24.i, label %_ZN11__llvm_libc12_GLOBAL__N_115write_to_streamEmPKvm.exit, label %while.body.i.i27.i

while.body.i.i27.i:                               ; preds = %while.body.i.i27.i, %cond.false.i20.i
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %109 = load ptr, ptr %inbox.i.i.i.i.i, align 8, !tbaa !16
  %arrayidx.i.i.i28.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %109, i64 %retval.sroa.3.1.i.i190
  %110 = load atomic i32, ptr %arrayidx.i.i.i28.i monotonic, align 4
  %cmp.i.not.i.i29.i = icmp eq i32 %110, %port.sroa.35.0.i
  br i1 %cmp.i.not.i.i29.i, label %_ZN11__llvm_libc12_GLOBAL__N_115write_to_streamEmPKvm.exit, label %while.body.i.i27.i, !llvm.loop !40

_ZN11__llvm_libc12_GLOBAL__N_115write_to_streamEmPKvm.exit: ; preds = %while.body.i.i27.i, %cond.false.i20.i
  fence acquire
  %111 = load ptr, ptr %packet.i.i, align 8, !tbaa !29
  %payload.i.i31.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %111, i64 %retval.sroa.3.1.i.i190, i32 1
  %arrayidx.i18.i.i239 = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i31.i, i64 0, i64 %idxprom.i.i.i
  %.val1.i.i.i240 = load i32, ptr %arrayidx.i18.i.i239, align 8, !tbaa !47
  fence release
  tail call void @llvm.amdgcn.wave.barrier()
  %112 = tail call i64 @llvm.cttz.i64(i64 %retval.sroa.2.1.i.i191, i1 true), !range !18
  %iszero.i.i.i.i37.i = icmp ne i64 %retval.sroa.2.1.i.i191, 0
  %cmp2.i.i.i38.i = icmp eq i64 %112, %idxprom.i.i.i
  %cmp.i.i.i.i241 = select i1 %iszero.i.i.i.i37.i, i1 %cmp2.i.i.i38.i, i1 false
  %cond.i.i.i242 = zext i1 %cmp.i.i.i.i241 to i32
  %not.i.i.i243 = xor i32 %cond.i.i.i242, -1
  %arrayidx.i.i39.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i.i192, i64 0, i32 4, i64 %retval.sroa.3.1.i.i190
  %113 = atomicrmw and ptr %arrayidx.i.i39.i, i32 %not.i.i.i243 monotonic, align 4
  tail call void @llvm.amdgcn.wave.barrier()
  br label %if.end7

if.end7:                                          ; preds = %_ZN11__llvm_libc12_GLOBAL__N_115write_to_streamEmPKvm.exit, %_ZN11__llvm_libc12_GLOBAL__N_115write_to_stderrEPKvm.exit, %_ZN11__llvm_libc12_GLOBAL__N_115write_to_stdoutEPKvm.exit
  %ret.0 = phi i32 [ %.val1.i.i.i, %_ZN11__llvm_libc12_GLOBAL__N_115write_to_stdoutEPKvm.exit ], [ %.val1.i.i.i129, %_ZN11__llvm_libc12_GLOBAL__N_115write_to_stderrEPKvm.exit ], [ %.val1.i.i.i240, %_ZN11__llvm_libc12_GLOBAL__N_115write_to_streamEmPKvm.exit ]
  %cmp8 = icmp slt i32 %ret.0, 0
  %sub = sub nsw i32 0, %ret.0
  %retval.sroa.3.0 = select i1 %cmp8, i32 %sub, i32 0
  %narrow = tail call i32 @llvm.smax.i32(i32 %ret.0, i32 0)
  %retval.sroa.0.0 = zext i32 %narrow to i64
  %.fca.0.insert = insertvalue %"struct.__llvm_libc::FileIOResult" poison, i64 %retval.sroa.0.0, 0
  %.fca.1.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.0.insert, i32 %retval.sroa.3.0, 1
  %.fca.2.0.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.1.insert, i8 undef, 2, 0
  %.fca.2.1.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.2.0.insert, i8 undef, 2, 1
  %.fca.2.2.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.2.1.insert, i8 undef, 2, 2
  %.fca.2.3.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.2.2.insert, i8 undef, 2, 3
  ret %"struct.__llvm_libc::FileIOResult" %.fca.2.3.insert
}

; Function Attrs: nofree nounwind
define internal noundef i32 @_ZN11__llvm_libc12_GLOBAL__N_110close_funcEPNS_4FileE(ptr nocapture noundef readonly %file) #2 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %cleanup.cont.i, %entry
  %p.sroa.9.0.i = phi i32 [ undef, %entry ], [ %p.sroa.9.1.i, %cleanup.cont.i ]
  %p.sroa.7.0.i = phi i64 [ undef, %entry ], [ %p.sroa.7.1.i, %cleanup.cont.i ]
  %p.sroa.5.0.i = phi i64 [ undef, %entry ], [ %p.sroa.5.1.i, %cleanup.cont.i ]
  %p.sroa.0.0.i = phi ptr [ undef, %entry ], [ %p.sroa.0.1.i, %cleanup.cont.i ]
  %retval.sroa.4.0.i = phi i32 [ undef, %entry ], [ %retval.sroa.4.1.i, %cleanup.cont.i ]
  %retval.sroa.3.0.i = phi i64 [ undef, %entry ], [ %retval.sroa.3.1.i, %cleanup.cont.i ]
  %retval.sroa.2.0.i = phi i64 [ undef, %entry ], [ %retval.sroa.2.1.i, %cleanup.cont.i ]
  %retval.sroa.0.0.i = phi ptr [ undef, %entry ], [ %retval.sroa.0.1.i, %cleanup.cont.i ]
  %0 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !87
  %cmp.not52.not.i.i = icmp eq i64 %0, 0
  br i1 %cmp.not52.not.i.i, label %for.end.i.i, label %for.body.lr.ph.i.i

for.body.lr.ph.i.i:                               ; preds = %for.cond.i
  %1 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %sh_prom.i.i.i = zext i32 %1 to i64
  %shl.i.i.i = shl nuw i64 1, %sh_prom.i.i.i
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.inc.critedge.i.i, %for.body.lr.ph.i.i
  %index.053.i.i = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %inc.i.i, %for.inc.critedge.i.i ]
  %2 = tail call i64 @llvm.read_register.i64(metadata !15) #21, !noalias !87
  %and.i.i.i = and i64 %2, %shl.i.i.i
  %tobool.i.i.i = icmp ne i64 %and.i.i.i, 0
  %arrayidx.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 4, i64 %index.053.i.i
  %conv.i.i.i = zext i1 %tobool.i.i.i to i32
  %3 = atomicrmw or ptr addrspace(1) %arrayidx.i.i.i, i32 %conv.i.i.i monotonic, align 4, !noalias !87
  %tobool4.i.i.i = icmp ne i32 %3, 0
  %4 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %tobool4.i.i.i)
  %conv.i.i.i.i = zext i32 %4 to i64
  %and.i.i.i.i = and i64 %2, %conv.i.i.i.i
  %cmp.i.not.i.i = icmp eq i64 %and.i.i.i.i, %2
  br i1 %cmp.i.not.i.i, label %for.inc.critedge.i.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %for.body.i.i
  fence acquire
  %5 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 1), align 8, !tbaa !16, !noalias !87
  %arrayidx.i41.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %5, i64 %index.053.i.i
  %6 = load atomic i32, ptr %arrayidx.i41.i.i monotonic, align 4, !noalias !87
  %7 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 2), align 8, !tbaa !17, !noalias !87
  %arrayidx.i42.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %7, i64 %index.053.i.i
  %8 = load atomic i32, ptr %arrayidx.i42.i.i monotonic, align 4, !noalias !87
  %cmp.i43.not.i.i = icmp eq i32 %6, %8
  br i1 %cmp.i43.not.i.i, label %if.end12.i.i, label %if.then10.i.i

if.then10.i.i:                                    ; preds = %if.then.i.i.i
  fence release
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !87
  %9 = tail call i64 @llvm.cttz.i64(i64 %2, i1 true), !range !18
  %iszero.i.i.i.i.i = icmp ne i64 %2, 0
  %cmp2.i.i.i.i = icmp eq i64 %9, %sh_prom.i.i.i
  %cmp.i.i.i.i = select i1 %iszero.i.i.i.i.i, i1 %cmp2.i.i.i.i, i1 false
  %cond.i.i.i = zext i1 %cmp.i.i.i.i to i32
  %not.i.i.i = xor i32 %cond.i.i.i, -1
  %10 = atomicrmw and ptr addrspace(1) %arrayidx.i.i.i, i32 %not.i.i.i monotonic, align 4, !noalias !87
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !87
  br label %for.inc.critedge.i.i

if.end12.i.i:                                     ; preds = %if.then.i.i.i
  %11 = tail call i64 @llvm.cttz.i64(i64 %2, i1 true), !range !18
  %iszero.i.i.i.i = icmp ne i64 %2, 0
  %cmp2.i.i.i = icmp eq i64 %11, %sh_prom.i.i.i
  %cmp.i47.i.i = select i1 %iszero.i.i.i.i, i1 %cmp2.i.i.i, i1 false
  br i1 %cmp.i47.i.i, label %if.then14.i.i, label %if.end20.i.i

if.then14.i.i:                                    ; preds = %if.end12.i.i
  %12 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 3), align 8, !tbaa !19, !noalias !87
  %opcode.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %12, i64 %index.053.i.i, i32 0, i32 1
  store i16 6, ptr %opcode.i.i, align 8, !tbaa !20, !noalias !87
  %arrayidx18.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %12, i64 %index.053.i.i
  store i64 %2, ptr %arrayidx18.i.i, align 64, !tbaa !25, !noalias !87
  br label %if.end20.i.i

if.end20.i.i:                                     ; preds = %if.then14.i.i, %if.end12.i.i
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !87
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i

for.inc.critedge.i.i:                             ; preds = %if.then10.i.i, %for.body.i.i
  %inc.i.i = add nuw i64 %index.053.i.i, 1
  %13 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !87
  %cmp.not.i.i = icmp ult i64 %inc.i.i, %13
  br i1 %cmp.not.i.i, label %for.body.i.i, label %for.end.i.i, !llvm.loop !90

for.end.i.i:                                      ; preds = %for.inc.critedge.i.i, %for.cond.i
  %14 = ptrtoint ptr %p.sroa.0.0.i to i64
  %p.sroa.0.0.insert.mask.i = and i64 %14, -256
  %15 = inttoptr i64 %p.sroa.0.0.insert.mask.i to ptr
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i

_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i: ; preds = %for.end.i.i, %if.end20.i.i
  %tobool.i.i.i.i = phi i1 [ false, %for.end.i.i ], [ true, %if.end20.i.i ]
  %p.sroa.9.1.i = phi i32 [ %p.sroa.9.0.i, %for.end.i.i ], [ %6, %if.end20.i.i ]
  %p.sroa.7.1.i = phi i64 [ %p.sroa.7.0.i, %for.end.i.i ], [ %index.053.i.i, %if.end20.i.i ]
  %p.sroa.5.1.i = phi i64 [ %p.sroa.5.0.i, %for.end.i.i ], [ %2, %if.end20.i.i ]
  %p.sroa.0.1.i = phi ptr [ %15, %for.end.i.i ], [ addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE to ptr), %if.end20.i.i ]
  br i1 %tobool.i.i.i.i, label %if.then.i, label %cleanup.i

if.then.i:                                        ; preds = %_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i
  br label %cleanup.i

cleanup.i:                                        ; preds = %if.then.i, %_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i
  %retval.sroa.4.1.i = phi i32 [ %p.sroa.9.1.i, %if.then.i ], [ %retval.sroa.4.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  %retval.sroa.3.1.i = phi i64 [ %p.sroa.7.1.i, %if.then.i ], [ %retval.sroa.3.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  %retval.sroa.2.1.i = phi i64 [ %p.sroa.5.1.i, %if.then.i ], [ %retval.sroa.2.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  %retval.sroa.0.1.i = phi ptr [ %p.sroa.0.1.i, %if.then.i ], [ %retval.sroa.0.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt6EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  br i1 %tobool.i.i.i.i, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_12_GLOBAL__N_110close_funcEPNS_4FileEE3$_0EEvT_.exit.i", label %cleanup.cont.i

cleanup.cont.i:                                   ; preds = %cleanup.i
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %for.cond.i, !llvm.loop !91

"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_12_GLOBAL__N_110close_funcEPNS_4FileEE3$_0EEvT_.exit.i": ; preds = %cleanup.i
  fence acquire
  %packet.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 3
  %16 = load ptr, ptr %packet.i.i, align 8, !tbaa !29
  %payload.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %16, i64 %retval.sroa.3.1.i, i32 1
  %17 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %idxprom.i.i.i = zext i32 %17 to i64
  %arrayidx.i14.i.i = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i.i, i64 0, i64 %idxprom.i.i.i
  %18 = getelementptr i8, ptr %file, i64 104
  %.val.val.i.i.i = load i64, ptr %18, align 8, !tbaa !64
  store i64 %.val.val.i.i.i, ptr %arrayidx.i14.i.i, align 8, !tbaa !30
  %tobool.not.i.i.i = icmp eq i32 %retval.sroa.4.1.i, 0
  %conv.i.i.i3 = zext i1 %tobool.not.i.i.i to i32
  fence release
  %outbox.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 2
  %19 = load ptr, ptr %outbox.i.i.i, align 8, !tbaa !17
  %arrayidx.i15.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %19, i64 %retval.sroa.3.1.i
  store atomic i32 %conv.i.i.i3, ptr %arrayidx.i15.i.i monotonic, align 4
  %inbox.i.i17.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 1
  %20 = load ptr, ptr %inbox.i.i17.i, align 8, !tbaa !16
  %arrayidx.i17.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %20, i64 %retval.sroa.3.1.i
  %21 = load atomic i32, ptr %arrayidx.i17.i.i monotonic, align 4
  %cmp.i.not3.i.i20.i = icmp eq i32 %21, %conv.i.i.i3
  br i1 %cmp.i.not3.i.i20.i, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE13send_and_recvIZNS_12_GLOBAL__N_110close_funcEPNS_4FileEE3$_0ZNS6_10close_funcES8_E3$_1EEvT_T0_.exit", label %while.body.i.i23.i

while.body.i.i23.i:                               ; preds = %while.body.i.i23.i, %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_12_GLOBAL__N_110close_funcEPNS_4FileEE3$_0EEvT_.exit.i"
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %22 = load ptr, ptr %inbox.i.i17.i, align 8, !tbaa !16
  %arrayidx.i.i.i24.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %22, i64 %retval.sroa.3.1.i
  %23 = load atomic i32, ptr %arrayidx.i.i.i24.i monotonic, align 4
  %cmp.i.not.i.i25.i = icmp eq i32 %23, %conv.i.i.i3
  br i1 %cmp.i.not.i.i25.i, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE13send_and_recvIZNS_12_GLOBAL__N_110close_funcEPNS_4FileEE3$_0ZNS6_10close_funcES8_E3$_1EEvT_T0_.exit", label %while.body.i.i23.i, !llvm.loop !40

"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE13send_and_recvIZNS_12_GLOBAL__N_110close_funcEPNS_4FileEE3$_0ZNS6_10close_funcES8_E3$_1EEvT_T0_.exit": ; preds = %while.body.i.i23.i, %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_12_GLOBAL__N_110close_funcEPNS_4FileEE3$_0EEvT_.exit.i"
  fence acquire
  %24 = load ptr, ptr %packet.i.i, align 8, !tbaa !29
  %payload.i.i27.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %24, i64 %retval.sroa.3.1.i, i32 1
  %arrayidx.i18.i.i = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i27.i, i64 0, i64 %idxprom.i.i.i
  %.val1.i.i.i = load i64, ptr %arrayidx.i18.i.i, align 8, !tbaa !30
  %conv.i.i.i.i4 = trunc i64 %.val1.i.i.i to i32
  fence release
  tail call void @llvm.amdgcn.wave.barrier()
  %25 = tail call i64 @llvm.cttz.i64(i64 %retval.sroa.2.1.i, i1 true), !range !18
  %iszero.i.i.i.i7 = icmp ne i64 %retval.sroa.2.1.i, 0
  %cmp2.i.i.i8 = icmp eq i64 %25, %idxprom.i.i.i
  %cmp.i.i.i = select i1 %iszero.i.i.i.i7, i1 %cmp2.i.i.i8, i1 false
  %cond.i.i9 = zext i1 %cmp.i.i.i to i32
  %not.i.i = xor i32 %cond.i.i9, -1
  %arrayidx.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 4, i64 %retval.sroa.3.1.i
  %26 = atomicrmw and ptr %arrayidx.i.i, i32 %not.i.i monotonic, align 4
  tail call void @llvm.amdgcn.wave.barrier()
  ret i32 %conv.i.i.i.i4
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
entry:
  %0 = load ptr, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 1), align 8
  %cmp.i8 = icmp eq ptr %0, addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE to ptr)
  %1 = load i64, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 2), align 8
  %tobool.not.i9 = icmp eq i64 %1, 0
  %2 = select i1 %cmp.i8, i1 %tobool.not.i9, i1 false
  br i1 %2, label %while.end, label %while.body

while.body:                                       ; preds = %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE8pop_backEv.exit, %entry
  %3 = phi i64 [ %6, %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE8pop_backEv.exit ], [ %1, %entry ]
  %cmp.i10 = phi i1 [ %cmp.i, %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE8pop_backEv.exit ], [ %cmp.i8, %entry ]
  %4 = phi ptr [ %5, %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE8pop_backEv.exit ], [ %0, %entry ]
  %sub.i = shl i64 %3, 4
  %mul.i = add i64 %sub.i, -16
  %add.ptr.i = getelementptr inbounds i8, ptr %4, i64 %mul.i
  %unit.sroa.0.0.copyload = load ptr, ptr %add.ptr.i, align 8, !tbaa.struct !92
  %unit.sroa.4.0.call2.sroa_idx = getelementptr inbounds i8, ptr %add.ptr.i, i64 8
  %unit.sroa.4.0.copyload = load ptr, ptr %unit.sroa.4.0.call2.sroa_idx, align 8, !tbaa.struct !93
  %dec.i = add i64 %3, -1
  store i64 %dec.i, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 2), align 8, !tbaa !94
  %tobool.not.i5 = icmp ne i64 %dec.i, 0
  %or.cond.i = or i1 %cmp.i10, %tobool.not.i5
  br i1 %or.cond.i, label %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE8pop_backEv.exit, label %do.end.i

do.end.i:                                         ; preds = %while.body
  %next.phi.trans.insert.i = getelementptr inbounds %"struct.__llvm_libc::cpp::BlockStore<__llvm_libc::(anonymous namespace)::AtExitUnit, 32, true>::Block", ptr %4, i64 0, i32 1
  %.pre.i = load ptr, ptr %next.phi.trans.insert.i, align 8, !tbaa !97
  store ptr %.pre.i, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 1), align 8, !tbaa !98
  tail call void @__llvm_libc_delete(ptr noundef nonnull %4) #22
  store i64 32, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 2), align 8, !tbaa !94
  br label %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE8pop_backEv.exit

_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE8pop_backEv.exit: ; preds = %do.end.i, %while.body
  tail call void %unit.sroa.0.0.copyload(ptr noundef %unit.sroa.4.0.copyload) #20
  %5 = load ptr, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 1), align 8
  %cmp.i = icmp eq ptr %5, addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE to ptr)
  %6 = load i64, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 2), align 8
  %tobool.not.i = icmp eq i64 %6, 0
  %7 = select i1 %cmp.i, i1 %tobool.not.i, i1 false
  br i1 %7, label %while.end, label %while.body, !llvm.loop !99

while.end:                                        ; preds = %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE8pop_backEv.exit, %entry
  %8 = load ptr, ptr getelementptr inbounds (i8, ptr addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE to ptr), i64 512), align 8, !tbaa !97
  %cmp.not2.i = icmp eq ptr %8, null
  br i1 %cmp.not2.i, label %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7destroyEPS4_.exit, label %delete.notnull.i7

delete.notnull.i7:                                ; preds = %delete.notnull.i7, %while.end
  %9 = phi ptr [ %10, %delete.notnull.i7 ], [ %8, %while.end ]
  %current.03.i = phi ptr [ %9, %delete.notnull.i7 ], [ addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE to ptr), %while.end ]
  tail call void @__llvm_libc_delete(ptr noundef nonnull %current.03.i) #22
  %next.i = getelementptr inbounds %"struct.__llvm_libc::cpp::BlockStore<__llvm_libc::(anonymous namespace)::AtExitUnit, 32, true>::Block", ptr %9, i64 0, i32 1
  %10 = load ptr, ptr %next.i, align 8, !tbaa !97
  %cmp.not.i = icmp eq ptr %10, null
  br i1 %cmp.not.i, label %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7destroyEPS4_.exit, label %delete.notnull.i7, !llvm.loop !100

_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7destroyEPS4_.exit: ; preds = %delete.notnull.i7, %while.end
  store ptr null, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 1), align 8, !tbaa !98
  store i64 0, ptr addrspace(1) getelementptr inbounds (%"class.__llvm_libc::cpp::BlockStore", ptr addrspace(1) @_ZN11__llvm_libc12_GLOBAL__N_114exit_callbacksE, i64 0, i32 2), align 8, !tbaa !94
  ret void
}

; Function Attrs: mustprogress nobuiltin nounwind
define internal void @__llvm_libc_delete(ptr noundef %mem) local_unnamed_addr #11 {
entry:
  tail call void @free(ptr noundef %mem) #20
  ret void
}

; Function Attrs: nofree nounwind
define internal void @free(ptr noundef %ptr) #2 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %cleanup.cont.i, %entry
  %p.sroa.9.0.i = phi i32 [ undef, %entry ], [ %p.sroa.9.1.i, %cleanup.cont.i ]
  %p.sroa.7.0.i = phi i64 [ undef, %entry ], [ %p.sroa.7.1.i, %cleanup.cont.i ]
  %p.sroa.5.0.i = phi i64 [ undef, %entry ], [ %p.sroa.5.1.i, %cleanup.cont.i ]
  %p.sroa.0.0.i = phi ptr [ undef, %entry ], [ %p.sroa.0.1.i, %cleanup.cont.i ]
  %retval.sroa.4.0.i = phi i32 [ undef, %entry ], [ %retval.sroa.4.1.i, %cleanup.cont.i ]
  %retval.sroa.3.0.i = phi i64 [ undef, %entry ], [ %retval.sroa.3.1.i, %cleanup.cont.i ]
  %retval.sroa.2.0.i = phi i64 [ undef, %entry ], [ %retval.sroa.2.1.i, %cleanup.cont.i ]
  %retval.sroa.0.0.i = phi ptr [ undef, %entry ], [ %retval.sroa.0.1.i, %cleanup.cont.i ]
  %0 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !101
  %cmp.not52.not.i.i = icmp eq i64 %0, 0
  br i1 %cmp.not52.not.i.i, label %for.end.i.i, label %for.body.lr.ph.i.i

for.body.lr.ph.i.i:                               ; preds = %for.cond.i
  %1 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %sh_prom.i.i.i = zext i32 %1 to i64
  %shl.i.i.i = shl nuw i64 1, %sh_prom.i.i.i
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.inc.critedge.i.i, %for.body.lr.ph.i.i
  %index.053.i.i = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %inc.i.i, %for.inc.critedge.i.i ]
  %2 = tail call i64 @llvm.read_register.i64(metadata !15) #21, !noalias !101
  %and.i.i.i = and i64 %2, %shl.i.i.i
  %tobool.i.i.i = icmp ne i64 %and.i.i.i, 0
  %arrayidx.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 4, i64 %index.053.i.i
  %conv.i.i.i = zext i1 %tobool.i.i.i to i32
  %3 = atomicrmw or ptr addrspace(1) %arrayidx.i.i.i, i32 %conv.i.i.i monotonic, align 4, !noalias !101
  %tobool4.i.i.i = icmp ne i32 %3, 0
  %4 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %tobool4.i.i.i)
  %conv.i.i.i.i = zext i32 %4 to i64
  %and.i.i.i.i = and i64 %2, %conv.i.i.i.i
  %cmp.i.not.i.i = icmp eq i64 %and.i.i.i.i, %2
  br i1 %cmp.i.not.i.i, label %for.inc.critedge.i.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %for.body.i.i
  fence acquire
  %5 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 1), align 8, !tbaa !16, !noalias !101
  %arrayidx.i41.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %5, i64 %index.053.i.i
  %6 = load atomic i32, ptr %arrayidx.i41.i.i monotonic, align 4, !noalias !101
  %7 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 2), align 8, !tbaa !17, !noalias !101
  %arrayidx.i42.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %7, i64 %index.053.i.i
  %8 = load atomic i32, ptr %arrayidx.i42.i.i monotonic, align 4, !noalias !101
  %cmp.i43.not.i.i = icmp eq i32 %6, %8
  br i1 %cmp.i43.not.i.i, label %if.end12.i.i, label %if.then10.i.i

if.then10.i.i:                                    ; preds = %if.then.i.i.i
  fence release
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !101
  %9 = tail call i64 @llvm.cttz.i64(i64 %2, i1 true), !range !18
  %iszero.i.i.i.i.i = icmp ne i64 %2, 0
  %cmp2.i.i.i.i = icmp eq i64 %9, %sh_prom.i.i.i
  %cmp.i.i.i.i = select i1 %iszero.i.i.i.i.i, i1 %cmp2.i.i.i.i, i1 false
  %cond.i.i.i = zext i1 %cmp.i.i.i.i to i32
  %not.i.i.i = xor i32 %cond.i.i.i, -1
  %10 = atomicrmw and ptr addrspace(1) %arrayidx.i.i.i, i32 %not.i.i.i monotonic, align 4, !noalias !101
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !101
  br label %for.inc.critedge.i.i

if.end12.i.i:                                     ; preds = %if.then.i.i.i
  %11 = tail call i64 @llvm.cttz.i64(i64 %2, i1 true), !range !18
  %iszero.i.i.i.i = icmp ne i64 %2, 0
  %cmp2.i.i.i = icmp eq i64 %11, %sh_prom.i.i.i
  %cmp.i47.i.i = select i1 %iszero.i.i.i.i, i1 %cmp2.i.i.i, i1 false
  br i1 %cmp.i47.i.i, label %if.then14.i.i, label %if.end20.i.i

if.then14.i.i:                                    ; preds = %if.end12.i.i
  %12 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 3), align 8, !tbaa !19, !noalias !101
  %opcode.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %12, i64 %index.053.i.i, i32 0, i32 1
  store i16 8, ptr %opcode.i.i, align 8, !tbaa !20, !noalias !101
  %arrayidx18.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %12, i64 %index.053.i.i
  store i64 %2, ptr %arrayidx18.i.i, align 64, !tbaa !25, !noalias !101
  br label %if.end20.i.i

if.end20.i.i:                                     ; preds = %if.then14.i.i, %if.end12.i.i
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !101
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i

for.inc.critedge.i.i:                             ; preds = %if.then10.i.i, %for.body.i.i
  %inc.i.i = add nuw i64 %index.053.i.i, 1
  %13 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !101
  %cmp.not.i.i = icmp ult i64 %inc.i.i, %13
  br i1 %cmp.not.i.i, label %for.body.i.i, label %for.end.i.i, !llvm.loop !104

for.end.i.i:                                      ; preds = %for.inc.critedge.i.i, %for.cond.i
  %14 = ptrtoint ptr %p.sroa.0.0.i to i64
  %p.sroa.0.0.insert.mask.i = and i64 %14, -256
  %15 = inttoptr i64 %p.sroa.0.0.insert.mask.i to ptr
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i

_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i: ; preds = %for.end.i.i, %if.end20.i.i
  %tobool.i.i.i.i = phi i1 [ false, %for.end.i.i ], [ true, %if.end20.i.i ]
  %p.sroa.9.1.i = phi i32 [ %p.sroa.9.0.i, %for.end.i.i ], [ %6, %if.end20.i.i ]
  %p.sroa.7.1.i = phi i64 [ %p.sroa.7.0.i, %for.end.i.i ], [ %index.053.i.i, %if.end20.i.i ]
  %p.sroa.5.1.i = phi i64 [ %p.sroa.5.0.i, %for.end.i.i ], [ %2, %if.end20.i.i ]
  %p.sroa.0.1.i = phi ptr [ %15, %for.end.i.i ], [ addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE to ptr), %if.end20.i.i ]
  br i1 %tobool.i.i.i.i, label %if.then.i, label %cleanup.i

if.then.i:                                        ; preds = %_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i
  br label %cleanup.i

cleanup.i:                                        ; preds = %if.then.i, %_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i
  %retval.sroa.4.1.i = phi i32 [ %p.sroa.9.1.i, %if.then.i ], [ %retval.sroa.4.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  %retval.sroa.3.1.i = phi i64 [ %p.sroa.7.1.i, %if.then.i ], [ %retval.sroa.3.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  %retval.sroa.2.1.i = phi i64 [ %p.sroa.5.1.i, %if.then.i ], [ %retval.sroa.2.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  %retval.sroa.0.1.i = phi ptr [ %p.sroa.0.1.i, %if.then.i ], [ %retval.sroa.0.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt8EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  br i1 %tobool.i.i.i.i, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_13__free_impl__EPvE3$_0EEvT_.exit", label %cleanup.cont.i

cleanup.cont.i:                                   ; preds = %cleanup.i
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %for.cond.i, !llvm.loop !105

"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_13__free_impl__EPvE3$_0EEvT_.exit": ; preds = %cleanup.i
  fence acquire
  %packet.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 3
  %16 = load ptr, ptr %packet.i, align 8, !tbaa !29
  %payload.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %16, i64 %retval.sroa.3.1.i, i32 1
  %17 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %idxprom.i.i = zext i32 %17 to i64
  %arrayidx.i14.i = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i, i64 0, i64 %idxprom.i.i
  %18 = ptrtoint ptr %ptr to i64
  store i64 %18, ptr %arrayidx.i14.i, align 8, !tbaa !30
  %tobool.not.i.i = icmp eq i32 %retval.sroa.4.1.i, 0
  %conv.i.i = zext i1 %tobool.not.i.i to i32
  fence release
  %outbox.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 2
  %19 = load ptr, ptr %outbox.i.i, align 8, !tbaa !17
  %arrayidx.i15.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %19, i64 %retval.sroa.3.1.i
  store atomic i32 %conv.i.i, ptr %arrayidx.i15.i monotonic, align 4
  fence release
  tail call void @llvm.amdgcn.wave.barrier()
  %20 = tail call i64 @llvm.cttz.i64(i64 %retval.sroa.2.1.i, i1 true), !range !18
  %iszero.i.i.i.i5 = icmp ne i64 %retval.sroa.2.1.i, 0
  %cmp2.i.i.i6 = icmp eq i64 %20, %idxprom.i.i
  %cmp.i.i.i = select i1 %iszero.i.i.i.i5, i1 %cmp2.i.i.i6, i1 false
  %cond.i.i = zext i1 %cmp.i.i.i to i32
  %not.i.i = xor i32 %cond.i.i, -1
  %arrayidx.i.i7 = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 4, i64 %retval.sroa.3.1.i
  %21 = atomicrmw and ptr %arrayidx.i.i7, i32 %not.i.i monotonic, align 4
  tail call void @llvm.amdgcn.wave.barrier()
  ret void
}

; Function Attrs: nofree nounwind
define internal noundef ptr @malloc(i64 noundef %size) #2 {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %cleanup.cont.i, %entry
  %p.sroa.9.0.i = phi i32 [ undef, %entry ], [ %p.sroa.9.1.i, %cleanup.cont.i ]
  %p.sroa.7.0.i = phi i64 [ undef, %entry ], [ %p.sroa.7.1.i, %cleanup.cont.i ]
  %p.sroa.5.0.i = phi i64 [ undef, %entry ], [ %p.sroa.5.1.i, %cleanup.cont.i ]
  %p.sroa.0.0.i = phi ptr [ undef, %entry ], [ %p.sroa.0.1.i, %cleanup.cont.i ]
  %retval.sroa.4.0.i = phi i32 [ undef, %entry ], [ %retval.sroa.4.1.i, %cleanup.cont.i ]
  %retval.sroa.3.0.i = phi i64 [ undef, %entry ], [ %retval.sroa.3.1.i, %cleanup.cont.i ]
  %retval.sroa.2.0.i = phi i64 [ undef, %entry ], [ %retval.sroa.2.1.i, %cleanup.cont.i ]
  %retval.sroa.0.0.i = phi ptr [ undef, %entry ], [ %retval.sroa.0.1.i, %cleanup.cont.i ]
  %0 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !106
  %cmp.not52.not.i.i = icmp eq i64 %0, 0
  br i1 %cmp.not52.not.i.i, label %for.end.i.i, label %for.body.lr.ph.i.i

for.body.lr.ph.i.i:                               ; preds = %for.cond.i
  %1 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %sh_prom.i.i.i = zext i32 %1 to i64
  %shl.i.i.i = shl nuw i64 1, %sh_prom.i.i.i
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.inc.critedge.i.i, %for.body.lr.ph.i.i
  %index.053.i.i = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %inc.i.i, %for.inc.critedge.i.i ]
  %2 = tail call i64 @llvm.read_register.i64(metadata !15) #21, !noalias !106
  %and.i.i.i = and i64 %2, %shl.i.i.i
  %tobool.i.i.i = icmp ne i64 %and.i.i.i, 0
  %arrayidx.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 4, i64 %index.053.i.i
  %conv.i.i.i = zext i1 %tobool.i.i.i to i32
  %3 = atomicrmw or ptr addrspace(1) %arrayidx.i.i.i, i32 %conv.i.i.i monotonic, align 4, !noalias !106
  %tobool4.i.i.i = icmp ne i32 %3, 0
  %4 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %tobool4.i.i.i)
  %conv.i.i.i.i = zext i32 %4 to i64
  %and.i.i.i.i = and i64 %2, %conv.i.i.i.i
  %cmp.i.not.i.i = icmp eq i64 %and.i.i.i.i, %2
  br i1 %cmp.i.not.i.i, label %for.inc.critedge.i.i, label %if.then.i.i.i

if.then.i.i.i:                                    ; preds = %for.body.i.i
  fence acquire
  %5 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 1), align 8, !tbaa !16, !noalias !106
  %arrayidx.i41.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %5, i64 %index.053.i.i
  %6 = load atomic i32, ptr %arrayidx.i41.i.i monotonic, align 4, !noalias !106
  %7 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 2), align 8, !tbaa !17, !noalias !106
  %arrayidx.i42.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %7, i64 %index.053.i.i
  %8 = load atomic i32, ptr %arrayidx.i42.i.i monotonic, align 4, !noalias !106
  %cmp.i43.not.i.i = icmp eq i32 %6, %8
  br i1 %cmp.i43.not.i.i, label %if.end12.i.i, label %if.then10.i.i

if.then10.i.i:                                    ; preds = %if.then.i.i.i
  fence release
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !106
  %9 = tail call i64 @llvm.cttz.i64(i64 %2, i1 true), !range !18
  %iszero.i.i.i.i.i = icmp ne i64 %2, 0
  %cmp2.i.i.i.i = icmp eq i64 %9, %sh_prom.i.i.i
  %cmp.i.i.i.i = select i1 %iszero.i.i.i.i.i, i1 %cmp2.i.i.i.i, i1 false
  %cond.i.i.i = zext i1 %cmp.i.i.i.i to i32
  %not.i.i.i = xor i32 %cond.i.i.i, -1
  %10 = atomicrmw and ptr addrspace(1) %arrayidx.i.i.i, i32 %not.i.i.i monotonic, align 4, !noalias !106
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !106
  br label %for.inc.critedge.i.i

if.end12.i.i:                                     ; preds = %if.then.i.i.i
  %11 = tail call i64 @llvm.cttz.i64(i64 %2, i1 true), !range !18
  %iszero.i.i.i.i = icmp ne i64 %2, 0
  %cmp2.i.i.i = icmp eq i64 %11, %sh_prom.i.i.i
  %cmp.i47.i.i = select i1 %iszero.i.i.i.i, i1 %cmp2.i.i.i, i1 false
  br i1 %cmp.i47.i.i, label %if.then14.i.i, label %if.end20.i.i

if.then14.i.i:                                    ; preds = %if.end12.i.i
  %12 = load ptr, ptr addrspace(1) getelementptr inbounds (%"struct.__llvm_libc::rpc::Client", ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, i64 0, i32 0, i32 3), align 8, !tbaa !19, !noalias !106
  %opcode.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %12, i64 %index.053.i.i, i32 0, i32 1
  store i16 7, ptr %opcode.i.i, align 8, !tbaa !20, !noalias !106
  %arrayidx18.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %12, i64 %index.053.i.i
  store i64 %2, ptr %arrayidx18.i.i, align 64, !tbaa !25, !noalias !106
  br label %if.end20.i.i

if.end20.i.i:                                     ; preds = %if.then14.i.i, %if.end12.i.i
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !106
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i

for.inc.critedge.i.i:                             ; preds = %if.then10.i.i, %for.body.i.i
  %inc.i.i = add nuw i64 %index.053.i.i, 1
  %13 = load i64, ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE, align 8, !tbaa !8, !noalias !106
  %cmp.not.i.i = icmp ult i64 %inc.i.i, %13
  br i1 %cmp.not.i.i, label %for.body.i.i, label %for.end.i.i, !llvm.loop !109

for.end.i.i:                                      ; preds = %for.inc.critedge.i.i, %for.cond.i
  %14 = ptrtoint ptr %p.sroa.0.0.i to i64
  %p.sroa.0.0.insert.mask.i = and i64 %14, -256
  %15 = inttoptr i64 %p.sroa.0.0.insert.mask.i to ptr
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i

_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i: ; preds = %for.end.i.i, %if.end20.i.i
  %tobool.i.i.i.i = phi i1 [ false, %for.end.i.i ], [ true, %if.end20.i.i ]
  %p.sroa.9.1.i = phi i32 [ %p.sroa.9.0.i, %for.end.i.i ], [ %6, %if.end20.i.i ]
  %p.sroa.7.1.i = phi i64 [ %p.sroa.7.0.i, %for.end.i.i ], [ %index.053.i.i, %if.end20.i.i ]
  %p.sroa.5.1.i = phi i64 [ %p.sroa.5.0.i, %for.end.i.i ], [ %2, %if.end20.i.i ]
  %p.sroa.0.1.i = phi ptr [ %15, %for.end.i.i ], [ addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE to ptr), %if.end20.i.i ]
  br i1 %tobool.i.i.i.i, label %if.then.i, label %cleanup.i

if.then.i:                                        ; preds = %_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i
  br label %cleanup.i

cleanup.i:                                        ; preds = %if.then.i, %_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i
  %retval.sroa.4.1.i = phi i32 [ %p.sroa.9.1.i, %if.then.i ], [ %retval.sroa.4.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  %retval.sroa.3.1.i = phi i64 [ %p.sroa.7.1.i, %if.then.i ], [ %retval.sroa.3.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  %retval.sroa.2.1.i = phi i64 [ %p.sroa.5.1.i, %if.then.i ], [ %retval.sroa.2.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  %retval.sroa.0.1.i = phi ptr [ %p.sroa.0.1.i, %if.then.i ], [ %retval.sroa.0.0.i, %_ZN11__llvm_libc3rpc6Client8try_openILt7EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit.i ]
  br i1 %tobool.i.i.i.i, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_15__malloc_impl__EmE3$_0EEvT_.exit.i", label %cleanup.cont.i

cleanup.cont.i:                                   ; preds = %cleanup.i
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %for.cond.i, !llvm.loop !110

"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_15__malloc_impl__EmE3$_0EEvT_.exit.i": ; preds = %cleanup.i
  fence acquire
  %packet.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 3
  %16 = load ptr, ptr %packet.i.i, align 8, !tbaa !29
  %payload.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %16, i64 %retval.sroa.3.1.i, i32 1
  %17 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %idxprom.i.i.i = zext i32 %17 to i64
  %arrayidx.i14.i.i = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i.i, i64 0, i64 %idxprom.i.i.i
  store i64 %size, ptr %arrayidx.i14.i.i, align 8, !tbaa !30
  %tobool.not.i.i.i = icmp eq i32 %retval.sroa.4.1.i, 0
  %conv.i.i.i3 = zext i1 %tobool.not.i.i.i to i32
  fence release
  %outbox.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 2
  %18 = load ptr, ptr %outbox.i.i.i, align 8, !tbaa !17
  %arrayidx.i15.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %18, i64 %retval.sroa.3.1.i
  store atomic i32 %conv.i.i.i3, ptr %arrayidx.i15.i.i monotonic, align 4
  %inbox.i.i17.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 1
  %19 = load ptr, ptr %inbox.i.i17.i, align 8, !tbaa !16
  %arrayidx.i17.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %19, i64 %retval.sroa.3.1.i
  %20 = load atomic i32, ptr %arrayidx.i17.i.i monotonic, align 4
  %cmp.i.not3.i.i20.i = icmp eq i32 %20, %conv.i.i.i3
  br i1 %cmp.i.not3.i.i20.i, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE13send_and_recvIZNS_15__malloc_impl__EmE3$_0ZNS_15__malloc_impl__EmE3$_1EEvT_T0_.exit", label %while.body.i.i23.i

while.body.i.i23.i:                               ; preds = %while.body.i.i23.i, %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_15__malloc_impl__EmE3$_0EEvT_.exit.i"
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %21 = load ptr, ptr %inbox.i.i17.i, align 8, !tbaa !16
  %arrayidx.i.i.i24.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %21, i64 %retval.sroa.3.1.i
  %22 = load atomic i32, ptr %arrayidx.i.i.i24.i monotonic, align 4
  %cmp.i.not.i.i25.i = icmp eq i32 %22, %conv.i.i.i3
  br i1 %cmp.i.not.i.i25.i, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE13send_and_recvIZNS_15__malloc_impl__EmE3$_0ZNS_15__malloc_impl__EmE3$_1EEvT_T0_.exit", label %while.body.i.i23.i, !llvm.loop !111

"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE13send_and_recvIZNS_15__malloc_impl__EmE3$_0ZNS_15__malloc_impl__EmE3$_1EEvT_T0_.exit": ; preds = %while.body.i.i23.i, %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_15__malloc_impl__EmE3$_0EEvT_.exit.i"
  fence acquire
  %23 = load ptr, ptr %packet.i.i, align 8, !tbaa !29
  %payload.i.i27.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %23, i64 %retval.sroa.3.1.i, i32 1
  %arrayidx.i18.i.i = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i.i27.i, i64 0, i64 %idxprom.i.i.i
  %24 = load i64, ptr %arrayidx.i18.i.i, align 8, !tbaa !30
  %25 = inttoptr i64 %24 to ptr
  fence release
  tail call void @llvm.amdgcn.wave.barrier()
  %26 = tail call i64 @llvm.cttz.i64(i64 %retval.sroa.2.1.i, i1 true), !range !18
  %iszero.i.i.i.i6 = icmp ne i64 %retval.sroa.2.1.i, 0
  %cmp2.i.i.i7 = icmp eq i64 %26, %idxprom.i.i.i
  %cmp.i.i.i = select i1 %iszero.i.i.i.i6, i1 %cmp2.i.i.i7, i1 false
  %cond.i.i8 = zext i1 %cmp.i.i.i to i32
  %not.i.i = xor i32 %cond.i.i8, -1
  %arrayidx.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %retval.sroa.0.1.i, i64 0, i32 4, i64 %retval.sroa.3.1.i
  %27 = atomicrmw and ptr %arrayidx.i.i, i32 %not.i.i monotonic, align 4
  tail call void @llvm.amdgcn.wave.barrier()
  ret ptr %25
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
  store ptr @_ZN11__llvm_libc12_GLOBAL__N_117stdc_at_exit_funcEPv, ptr %retval.1.i.i.i, align 8, !tbaa.struct !92
  store ptr %callback, ptr %ref.tmp.sroa.4.0.retval.1.i.i.i.sroa_idx, align 8, !tbaa.struct !93
  br label %_ZN11__llvm_libcL15add_atexit_unitERKNS_12_GLOBAL__N_110AtExitUnitE.exit

_ZN11__llvm_libcL15add_atexit_unitERKNS_12_GLOBAL__N_110AtExitUnitE.exit: ; preds = %if.end.i.i, %_ZN11__llvm_libc3cpp10BlockStoreINS_12_GLOBAL__N_110AtExitUnitELm32ELb1EE7new_objEv.exit.i.i
  %..i = sext i1 %cmp.i.not.i to i32
  ret i32 %..i
}

; Function Attrs: mustprogress nounwind
define internal void @_ZN11__llvm_libc12_GLOBAL__N_117stdc_at_exit_funcEPv(ptr nocapture noundef readonly %payload) #13 {
entry:
  tail call void %payload() #20
  ret void
}

; Function Attrs: mustprogress noreturn nounwind
define internal void @exit(i32 noundef %status) #14 {
entry:
  tail call void @_ZN11__llvm_libc8internal19call_exit_callbacksEv() #20
  tail call void @_ZN11__llvm_libc10quick_exitEi(i32 noundef %status) #20
  unreachable
}

; Function Attrs: mustprogress noreturn nounwind
define internal void @_ZN11__llvm_libc10quick_exitEi(i32 noundef %status) local_unnamed_addr #14 {
entry:
  %status.addr = alloca i32, align 4, addrspace(5)
  %port = alloca %"struct.__llvm_libc::rpc::Port", align 8, addrspace(5)
  %status.addr.ascast = addrspacecast ptr addrspace(5) %status.addr to ptr
  %port.ascast = addrspacecast ptr addrspace(5) %port to ptr
  store i32 %status, ptr addrspace(5) %status.addr, align 4, !tbaa !47
  call void @llvm.lifetime.start.p5(i64 32, ptr addrspace(5) %port) #23
  %call = tail call %"struct.__llvm_libc::rpc::Port" @_ZN11__llvm_libc3rpc6Client4openILt1EEENS0_4PortILb0ENS0_6PacketILj32EEEEEv(ptr noundef nonnull align 8 dereferenceable(288) addrspacecast (ptr addrspace(1) @_ZN11__llvm_libc3rpc6clientE to ptr)) #24
  %0 = extractvalue %"struct.__llvm_libc::rpc::Port" %call, 0
  store ptr %0, ptr addrspace(5) %port, align 8
  %1 = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr addrspace(5) %port, i32 0, i32 1
  %2 = extractvalue %"struct.__llvm_libc::rpc::Port" %call, 1
  store i64 %2, ptr addrspace(5) %1, align 8
  %3 = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr addrspace(5) %port, i32 0, i32 2
  %4 = extractvalue %"struct.__llvm_libc::rpc::Port" %call, 2
  store i64 %4, ptr addrspace(5) %3, align 8
  %5 = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr addrspace(5) %port, i32 0, i32 3
  %6 = extractvalue %"struct.__llvm_libc::rpc::Port" %call, 3
  store i32 %6, ptr addrspace(5) %5, align 8
  %7 = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr addrspace(5) %port, i32 0, i32 4
  %8 = extractvalue %"struct.__llvm_libc::rpc::Port" %call, 4
  store i8 %8, ptr addrspace(5) %7, align 4
  %9 = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr addrspace(5) %port, i32 0, i32 5
  %10 = extractvalue %"struct.__llvm_libc::rpc::Port" %call, 5
  store i8 %10, ptr addrspace(5) %9, align 1
  %11 = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr addrspace(5) %port, i32 0, i32 6
  %12 = extractvalue %"struct.__llvm_libc::rpc::Port" %call, 6
  %.fca.0.extract = extractvalue [2 x i8] %12, 0
  store i8 %.fca.0.extract, ptr addrspace(5) %11, align 2
  %.fca.1.extract = extractvalue [2 x i8] %12, 1
  %.fca.1.gep = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr addrspace(5) %port, i32 0, i32 6, i32 1
  store i8 %.fca.1.extract, ptr addrspace(5) %.fca.1.gep, align 1
  call fastcc void @"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE13send_and_recvIZNS_10quick_exitEiE3$_0ZNS_10quick_exitEiE3$_1EEvT_T0_"(ptr noundef nonnull align 8 dereferenceable(30) %port.ascast) #24
  call fastcc void @"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_10quick_exitEiE3$_2EEvT_"(ptr noundef nonnull align 8 dereferenceable(30) %port.ascast, ptr nonnull %status.addr.ascast) #24
  call void @_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(30) %port.ascast) #24
  call void @llvm.amdgcn.endpgm()
  unreachable
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p5(i64 immarg, ptr addrspace(5) nocapture) #15

; Function Attrs: inlinehint nounwind
define internal %"struct.__llvm_libc::rpc::Port" @_ZN11__llvm_libc3rpc6Client4openILt1EEENS0_4PortILb0ENS0_6PacketILj32EEEEEv(ptr noundef nonnull align 8 dereferenceable(288) %this) local_unnamed_addr #16 comdat align 2 {
entry:
  %inbox.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %this, i64 0, i32 1
  %outbox.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %this, i64 0, i32 2
  %packet.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %this, i64 0, i32 3
  br label %for.cond

for.cond:                                         ; preds = %cleanup.cont, %entry
  %p.sroa.9.0 = phi i32 [ undef, %entry ], [ %p.sroa.9.1, %cleanup.cont ]
  %p.sroa.7.0 = phi i64 [ undef, %entry ], [ %p.sroa.7.1, %cleanup.cont ]
  %p.sroa.5.0 = phi i64 [ undef, %entry ], [ %p.sroa.5.1, %cleanup.cont ]
  %p.sroa.0.0 = phi ptr [ undef, %entry ], [ %p.sroa.0.1, %cleanup.cont ]
  %retval.sroa.4.0 = phi i32 [ undef, %entry ], [ %retval.sroa.4.1, %cleanup.cont ]
  %retval.sroa.3.0 = phi i64 [ undef, %entry ], [ %retval.sroa.3.1, %cleanup.cont ]
  %retval.sroa.2.0 = phi i64 [ undef, %entry ], [ %retval.sroa.2.1, %cleanup.cont ]
  %retval.sroa.0.0 = phi ptr [ undef, %entry ], [ %retval.sroa.0.1, %cleanup.cont ]
  %0 = load i64, ptr %this, align 8, !tbaa !8, !noalias !113
  %cmp.not52.not.i = icmp eq i64 %0, 0
  br i1 %cmp.not52.not.i, label %for.end.i, label %for.body.lr.ph.i

for.body.lr.ph.i:                                 ; preds = %for.cond
  %1 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %sh_prom.i.i = zext i32 %1 to i64
  %shl.i.i = shl nuw i64 1, %sh_prom.i.i
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.critedge.i, %for.body.lr.ph.i
  %index.053.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %inc.i, %for.inc.critedge.i ]
  %2 = tail call i64 @llvm.read_register.i64(metadata !15) #21, !noalias !113
  %and.i.i = and i64 %2, %shl.i.i
  %tobool.i.i = icmp ne i64 %and.i.i, 0
  %arrayidx.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %this, i64 0, i32 4, i64 %index.053.i
  %conv.i.i = zext i1 %tobool.i.i to i32
  %3 = atomicrmw or ptr %arrayidx.i.i, i32 %conv.i.i monotonic, align 4, !noalias !113
  %tobool4.i.i = icmp ne i32 %3, 0
  %4 = tail call i32 @llvm.amdgcn.ballot.i32(i1 %tobool4.i.i)
  %conv.i.i.i = zext i32 %4 to i64
  %and.i.i.i = and i64 %2, %conv.i.i.i
  %cmp.i.not.i = icmp eq i64 %and.i.i.i, %2
  br i1 %cmp.i.not.i, label %for.inc.critedge.i, label %if.then.i.i

if.then.i.i:                                      ; preds = %for.body.i
  fence acquire
  %5 = load ptr, ptr %inbox.i.i, align 8, !tbaa !16, !noalias !113
  %arrayidx.i41.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %5, i64 %index.053.i
  %6 = load atomic i32, ptr %arrayidx.i41.i monotonic, align 4, !noalias !113
  %7 = load ptr, ptr %outbox.i.i, align 8, !tbaa !17, !noalias !113
  %arrayidx.i42.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %7, i64 %index.053.i
  %8 = load atomic i32, ptr %arrayidx.i42.i monotonic, align 4, !noalias !113
  %cmp.i43.not.i = icmp eq i32 %6, %8
  br i1 %cmp.i43.not.i, label %if.end12.i, label %if.then10.i

if.then10.i:                                      ; preds = %if.then.i.i
  fence release
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !113
  %9 = tail call i64 @llvm.cttz.i64(i64 %2, i1 true), !range !18
  %iszero.i.i.i.i = icmp ne i64 %2, 0
  %cmp2.i.i.i = icmp eq i64 %9, %sh_prom.i.i
  %cmp.i.i.i = select i1 %iszero.i.i.i.i, i1 %cmp2.i.i.i, i1 false
  %cond.i.i = zext i1 %cmp.i.i.i to i32
  %not.i.i = xor i32 %cond.i.i, -1
  %10 = atomicrmw and ptr %arrayidx.i.i, i32 %not.i.i monotonic, align 4, !noalias !113
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !113
  br label %for.inc.critedge.i

if.end12.i:                                       ; preds = %if.then.i.i
  %11 = tail call i64 @llvm.cttz.i64(i64 %2, i1 true), !range !18
  %iszero.i.i.i = icmp ne i64 %2, 0
  %cmp2.i.i = icmp eq i64 %11, %sh_prom.i.i
  %cmp.i47.i = select i1 %iszero.i.i.i, i1 %cmp2.i.i, i1 false
  br i1 %cmp.i47.i, label %if.then14.i, label %if.end20.i

if.then14.i:                                      ; preds = %if.end12.i
  %12 = load ptr, ptr %packet.i, align 8, !tbaa !19, !noalias !113
  %opcode.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %12, i64 %index.053.i, i32 0, i32 1
  store i16 1, ptr %opcode.i, align 8, !tbaa !20, !noalias !113
  %arrayidx18.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %12, i64 %index.053.i
  store i64 %2, ptr %arrayidx18.i, align 64, !tbaa !25, !noalias !113
  br label %if.end20.i

if.end20.i:                                       ; preds = %if.then14.i, %if.end12.i
  tail call void @llvm.amdgcn.wave.barrier(), !noalias !113
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit

for.inc.critedge.i:                               ; preds = %if.then10.i, %for.body.i
  %inc.i = add nuw i64 %index.053.i, 1
  %13 = load i64, ptr %this, align 8, !tbaa !8, !noalias !113
  %cmp.not.i = icmp ult i64 %inc.i, %13
  br i1 %cmp.not.i, label %for.body.i, label %for.end.i, !llvm.loop !116

for.end.i:                                        ; preds = %for.inc.critedge.i, %for.cond
  %14 = ptrtoint ptr %p.sroa.0.0 to i64
  %p.sroa.0.0.insert.mask = and i64 %14, -256
  %15 = inttoptr i64 %p.sroa.0.0.insert.mask to ptr
  br label %_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit

_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit: ; preds = %for.end.i, %if.end20.i
  %tobool.i.i.i = phi i1 [ false, %for.end.i ], [ true, %if.end20.i ]
  %p.sroa.9.1 = phi i32 [ %p.sroa.9.0, %for.end.i ], [ %6, %if.end20.i ]
  %p.sroa.7.1 = phi i64 [ %p.sroa.7.0, %for.end.i ], [ %index.053.i, %if.end20.i ]
  %p.sroa.5.1 = phi i64 [ %p.sroa.5.0, %for.end.i ], [ %2, %if.end20.i ]
  %p.sroa.0.1 = phi ptr [ %15, %for.end.i ], [ %this, %if.end20.i ]
  br i1 %tobool.i.i.i, label %if.then, label %cleanup

if.then:                                          ; preds = %_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit
  br label %cleanup

cleanup:                                          ; preds = %if.then, %_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit
  %retval.sroa.4.1 = phi i32 [ %p.sroa.9.1, %if.then ], [ %retval.sroa.4.0, %_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit ]
  %retval.sroa.3.1 = phi i64 [ %p.sroa.7.1, %if.then ], [ %retval.sroa.3.0, %_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit ]
  %retval.sroa.2.1 = phi i64 [ %p.sroa.5.1, %if.then ], [ %retval.sroa.2.0, %_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit ]
  %retval.sroa.0.1 = phi ptr [ %p.sroa.0.1, %if.then ], [ %retval.sroa.0.0, %_ZN11__llvm_libc3rpc6Client8try_openILt1EEENS_3cpp8optionalINS0_4PortILb0ENS0_6PacketILj32EEEEEEEv.exit ]
  br i1 %tobool.i.i.i, label %return, label %cleanup.cont

cleanup.cont:                                     ; preds = %cleanup
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %for.cond, !llvm.loop !117

return:                                           ; preds = %cleanup
  %.fca.0.insert = insertvalue %"struct.__llvm_libc::rpc::Port" poison, ptr %retval.sroa.0.1, 0
  %.fca.1.insert = insertvalue %"struct.__llvm_libc::rpc::Port" %.fca.0.insert, i64 %retval.sroa.2.1, 1
  %.fca.2.insert = insertvalue %"struct.__llvm_libc::rpc::Port" %.fca.1.insert, i64 %retval.sroa.3.1, 2
  %.fca.3.insert = insertvalue %"struct.__llvm_libc::rpc::Port" %.fca.2.insert, i32 %retval.sroa.4.1, 3
  %.fca.4.insert = insertvalue %"struct.__llvm_libc::rpc::Port" %.fca.3.insert, i8 0, 4
  %.fca.5.insert = insertvalue %"struct.__llvm_libc::rpc::Port" %.fca.4.insert, i8 1, 5
  %.fca.6.0.insert = insertvalue %"struct.__llvm_libc::rpc::Port" %.fca.5.insert, i8 undef, 6, 0
  %.fca.6.1.insert = insertvalue %"struct.__llvm_libc::rpc::Port" %.fca.6.0.insert, i8 undef, 6, 1
  ret %"struct.__llvm_libc::rpc::Port" %.fca.6.1.insert
}

; Function Attrs: inlinehint mustprogress nofree nounwind
define internal fastcc void @"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE13send_and_recvIZNS_10quick_exitEiE3$_0ZNS_10quick_exitEiE3$_1EEvT_T0_"(ptr nocapture noundef nonnull align 8 dereferenceable(30) %this) unnamed_addr #17 align 2 {
entry:
  %owns_buffer.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 5
  %0 = load i8, ptr %owns_buffer.i, align 1, !tbaa !118, !range !120, !noundef !121
  %tobool.not.i = icmp eq i8 %0, 0
  br i1 %tobool.not.i, label %cond.false.i, label %cond.true.i

cond.true.i:                                      ; preds = %entry
  %out.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 3
  %1 = load i32, ptr %out.i, align 8, !tbaa !122
  %index3.phi.trans.insert.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 2
  %.pre.i = load i64, ptr %index3.phi.trans.insert.i, align 8, !tbaa !123
  br label %cond.end.i

cond.false.i:                                     ; preds = %entry
  %2 = load ptr, ptr %this, align 8, !tbaa !124
  %index.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 2
  %3 = load i64, ptr %index.i, align 8, !tbaa !123
  %inbox.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %2, i64 0, i32 1
  %4 = load ptr, ptr %inbox.i.i, align 8, !tbaa !16
  %arrayidx.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %4, i64 %3
  %5 = load atomic i32, ptr %arrayidx.i.i monotonic, align 4
  %out4.phi.trans.insert.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 3
  %.pre15.i = load i32, ptr %out4.phi.trans.insert.i, align 8, !tbaa !122
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %cond.true.i
  %6 = phi i32 [ %1, %cond.true.i ], [ %.pre15.i, %cond.false.i ]
  %7 = phi i64 [ %.pre.i, %cond.true.i ], [ %3, %cond.false.i ]
  %cond.i = phi i32 [ %1, %cond.true.i ], [ %5, %cond.false.i ]
  %cmp.i.not3.i.i = icmp eq i32 %cond.i, %6
  br i1 %cmp.i.not3.i.i, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_10quick_exitEiE3$_0EEvT_.exit", label %while.body.lr.ph.i.i

while.body.lr.ph.i.i:                             ; preds = %cond.end.i
  %8 = load ptr, ptr %this, align 8, !tbaa !124
  %inbox.i.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %8, i64 0, i32 1
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %while.body.i.i, %while.body.lr.ph.i.i
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %9 = load ptr, ptr %inbox.i.i.i, align 8, !tbaa !16
  %arrayidx.i.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %9, i64 %7
  %10 = load atomic i32, ptr %arrayidx.i.i.i monotonic, align 4
  %cmp.i.not.i.i = icmp eq i32 %10, %6
  br i1 %cmp.i.not.i.i, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_10quick_exitEiE3$_0EEvT_.exit", label %while.body.i.i, !llvm.loop !125

"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_10quick_exitEiE3$_0EEvT_.exit": ; preds = %while.body.i.i, %cond.end.i
  %out4.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 3
  %index3.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 2
  fence acquire
  %11 = load ptr, ptr %this, align 8, !tbaa !124
  %12 = load i64, ptr %index3.i, align 8, !tbaa !123
  %13 = load i32, ptr %out4.i, align 8, !tbaa !122
  %tobool.not.i.i = icmp eq i32 %13, 0
  %conv.i.i = zext i1 %tobool.not.i.i to i32
  fence release
  %outbox.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %11, i64 0, i32 2
  %14 = load ptr, ptr %outbox.i.i, align 8, !tbaa !17
  %arrayidx.i14.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %14, i64 %12
  store atomic i32 %conv.i.i, ptr %arrayidx.i14.i monotonic, align 4
  store i32 %conv.i.i, ptr %out4.i, align 8, !tbaa !122
  store i8 0, ptr %owns_buffer.i, align 1, !tbaa !118
  %receive.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 4
  store i8 0, ptr %receive.i, align 4, !tbaa !126
  %15 = load ptr, ptr %this, align 8, !tbaa !124
  %16 = load i64, ptr %index3.i, align 8, !tbaa !123
  %inbox.i.i14 = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %15, i64 0, i32 1
  %17 = load ptr, ptr %inbox.i.i14, align 8, !tbaa !16
  %arrayidx.i16.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %17, i64 %16
  %18 = load atomic i32, ptr %arrayidx.i16.i monotonic, align 4
  %cmp.i.not3.i.i17 = icmp eq i32 %18, %conv.i.i
  br i1 %cmp.i.not3.i.i17, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4recvIZNS_10quick_exitEiE3$_1EEvT_.exit", label %while.body.i.i20

while.body.i.i20:                                 ; preds = %while.body.i.i20, %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_10quick_exitEiE3$_0EEvT_.exit"
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %19 = load ptr, ptr %inbox.i.i14, align 8, !tbaa !16
  %arrayidx.i.i.i21 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %19, i64 %16
  %20 = load atomic i32, ptr %arrayidx.i.i.i21 monotonic, align 4
  %cmp.i.not.i.i22 = icmp eq i32 %20, %conv.i.i
  br i1 %cmp.i.not.i.i22, label %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4recvIZNS_10quick_exitEiE3$_1EEvT_.exit", label %while.body.i.i20, !llvm.loop !125

"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4recvIZNS_10quick_exitEiE3$_1EEvT_.exit": ; preds = %while.body.i.i20, %"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_10quick_exitEiE3$_0EEvT_.exit"
  fence acquire
  store i8 1, ptr %receive.i, align 4, !tbaa !126
  store i8 1, ptr %owns_buffer.i, align 1, !tbaa !118
  ret void
}

; Function Attrs: inlinehint mustprogress nofree nounwind
define internal fastcc void @"_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE4sendIZNS_10quick_exitEiE3$_2EEvT_"(ptr nocapture noundef nonnull align 8 dereferenceable(30) %this, ptr nocapture readonly %fill.coerce) unnamed_addr #17 align 2 {
entry:
  %owns_buffer = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 5
  %0 = load i8, ptr %owns_buffer, align 1, !tbaa !118, !range !120, !noundef !121
  %tobool.not = icmp eq i8 %0, 0
  br i1 %tobool.not, label %cond.false, label %cond.true

cond.true:                                        ; preds = %entry
  %out = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 3
  %1 = load i32, ptr %out, align 8, !tbaa !122
  %index4.phi.trans.insert = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 2
  %.pre = load i64, ptr %index4.phi.trans.insert, align 8, !tbaa !123
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load ptr, ptr %this, align 8, !tbaa !124
  %index = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 2
  %3 = load i64, ptr %index, align 8, !tbaa !123
  %inbox.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %2, i64 0, i32 1
  %4 = load ptr, ptr %inbox.i, align 8, !tbaa !16
  %arrayidx.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %4, i64 %3
  %5 = load atomic i32, ptr %arrayidx.i monotonic, align 4
  %out5.phi.trans.insert = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 3
  %.pre16 = load i32, ptr %out5.phi.trans.insert, align 8, !tbaa !122
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %6 = phi i32 [ %1, %cond.true ], [ %.pre16, %cond.false ]
  %7 = phi i64 [ %.pre, %cond.true ], [ %3, %cond.false ]
  %cond = phi i32 [ %1, %cond.true ], [ %5, %cond.false ]
  %cmp.i.not3.i = icmp eq i32 %cond, %6
  br i1 %cmp.i.not3.i, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit, label %while.body.lr.ph.i

while.body.lr.ph.i:                               ; preds = %cond.end
  %8 = load ptr, ptr %this, align 8, !tbaa !124
  %inbox.i.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %8, i64 0, i32 1
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  %9 = load ptr, ptr %inbox.i.i, align 8, !tbaa !16
  %arrayidx.i.i = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %9, i64 %7
  %10 = load atomic i32, ptr %arrayidx.i.i monotonic, align 4
  %cmp.i.not.i = icmp eq i32 %10, %6
  br i1 %cmp.i.not.i, label %_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit, label %while.body.i, !llvm.loop !125

_ZN11__llvm_libc3rpc7ProcessILb0ENS0_6PacketILj32EEEE18wait_for_ownershipEyjj.exit: ; preds = %while.body.i, %cond.end
  %out5 = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 3
  %index4 = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 2
  fence acquire
  %11 = load ptr, ptr %this, align 8, !tbaa !124
  %packet = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %11, i64 0, i32 3
  %12 = load ptr, ptr %packet, align 8, !tbaa !29
  %13 = load i64, ptr %index4, align 8, !tbaa !123
  %payload.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Packet", ptr %12, i64 %13, i32 1
  %14 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %idxprom.i = zext i32 %14 to i64
  %arrayidx.i14 = getelementptr inbounds [32 x %"struct.__llvm_libc::rpc::Buffer"], ptr %payload.i, i64 0, i64 %idxprom.i
  %.val.val.i = load i32, ptr %fill.coerce, align 4, !tbaa !47
  store i32 %.val.val.i, ptr %arrayidx.i14, align 8, !tbaa !47
  %15 = load i32, ptr %out5, align 8, !tbaa !122
  %tobool.not.i = icmp eq i32 %15, 0
  %conv.i = zext i1 %tobool.not.i to i32
  fence release
  %outbox.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %11, i64 0, i32 2
  %16 = load ptr, ptr %outbox.i, align 8, !tbaa !17
  %arrayidx.i15 = getelementptr inbounds %"struct.__llvm_libc::cpp::Atomic", ptr %16, i64 %13
  store atomic i32 %conv.i, ptr %arrayidx.i15 monotonic, align 4
  store i32 %conv.i, ptr %out5, align 8, !tbaa !122
  store i8 0, ptr %owns_buffer, align 1, !tbaa !118
  %receive = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 4
  store i8 0, ptr %receive, align 4, !tbaa !126
  ret void
}

; Function Attrs: inlinehint mustprogress nounwind
define internal void @_ZN11__llvm_libc3rpc4PortILb0ENS0_6PacketILj32EEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(30) %this) local_unnamed_addr #18 comdat align 2 {
entry:
  %0 = load ptr, ptr %this, align 8, !tbaa !124
  %lane_mask = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 1
  %1 = load i64, ptr %lane_mask, align 8, !tbaa !127
  %index4 = getelementptr inbounds %"struct.__llvm_libc::rpc::Port", ptr %this, i64 0, i32 2
  %2 = load i64, ptr %index4, align 8, !tbaa !123
  fence release
  tail call void @llvm.amdgcn.wave.barrier()
  %3 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %conv.i.i = zext i32 %3 to i64
  %4 = tail call i64 @llvm.cttz.i64(i64 %1, i1 true), !range !18
  %iszero.i.i.i = icmp ne i64 %1, 0
  %cmp2.i.i = icmp eq i64 %4, %conv.i.i
  %cmp.i.i = select i1 %iszero.i.i.i, i1 %cmp2.i.i, i1 false
  %cond.i = zext i1 %cmp.i.i to i32
  %not.i = xor i32 %cond.i, -1
  %arrayidx.i = getelementptr inbounds %"struct.__llvm_libc::rpc::Process", ptr %0, i64 0, i32 4, i64 %2
  %5 = atomicrmw and ptr %arrayidx.i, i32 %not.i monotonic, align 4
  tail call void @llvm.amdgcn.wave.barrier()
  ret void
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
entry:
  br label %for.cond.i.i

for.cond.i.i:                                     ; preds = %for.cond.i.i, %entry
  %End.0.i.i = phi ptr [ %str, %entry ], [ %incdec.ptr.i.i, %for.cond.i.i ]
  %0 = load i8, ptr %End.0.i.i, align 1, !tbaa !112
  %cmp.i.i = icmp eq i8 %0, 0
  %incdec.ptr.i.i = getelementptr inbounds i8, ptr %End.0.i.i, i64 1
  br i1 %cmp.i.i, label %_ZN11__llvm_libc3cpp11string_viewC2EPKc.exit, label %for.cond.i.i, !llvm.loop !128

_ZN11__llvm_libc3cpp11string_viewC2EPKc.exit:     ; preds = %for.cond.i.i
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %End.0.i.i to i64
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %str to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %1 = load ptr, ptr addrspace(1) @_ZN11__llvm_libc6stdoutE, align 8, !tbaa !4
  %call.i = tail call %"struct.__llvm_libc::FileIOResult" @_ZN11__llvm_libc4File14write_unlockedEPKvm(ptr noundef nonnull align 8 dereferenceable(98) %1, ptr noundef %str, i64 noundef %sub.ptr.sub.i.i) #20
  %2 = extractvalue %"struct.__llvm_libc::FileIOResult" %call.i, 0
  %cmp.not = icmp eq i64 %sub.ptr.sub.i.i, %2
  br i1 %cmp.not, label %if.end5, label %cleanup

if.end5:                                          ; preds = %_ZN11__llvm_libc3cpp11string_viewC2EPKc.exit
  %3 = load ptr, ptr addrspace(1) @_ZN11__llvm_libc6stdoutE, align 8, !tbaa !4
  %call.i25 = tail call %"struct.__llvm_libc::FileIOResult" @_ZN11__llvm_libc4File14write_unlockedEPKvm(ptr noundef nonnull align 8 dereferenceable(98) %3, ptr noundef addrspacecast (ptr addrspace(4) @.str.3 to ptr), i64 noundef 1) #20
  %4 = extractvalue %"struct.__llvm_libc::FileIOResult" %call.i25, 0
  %cmp12.not = icmp ne i64 %4, 1
  %. = sext i1 %cmp12.not to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end5, %_ZN11__llvm_libc3cpp11string_viewC2EPKc.exit
  %retval.0 = phi i32 [ -1, %_ZN11__llvm_libc3cpp11string_viewC2EPKc.exit ], [ %., %if.end5 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal %"struct.__llvm_libc::FileIOResult" @_ZN11__llvm_libc4File14write_unlockedEPKvm(ptr noundef nonnull align 8 dereferenceable(98) %this, ptr noundef %data, i64 noundef %len) local_unnamed_addr #10 align 2 {
entry:
  %mode.i = getelementptr inbounds %"class.__llvm_libc::File", ptr %this, i64 0, i32 12
  %0 = load i32, ptr %mode.i, align 8, !tbaa !129
  %and.i = and i32 %0, 14
  %tobool.i.not = icmp eq i32 %and.i, 0
  br i1 %tobool.i.not, label %return.sink.split, label %if.end

if.end:                                           ; preds = %entry
  %prev_op = getelementptr inbounds %"class.__llvm_libc::File", ptr %this, i64 0, i32 15
  store i8 2, ptr %prev_op, align 8, !tbaa !130
  %1 = load ptr, ptr %this, align 8, !tbaa !131
  %call.i = tail call %"struct.__llvm_libc::FileIOResult" %1(ptr noundef nonnull %this, ptr noundef %data, i64 noundef %len) #20
  %2 = extractvalue %"struct.__llvm_libc::FileIOResult" %call.i, 0
  %cmp.i = icmp ult i64 %2, %len
  br i1 %cmp.i, label %return.sink.split, label %return

return.sink.split:                                ; preds = %if.end, %entry
  %retval.sroa.0.0.ph = phi i64 [ 0, %entry ], [ %2, %if.end ]
  %retval.sroa.3.0.ph = phi i32 [ 9, %entry ], [ 0, %if.end ]
  %err.i = getelementptr inbounds %"class.__llvm_libc::File", ptr %this, i64 0, i32 19
  store i8 1, ptr %err.i, align 1, !tbaa !132
  br label %return

return:                                           ; preds = %return.sink.split, %if.end
  %retval.sroa.0.0 = phi i64 [ %2, %if.end ], [ %retval.sroa.0.0.ph, %return.sink.split ]
  %retval.sroa.3.0 = phi i32 [ 0, %if.end ], [ %retval.sroa.3.0.ph, %return.sink.split ]
  %.fca.0.insert = insertvalue %"struct.__llvm_libc::FileIOResult" poison, i64 %retval.sroa.0.0, 0
  %.fca.1.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.0.insert, i32 %retval.sroa.3.0, 1
  %.fca.2.0.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.1.insert, i8 undef, 2, 0
  %.fca.2.1.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.2.0.insert, i8 undef, 2, 1
  %.fca.2.2.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.2.1.insert, i8 undef, 2, 2
  %.fca.2.3.insert = insertvalue %"struct.__llvm_libc::FileIOResult" %.fca.2.2.insert, i8 undef, 2, 3
  ret %"struct.__llvm_libc::FileIOResult" %.fca.2.3.insert
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
