## Ch22_Ex1.asm
##
## evaluate the polynomial ax^3 + bx^2 + cx + d
##
## Registers:
## $8  --- a
## $9  --- b
## $10 --- c
## $11 --- d
## $12 --- x
## $13 --- ax^3
## $14 --- ax^3 + bx^2
## $15 --- ax^3 + bx^2 + cx
## $16 --- ax^3 + bx^2 + cx + d


        .text
        .globl  main

main:


	lw   $12,x         	# get x
        	lw   $8,a         	# get a
        	lw   $9,bb         	# get bb
        	lw   $10,c          	# get c
        	lw   $11,d          	# get d

        	mult $12,$12        	# x^2
        	mflo $13            	# $13 = x^2
        	nop
        	nop
        	mult $13,$12        	# x^3
        	mflo $13            	# $13 = x^3
        	nop
        	nop
        	mult $13,$8        	# low  = ax^3
        	mflo $13            	# $13  = ax^3
        	nop
        	nop

	mult $12,$12        	# x^2
        	mflo $14            	# $14 = x^2
        	nop
        	nop
        	mult $9,$14        	# low  = bx^2
        	mflo $14            	# $14  = bx^2
        	
        	mult $10,$12        	# low  = cx
        	mflo $15            	# $15  = cx
        	
        	
        	addu $14,$13,$14    	# $14  = ax^3 + bx^2
	addu $15,$14,$15	# $15  = ax^3 + bx^2 + cx
        	addu $16,$15,$11    	# $t6  = ax^3 + bx^2 + cx + d
        	sw   $16,result      	# result = polynomial


        .data
x:      .word    10
a:      .word    10
bb:     .word    20
c:      .word    20
d:      .word    0
result: .word    0

## End of file