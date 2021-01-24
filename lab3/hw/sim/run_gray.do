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
add wave -position insertpoint  sim:/image_gray_tb/clk sim:/image_gray_tb/ast_in_valid sim:/image_gray_tb/ast_in_ready sim:/image_gray_tb/ast_out_valid sim:/image_gray_tb/ast_out_data sim:/image_gray_tb/ast_out_ready sim:/image_gray_tb/ast_in_data_delayed
add wave -position end  sim:/image_gray_tb/DUT/r_red_in_reg
add wave -position end  sim:/image_gray_tb/DUT/r_green_in_reg
add wave -position end  sim:/image_gray_tb/DUT/r_blue_in_reg
run -all
wave zoom full
quit
