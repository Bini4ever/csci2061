## Program to calculate 3 * x - 5 * y
##
## Register Use:
##  $8   x
##  $9   y
##  $10  result
        .text
        .globl  main
main:
        ori      $8, $0, 1        # put x into $8
        sll      $9, $8, 1        # $9 = 2x
        addu     $8, $9, $8       # $8 = 3x
        
        ori	 $9, $0, 2	  # put y into $10
        sll	 $10, $9, 2	  # $11 = 4y
        addu	 $9, $10, $9	  # $10 = 5y
        
        sub    $10, $8, $9    # $12 = 3x - 5y

## End of file

