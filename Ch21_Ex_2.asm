## Ch21_EX_2.asm
##
## adds corresponding elements in the first two arrays and 
## stores the result in the corresponding element of the result array

## Registers:
##  $8 -- count
## $10 -- current array entry
## $11 -- length of the entry
## $12 -- base register for array1
## $13 -- base register for array2
## $14 -- base register for result
## $16 -- value 1
## $17 -- value 2 
## $15 -- sum

.text
         .globl  main
# Initialize
main:    	ori      	$8,$0,0        	#  count = 0
         	lw       	$11,size($0)      	#  get SIZE    	
	la    	$12,array1     	#  base register
	la    	$13,array2     	#  base register
	la    	$14,result     	#  base register


loop:    	beq      	$8,$11,done 
        	sll      	$0,$0,0        	#  branch delay
        	
        	lw    	$16,0($12)   	#  load value 2
        	lw    	$17,0($13)   	#  load value 3
        	sll   	$0,$0,0      	#  load delay slot
        	addu  	$15,$17,$16  	#  calc. sum
        	
        	sw	$15,0($14)	#  store value of registure $15 to result
        	
        	addiu    	$8,$8,1        	# count++
         	addiu    	$12,$12,4        	# point at next entry
         	addiu    	$13,$13,4        	# point at next entry
         	addiu    	$14,$14,4        	# point at next entry
         	j        	loop
         	sll      	$0,$0,0        	#  branch delay


# finish
done:    	sll      	$0,$0,0        	# target for branch


.data
size:    .word  7
array1:  .word -30, -23, 56, -43, 72, -18, 71
array2:  .word  45,  23, 21, -23, -82,  0, 69
result:  .word  0,   0,  0,   0,   0,  0,  0

## End of file