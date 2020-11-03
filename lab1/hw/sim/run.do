# create libraries
vlib work
vlib edi

# source compilation
vcom -work edi -2008 data_types.vhd
vcom -work edi -2008 simulation.vhd -allowProtectedBeforeBody
vcom -work work -2008 ../src/lab.vhd
vcom -work work -2008 lab_tb.vhd

# simulate
vsim lab_tb
add wave sim:/lab_tb/.*
run -all
quit
