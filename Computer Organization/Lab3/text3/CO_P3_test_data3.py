# first 0
	addu r0,r0,r0
	00000000000000000000000000100001
	addi a0,zero,4
	00100000000001000000000000000100 
	addi t1,zero,1
	00100000000010010000000000000001 
	mul
	j final
	00001000000000000000000000011110
# bubble 5
	li
	001111
	li
	001111
	mul
# outer 8
	addi a0,zero,4
	00100000000001000000000000000100 
	subu t0,t4,t6
	li t1,0
# inner 11
	lw s0,4(sp)
	10001111101100000000000000000100
	lw ra,0(sp)
	10001111101111110000000000000000
	ble
	sw ra,0(sp)
	10101111101111110000000000000000 
	sw s0,4(sp)
	10101111101100000000000000000100 
	li t1,1
# no_swap 17
	addi a0,zero,4
	00100000000001000000000000000100 
	subu t0,t4,t6
	bltz
	j innera
# next_turn 21
	bnez  
	j final
	00001000000000000000000000011110
# Jump 23
	subu
# Loop 24
	addu s0,a0,zero
	00000000100000001000000000100001 
	beq s0,t1,re1
	00010010000010010000000000001011  
	j final
	00001000000000000000000000011110
# End 27



