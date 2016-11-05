	.file	"mystery.c"
	.text
.globl add
	.type	add, @function
add:
	pushl	%ebp                #push the base pointer to the stack
	movl	%esp, %ebp          #move the memory of the stack to the base pointer
	movl	12(%ebp), %eax      #move memory offsetted by 12 to eax(one variable)
	addl	8(%ebp), %eax       #move memory offsetted by 8 and add it to the previous variable
	popl	%ebp                #pop the stack to remove ebp
	ret                         #return to main(value at eax)
	.size	add, .-add
.globl dothething
	.type	dothething, @function
dothething:
	pushl	%ebp                #push the base pointer to the stack
	movl	%esp, %ebp          #move the stack pointer to the base pointer
	pushl	%ebx                #push gen register to the stack(1.ebp, 2. ebx)
	subl	$28, %esp           #subtract the value of 28 from the stack pointer(leave 4 for 32 bit)
	movl	8(%ebp), %eax       #move the integer from the function to eax
	movl	num(,%eax,4), %eax  #move the the number at the array num at index from the integer
	cmpl	$-1, %eax           #compare value at the array with negative one
	je	.L4                     #if it is equal, jump to L4
	movl	8(%ebp), %eax
	movl	num(,%eax,4), %eax
	movl	%eax, -24(%ebp)
	jmp	.L6
.L4:
	movl	$-1, -8(%ebp)       #move negative one to ebp at -8 off
	cmpl	$0, 8(%ebp)         #check if the integer entered in the funciton is 0
	jne	.L7                     #jump if its not equal
	movl	$0, -8(%ebp)        #if it is eaul, move 0 to the -8 position
	jmp	.L9                     #jump to L9
.L7:
	cmpl	$1, 8(%ebp)
	jne	.L10
	movl	$1, -8(%ebp)
	jmp	.L9
.L10:
	movl	8(%ebp), %eax
	subl	$2, %eax
	movl	%eax, (%esp)
	call	dothething
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	subl	$1, %eax
	movl	%eax, (%esp)
	call	dothething
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	add
	movl	%eax, -8(%ebp)
.L9:
	movl	8(%ebp), %eax       #move the integer(input of function) to eax
	movl	num(,%eax,4), %eax  #move the value of the array at index of that integer to eax
	cmpl	$-1, %eax           #compare that value with negative 
	jne	.L12
	movl	8(%ebp), %edx
	movl	-8(%ebp), %eax
	movl	%eax, num(,%edx,4)
.L12:
	movl	8(%ebp), %eax
	movl	num(,%eax,4), %eax
	movl	%eax, -24(%ebp)
.L6:
	movl	-24(%ebp), %eax
	addl	$28, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	dothething, .-dothething
	.section	.rodata
.LC0:
	.string	"Value:   %d\n"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$36, %esp
	movl	4(%ecx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, -12(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L16
.L17:
	movl	-8(%ebp), %eax
	movl	$-1, num(,%eax,4)
	addl	$1, -8(%ebp)
.L16:
	cmpl	$199, -8(%ebp)
	jle	.L17
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	dothething
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, %eax
	addl	$36, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.comm	num,800,32
	.ident	"GCC: (GNU) 4.1.2 20080704 (Red Hat 4.1.2-51)"
	.section	.note.GNU-stack,"",@progbits
