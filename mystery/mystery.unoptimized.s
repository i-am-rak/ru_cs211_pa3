	.file	"mystery.c"
	.comm	num,800,32
	.text
	.globl	add
	.type	add, @function
add:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	add, .-add
	.globl	dothething
	.type	dothething, @function
dothething:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	-36(%rbp), %eax
	cltq
	movl	num(,%rax,4), %eax
	cmpl	$-1, %eax
	jne	.L4
	cmpl	$0, -36(%rbp)
	jne	.L5
	movl	$0, -20(%rbp)
	jmp	.L6
.L5:
	cmpl	$1, -36(%rbp)
	jne	.L7
	movl	$1, -20(%rbp)
	jmp	.L6
.L7:
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	dothething
	movl	%eax, %ebx
	movl	-36(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %edi
	call	dothething
	movl	%ebx, %esi
	movl	%eax, %edi
	call	add
	movl	%eax, -20(%rbp)
.L6:
	movl	-36(%rbp), %eax
	cltq
	movl	num(,%rax,4), %eax
	cmpl	$-1, %eax
	jne	.L4
	movl	-36(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movl	%edx, num(,%rax,4)
.L4:
	movl	-36(%rbp), %eax
	cltq
	movl	num(,%rax,4), %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	dothething, .-dothething
	.section	.rodata
.LC0:
	.string	"Value:  %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L10
.L11:
	movl	-8(%rbp), %eax
	cltq
	movl	$-1, num(,%rax,4)
	addl	$1, -8(%rbp)
.L10:
	cmpl	$199, -8(%rbp)
	jle	.L11
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	dothething
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
