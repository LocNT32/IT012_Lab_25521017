# Ma nguon 4 - chuyen cau lenh thanh lenh hop ngu
.text
.globl main
main:
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3
 
    # >>> cac lenh cho x1, x2, x3 va x4
    add $t0, $s0, $s1
    add $t0, $t0, $s2
    add $t1, $s0, $s1
    add $s2, $s2, 5
    sub $t1, $t1, $s2 
    add $t2, $zero, $s0
    sub $t3, $s1, $s0 

    li   $v0, 10
    syscall
