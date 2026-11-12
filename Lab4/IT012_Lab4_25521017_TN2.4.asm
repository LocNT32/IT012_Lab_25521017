# Ma nguon 5 – phan bac dien nang
.data
prompt: .asciiz "Nhap dien nang (kWh): "
msg:    .asciiz "Bac: "
nl:     .asciiz "\n"

.text
.globl main
main:
  li  $v0, 4
  la  $a0, prompt
  syscall
  
  li  $v0, 5            # doc kWh, ket qua o $v0
  syscall
  
  add $s0, $v0, $zero   # $s0 = dien nang (kWh)
  
  # 25521017 xac dinh bac (1..4) theo Bang 6, dat vao $s1
  blt $s0, 101, bac1
  blt $s0, 151, bac2
  blt $s0, 201, bac3
  
  add $s1, $zero, 4 
  j in_bac
  
  bac1:
	add $s1, $zero, 1
  	j in_bac
  bac2:
  	add $s1, $zero, 2
  	j in_bac
  bac3:
  	add $s1, $zero, 3
  	j in_bac
  
  # 25521017 in “Bac: “, roi $s1, roi xuong dong
  in_bac:
  li $v0, 4
  la $a0, msg
  syscall
  
  li $v0, 1
  add $a0, $s1, $zero
  syscall
  
  li  $v0, 10
  syscall

