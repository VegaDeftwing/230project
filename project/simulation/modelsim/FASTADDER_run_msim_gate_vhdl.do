transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {FASTADDER.vho}

do "C:/Users/Zed/Desktop/CSCE230/230project/project/FASTADDER.do"
