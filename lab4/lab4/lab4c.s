#
# PROGRAM: Made in Lab
#
.data # Data declaration section
a1: .word 2
b1: .word 4
c1: .word 6
d1: .word 8
.text # Assembly language instructions
.globl main # Tells assembler main is accessible outside file
main: # Start of code section
    #addi $sp, $sp, -12 # Making room on the stack for three items
    lw $a0, a1 
	lw $a1, b1
	lw $a2, c1
	lw $a3, d1
	j f
next: 
    addi $a0, $v0, 0
	li $v0, 1 # Print v0 
	syscall
	j done  
    
f:
    add $t0, $a0, $a1 # t0 = (a+b) = 6
	add $t1, $a2, $a3 # t1 = (c+d) = 14
	mul $s0, $t0, $t1 # s0 = t0 * t1
	addi $v0, $s0, 0
    #li $v0, 9	# save the result to v0
    #la $s0, 5
	j next
done: # Tell assembler that this is the end
    li $v0, 10
    syscall
