	.file	"mystery.c"
	.text
	.globl	add
	.type	add, @function
add:
.LFB62:
	.cfi_startproc
	leal	(%rdi,%rsi), %eax
	ret
	.cfi_endproc
.LFE62:
	.size	add, .-add
	.globl	dothething
	.type	dothething, @function
dothething:
.LFB63:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, %ebx
	movslq	%edi, %rax
	cmpl	$-1, num(,%rax,4)
	jne	.L3
	movl	$0, %eax
	testl	%edi, %edi
	je	.L4
	movl	$1, %eax
	cmpl	$1, %edi
	je	.L4
	leal	-1(%rdi), %edi
	call	dothething
	movl	%eax, %ebp
	leal	-2(%rbx), %edi
	call	dothething
	addl	%ebp, %eax
.L4:
	movslq	%ebx, %rdx
	cmpl	$-1, num(,%rdx,4)
	jne	.L3
	movl	%eax, num(,%rdx,4)
.L3:
	movslq	%ebx, %rbx
	movl	num(,%rbx,4), %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE63:
	.size	dothething, .-dothething
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Value:  %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB64:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	$num, %edx
	movl	$num+800, %ecx
.L9:
	movl	$-1, (%rdx)
	addq	$4, %rdx
	cmpq	%rcx, %rdx
	jne	.L9
	movl	%eax, %edi
	call	dothething
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE64:
	.size	main, .-main
	.comm	num,800,32
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
