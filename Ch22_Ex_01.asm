# Ch22_Ex_1
#
# miles per gallo
# Convert ounces to pounds and ounces.

        .text
        .globl  main

main:   

	ori $s0,$0,1   #initualize 

loop:   beq     $s0, 0, exit   #loop until the user enter 0
        li      $v0,4           # print prompt1
        la      $a0,promptone  #
        syscall
        li      $v0,5       # read in in Mile
        syscall
        move    $s0,$v0     # save it in $s0
        beq     $s0, 0, loop
        la      $a0,prompttwo  #
        li      $v0,4       # print prompt2
        syscall
        li      $v0,5       # read in in gallons
        syscall
        move    $s1,$v0     # save it in $s1

        divu    $s0, $s1    # mile/gallons
        mflo    $t0
        mfhi    $t1
        
        move    $a0,$t0     # move mile/gallons to perimetr
        li      $v0,1       # print
        syscall             
        li      $v0,4       # print "mile / gallons"
        la      $a0,milgal
        syscall
        
        j loop
        
        sll $0, $0, 0
	
exit: 	sll $0, $0, 0
        li      $v0,10      # exit
        syscall

        .data
promptone: .asciiz "Enter the number of miles traveled: "
prompttwo: .asciiz "Enter the gallons of gasoline consumed: "
milgal:  .asciiz " Miles / gallone\n"

