
## Program to put DEADBEEF into register $1:
        .text
        .globl  main

main:
        ori     $1, $0, 0xDEAD		# put DEAD into register $1
        sll	$1, $1, 16		# shift left logicaly by 16
        ori	$1, $1, 0xBEEF		# put BEEF at the end into register $1
        
## End of file
