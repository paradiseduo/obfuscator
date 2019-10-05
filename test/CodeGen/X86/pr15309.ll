; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-linux-pc | FileCheck %s

define void @test_convert_float2_ulong2(<2 x i64>* nocapture %src, <2 x float>* nocapture %dest) nounwind {
; CHECK-LABEL: test_convert_float2_ulong2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pushl %edi
; CHECK-NEXT:    pushl %esi
; CHECK-NEXT:    subl $20, %esp
; CHECK-NEXT:    movl {{[0-9]+}}(%esp), %eax
; CHECK-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; CHECK-NEXT:    movl 168(%ecx), %edx
; CHECK-NEXT:    movl 172(%ecx), %esi
; CHECK-NEXT:    movl 160(%ecx), %edi
; CHECK-NEXT:    movl 164(%ecx), %ecx
; CHECK-NEXT:    movl %ecx, {{[0-9]+}}(%esp)
; CHECK-NEXT:    movl %edi, (%esp)
; CHECK-NEXT:    movl %esi, {{[0-9]+}}(%esp)
; CHECK-NEXT:    movl %edx, {{[0-9]+}}(%esp)
; CHECK-NEXT:    xorl %edx, %edx
; CHECK-NEXT:    testl %ecx, %ecx
; CHECK-NEXT:    setns %dl
; CHECK-NEXT:    fildll (%esp)
; CHECK-NEXT:    fadds {{\.LCPI.*}}(,%edx,4)
; CHECK-NEXT:    xorl %ecx, %ecx
; CHECK-NEXT:    testl %esi, %esi
; CHECK-NEXT:    setns %cl
; CHECK-NEXT:    fildll {{[0-9]+}}(%esp)
; CHECK-NEXT:    fadds {{\.LCPI.*}}(,%ecx,4)
; CHECK-NEXT:    fstps 84(%eax)
; CHECK-NEXT:    fstps 80(%eax)
; CHECK-NEXT:    addl $20, %esp
; CHECK-NEXT:    popl %esi
; CHECK-NEXT:    popl %edi
; CHECK-NEXT:    retl
  %t0 = getelementptr <2 x i64>, <2 x i64>* %src, i32 10
  %t1 = load <2 x i64>, <2 x i64>* %t0, align 16
  %t2 = uitofp <2 x i64> %t1 to <2 x float>
  %t3 = getelementptr <2 x float>, <2 x float>* %dest, i32 10
  store <2 x float> %t2, <2 x float>* %t3, align 8
  ret void
}

