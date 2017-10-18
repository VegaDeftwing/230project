vsim FA

view wave
add wave A
add wave B
add wave Cin
add wave S
add wave Cout

force A 0 0, 1 20 -repeat 40
force B 0 0, 1 40 -repeat 80
force Cin 0 0, 1 80 -repeat 160

run 320

