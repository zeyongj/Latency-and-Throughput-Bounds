	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%f"
.LC2:
	.string	" min     >>>"
.LC3:
	.string	" %2d"
.LC4:
	.string	"    max   >>"
.LC5:
	.string	"  v    avg >"
.LC6:
	.string	"  v  v      "
.LC7:
	.string	"  v  v  v   "
.LC8:
	.string	" %.2f %.2f %.2f   "
.LC9:
	.string	" %f %f %f   (Overall)"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC10:
	.string	"Sample %d completed in %d cycles.\n"
	.section	.rodata.str1.1
.LC11:
	.string	"Average of %ld cycles.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC0(%rip), %rdi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	leaq	20(%rsp), %rdx
	leaq	16(%rsp), %rsi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	16(%rsp), %rdi
	salq	$3, %rdi
	call	malloc@PLT
	movl	20(%rsp), %edi
	movq	%rax, %rbx
	movq	%rax, 8(%rsp)
	imull	16(%rsp), %edi
	movslq	%edi, %rdi
	salq	$2, %rdi
	call	malloc@PLT
	movl	16(%rsp), %edi
	movq	%rax, (%rbx)
	cmpl	$1, %edi
	jle	.L2
	movslq	20(%rsp), %rsi
	subl	$2, %edi
	leaq	8(%rbx), %rcx
	leaq	8(%rbx,%rdi,8), %rdi
	movq	%rsi, %rdx
	salq	$2, %rsi
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L36:
	addq	$8, %rcx
.L4:
	addq	%rsi, %rax
	cmpq	%rcx, %rdi
	movq	%rax, (%rcx)
	jne	.L36
.L3:
	movq	8(%rsp), %r13
	leaq	.LC1(%rip), %r14
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L6:
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	testl	%edx, %edx
	jle	.L8
	.p2align 4,,10
	.p2align 3
.L7:
	movq	0(%r13), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	addl	$1, %ebx
	addq	%rbp, %rsi
	addq	$4, %rbp
	call	__isoc99_scanf@PLT
	movslq	20(%rsp), %rdx
	cmpl	%ebx, %edx
	jg	.L7
.L8:
	addl	$1, %r15d
	addq	$8, %r13
	cmpl	%r15d, 16(%rsp)
	jg	.L6
.L5:
	leaq	0(,%rdx,4), %rdi
	leaq	cycles(%rip), %rbp
	leaq	overall_avg(%rip), %r14
	xorl	%r13d, %r13d
	call	malloc@PLT
	movslq	20(%rsp), %rdi
	movq	%rax, col_min(%rip)
	salq	$2, %rdi
	call	malloc@PLT
	movslq	20(%rsp), %rdi
	movq	%rax, col_max(%rip)
	salq	$2, %rdi
	call	malloc@PLT
	movslq	16(%rsp), %rdi
	movq	%rax, col_avg(%rip)
	salq	$2, %rdi
	call	malloc@PLT
	movslq	16(%rsp), %rdi
	movq	%rax, row_min(%rip)
	salq	$2, %rdi
	call	malloc@PLT
	movslq	16(%rsp), %rdi
	movq	%rax, row_max(%rip)
	salq	$2, %rdi
	call	malloc@PLT
	movq	%rax, row_avg(%rip)
	.p2align 4,,10
	.p2align 3
.L10:
#APP
# 57 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	pushq	row_avg(%rip)
	.cfi_def_cfa_offset 104
	movl	%esi, start_time(%rip)
	leaq	overall_max(%rip), %r8
	pushq	row_max(%rip)
	.cfi_def_cfa_offset 112
	pushq	row_min(%rip)
	.cfi_def_cfa_offset 120
	leaq	overall_min(%rip), %rcx
	pushq	col_avg(%rip)
	.cfi_def_cfa_offset 128
	pushq	col_max(%rip)
	.cfi_def_cfa_offset 136
	movq	%r14, %r9
	pushq	col_min(%rip)
	.cfi_def_cfa_offset 144
	movl	68(%rsp), %edx
	movl	64(%rsp), %esi
	movq	56(%rsp), %rdi
	call	min_max_avg@PLT
#APP
# 68 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	movslq	%r13d, %rax
	addq	$48, %rsp
	.cfi_def_cfa_offset 96
	movl	%esi, 0(%rbp,%rax,4)
	xorl	%eax, %eax
	cmpl	$19999, %esi
	setg	%al
	subl	%eax, %r13d
	addl	$1, %r13d
	cmpl	$20, %r13d
	jne	.L10
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	20(%rsp), %edi
	testl	%edi, %edi
	jle	.L11
	leaq	.LC3(%rip), %r14
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L12:
	movq	col_min(%rip), %rax
	movq	%r14, %rsi
	movl	$1, %edi
	addl	$1, %ebx
	cvttss2si	(%rax,%r13), %edx
	xorl	%eax, %eax
	addq	$4, %r13
	call	__printf_chk@PLT
	cmpl	%ebx, 20(%rsp)
	jg	.L12
.L11:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	20(%rsp), %esi
	testl	%esi, %esi
	jle	.L13
	leaq	.LC3(%rip), %r14
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L14:
	movq	col_max(%rip), %rax
	movq	%r14, %rsi
	movl	$1, %edi
	addl	$1, %ebx
	cvttss2si	(%rax,%r13), %edx
	xorl	%eax, %eax
	addq	$4, %r13
	call	__printf_chk@PLT
	cmpl	%ebx, 20(%rsp)
	jg	.L14
.L13:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC5(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	20(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L15
	leaq	.LC3(%rip), %r14
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L16:
	movq	col_avg(%rip), %rax
	movq	%r14, %rsi
	movl	$1, %edi
	addl	$1, %ebx
	cvttss2si	(%rax,%r13), %edx
	xorl	%eax, %eax
	addq	$4, %r13
	call	__printf_chk@PLT
	cmpl	%ebx, 20(%rsp)
	jg	.L16
.L15:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	movl	16(%rsp), %edx
	testl	%edx, %edx
	jle	.L17
	movq	8(%rsp), %rbx
	leaq	.LC3(%rip), %r13
	xorl	%r14d, %r14d
	movl	$0, 4(%rsp)
	.p2align 4,,10
	.p2align 3
.L20:
	movq	row_min(%rip), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	leaq	.LC8(%rip), %rsi
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	cvtss2sd	(%rax,%r14), %xmm0
	movq	row_avg(%rip), %rax
	cvtss2sd	(%rax,%r14), %xmm2
	movq	row_max(%rip), %rax
	cvtss2sd	(%rax,%r14), %xmm1
	movl	$3, %eax
	call	__printf_chk@PLT
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jle	.L18
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L19:
	movq	(%rbx), %rax
	movq	%r13, %rsi
	movl	$1, %edi
	addl	$1, %r12d
	cvttss2si	(%rax,%r15), %edx
	xorl	%eax, %eax
	addq	$4, %r15
	call	__printf_chk@PLT
	cmpl	%r12d, 20(%rsp)
	jg	.L19
.L18:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	addq	$4, %r14
	addq	$8, %rbx
	call	_IO_putc@PLT
	addl	$1, 4(%rsp)
	movl	4(%rsp), %eax
	cmpl	%eax, 16(%rsp)
	jg	.L20
.L17:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	leaq	.LC10(%rip), %r13
	movl	$1, %ebx
	call	_IO_putc@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC9(%rip), %rsi
	pxor	%xmm2, %xmm2
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	movl	$3, %eax
	cvtss2sd	overall_min(%rip), %xmm0
	cvtss2sd	overall_avg(%rip), %xmm2
	cvtss2sd	overall_max(%rip), %xmm1
	call	__printf_chk@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	movl	cycles(%rip), %ecx
	leaq	.LC10(%rip), %rsi
	movl	$1, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movq	$0, total(%rip)
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L22:
	movl	0(%rbp,%rbx,4), %ecx
	leal	1(%rbx), %edx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpq	$9, %rbx
	jbe	.L21
	movslq	0(%rbp,%rbx,4), %rax
	addq	%rax, total(%rip)
.L21:
	addq	$1, %rbx
	cmpq	$20, %rbx
	jne	.L22
	movq	total(%rip), %rcx
	movabsq	$7378697629483820647, %rdx
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rdx
	xorl	%eax, %eax
	sarq	$2, %rdx
	subq	%rcx, %rdx
	call	__printf_chk@PLT
	movq	8(%rsp), %rbx
	movq	(%rbx), %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	col_min(%rip), %rdi
	call	free@PLT
	movq	col_max(%rip), %rdi
	call	free@PLT
	movq	col_avg(%rip), %rdi
	call	free@PLT
	movq	row_min(%rip), %rdi
	call	free@PLT
	movq	row_max(%rip), %rdi
	call	free@PLT
	movq	row_avg(%rip), %rdi
	call	free@PLT
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L37
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	testl	%edi, %edi
	movslq	20(%rsp), %rdx
	jle	.L5
	jmp	.L3
.L37:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE52:
	.size	main, .-main
	.globl	end_time
	.data
	.align 4
	.type	end_time, @object
	.size	end_time, 4
end_time:
	.long	125
	.globl	start_time
	.align 4
	.type	start_time, @object
	.size	start_time, 4
start_time:
	.long	150
	.comm	total,8,8
	.comm	cycles,80,32
	.comm	row_avg,8,8
	.comm	row_max,8,8
	.comm	row_min,8,8
	.comm	col_avg,8,8
	.comm	col_max,8,8
	.comm	col_min,8,8
	.comm	overall_avg,4,4
	.comm	overall_max,4,4
	.comm	overall_min,4,4
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
