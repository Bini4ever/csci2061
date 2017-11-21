## Ch15_Ex_2.asm Program to calculate \17xy - 12x - 6y + 12
## Register Use:  $6   x
	##  $7   y
	##  $10  result
	##  $11  multiplier
.text
.globl main

main:
	lui   	$12,  	0x1001 		# Loads base into reg 12
	lw    	$6,   	0($12)		# $6 = x
	sll	$0	$0	0
	lw    	$7,   	4($12) 		# $7 = y
	ori   	$11,  	$0,   	17 	# $11 = 17
	multu 	$9,   	$10		# xy
	mflo 	$10 			# $10 = xy
	sll	$0	$0	0
	multu 	$10,  	$11 		# Multiplies xy by 17
	mflo  	$10 			# $10 = 17xy
	sll	$0	$0	0
	ori   	$11,  	$0,  	12 	# $11 = 12
	multu 	$6,   	$11 		# 12x
	mflo  	$9 			# $9 = 12X
	subu  	$10,  	$10,	$9 	# 17xy - 12x
	ori   	$11,  	$0,   	6 	# $11 = 6
	multu 	$7,   	$11 		# 6y
	mflo  	$9 			# 9 = 6y 
	subu  	$10,  	$10,  	$9 	# 17xy - 12x - 6y
	ori   	$11,  	$0,   	12 	# $11 = 12
	addu  	$10,  	$10,  	$11 	# 17xy - 12x - 6y + 12
	sw    	$10,  	8($12) 		# $10 = result

.data	
x: .word 0
y: .word 1
answer: .word 0



