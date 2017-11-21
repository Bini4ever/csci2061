## Ch16_Ex_1.asm
##
## adds the values up, computes the average
## 
 .text 
.globl main
main:
	ori	$10,	$0, 	0		
	lui  	$8, 	0x1001		# set base register
	lbu   	$9, 	0($8)		# load byte
	sll  	$0, 	$0, 	0	
	addu 	$10, 	$10, 	$9	# add the values
	lbu   	$9, 	1($8)		# load byte
	sll  	$0, 	$0, 	0
	addu 	$10, 	$10, 	$9	# add the values
	lbu   	$9, 	2($8)		# load byte
	sll  	$0, 	$0, 	0
	addu 	$10, 	$10,	$9	# add the values
	lbu   	$9, 	3($8)		# load byte
	sll  	$0, 	$0, 0
	addu 	$10, 	$10, 	$9	# add the values
	lbu  	$9, 	4($8)		# load byte
	sll  	$0, 	$0, 0
	addu 	$10, 	$10, 	$9	# add the values
	ori  	$11, 	$0, 	5	# load byte
	div  	$10, 	$11  		# average
       	mflo 	$10               		 # store average in $10
       	mfhi 	$11 
	sb   	$10, 	8($8)
.data
      .byte   12
      .byte   97
      .byte   133
      .byte   82
      .byte   236
## End of file
