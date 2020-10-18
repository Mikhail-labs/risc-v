.data
nums:	.byte	69, 98, 73, 138, 5, 49, 5, 14, 5, 107
	.eqv	N	10	
.text
	la		x1, nums 
	mv		x7, x1 
	li		x6, N
	mv		x5, x6
	add		x5, x5, x1 
	
isnsertion_sort:	
	beq	x1, x5, printing
	lbu	x11,  (x1)
	addi	x1, x1, 1
	beq	x1, x5, printing
	lbu	x12, (x1) 
	
compare:	
	bleu	x11, x12, insertion_sort 
	
	mv	x4, x1
 			
sorting_process:
	sb	x11, (x1)
	addi	x1, x1, -1
	sb	x12, (x1)  
	
back:  
	mv	x13, x12
	mv	x12, x11
	mv	x11, x13

compare_back:
	beq	x1, x7, back_to_beginning
	mv	x12, x11
	addi	x1, x1, -1
	lbu	x11, (x1)
	bleu	x11, x12, back_to_beginning
	bgtu	x11, x12, sorting_process1
	
sorting_process1:
	sb	x13, (x1)
	addi	x1, x1, 1
	sb	x11, (x1)
	addi	x1, x1, -1
	b	back
	
	
back_to_beginning:
	mv	x1, x4
	b	insertion_sort
	
printing:
	sub	x1, x5, x6 
	li x17, 1
	print:
		lbu x10, (x1)
		addi x1, x1, 1
		ecall
		li x10, '\n'
		li x17, 11
		ecall
		beq x1, x5, end
		li x17, 1
		b print
	
end:	

				
	
			
