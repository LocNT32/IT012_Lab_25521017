.data
prompt: .asciiz "Nhap chi so (kWh): "
m1:     .asciiz "Thang 1: "
m2:     .asciiz "Thang 2: "
m3:     .asciiz "Thang 3: "
tot:    .asciiz "Tong:    "
nl:     .asciiz "\n"

.text
.globl main
main:
#in prompt va doc chi so ban dau va newline
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	add $s0, $v0, $zero
	
#in m1 va doc du lieu m1
	li $v0, 4
	la $a0, m1
	syscall
	
	li $v0, 5
	syscall
	add $s1, $v0, $zero
	
#in m2 va doc lieu m2
	li $v0, 4
	la $a0, m2
	syscall
	
	li $v0, 5
	syscall
	add $s2, $v0, $zero
	
#in m3 va doc du lieu m3
	li $v0, 4
	la $a0, m3
	syscall
	
	li $v0, 5
	syscall
	add $s3, $v0, $zero
	
#xu li so lieu de cho ra total
	#so kwH sau thang dau tien
	sub $t0, $s1, $s0
	 
	#so kwh sau thang 2
	sub $t1, $s2, $s1
	
	#so kwh sau thang 3
	sub $t2, $s3, $s2
	
	#tong so kwh
	add $t3, $t2, $t1
	add $t3, $t3, $t0
	
#in kqua
	li $v0, 4
	la $a0, m1
	syscall
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 4
	la $a0, m2
	syscall
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 4
	la $a0, m3
	syscall
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 4
	la $a0, tot
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	li $v0, 4
	la $a0, nl
	syscall
	
#exit
	li $v0, 10
	syscall
