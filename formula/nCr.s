.globl nCr
        .type   nCr, @function
nCr:
  # Your code for nCr should go here
	
    pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebp
	movl	%esi, %r12d
	call	Factorial
	movl	%eax, %ebx
	movl	%r12d, %edi
	call	Factorial
	movl	%eax, %r13d
	movl	%ebp, %edi
	subl	%r12d, %edi
	call	Factorial
	movl	%r13d, %ecx
	imull	%eax, %ecx
	movl	%ebx, %eax
	cltd
	idivl	%ecx
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret

    
   # movl	%edi, %ebp
#	call	Factorial
#	movl	%eax, %ebx
#	movl	%esi, %edi
#	call	Factorial
#	movl	%ebp, %edi
#	subl	%esi, %edi
#	call	Factorial
#	movl	%eax, %ecx
#	imull	%eax, %ecx
#	movl	%ebx, %eax
#	cltd
#	idivl	%ecx
#	ret

.globl Factorial
        .type   Factorial, @function
Factorial:
  # Your code for Factorial should go here
    testl	%edi, %edi
	jle	.L4
	addl	$1, %edi
	movl	$1, %eax
	movl	$1, %edx
.L3:
	imull	%edx, %eax
	addl	$1, %edx
	cmpl	%edi, %edx
	jne	.L3
	ret
.L4:
	movl	$1, %eax
	ret
	
