.data

msg1:	.asciz "загадайте число от 1 до 100\n"
msg2:	.asciz "загаданное число больше или равно "
msg3:	.asciz "? (д/н)\n"

.text
	li	t5, 'д'
	li	t6, 'н'
	li	t4, 50
	li	t2, 1
	li	t3, 100
	li	s7, 100
	li	s2, 2
	li	s4, 1
	
	la	a0, msg1
	li	a7, 4
	ecall
	
cyc1:	la	a0, msg2 #answer the question
	li	a7, 4
	ecall
	
	mv	a0, t4 #move 50 to a0
	li	a7, 1
	ecall

	la	a0, msg3 #yes or no
	li	a7, 4
	ecall
	
	li	a7, 12 #read char
	ecall
	mv	a1, a0
	
	li	a0, '\n'
	li	a7, 11 #print new line
	ecall
	
	beq	a1, t5, cyc2 # if a1 == д then cyc2
	beq	a1, t6, cyc3 # if a2 == н
	b cyc1
	
cyc2:	add	t2, zero, t4 # t4
	sub	s3, t3, t2
	rem	s5, s3, s2
	div	s3, s3, s2
	add	s3, s3, s5
	add	t4, t4, s3
	sub	s6, t3, t2
	beq	s6, s4, out
	b cyc1 # new question
	
	
cyc3:	add	t3, zero, t4
	sub	s3, t3, t2
	rem	s5, s3, s2
	div	s3, s3, s2
	add	s3, s3, s5
	sub	t4, t4, s3
	sub	s6, t3, t2
	beq	s6, s4, out
	b cyc1
			
out:	beq	t3, s7, out2
	mv	t3, t2
out2:	mv	a0, t3
	li	a7, 1
	ecall
	
	
	
	
