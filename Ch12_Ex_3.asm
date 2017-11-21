
## put the pattern 0xFFFFFFFF into register $1
	.text
        .globl  main

main:
       ori	$1, $0, 0x01 	  # put 1 to $1
       xori	$2, $1, 0xFFFe 	  # XOR with fffe
       sll	$3, $2, 8 	  # shift to left by 8
       xori	$4, $3, 0xFFFF	  # XOR with ffff
       xori	$5, $4, 0xFFFF	  # XOR with ffff
       xori	$6, $5, 0xFF	  # xOR with ff
       sll	$7, $6, 8  	  # shift to left by 8
       xori	$1, $7, 0xFF	  # XOR with ff
       
 ## end of program
  
        
