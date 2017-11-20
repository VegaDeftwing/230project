vsim FASTADDER
view wave
add wave A
add wave B
add wave Cin
add wave F
add wave C14
add wave C15

force A 1011111111111111 0, 0100000000000001 20, 1010000000000000 60 -repeat 60
force B 0100000000000010 0, 0010000000000000 60, 1000010001000001 120 -repeat 120
force Cin 0 0, 1 120 -repeat 240
run 480

