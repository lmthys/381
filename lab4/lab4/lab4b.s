#
# Get an int from console, add, and save it in memory
#
.data # Data declaration section
prompt: .asciiz "Enter an integer value: "
x: .word 3
y: .word 1
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
do_more: # just for fun
    lw $t0, x # t0 = MEM[x]
    add $t0, $t0, $v0 # add 5 + 3 into temp
    sw $t0, y # store t0 in MEM[y]
done: # Tell assembler that I am done.
    li $v0, 10 # system call for exit 
    syscall # do it