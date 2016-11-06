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
	movl	8(%ebp), %eax       #if its not equal move input to eax
	movl	num(,%eax,4), %eax  #move the value at the array to eax
	movl	%eax, -24(%ebp)     #move that value to offset -24 of ebp
	jmp	.L6
.L4:
	movl	$-1, -8(%ebp)       #move negative one to ebp at -8 off
	cmpl	$0, 8(%ebp)         #check if the integer entered in the funciton is 0
	jne	.L7                     #jump if its not equal
	movl	$0, -8(%ebp)        #if it is equal, move 0 to the -8 position
	jmp	.L9                     #jump to L9
.L7:
	cmpl	$1, 8(%ebp)         #check if the integer entered in the funciton is 1 
	jne	.L10                    #jump to 10 if its not equal
	movl	$1, -8(%ebp)        #jump move 1 to -8 offset if its equal
	jmp	.L9                     #jump to L9
.L10:
	movl	8(%ebp), %eax       #move the funciton input to eax
	subl	$2, %eax            #subtract 2 from the eax and put in eax
	movl	%eax, (%esp)        #move that value to esp
	call	dothething          #call dothething with esp
	movl	%eax, %ebx          #move the result of dothething to ebx
	movl	8(%ebp), %eax       #move function input to eax
	subl	$1, %eax            #subtract 1 from eax and put int eax
	movl	%eax, (%esp)        #move that value to esp
	call	dothething          #call do the thing on esp
	movl	%ebx, 4(%esp)       #move ebx to 4 off esp
	movl	%eax, (%esp)        #move eax to esp(at 0)
	call	add                 #call add with esp(will use the 2 values in add function)
	movl	%eax, -8(%ebp)      #move the value to -8 offset of ebp
.L9:
	movl	8(%ebp), %eax       #move the integer(input of function) to eax
	movl	num(,%eax,4), %eax  #move the value of the array at index of that integer to eax
	cmpl	$-1, %eax           #compare that value with negative  -1
	jne	.L12                    #if its not equal, jump to 12
	movl	8(%ebp), %edx       #if its equal move the input to gen %edx
	movl	-8(%ebp), %eax      #move the value of offet -8(either 0/1 or the sum) to eax
	movl	%eax, num(,%edx,4)  #move that to the value at index of the array
.L12:
	movl	8(%ebp), %eax       #move the integer of the function to eax
	movl	num(,%eax,4), %eax  #move the value of the array at index of the integer to eax 
	movl	%eax, -24(%ebp)     #move eax to -24 offset of ebp
.L6:        
	movl	-24(%ebp), %eax     #move the value at -24 to eax(value at the array) to be returned
	addl	$28, %esp           #set stack pointer back
	popl	%ebx                #pop ebx out of stack
	popl	%ebp                #pop ebp out of stack
	ret                         #return value of eax to main
	.size	dothething, .-dothething
	.section	.rodata
.LC0:
	.string	"Value:   %d\n"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx       #move address 4 offset esp to gen % ecx
	andl	$-16, %esp          #add -16 to esp
	pushl	-4(%ecx)            #push value at -4 of ecx to stack
	pushl	%ebp                #push ebp to stack
	movl	%esp, %ebp          #move esp to ebp
	pushl	%ecx                #push ecx to the stack
	subl	$36, %esp           #subtract 36 from esp
	movl	4(%ecx), %eax       #move 4 offset ecx to eax
	addl	$4, %eax            #addthe value of 4 to eax
	movl	(%eax), %eax        #move the adddress to address(above code could be done differently)
	movl	%eax, (%esp)        #move eax to esp
	call	atoi                #call atoi esp (convert the input to a integer
	movl	%eax, -12(%ebp)     #move the value of input to -12 offset ebp
	movl	$0, -8(%ebp)        #move value zero to -8 offset ebp
	jmp	.L16                    #jump to L16
.L17:
	movl	-8(%ebp), %eax      #move value at -8 offset ebp to eax
	movl	$-1, num(,%eax,4)   #move the value -1 to the spot at array of index of -8 ebp
	addl	$1, -8(%ebp)        #add -8 offset ebp by 1(increment by 1)
.L16:
	cmpl	$199, -8(%ebp)      #compare 199 with the value at -8 offset ebp
	jle	.L17                    #jump to L17 if less than or equal to 199
	movl	-12(%ebp), %eax     #move the value of the input(-12(%ebp)) to eax
	movl	%eax, (%esp)        #move that value to esp
	call	dothething          #call dothething with esp
	movl	%eax, 4(%esp)       #move the result to 4 offset esp
	movl	$.LC0, (%esp)       #move the value at .LC0 to esp
	call	printf              #call prinf witht esp
	movl	$0, %eax            #move 0 to eax
	addl	$36, %esp           #add 36 back to the esp
	popl	%ecx                #pop ecx out of stack
	popl	%ebp                #pop ebp out of stack
	leal	-4(%ecx), %esp      #move address -4 offset to esp
	ret                         #return to exit
	.size	main, .-main
	.comm	num,800,32
	.ident	"GCC: (GNU) 4.1.2 20080704 (Red Hat 4.1.2-51)"
	.section	.note.GNU-stack,"",@progbits
