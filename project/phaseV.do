
vsim processor

view wave


add wave Clock
add wave Reset
add wave StageOut
add wave Cond_Output
#add wave ReturnAddress_Output 
#add wave InstructionAddress_Output
add wave Address_Output
add wave MemInstruction_Output
add wave InR_Output
add wave opCode_Output
add wave LabelConst_Output
add wave IOSwitch
add wave IOPush
add wave IOLEDG
add wave IOLEDR
add wave IOHEX0 
add wave IOHEX1 
add wave IOHEX2 
add wave IOHEX3 
add wave GPIOin
add wave GPIOout
add wave IOKey_Output

add wave S_Output
add wave opx_Output

add wave rf_write_Output
add wave c_select_Output
add wave muxCOUT_Output
#add wave RegT_Output
#add wave RegS_Output


add wave alu_op_Output
#add wave ALU_out_Output
#add wave a_inv_Output
add wave b_inv_Output
#add wave N_Output
#add wave C_Output
#add wave V_Output
#add wave Z_Output

add wave b_select_Output
#add wave DataB_Output
#add wave immediateB_Output
add wave muxBout_Output


add wave y_select_Output
#add wave muxYout_Output
add wave DataD_Output
#add wave DataS_Output
#add wave DataT_Output
add wave DataA_Output
add wave DataM_Output
add wave DataZ_Output
add wave enablePS_Output
add wave Nout_Output
add wave Cout_Output
add wave Vout_Output
add wave Zout_Output


add wave pc_select_Output
#add wave pc_enable_Output



add wave mem_read_Output 
add wave mem_write_Output
#add wave memOut_Output
#add wave IOmemdata_Output
add wave extend_Output
add wave mfc_Output
add wave ma_select_Output
add wave mem_select_Output
add wave inc_select_Output

add wave ir_enable_Output




force reset 1 0
force clock 0 0, 1 167  -repeat 334
force IOPush 1111 0, 0111 100000, 1011 200000 
force IOSwitch 1111111111 0, 0000000000 100000, 1010101010 200000
force GPIOin 1 0, 0 100000
run 300000