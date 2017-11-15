.text
.global	_mult
_mult:
	subi sp, sp, 20
	stw ra, 0(sp)
	stw r2, 4(sp)
	stw r3, 8(sp)
	stw r5, 12(sp)
	stw r6, 16(sp)	
	ldw r5, 20(sp)
	ldw r6, 24(sp)
	slli r2,r5,3
	slli r5,r5,2
	add r5,r5,r2
	add r2,r5,r6
	stw r2, 20(sp)
	ldw ra, 0(sp)
	ldw r2, 4(sp)
	ldw r3, 8(sp)
	ldw r5, 12(sp)
	ldw r6, 16(sp)

	addi sp, sp, 20
	ret
.end


