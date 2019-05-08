	.file	1 "opt_division.c"

 # GNU C 2.7.2.3 [AL 1.1, MM 40, tma 0.1] SimpleScalar running sstrix compiled by GNU C

 # Cc1 defaults:
 # -mgas -mgpOPT

 # Cc1 arguments (-G value = 8, Cpu = default, ISA = 1):
 # -quiet -dumpbase -o

gcc2_compiled.:
__gnu_compiled_c:
	.text
	.align	2
	.globl	main

	.text

	.loc	1 4
	.ent	main
main: # Starting the main 
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, extra= 0  
	.mask	0xc0000000,-4 
	.fmask	0x00000000,0
	subu	$sp,$sp,32
	sw	$31,28($sp)  # Store value of MEM[sp + 28] in $31 
	sw	$fp,24($sp)  # Store value of MEM[sp +24] in $fp 
	move	$fp,$sp  # Move $sp into fp
	jal	__main #jump and link to main
	sw	$0,16($fp)  # save value of MEM[fp+16] into $0
$L2: # for loop 
	lw	$2,16($fp)  # load the value of MEM[fp+16] into $2 (i = 0) 
	slt	$3,$2,1000  # if $2(which is i) < 1000 then $3 = 1 else $3 = 0
	bne	$3,$0,$L5   # if $0 is not equal to $3 then go to L5 
	j	$L3         # Jump to L3 
$L5:
	li	$2,0x00100000		# 1048576 load $2 immediately with 1048576 (so x = 1048576)	
	sw	$2,20($fp) # store MEM[fp+20] in $2
	lw	$2,20($fp) # load $2 with MEM[fp+20]
	sra	$3,$2,3 # shift $2 3 to the right and then store in $3 (x >> 3)
	sw	$3,20($fp) # store MEM[20 + fp] 
	lw	$2,20($fp) # load MEM[20 + fp] 
	sra	$3,$2,4 # shift $2 4 to right and store in $3 (x >> 4)
	sw	$3,20($fp) # store MEM[fp + 20] in $3 
	lw	$2,20($fp) # load MEM[fp + 20] in $2 
	sra	$3,$2,5 #shift $2 5 to the right and store in $3 (x >> 5)
	sw	$3,20($fp) # store MEM[fp + 20] in $3 
$L4:
	lw	$3,16($fp) # load MEM[fp+16] into $3
	addu	$2,$3,1 # add 1 to $3 and store in $2
	move	$3,$2 # move $2 into $3
	sw	$3,16($fp) # store MEM[$fp + 16] into $3
	j	$L2 # Jump to L3
$L3:
$L1:
	move	$sp,$fp			# sp not trusted here
	lw	$31,28($sp) # load MEM[sp + 28] into $31
	lw	$fp,24($sp) # load MEM[sp + 24] into $fp
	addu	$sp,$sp,32 # add $sp + 32 and store into $sp 
	j	$31 # jump to $31
	.end	main
