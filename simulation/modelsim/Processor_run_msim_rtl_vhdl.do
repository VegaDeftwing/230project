transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/MUX3_1.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/FAST4BITADDER.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/memFilesProcessor/PC_Temp.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/memFilesProcessor/PC.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/memFilesProcessor/MuxPC.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/memFilesProcessor/MuxINC.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/memFilesProcessor/MainMemory.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/memFilesProcessor/Const.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/memFilesProcessor/Adder.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/Reg_16.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/immediate.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/Registry.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/reg16.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/mux16.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/MUX.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/FLAGLOGIC.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/decoder16.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/CU.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/ALU.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/processor.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/PS.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/IR.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/MUXB.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/MUXY.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/MUX6TO1.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/FASTADDER.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/BUFFREG.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/MUXma.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/MUXC.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/MUXmem.vhdl}
vcom -93 -work work {C:/Users/Zed/Desktop/CSCE230/230project/project/HEXTRANSLATOR.vhdl}

do "C:/Users/Zed/Desktop/CSCE230/230project/project/phaseV.do"
