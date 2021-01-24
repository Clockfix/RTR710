# libraries
vlib work
vlib edi

# compiling sources
vcom -work edi -2008 data_types.vhd
vcom -work edi -2008 simulation.vhd -allowProtectedBeforeBody
vcom -work work -2008 ../src/data_types.vhd
vcom -work work -2008 ../src/components.vhd
vcom -work work -2008 ../src/*.vhd
vcom -work work -2008 image_sobelHor_tb.vhd

# simulation
vsim image_sobelHor_tb
add wave -position insertpoint  sim:/image_sobelhor_tb/clk 
add wave -position end sim:/image_sobelhor_tb/reset 
add wave -position end sim:/image_sobelhor_tb/ast_in_valid 
add wave -radix unsigned  -position end sim:/image_sobelhor_tb/ast_in_data 
add wave -position end sim:/image_sobelhor_tb/ast_in_ready 
add wave -color red -position end sim:/image_sobelhor_tb/ast_out_valid 
add wave -color red -radix unsigned -position end sim:/image_sobelhor_tb/ast_out_data 
add wave -position end sim:/image_sobelhor_tb/ast_out_ready 
#add wave -radix unsigned -position end sim:/image_sobelhor_tb/ast_in_data_delayed 
####### Add DUT registers
add wave -color blue -radix unsigned -position end sim:/image_sobelhor_tb/DUT/r_data_one 
add wave -color yellow -radix unsigned -position end sim:/image_sobelhor_tb/DUT/r_data_two 
add wave -color blue -radix unsigned -position end sim:/image_sobelhor_tb/DUT/r_data_tree

add wave -radix decimal -position end  sim:/image_sobelhor_tb/DUT/w_result_w_threshold
add wave -position end  sim:/image_sobelhor_tb/DUT/w_enable 
#add wave -position end  sim:/image_sobelhor_tb/DUT/w_data_enable
add wave -position end sim:/image_sobelhor_tb/DUT/r_valid_shift
run -all
quit
