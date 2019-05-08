#
# Get an int from console, add, and save it in memory
#
.data # Data declaration section
prompt: .asciiz "Enter an integer value: "
a1: .word 3
b1: .word 1
c1: .word 5
nw: .asciiz "\n"
.text # Assembly language instructions
.globl main # Tells assembler main is accessible outside file
main: # Start of code section
print_msg: # Print a msg
    li $v0, 4 # system call to print_str
    la $a0, prompt # print the string prompt
    syscall # actually do it
get_int: # Get an int from console
    li $v0, 5 # system call to read int
	syscall # actually do it
	lw $a1,a1
	addi $a1, $v0, 0
print_msg2: # Print a msg
    li $v0, 4 # system call to print_str
    la $a0, prompt # print the string prompt
    syscall # actually do it
get_int2:
	li $v0, 5 # system call to read int
	syscall # actually do it
	lw $a2,b1
	addi $a2, $v0, 0
print_msg3: # Print a msg
    li $v0, 4 # system call to print_str
    la $a0, prompt # print the string prompt
    syscall # actually do it
get_int3:
	li $v0, 5 # system call to read int
	syscall # actually do it
	lw $a3,c1
	addi $a3, $v0, 0
do_stuff:
	mul $s0, $a1, $a2 # s0 = A * B
	mul $s0, $s0, $a3 # s0 = s0 * C
	addi $a0, $s0, 0 
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, nw
	syscall
do_moreStuff:
	add $s0, $a1, $a2 # s0 = A + B
	add $s0, $s0, $a3 # s0 = s0 + C
	addi $a0, $s0, 0 
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, nw
	syscall
	div	$s0, $a1 
	mfhi $s1 # remainder 
	mflo $s2 # quoient 
	addi $a0, $s1, 0 
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, nw
	syscall
	
	addi $a0, $s2, 0 
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, nw
	syscall
done: # Tell assembler that I am done.
    li $v0, 10 # system call for exit 
    syscall # do it