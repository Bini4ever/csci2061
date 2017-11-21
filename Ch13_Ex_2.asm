## Program to demonstrate addition
        .text
        .globl  main
main:
        ori     $8, $0, 0x0
        ori	$7, $0, 0x1000      
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        addu    $8, $8, $7
        ori	$9, $0, 0x1000
        sll	$9, $9, 4      
        ori	$10, $0, 0x1000
        addu	$10, $10, $10
        addu	$10, $10, $10
        addu	$10, $10, $10
        addu	$10, $10, $10        
## End of file
