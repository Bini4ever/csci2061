# This program prompts for the size of the square 
# (the number of lines it takes to draw the square)
# The program then writes a square of stars ("*") to the monitor
#
## Registers:
#  $s0 --- size
#  $s1 --- count1
#  $s2 --- count2

.text
        .globl  main

main:   
	 li      	$v0,4           	# print prompt
       	 la      	$a0,prompt  	#
       	 syscall
       	 li      	$v0,5       	# read size
       	 syscall
       	 move    	$s0,$v0     	# size
       	 add	$s1,$0,$s0		# count1
       	 add	$s2,$0,$s0		# count2	
       	 
	

loop:   	beq     	$s1, 0, exit   	# loop until count1 is zero
        	add	$s2,$0,$s0	
        	
        	nested:	beq	$s2, 0, nextline
        		li     	$v0,4           	# print star
        		la      	$a0,star  	
        		syscall
        		
        		subi	$s2,$s2,1		# count2--	
        		
        		j	nested
		sll	$0, $0, 0
        	
        	nextline:	li     	$v0,4           	# nextline
        		la      	$a0,newline  	
        		syscall
        		
        		subi	$s1,$s1,1		# count1--	
        		
        		j 	loop
        	
        	sll	$0, $0, 0
	
exit: 	sll 	$0, $0, 0
       	li     	$v0,10      # exit
       	syscall

        .data
prompt: .asciiz "Enter the size of rectangle: "
star: .asciiz "* "
newline: .asciiz "\n"
