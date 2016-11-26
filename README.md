##CS 211: Computer Architecture, Fall 2016

##Programming Assignment 3:

##Formula and Mystery (Reverse Engineering)

----

###1 Introduction 

This assignment is designed to give you additional practice in reading and writing Assembly Languageprograms. As discussed in lecture, unless you are working in increasingly rare areas such as low-level OS development, you are unlikely to be reading and/or writing Assembly Language programs in the remainder of your career. However, we are still requiring you to read and write some here to make sure you understand the computing model underlying your C and Java programs. In addition, being able to read Assembly Language is particularly important because there are times when you need to understand what the compiler is doing to your code. There are two parts. In the first part, you will write two small functions in Assembly. In the second part, you will be deciphering (that is, write equivalent C code) an Assembly Language program. You will also be asked to compare unoptimized and optimized versions of the code and explained what the compiler did when it optimized the code. Disclaimer:Follow guidlines when looking at code.(IE. Copying code is against most rules)

###2 Part 1: Writing x86 Assembly

In this part, you will implement a program formula that will print the formula for (1 + x)n. In particular, your program formula should support the following usage interface:
```
formula <power>
```
where the argument <power> should be a non-negative integer. Your program should print out the “long” form of (1 + x)^n , where n is equal to the argument <power>. Your program should also print out its execution time (in microseconds).

For example:
```
$ ./formula 5
```
(1 + x)^5 = 1 + 5*x^1 + 10*x^2 + 10*x^3 + 5*x^4 + 1*x^5

Time Required = 50 microsecond
```
$ ./formula 10
```
1

(1 + x)^10 = 1 + 10*x^1 + 45*x^2 + 120*x^3 + 210*x^4 + 252*x^5 + 210*x^6 + 120*x^7 + 45*x^8 + 10*x^9 + 1*x^10

Time Required = 55 microsecond

(Hint: You can use the system call gettimeofday() to measure the running time of a chunk of code.)

More generally, given the argument n, your code needs to generate:

(1 + x)^n = 1 + nC1*x + nC2*x^2+ ... + nCr*x^r + ... + nCn*x^n

Your program should also print a usage message if the user runs formula with the help flag (-h).

For example:
```
$ ./formula -h
```
Usage: formula <positive integer>

###2.1 nCr Calculation

Each of the nCr coefficents above is ”n choose r”. The nCr coeffcient can be computed using the

formula: nCr = n!/(r!(n − r)!)

Your task is to implement this computation in Assembly. In particular, you need to implement two functions in Assembly:

int nCr(int n, int r): This function computes the nCr constant according to Equation 1.

int Factorial(int n): This function computes the factorial of the input (that is, n!).

To help you get started, we are providing two files:

nCr.s: contains the necessary GAS (Gnu ASsembler) directives so that your Assembly code can be compiled and linked in with your C code.

nCr.h: contains the prototype for the function nCr() so that you can compile your C code which calls nCr().

Important: As n becomes large, you will not be able to compute n! and nCr. Both nCr() and Factorial() must detect overflow conditions using the processor’s condition codes and return 0 to indicate that an error has been encountered.

###2.3 Part 2: Reading x86 Assembly Code

In this part, you are asked to decipher the Assembly Language program in the attached mystery.s file. Specifically, you need to provide a concise description of what the program does and how it does it. You should also implement a C program mystery that performs the same task in the same
manner that the code in the attached file mystery.s does.
The provided program takes a single integer as input.
```
$ gcc -m32 -o mystery mystery.s
$ ./mystery 41
```
Value: 165580141

Hint: This program performs a well known and easily recognizable computation. However, it
includes an optimization to speedup the computation. You need to figure out both the basic
functionality as well as the optimization, describe them, and replicate them in your C code.

Another Hint: You are not strictly required to go backward from the mystery.s file that we give
you. That is, when you start writing your mystery.c program, you can compile it to Assembly
(gcc -S), and compare the generated code against our mystery.s. Our mystery.s was generated
on factory.cs.rutgers.edu so you should be able to generate the exact same code.

Once you have implemented your C program, you should compile it with and without the -O option
(optimization). You should then compare the two versions and explain the differences inside the
mystery function.

For example:

```
$ gcc -S mystery.c
$ mv mystery.s mystery.unoptimized.s
$ gcc -S -O mystery.c
$ diff --side-by-side mystery.unoptimized.s mystery.s
```

The last command in the above sequence will show you the differences between the two .s files
side by side (use a large terminal window). You should look at the differences inside the mystery
function and explain why the compiler made the changes that it did when optimizing the code.
Collaboration: Please do not share your solution with your classmates as this gives the problem
away. You may help each other with understanding Assembly details but not the solution.




