# Evaluate the expression 3ab - 2bc - 5a + 20ac - 16
#
# Settings: Load delays OFF; Branch delays OFF,
#           Trap file    ON; Pseudoinstructions ON  
#
# Register:
# 
# 

        .globl  main

main:   
         jal     pread           # read first integer
         nop                     #  
         move    $5,$2          # save it in $5
         
         jal     pread           # read second integer
         nop                     #  
         move    $6,$2          # save it in $6
         
         jal     pread           # read thrid integer
         nop                     #  
         move    $7,$2          # save it in $7
         
         la      $10,a	# load base register

           
         sw      $5,0($10)		#  store value of first integer to  a
         sw      $6,4($10)		#  store value of first integer to  bb
         sw      $7,8($10)		#  store value of first integer to  c
         

        lw      $8,0($10)          # get a
        lw      $9,4($10)         # get b
        mul     $8,$8,$9    	# a*b
        mul     $8,$8,3	# 3*ab
        subu    $29,$29,4      # push 3a*b onto stack
        sw      $8,($29)
        
        lw      $8,4($10)          # get b
        lw      $9,8($10) 		# get c
        mul     $8,$8,$9      # bc
        mul     $8,$8,-2
        subu    $29,$29,4      # push push -2bc onto stack
        sw      $8,($29)
        
        
        lw      $8,0($10)          # get a
        li      $9,-5        # 
        mul     $8,$8,$9     # -5a
        subu    $29,$29,4      # push -5a onto stack
        sw      $8,($29)
        
        lw      $8,0($10)         # get a
        lw      $9,8($10)         # get c
        mul     $8,$8,$9     # a*c
        mul     $8,$8,20      #20*ac
        subu    $29,$29,4      # push 20ac onto stack
        sw      $8,($29)

        li      $9,-16         # init sum to -16
        lw      $8,($29)      # pop 20ac
        addu    $29,$29,4
        addu    $9,$9,$8    # 20ac - 16
                
        lw      $8,($29)      # pop -5a
        addu    $29,$29,4
        addu    $9,$9,$8    #  -5a + 20ac - 16
                
        lw      $8,($29)      # pop -2bc
        addu    $29,$29,4
        addu    $9,$9,$8    # -2bc - 5a + 20ac - 16
        
        lw      $8,($29)      # pop 3ab
        addu    $29,$29,4
        addu    $9,$9,$8    # 3ab - 2bc - 5a + 20ac - 16
         
done:   
         li      $2,4            # print a heading
         la      $4,heading         
         syscall

        li      $2,1          # print sum
        move    $4,$9
        syscall
        li      $2,10         # exit
        syscall   




##   on entry:
##      $ra -- return address
##
##   on exit:
##      $v0 -- the integer


         .text
         .globl  pread
pread:   
         la    $a0,prompt        # print string
         li    $v0,4             # service 4
         syscall
        
         li    $v0,5             # read int into $v0
         syscall                 # service 5
        
         jr    $ra               # return
         nop                     #  
        
         .data
a:      .word  0
bb:     .word  0
c:      .word  0
prompt:
         .asciiz "Enter an integer: "
heading:
         .asciiz "The sum is: " 
