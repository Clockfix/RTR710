# libraries
vlib work
vlib edi

# compiling sources
vcom -work edi -2008 data_types.vhd
vcom -work edi -2008 simulation.vhd -allowProtectedBeforeBody
vcom -work work -2008 ../src/data_types.vhd
vcom -work work -2008 ../src/components.vhd
vcom -work work -2008 ../src/*.vhd
vcom -work work -2008 image_gray_tb.vhd

# simulation
vsim image_gray_tb
run -all
quit
