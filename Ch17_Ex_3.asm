## Ch17_Ex_3.asm
##
## This program loops from 0 to 100 and add the numbers together
##
.text 
.globl main

main:
	ori $1, $0, 0	# sum
	ori $2, $0, 1	# count
	ori $3, $0, 101	# Limit
	
	top: beq $2, $3, exit   #loop until 101
	
	addu $1, $1, $2	# add sum
	addi $2, $2, 1	# count++
	j top
	sll $0, $0, 0
	
	exit: sll $0, $0, 0
	
## End of file




