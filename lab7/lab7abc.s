li $t1, 0; //set i=0
li $t2,0; //set j=0
li $t5,4; //set column number to be 10
loop:
slti $t0, $t1, 4 #//set register $t0 if i is less than 10
beq $t0, $zero, exit; #//exit if i wasn’t less than 10
slti $t0, $t2, 4 #//set $t0 to 1 if j is less than 10
 beq $t0, $zero, exit;
sll $t3, $t1, 2;
mul $t3, $t3, $t5;
sll $t4, $t2, 2;
add $t3, $t3, $t4;
lw $t4, 0($t3);
addi $t4, $t4, 1;
sw $t4, 0($t3);
addi $t1, $t1, 1;
addit $t2, $t2, 1;
j loop;
exit:



 //exit if j wasn’t less than 10
// multiply I by 4 using left shift
//multiply result obtained in previous step by number of columns
// multiply J by 4 using left shift
//calculate address of a[i][j] in register $t3
// load A[i][j]
// A[i][j] = A[i][j] +1
//store the result back into the original array
//increment I by 1
//increment j by 1
//jump back to the head of the loop