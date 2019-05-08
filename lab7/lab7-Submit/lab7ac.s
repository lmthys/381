#
# Get an int from console, add, and save it in memory
#
.data # Data declaration section
prompt: .asciiz "Enter an float value: "
.align 2
matrixA: .word 1:64#Content of matrixA in array form
.align 2
matrixB: .word 1:64
.align 2
result:  .word 1:64  #Initialize result as being an array of length 16 populated with 0
nw: .asciiz "\n"
tab: .asciiz "\t"

.text # Assembly language instructions
.globl main # Tells assembler main is accessible outside file
main: # Start of code section
 la $a1, matrixA
 la $a2, matrixB
 la $a3, result
li $t1, 4 # $t1 = 4 (row size/loop end)
li $s1, 0 # j = 0; restart 2nd for loop

print_msg3: # Print a msg
	li $v0, 4 # system call to print_str
    la $a0, prompt # print the string prompt
    syscall # actually do it
get_int3:
	li $v0, 6 # system call to read int
	syscall # actually do it
	mov.d $f24, $f0
fillA:
	sll $t0, $s2, 2 # $t0 = k * 2^2 (size of row of b)
	addu $t0, $t0, $s1 # $t0 = k * size(row) + j
	sll $t0, $t0, 3 # $t0 = byte offset of [k][j]
	addu $t0, $a1, $t0 # $t0 = byte address of a[k][j]
	s.d $f24, 0($t0) # $f16 = 8 bytes of a[k][j]
	addiu $s2, $s2, 1 # $k = k + 1
	bne $s2, $t1, print_msg3 # if (k != 4) go to L3
	li $s2, 0 # k = 0; restart 2nd for loop
	addiu $s1, $s1, 1 # $j = j + 1
	bne $s1, $t1, print_msg3 # if (j != 4) go to L2
li $s1, 0 # j = 0; restart 2nd for loop

print_msg2: # Print a msg
	li $v0, 4 # system call to print_str
    la $a0, prompt # print the string prompt
    syscall # actually do it
get_int2:
	li $v0, 6 # system call to read int
	syscall # actually do it
	mov.d $f26, $f0
fillB:
	sll $t0, $s2, 2 # $t0 = k * 2^2 (size of row of b)
	addu $t0, $t0, $s1 # $t0 = k * size(row) + j
	sll $t0, $t0, 3 # $t0 = byte offset of [k][j]
	addu $t0, $a2, $t0 # $t0 = byte address of a[k][j]
	s.d $f26, 0($t0) # $f16 = 8 bytes of a[k][j]
	addiu $s2, $s2, 1 # $k = k + 1
	bne $s2, $t1, print_msg2 # if (k != 4) go to L3
	li $s2, 0 # k = 0; restart 2nd for loop
	addiu $s1, $s1, 1 # $j = j + 1
	bne $s1, $t1, print_msg2 # if (j != 4) go to L2


li $t1, 4 # $t1 = 4 (row size/loop end)
li $s0, 0 # i = 0; initialize 1st for loop
L1: li $s1, 0 # j = 0; restart 2nd for loop
	L2: li $s2, 0 # k = 0; restart 3rd for loop
		sll $t2, $s0, 2 # $t2 = i * 2^2 (size of row of c)
		addu $t2, $t2, $s1 # $t2 = i * size(row) + j
		sll $t2, $t2, 3 # $t2 = byte offset of [i][j]
		addu $t2, $a3, $t2 # $t2 = byte address of c[i][j]
		l.s $f4, 0($t2) # $f4 = 8 bytes of c[i][j]
		L3: 
			sll $t0, $s2, 2 # $t0 = k * 2^2 (size of row of b)
			addu $t0, $t0, $s1 # $t0 = k * size(row) + j
			sll $t0, $t0, 3 # $t0 = byte offset of [k][j]
			addu $t0, $a2, $t0 # $t0 = byte address of b[k][j]
			l.s $f16, 0($t0) # $f16 = 8 bytes of b[k][j]
			sll $t0, $s0, 2 # $t0 = i * 2^2 (size of row of a)
			addu $t0, $t0, $s2 # $t0 = i * size(row) + k
			sll $t0, $t0, 3 # $t0 = byte offset of [i][k]
			addu $t0, $a1, $t0 # $t0 = byte address of a[i][k]
			l.s $f18, 0($t0) # $f18 = 8 bytes of a[i][k]
			mul.s $f16, $f18, $f16 # $f16 = a[i][k] * b[k][j]
			mov.s $f4, $f16
			addiu $s2, $s2, 1 # $k = k + 1
			bne $s2, $t1, L3 # if (k != 4) go to L3
			s.s $f4, 0($t2) # c[i][j] = $f4

			mov.s $f12, $f4
			li $v0, 2
			syscall 
			
			mov.s $f12, $f5
			li $v0, 2
			syscall 

			li $v0, 4
			la $a0, tab
			syscall
			
 
	addiu $s1, $s1, 1 # $j = j + 1
	bne $s1, $t1, L2 # if (j != 4) go to L2
addiu $s0, $s0, 1 # $i = i + 1
bne $s0, $t1, L1 # if (i != 4) go to L1


done: # Tell assembler that I am done.
    li $v0, 10 # system call for exit 
    syscall # do it
	