#read in three integers Evaluate the expression 5u^2 - 12uv + 6v^2
#
# This program uses simple linkage.  
#
# Settings: Load delays  ON;  Branch delays ON
#           Trap file    ON;  Pseudoinstructions ON   
# Register: 
# $s0 -- u
# $s1 -- v
# $a0 -- 5u^2
# $a1 -- -12uv
# $a2 -- 6v^2
# $a3 -- sum

         .text
         .globl  main
main:
         jal     pread            # read first integer
         nop                      #  
         move    $s0,$v0          # save it in $s0

         jal     pread            # read second integer
         nop                      #  
         move    $s1,$v0          # save it in $s1

         move    $t1,$s0	# put u in to $t1
         move    $t2,$s0	# put u in to $t2
         addi    $t3,$zero,5	# put 5 in to $t3
         jal     multiply	# multiply 
         move    $a0,$t0	# $s0 = 5u^2
         
         move    $t1,$s0	# put u in to $t1
         move    $t2,$s1	# put v in to $t2
         addi    $t3,$zero,-12	# put -12 in to $t3
         jal     multiply	# multiply 
         move    $a1,$t0	# $s1 = - 12uv
         
         move    $t1,$s1	# put v in to $t1
         move    $t2,$s1	# put v in to $t2
         addi    $t3,$zero,6	# put 6 in to $t3
         jal     multiply	# multiply 
         move    $a2,$t0	# $s0 = 6v^2
         
         addu    $a0,$a0,$a1      # compute the sum
         addu    $a3,$a0,$a2      # result in $s3
 
         li      $v0,4            # print a heading
         la      $a0,heading         
         syscall

         move    $a0,$a3          # move sum into parameter
         li      $v0,1            # print the sum
         syscall
        
         li      $v0,10           # exit
         syscall
         
# subroutine multiply X*Y*Z and return       
multiply: 	mul $t0, $t1, $t2	# $t0 = $t1 * $t2
	mul $t0, $t0, $t3	# $t0 = $t0 * $t3
	jr  $ra               # return
         	nop                     #  
        
          
         .data
heading:
         .asciiz "The sum is: "        
        
 

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
prompt:
         .asciiz "Enter an integer: "
