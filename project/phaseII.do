vsim processor

view wave


add wave reset
add wave clock
add wave instruction
add wave ir_enable
add wave mem_read
add wave y_select
add wave c_select
add wave rf_write
add wave b_select
add wave a_inv
add wave b_inv
add wave alu_op
add wave N
add wave C
add wave V
add wave Z
add wave ALU_out 
add wave RegD
add wave RegT
add wave RegS
add wave DataD 
add wave DataS
add wave DataT 
add wave DataA 	
add wave DataB 
add wave DataM  
add wave DataZ 
add wave immediateB 
add wave ReturnAddress  


force reset 0 0
force clock 0 0, 1 10  -repeat 20

force instruction 000000000100000000000000 0, 000000000011000000000000 110, 000000000111000000000000 210, 000000000110000000000000 310, 000000000101000000000000 410, 000000000100000100100011 510, 000000000011000100100011 610, 000000000111000100100011 710, 000000000110000100100011 810, 000000000101000100100011 910, 000000001100000000000000 1010, 000000010100000000000000 1110,  000000100100000100100011 1210, 000000101100000100100011 1310, 000000000100000000000000 1410, 000000000100000100010001 1510, 000000000100000000000000 1610 -repeat 1710




run 1710