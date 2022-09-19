.data
	asterisco: .asciiz "*"  
	espaco: .asciiz " " 
	enter: .asciiz "\n"

.text
main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	move $t1, $zero 	#zera t1
	addi $t1, $t1, 1  	#t1 = 1
	
	
	loop1:
		bgt $t1, $t0, fim 	#if(t1 > t2) encerra programa
		
		move $t2, $zero 
		addi $t2, $t2, 1 
		sub $t4, $t0, $t1 	#t4 = t0 - t1
		
		loop2:
			bgt $t2, $t4, fim2 #if(t2 > t4) {}
			
			li $v0, 4
			la $a0, espaco	#a0 recebe " "
			syscall

			addi $t2, $t2, 1 
			
			j loop2  #  reinicia loop2
			
		fim2:
			move $t3, $zero 
			addi $t3, $t3, 1 
			move $t5, $zero
			addi $t5, $t5, 2
			
			mul $s0, $t1, $t5 	# s0 = t1 x t5
			sub $t6, $s0, 1 
		loop3:
			bgt $t3, $t6, fim3
			li $v0, 4
			la $a0, asterisco
			syscall
			addi $t3, $t3, 1
		
			j fim3
		fim3:
			li $v0, 4
			la $a0, enter
			syscall
			
			addi $t1, $t1, 1
			j loop1
						
	fim:
		li $v0, 10 #finaliza programa
		syscall
	
	
	
	
	
	
	
	
	
	
	
	
		

	