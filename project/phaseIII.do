vsim processor

view wave


add wave reset
add wave clock
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
force clock 0 0, 1 200  -repeat 400




run 8000