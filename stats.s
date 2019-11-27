	.file	"stats.c"
	.text
	.p2align 4,,15
	.globl	min_max_avg
	.type	min_max_avg, @function
min_max_avg:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -96(%rbp)
	movq	%r9, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movslq	%esi, %rax
	movss	.LC3(%rip), %xmm0
	leaq	18(,%rax,4), %rax
	movq	%rcx, -80(%rbp)
	movq	%r9, -112(%rbp)
	movq	%r8, -88(%rbp)
	movq	16(%rbp), %r9
	movss	%xmm0, (%rdi)
	andq	$-16, %rax
	movq	24(%rbp), %r10
	movq	32(%rbp), %r14
	subq	%rax, %rsp
	movslq	%edx, %rax
	movq	40(%rbp), %rbx
	leaq	18(,%rax,4), %rax
	movq	%rsp, %r13
	movq	48(%rbp), %r11
	movq	56(%rbp), %r15
	andq	$-16, %rax
	subq	%rax, %rsp
	testl	%esi, %esi
	movq	%rsp, %rcx
	jle	.L2
	leal	-1(%rsi), %edi
	movq	%rdi, %rax
	leaq	4(,%rdi,4), %r8
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$0x00000000, 0(%r13,%rdi)
	movss	%xmm0, (%r15,%rdi)
	addq	$4, %rdi
	cmpq	%r8, %rdi
	jne	.L3
	testl	%edx, %edx
	jle	.L54
.L30:
	leal	-1(%rdx), %eax
	movss	.LC0(%rip), %xmm8
	movss	.LC1(%rip), %xmm9
	movl	%eax, -68(%rbp)
	leaq	4(,%rax,4), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movss	%xmm8, (%r10,%rax)
	movl	$0x00000000, (%rcx,%rax)
	movss	%xmm9, (%r9,%rax)
	movss	%xmm0, (%r14,%rax)
	addq	$4, %rax
	cmpq	%rdi, %rax
	jne	.L5
	testl	%esi, %esi
	jle	.L6
	leal	-1(%rsi), %eax
.L31:
	leaq	4(,%rax,4), %rdi
	movl	-68(%rbp), %eax
	movq	%r14, -104(%rbp)
	movq	-96(%rbp), %r14
	movaps	%xmm9, %xmm5
	movaps	%xmm8, %xmm4
	movl	%esi, -72(%rbp)
	xorl	%r8d, %r8d
	movq	%rdi, %rsi
	leaq	4(,%rax,4), %r12
	.p2align 4,,10
	.p2align 3
.L7:
	testl	%edx, %edx
	jle	.L19
	movq	(%r14,%r8,2), %rdi
	movaps	%xmm8, %xmm2
	movaps	%xmm9, %xmm1
	xorl	%eax, %eax
	movss	0(%r13,%r8), %xmm3
	.p2align 4,,10
	.p2align 3
.L16:
	movss	(%rdi,%rax), %xmm0
	movaps	%xmm0, %xmm6
	minss	%xmm5, %xmm6
	movaps	%xmm6, %xmm5
	movaps	%xmm0, %xmm6
	maxss	%xmm4, %xmm6
	movaps	%xmm6, %xmm4
	movaps	%xmm0, %xmm6
	minss	%xmm1, %xmm6
	movaps	%xmm6, %xmm1
	movaps	%xmm0, %xmm6
	maxss	%xmm2, %xmm6
	movaps	%xmm6, %xmm2
	movss	(%r9,%rax), %xmm6
	ucomiss	%xmm0, %xmm6
	jbe	.L12
	movss	%xmm0, (%r9,%r8)
.L12:
	ucomiss	(%r10,%rax), %xmm0
	jbe	.L14
	movss	%xmm0, (%r10,%r8)
.L14:
	movss	%xmm2, (%r11)
	movss	%xmm1, (%rbx)
	movss	(%rdi,%rax), %xmm0
	addss	%xmm0, %xmm3
	addss	(%rcx,%rax), %xmm0
	movss	%xmm0, (%rcx,%rax)
	addq	$4, %rax
	cmpq	%r12, %rax
	jne	.L16
	movss	%xmm3, 0(%r13,%r8)
.L19:
	addq	$4, %r8
	addq	$4, %r11
	addq	$4, %rbx
	cmpq	%rsi, %r8
	jne	.L7
	movq	-80(%rbp), %rax
	testl	%edx, %edx
	movl	-72(%rbp), %esi
	movq	-104(%rbp), %r14
	movss	%xmm5, (%rax)
	movq	-88(%rbp), %rax
	movss	%xmm4, (%rax)
	jle	.L29
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	cvtsi2ss	%edx, %xmm0
	.p2align 4,,10
	.p2align 3
.L20:
	movss	0(%r13,%rax), %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, (%r15,%rax)
	addq	$4, %rax
	cmpq	%rax, %r8
	jne	.L20
	pxor	%xmm0, %xmm0
	movl	-68(%rbp), %eax
	cvtsi2ss	%esi, %xmm0
	leaq	4(,%rax,4), %rdi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L22:
	movss	(%rcx,%rax), %xmm1
	divss	%xmm0, %xmm1
	movss	%xmm1, (%r14,%rax)
	addq	$4, %rax
	cmpq	%rax, %rdi
	jne	.L22
.L29:
	cmpl	$2, %esi
	jle	.L39
.L33:
	leal	-3(%rsi), %edi
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movq	%r13, %rax
	shrl	%edi
	movl	%edi, %ecx
	leaq	8(%r13,%rcx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L24:
	addss	(%rax), %xmm0
	addq	$8, %rax
	addss	-4(%rax), %xmm1
	cmpq	%rcx, %rax
	jne	.L24
	addss	%xmm1, %xmm0
	leal	2(%rdi,%rdi), %edi
.L23:
	cmpl	%edi, %esi
	jle	.L25
	leal	-1(%rsi), %ecx
	movslq	%edi, %r8
	leaq	0(%r13,%r8,4), %rax
	subl	%edi, %ecx
	addq	%r8, %rcx
	leaq	4(%r13,%rcx,4), %rcx
	.p2align 4,,10
	.p2align 3
.L26:
	addss	(%rax), %xmm0
	addq	$4, %rax
	cmpq	%rax, %rcx
	jne	.L26
.L25:
	imull	%edx, %esi
	testl	%esi, %esi
	jle	.L1
	pxor	%xmm1, %xmm1
	movq	-112(%rbp), %rax
	cvtsi2ss	%esi, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
.L1:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L55
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L2:
	.cfi_restore_state
	testl	%edx, %edx
	jg	.L30
	movq	-80(%rbp), %rax
	cmpl	$2, %esi
	movl	$0x7f800000, (%rax)
	movq	-88(%rbp), %rax
	movl	$0xff800000, (%rax)
	jg	.L33
.L39:
	pxor	%xmm0, %xmm0
	xorl	%edi, %edi
	jmp	.L23
.L6:
	movq	-80(%rbp), %rax
	cmpl	$2, %esi
	pxor	%xmm0, %xmm0
	movss	%xmm9, (%rax)
	movq	-88(%rbp), %rax
	movss	%xmm8, (%rax)
	jg	.L33
	jmp	.L25
.L54:
	leal	-1(%rdx), %edi
	movss	.LC0(%rip), %xmm8
	movss	.LC1(%rip), %xmm9
	movl	%edi, -68(%rbp)
	jmp	.L31
.L55:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	min_max_avg, .-min_max_avg
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	4286578688
	.align 4
.LC1:
	.long	2139095040
	.align 4
.LC3:
	.long	2143289344
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
