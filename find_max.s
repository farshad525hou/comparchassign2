# find max from array
#
.data
array:  .word   1, 4, 98, 6, 9, 12, 5, 23
size:   .word   32
fst:                    
	.asciiz "first integer = " 
.text
#
# -- register assignments  --
# $t1 = counter
# $t2 = sum
# $t3 = loop limit (20)
#
# counter = 0
    and $t1, $0, $0
# sum = 0
    and $t2, $0, $0
    lw	$t4, size
    add  $t3, $0, $t4
loop:
# if array[i] < max save array[i] as max
    lw  $4, array($t1)
    ble $4, $t2, incrementCount
    move    $t2, $4
incrementCount:
# counter++
# (words are 4 bytes, so advance counter by 4)
    addi    $t1, $t1, 4
# if counter < 5, loop (really < 20)
    blt $t1, $t3, loop
done:
  # sw  $t2, 1($s1)
   li	$v0, 1      # Load syscall4 (output) into v0
  # la	$a0, 1($s1)  # Load address of fst into ao
  add $a0 $t2 $0
	syscall 
   li	$v0,10
	syscall       # return to calling procedure