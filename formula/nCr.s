.globl nCr
        .type   nCr, @function
nCr:
  # Your code for nCr should go here	
    movl	%edi, %r8d  #move n to r8d
	call	Factorial   #call Factorial with value at edi(n), store in eax
    jo .L6              #jump if over flow from factorial
	movl	%esi, %edi  #move r to edi to be used in factorial
	movl	%eax, %ecx  #move sum of factorial(n) to ecx
	call	Factorial   #call Factorial with value at edi(r), store in eax
    jo .L6              #jump if over flow from factorial
	movl	%r8d, %edi  #move n from r8d to edi
	movl	%eax, %ebx  #move sum of factorial r in ebx
	subl	%esi, %edi  #subtract r from n and store in edi(n-r)
	call	Factorial   #call factorial with value at edi(n-r), store in eax
	movl	%ebx, %esi  #move ebx(r!) to esi
	imull	%eax, %esi  #multiply  (n-r!) and r!, sotre
    jz .L6              #check if zero/overflow to prevent zero division
	movl	%ecx, %eax  #move n! eax
	cltd                #convert long to double(fix floating point exception)
	idivl	%esi        #divide n! by r!(n-r)!, store in eax
	ret                 #return (value is in eax)
.L6:
    movl    $0, %eax    #store 0 in eax for overflow
    ret                 #return (value is in eax)

.globl Factorial
    .type   Factorial, @function
Factorial:
  # Your code for Factorial should go here
	cmpl    $0, %edi    #check if its less then 0
    jl .L4             #go to L4 if less then zero
    movl	$1, %eax    #move 1 to eax(starting value)
	movl	$1, %edx    #move 1 to edx(counter)
.L1:
	cmpl	%edi, %edx  #check if counter is less then n
	jg	.L3             #if it isn't, jump to L3
	imull	%edx, %eax  #multiply eax with edx(edx is new value and eax is last value)
    jo  .L4             #jump if overflow
	incl	%edx        #increment edx(the counter)
	jmp	.L1             #loop back to L1
.L3:    
	ret                 #return (value is in eax)
.L4:
    movl    $0, %eax    #move 0 to eax if overflow
    ret                 #return (value is in eax)

