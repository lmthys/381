#
# PROGRAM: Hello, World!
#
.data # Data declaration section
    out_string: .asciiz "\nHello, World!\n"
    exit_string: .asciiz "Exit.\n"
.text # Assembly language instructions
.globl main # Tells assembler main is accessible outside file
main: # Start of code section
    li $v0, 4 # System call for print_str
    la $a0, out_string  # address of the str to print
    syscall # actually print it
print_str2:
    li $v0, 4 # System call for print_str
    la $a0, exit_string # the string to print is exit_string 
    syscall # actually print it
done: # Tell assembler that this is the end
    li $v0, 10 # system call for exit
    syscall # actually do it
