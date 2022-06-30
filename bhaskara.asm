
.globl main

main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
	li $v0, 5
	syscall
	add $t3, $v0, $zero
	
	mul $t5, $t2, $t2
	
	li $t4 4
	mul $t4, $t4, $t1
	mul $t4, $t4, $t3
	sub $t4, $t5, $t4
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	jal println
	
	bltz $t4, deltaNgtv
	
	li $t5, 0
	div $t6, $t4, 2
	move $t7, $t4
	
	b for
	
for:
	div $s0, $t4, $t7
	add $s0, $s0, $t7
	div $t7, $s0, 2
	addi $t5, $t5, 1
	bge $t5, $t6, endf
	b for
	
endf:

	mul $t1, $t1, 2
	add $t5, $t2, $t7
	
	mtc1 $t5, $f0
	cvt.s.w $f0, $f0
	
	mtc1 $t1, $f1
	cvt.s.w $f1, $f1
	
	#div $t5, $t5, $t1
	div.s $f1, $f0, $f1
	
	li $v0, 2
	mov.s $f12, $f1
	syscall
	
	jal println
	
	sub $t5, $t2, $t7
	
	mtc1 $t5, $f0
	cvt.s.w $f0, $f0
	
	mtc1 $t1, $f1
	cvt.s.w $f1, $f1
	
	#div $t5, $t5, $t1
	div.s $f1, $f0, $f1
	
	li $v0, 2
	mov.s $f12, $f1
	syscall
	
	jal println
	
	b Exit

	
deltaNgtv:
	li $v0, 4
	la $a0, deltaN
	syscall
	b Exit

println:
	li $v0, 11
	addi $a0, $zero, 10
	syscall
	jr $ra
	
Exit:
	li $v0, 10
	syscall

.data
prompt: .asciiz "Digite os coeficientes da equacao de segundo grau\n"
deltaN: .asciiz "Nenhum resultado no conjunto dos reais\n"
