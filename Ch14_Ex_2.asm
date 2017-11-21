## Ch14_Ex_2.asm
## 
## Program to calculate (3x + 7) / (2x + 8)
##
## Register Use:
##  $8   x
##  $9  3x + 7
##  $11  2x + 8
##  $10  (3x+7)/(2x+8)

        .text
        .globl  main

main:
        ori 	$8,  	$0,  	1        	# put x into $8
        sll	$9,	$8,  	1	# $9 = 2x
        addu 	$10,  	$9, 	$8	# $10 = 3x
        addi    	$10,  	$10, 	7        	# $10  = (3x + 7)
        addi     	$11,  	$9,  	8        	# $11  = (2x + 8)
        div      	$10,  	$11            	# hilo = (3x+7)/(2x+8)
        mflo     	$10                 		# $10  = quotient
        mfhi     	$11                  		# $11  = remainder

## End of file
