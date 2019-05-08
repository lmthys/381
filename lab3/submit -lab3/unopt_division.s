	.file	1 "division.c"

 # GNU C 2.7.2.3 [AL 1.1, MM 40, tma 0.1] SimpleScalar running sstrix compiled by GNU C

 # Cc1 defaults:
 # -mgas -mgpOPT

 # Cc1 arguments (-G value = 8, Cpu = default, ISA = 1):
 # -quiet -dumpbase -O0 -o

gcc2_compiled.:
__gnu_compiled_c:
	.sdata
	.align	2
$LC0:
	.ascii	"x = %d\n\000"
	.text
	.align	2
	.globl	main

	.text

	.loc	1 4
	.ent	main
main:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, extra= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	subu	$sp,$sp,32
	sw	$31,28($sp) # Store value of MEM[sp + 28] in $31 
	sw	$fp,24($sp) # Store value of MEM[sp + 24] in $fp 
	move	$fp,$sp # move $sp into $fp 
	jal	__main
	sw	$0,16($fp) #store the value of MEM[fp+16] into $0 
$L2:
	lw	$2,16($fp) #load the value of MEM[fp+16] into $2  
	slt	$3,$2,1000 # if $2(which is i) < 1000 then $3 = 1 else $3 = 0
	bne	$3,$0,$L5 # branch to L5 if $3 and $0 are not equal
	j	$L3 # Jump to L3
$L5:
	li	$2,0x00100000		# 1048576
	sw	$2,20($fp) # Store value of MEM[fp + 20] in $2 
	lw	$3,20($fp) #load the value of MEM[fp+20] into $3 
	move	$2,$3 # move $3 into $2
	bgez	$2,$L6 # Branch to L6 when $2 is > or equal to zero.
	addu	$2,$2,7 # add $2 + 7 and store in $2
$L6:
	div	$2,8 # divide $2 by 8 then store in $2
	#mflo	$2
	sw	$2,20($fp) # Store value of MEM[fp + 20] in $2 
	lw	$3,20($fp) #load the value of MEM[fp+20] into $3 
	move	$2,$3 # move $3 into $2
	bgez	$2,$L7 # Branch to L7 when $2 is > or equal to zero.
	addu	$2,$2,15 # add $2 + 7 into $2
$L7:
	div	$2,16 # divide $2 by 16 then store in $2
	#mflo	$2
	sw	$2,20($fp) # Store value of MEM[fp + 20] in $2 
	lw	$3,20($fp) #load the value of MEM[fp+20] into $3 
	move	$2,$3 # move $2 into $3
	bgez	$2,$L8 # Branch to L8 when $2 is > or equal to zero.
	addu	$2,$2,31 # add $2 + 31 into $2
$L8:
	div	$2,32 # divide $2 by 32 then store in $2
	#mflo	$2
	sw	$2,20($fp) # Store value of MEM[fp + 20] in $2 
$L4:
	lw	$3,16($fp) #load the value of MEM[fp+16] into $3
	addu	$2,$3,1 # add $3 + 1 into $2
	move	$3,$2 # move $3 into $2
	sw	$3,16($fp) # Store value of MEM[fp + 16] in $3 
	j	$L2 # jump to L2
$L3:
	la	$4,$LC0 # load address LC0 into $4
	lw	$5,20($fp) # load value of MEM[fp + 20] in $5 
	jal	printf # jump and link to Print f 
$L1:
	move	$sp,$fp			# sp not trusted here
	lw	$31,28($sp)   # load value of MEM[sp + 28] in $31 
	lw	$fp,24($sp)   # load value of MEM[sp + 24] in $fp 
	addu	$sp,$sp,32 # add $sp + 32 and store in $sp 
	j	$31 # jump to $31
	.end	main
