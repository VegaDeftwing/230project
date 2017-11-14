.text
.global	_start
.extern	_mult
_start:
	movia	sp,	0x007FFFFC		
	addi	r2,	r0,	2 
	addi	r3,	r0,	3 
	add r5,r0,r0
	add r6,r0,r0
	subi sp,sp, 8
	stw r2, 0(sp)
	stw r3, 4(sp)
	call	_mult 
	ldw r4, 0(sp)
	END:
	br END
.end