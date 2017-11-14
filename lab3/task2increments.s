.text
.global	_increment
_increment:
	subi sp,sp,48
	stw r4, 4(sp)
	stw r7, 8(sp)
	stw r8, 12(sp)
	stw r9, 16(sp)
	stw r10, 20(sp)
	stw r11, 24(sp)
	stw r12, 28(sp)
	stw r13, 32(sp)
	stw r14, 36(sp)
	stw r15, 40(sp)
	stw ra, 44(sp)
	ldw r3, 48(sp) 
	/*I'm taking liberties with the lab instructions, to make the program more useful. I'm adding the switch values after the button switch is pressed, and making the red lights update dynamically */
	/*That way you don't have to have the value of the switches chosen immediately when running in Real time, so you can actually change the values */

	addi r8,r0,0
	
	PRESSLOOP:
	addi r23,r0,0
	movia r14, 0x10000040
	ldwio r7,0(r14)
	movia r15,0x10000000
	stwio r7,0(r15)
	movia r13, 0x10000050
	ldwio r8,0(r13)
	addi r12,r0,0
	bne r8, r12, DEPRESSLOOP
	br PRESSLOOP
	DEPRESSLOOP:
	movia r13, 0x10000050
	ldwio r9,0(r13)	
	bne r8,r9, ENDLOOP
	br DEPRESSLOOP:
	ENDLOOP:
	ldwio r0,0(r13)
	stwio r0,0(r4)
	addi r8,r0,0
	
	add r3,r3,r7
		
	ldw r4, 4(sp)
	ldw r7, 8(sp)
	ldw r8, 12(sp)
	ldw r9, 16(sp)
	ldw r10, 20(sp)
	ldw r11, 24(sp)
	ldw r12, 28(sp)
	ldw r13, 32(sp)
	ldw r14, 36(sp)
	ldw r15, 40(sp)
	ldw ra, 44(sp)
	stw r3, 48(sp) 
	addi sp,sp,48
ret
.end