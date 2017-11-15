.text
.global	_start
.extern	_incArr
_start:
 movia	sp,	0x007FFFFC		
	movia r2, ARR
	subi sp,sp,36
	stw r2, 0(sp)
	
call	_incArr

	addi sp,sp,36 
	addi r3,r0,0
	addi r4,r0,0
	addi r5,r0,0
	addi r6,r0,0
	addi r7,r0,24
	LOOP:
	add r3,r2,r4
	ldw r5,0(r3)
	add r6,r6,r5
	addi r4,r4,4
	blt r4,r7,LOOP
	
	
	
	
	addi r14,r0,0
	addi r2,r6,0
	addi r4,r0,0
	addi r5,r0,0
	addi r6,r0,0
	addi r7,r0,0
	addi r9,r0,0
	addi r10,r0,0
	addi r11,r0,0
	addi r12,r0,0
	addi r13,r0,0
	addi r14,r2,0
	/*Display	value	to	HEX digits */
	movia r18, HEX 
	
	/*thousands place */
	addi r3,r0,1000
	bge  r2,r3, THOUSANDS
	br NOTHOUSANDS
	THOUSANDS:
	subi r2,r2,1000
	addi r4,r4,1
	addi r13,r13,4
	addi r18,r18,4
	bge  r2,r3, THOUSANDS
	NOTHOUSANDS:
	beq r4,r0, THOUSANDISZERO
	ldw r9,0(r18)
	sub r18,r18,r13
	addi r13,r0,0
	ZEROTHOUSANDS:
	slli r9,r9,24

	/*hundreds place */
	addi r3,r0,100
	bge  r2,r3, HUNDREDS
	br NOHUNDREDS
	HUNDREDS:
	subi r2,r2,100
	addi r5,r5,1
	addi r13,r13,4
	addi r18,r18,4
	bge  r2,r3, HUNDREDS
	NOHUNDREDS:
	beq r5,r0, HUNDREDISZERO
	ldw r10,(r18)
	sub r18,r18,r13
	addi r13,r0,0
	ZEROHUNDREDS:
	slli r10,r10,16

	/*tens place */
	addi r3,r0,10
	bge  r2,r3, TENS
	br NOTENS
	TENS:
	subi r2,r2,10
	addi r6,r6,1
	addi r13,r13,4
	addi r18,r18,4
	bge  r2,r3, TENS
	NOTENS:
	beq r6,r0, TENISZERO
	ldw r11,0(r18)
	sub r18,r18,r13
	ZEROTENS:
	slli r11,r11,8
	/*ones place */
	addi r3,r0,1
	bge  r2,r3, ONES
	br NOONES
	ONES:
	subi r2,r2,1
	addi r7,r7,1
	addi r13,r13,4
	addi r18,r18,4
	bge  r2,r3, ONES
	NOONES:
	beq r7,r0, ONEISZERO
	ldw r12,0(r18)
	sub r18,r18,r13
	ZEROONES:

	br CONCATENATE
	/*Edge cases in case the value for the digit is zero */
	
	THOUSANDISZERO:
	ldw r9,0(r18)
	br ZEROTHOUSANDS
	
	HUNDREDISZERO:
	ldw r10,0(r18)
	br ZEROHUNDREDS
	
	TENISZERO:
	ldw r11,0(r18)
	br ZEROTENS
	
	ONEISZERO:
	ldw r12,0(r18)
	br ZEROONES
	
	CONCATENATE:
	or r2,r9,r10
	or r2,r2,r11
	or r2,r2,r12
	/*r2 will be the final value on hex display. r14 will be equivalent binary representation on the red leds*/
	movia r13, 0x10000050
	ldwio r14,0(r13)
	movia r8,0x10000020
	stwio r2, 0(r8)

	
	
	ENDING:
	br ENDING

	
.data
ARR:	.word	0,0,0,0,0,0
HEX: .word 0x3F,0x6,0x5B,0x4F,0x66,0x6D,0x7D,0x7,0x7F,0x6F 
.end