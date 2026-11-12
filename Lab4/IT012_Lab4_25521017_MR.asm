#Ma nguon 7 - Data
.data
m1:      .asciiz "Thang "
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
mb:	 .asciiz "Bac"
lp:      .asciiz " ("
rp:      .asciiz ")"
nl:      .asciiz "\n"
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48

cnt:     .word 0, 0, 0, 0


# Ma nguon 8 – dien nang tung thang
.text
.globl main
main:
  la   $s0, reading     # $s0 = dia chi nen reading
  la   $s1, usage       # $s1 = dia chi nen usage
  addi $s2, $zero, 0    # i = 0
  addi $s3, $zero, 12   # n = 12 thang
   la	$s7, cnt	# $s7 = dia chi nen cnt
   addi $8, $zero, 0 	#j = 0
Loop:
  # 25521017 thoat neu i == n
  beq $s2, $s3, Done
  
  # 25521017 tinh dia chi reading[i]
  sll $t1, $s2, 2
  add $t1, $t1, $s0
  
  # 25521017 $t3 = reading[i], $t4 = reading[i+1]
  lw $t3, 0($t1)
  lw $t4, 4($t1)
  
  # 25521017 $t5 = $t4 - $t3 (dien nang thang i+1)
  sub $t5, $t4, $t3
  
  # 25521017 tinh dia chi usage[i], luu $t5 vao usage[i]
  sll $t2, $s2, 2
  add $t2, $t2, $s1
  
  sw $t5, 0($t2)
  
#25521017 Tinh bac
blt $t5, 101, bac1
blt $t5, 151, bac2
blt $t5, 201, bac3

#25521017Dia chi cnt[3] -> c($t7)
lw $t8, 12($s7)
add $t8, $t8, 1
sw $t8, 12($s7) 
j Sau_cnt

bac1:
#25521017Dai chi cnt[0] -> 0($t7)
lw $t8, 0($s7)
add $t8, $t8, 1
sw $t8, 0($s7)
j Sau_cnt

bac2:
#25521017Dia chi cnt[1] -> 4($t7)
lw $t8, 4($s7)
add $t8, $t8, 1
sw $t8, 4($s7)
j Sau_cnt

bac3:
#25521017Dia chi cnt[2] -> 8($t7)
lw $t8, 8($s7)
add $t8, $t8, 1
sw $t8, 8($s7)
j Sau_cnt
 
 Sau_cnt:
  # 25521017 in “Thang “, i+1, “: ", $t5, xuong dong
  li $v0, 4
  la $a0, m1
  syscall
  
  li $v0, 1
  add $a0, $s2, 1
  syscall	
	    
  li $v0, 4
  la $a0, m2
  syscall
  
  li $v0, 1
  add $a0, $t5, $zero
  syscall
  
  li $v0, 4
  la $a0, nl
  syscall
 
  # 25521017 tong dien nang $s4
  add $s4, $s4, $t5
   
  # 25521017 dien nang cao nhat
  sgt $k0, $t5, $s5
  bne $k0, 1, Dieukien
  add $s5, $s5, $t5
  add $s6, $s6, $s2 
  
  # 25521017 i = i + 1, quay lai Loop
  Dieukien:
  add $s2, $s2, 1
  j Loop
  
Done:
#25521017 In tong Kwh
li $v0, 4
la $a0, mt
syscall

li $v0, 1
add $a0, $s4, $zero
syscall

li $v0, 4
la $a0, nl
syscall

#25521017 In thang cao nhat
li $v0, 4
la $a0, mm
syscall

li $v0, 1
add $a0, $s6, $zero
syscall

li $v0, 4
la $a0, nl
syscall

add $t2, $zero, 0	# i = 0
add $t3, $zero, 4 	# n = 4
LoopPrintBac:
#25521017Dieu kien out loop
beq $t2, $t3, End

#25521017In
li $v0, 4
la $a0, mb
syscall

li $v0, 1
add $a0, $t2, 1
syscall

li $v0, 4
la $a0, m2
syscall

#25521017Tinh dia chi cua cnt[i]
sll $t8, $t2, 2
add $t8, $t8, $s7

li $v0, 1
lw $a0, 0($t8)
syscall

li $v0, 4
la $a0, nl
syscall

add $t2, $t2, 1
j LoopPrintBac

End:
  li   $v0, 10
 syscall


