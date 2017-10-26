# Farshad Chowdhury
# Computer Architecture
.data
array:  .word   1, 4, 58, 6, 9, 61, 5, 23
size:   .word   32
.text
#
#
#
# counter = 0
    and $t1, $0, $0 #load 0 into counter
# sum = 0
    and $t2, $0, $0 #t2 is max 
    lw	$t4, size # sets max amount of loop iterations
    add  $t3, $0, $t4
loop:
    lw  $4, array($t1)
    ble $4, $t2, countinc
    move    $t2, $4
countinc:
    addi    $t1, $t1, 4
    blt $t1, $t3, loop
done:
 
   li	$v0, 1      # Load syscall1 (integer output) into v0
  add $a0 $t2 $0 #load t2 into a0
	syscall
   li	$v0,10
	syscall       
	