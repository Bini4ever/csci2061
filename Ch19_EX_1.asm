##  Ch19_Ex_1.asm
##
##  stores the number 0 to 24 in .data section
##  Registers:
##  $8 -- index of array byte
##  $9 -- counter
##  $10 -- limit
.text
    .globl  main

main: 
 	
	ori $9, $0, 0	# count
	ori $10, $0, 25	# Limit
	ori $8, $0, 0	# clear index
	
	# While $9 < 25 do
	top: 	beq $9, $10, exit      #loop until 25
		sw $9, array($8)
		   addi $8, $8, 4     # index+=4
		addi $9, $9, 1	# count++
	j top
	sll $0, $0, 0
	
	exit: sll $0, $0, 0
	
.data
array:   .space    100

## End of file