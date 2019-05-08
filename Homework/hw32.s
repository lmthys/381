.data
myArray: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
.text
.globl main # Tells assembler main is accessible outside file
main: # Start of code section
	la $s0, myArray
	li $s1, 0
loop: sll $t0, $s1, 2 
	add $t0, $t0, $s0 
	lw $s2, 0($t0)
	lw $s3, 4($t0) 
	add $s2, $s2, $s3
	sw $s2, 0($t0) 
	addi $s1, $s1, 1 
	slti $t1, $s1, 9 
	bne $t1, $zero, loop
.end

 

 