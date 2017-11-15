.text
.global	_incArr
.extern	_increment
_incArr:
	subi sp,sp,28
	stw r2, 4(sp)
	stw r3, 8(sp)
	stw r4, 12(sp)
	stw r5, 16(sp)
	stw r7, 20(sp)
	stw ra, 24(sp)
	ldw r4, 28(sp)

	addi r5,r0,5
	addi r7,r4,0
	addi r2,r0,0
	LOOP: blt r5, r0, ENDLOOP
	add r4,r7,r2
	ldw r3, 0(r4)
	stw r3, 0(sp)
	call _increment
	stw r3, 0(r4)
	addi r2,r2,4
	subi r5,r5,1
	br LOOP
	ENDLOOP:
	
   ldw r2, 4(sp)
	ldw r3, 8(sp)
	ldw r4, 12(sp)
	ldw r5, 16(sp)
	ldw r7, 20(sp)
	ldw ra, 24(sp)
	stw r4, 28(sp)
	addi sp,sp,28
ret
.end