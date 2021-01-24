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
add wave -position insertpoint  sim:/image_gray_tb/clk 
add wave -color red -position end sim:/image_gray_tb/ast_in_valid 
add wave -color red -position end sim:/image_gray_tb/ast_out_ready 
add wave -color red -radix hex -position end sim:/image_gray_tb/ast_in_data 
add wave -color yellow -radix hex -position end sim:/image_gray_tb/ast_in_data_delayed
add wave -color blue -radix unsigned -position end sim:/image_gray_tb/ast_out_data 
add wave -color blue -position end sim:/image_gray_tb/ast_in_ready 
add wave -color blue -position end sim:/image_gray_tb/ast_out_valid 
run -all
wave zoom full
quit
