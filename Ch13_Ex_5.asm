## ch13_Ex_5.asm
## 
## Program to compute 13X and -13x
## 
## Register Use: 
##	$8 	x
##	$10	13x
##	$11	-13x

	.text
	.globl main
	
main:
	ori		$8,  $0,  0x1		# put x in to $8
	sll 		$10, $8,  3		# $10 = 8x
	sll		$9,  $8,  2		# $9 = x
	addu 		$10, $9,  $10		# $10 = 12x
	addu		$10, $10, $8		# $10 = 13x
			
	
	nor		$11, $10, $0		# $11 = -14
	addi 		$11, $11, 1		# $11 = -13		
			
