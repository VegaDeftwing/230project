vsim processor

view wave


add wave reset
add wave clock
add wave instruction
add wave ir_enable_Output
add wave mem_read_Output
add wave y_select_Output
add wave c_select_Output
add wave rf_write_Output
add wave b_select_Output
add wave a_inv_Output
add wave b_inv_Output
add wave alu_op_Output
add wave N_Output
add wave C_Output
add wave V_Output
add wave Z_Output
add wave ALU_out_Output
add wave RegD_Output
add wave RegT_Output
add wave RegS_Output
add wave DataD_Output 
add wave DataS_Output
add wave DataT_Output 
add wave DataA_Output	
add wave DataB_Output 
add wave DataM_Output  
add wave DataZ_Output 
add wave immediateB_Output 
add wave ReturnAddress_Output  
 
force reset 0 0
force clock 0 0, 1 10  -repeat 20

force instruction 000000000100000000000000 0, 16#600410 110, 000000000111000000000000 210, 000000000110000000000000 310, 000000000101000000000000 410, 000000000100000100100011 510, 000000000011000100100011 610, 000000000111000100100011 710, 000000000110000100100011 810, 000000000101000100100011 910, 000000001100000000000000 1010, 000000010100000000000000 1110,  000000100100000100100011 1210, 000000101100000100100011 1310, 000000000100000000000000 1410, 000000000100000100010001 1510, 000000000100000000000000 1610 -repeat 1710




run 1710