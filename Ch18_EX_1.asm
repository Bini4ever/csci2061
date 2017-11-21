## Ch18_Ex_3.asm
##
## Check that   20 <= temp <= 40 and 60 <= temp <= 80
## Set flag to 1 if in range, to 0 if out of range
##
## Registers:
## $1 --- temp
## $3 --- in/out range indicator flag 
## $8 --- scratch

      .text
      .globl  main

# Set range indicator to 1
main:   ori     $3,$0,1         #  set to 1
        ori     $1,$0,100        #  temp
        
 
# Test  20 <= temp <= 40
test1:  sltiu   $8,$1,41        #  $8=1 if temp <= 40
        beq     $8,$0,out1      #  0? out of range
        sll     $0,$0,0         #  delay

        sltiu   $8,$1,20        #  $8=1 if  temp < 20
        beq     $8,$0,cont      #  0? in range
        sll     $0,$0,0         #  delay
        
# Test  60 <= temp <= 80
test2:  sltiu   $8,$2,81        #  $8=1 if temp <= 80
        beq     $8,$0,out2      #  0? out of range
        sll     $0,$0,0         #  delay

        sltiu   $8,$2,60        #  $8=1 if  temp < 60
        beq     $8,$0,cont      #  0? in range
        sll     $0,$0,0         #  delay
        j	     end
        
# Out of Range: clear range indicator to 0
out1:    ori     $3,$0,0         #  clear flag1 to 0
	j     test2    
out2:    ori     $4,$0,0         #  clear glag2 to 0

cont:    sll     $0,$0,0         #  target for the jump

end:     sll     $0,$0,0

## End of file