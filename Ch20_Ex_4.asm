## Ch20_Ex_4
##
## determines the minimum and the maximum element in the array
## Registers:
##  $8 -- count
##  $9 -- pointer to the array entry
## $10 -- current array entry
## $11 -- length of the entry
## $12--- scratch
## $14 -- minimum
## $15 -- maximum

         .text
         .globl  main
# Initialize
main:    	ori      	$8,$0,0        	#  count = 0
         	ori      	$9,$0,0      	
	ori	$12,$0,1
         	lw       	$11,size($0)      	#  get SIZE

# get first entry and put into min and max
         	lw       	$10,array($9)      	#  get entry
         	sll      	$0,$0,0        	#  load delay
         	add     	$14,$0,$10		#  put into min
         	add     	$15,$0,$10		#  put into max
         	addiu    	$8,$8,1		#  count =+ 1

         	addiu    	$9,$9,4        	#  point to next entry
         
# while  count < SIZE do
loop:    	beq      	$8,$11,done 
        	sll      	$0,$0,0        	#  branch delay

# get entry
         	lw       	$10,array($9)      	#  get entry
         	sll      	$0,$0,0        	#  load delay
	
# test min
	slt	$12,$14,$10
	beq 	$12,$0,min
	sll      	$0,$0,0        	#  load delay	
	
# test max
	slt	$12,$10,$15
	beq	$12,$0,max
	sll      	$0,$0,0      	#  load delay
	
	addiu    	$8,$8,1        	# count++
         	addiu    	$9,$9,4        	# point at next entry
         	j        	loop
         	sll      	$0,$0,0        	#  branch delay
	
min:	addu	$14,$0,$10		# put into min
	addiu    	$8,$8,1        	# count++
         	addiu    	$9,$9,4        	# point at next entry
         	j        	loop
         	sll      	$0,$0,0        	#  branch delay

max:	addu	$15,$0,$10		# put into max

	addiu    	$8,$8,1        	# count++
         	addiu    	$9,$9,4        	# point at next entry
         	j        	loop
         	sll      	$0,$0,0        	#  branch delay
         
# finish
done:    	sll      	$0,$0,0        	# target for branch

.data
size:   .word 8
array:  .word 23, -12, 45, -32, 52, -72, 8, 13

## End of file