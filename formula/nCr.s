.globl nCr
        .type   nCr, @function
nCr:
  # Your code for nCr should go here	
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	20(%esp), %esi
	movl	24(%esp), %ebp
	pushl	%esi
	call	Factorial
	movl	%eax, %ebx
	movl	%ebp, (%esp)
	call	Factorial
	movl	%eax, %edi
	subl	%ebp, %esi
	movl	%esi, (%esp)
	call	Factorial
	addl	$4, %esp
	movl	%edi, %ecx
	imull	%eax, %ecx
	movl	%ebx, %eax
	cltd
	idivl	%ecx
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret

.globl Factorial
        .type   Factorial, @function
Factorial:
  # Your code for Factorial should go here
	movl	4(%esp), %ecx
	testl	%ecx, %ecx
	jle	.L4
	addl	$1, %ecx
	movl	$1, %eax
	movl	$1, %edx
.L3:
	imull	%edx, %eax
	addl	$1, %edx
	cmpl	%ecx, %edx
	jne	.L3
	rep ret
.L4:
	movl	$1, %eax
	ret

