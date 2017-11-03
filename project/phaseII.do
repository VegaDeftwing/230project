vsim processor

view wave


add wave reset
add wave clock
add wave instruction
add wave InR 
add wave opCode
add wave Cond 
add wave S 
add wave opx
add wave ir_enable
add wave ma_select
add wave mem_read
add wave mem_write
add wave pc_select
add wave pc_enable
add wave inc_select
add wave extend
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
add wave mfc 
add wave A
add wave B
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
add wave DataY 
add wave DataZ 
add wave enablePS 
add wave immediateB 
add wave muxBout 
add wave memIn 
add wave ReturnAddress 
add wave muxYout 
add wave Nout
add wave Cout
add wave Vout
add wave Zout

force reset 0 0
force clock 0 0, 1 10  -repeat 20

force instruction 000000000100000100100011 0, 000000001100000100100011 100, 000000000011000100100011 200, 000000000011010001010110 300,  000000010111011110001001 400, 001011111000101010110000 500 -repeat 600




run 1200