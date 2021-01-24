# libraries
vlib work
vlib edi

# compiling sources
vcom -work edi -2008 data_types.vhd
vcom -work edi -2008 simulation.vhd -allowProtectedBeforeBody
vcom -work work -2008 ../src/data_types.vhd
vcom -work work -2008 ../src/components.vhd
vcom -work work -2008 ../src/*.vhd
vcom -work work -2008 image_darkener_tb.vhd

# simulation
vsim image_darkener_tb -g DARKENER_CONSTANT=20
add wave -position insertpoint sim:/image_darkener_tb/clk
add wave -position end sim:/image_darkener_tb/reset
#    -- Avalon-ST (input)
add wave -color red -position end sim:/image_darkener_tb/ast_in_valid
add wave -color red -radix unsigned -position end sim:/image_darkener_tb/ast_in_data
add wave -color red -position end sim:/image_darkener_tb/ast_out_ready
 
#        -- Avalon-ST (output)
add wave -color blue -position end sim:/image_darkener_tb/ast_out_valid 
add wave -color blue -radix unsigned -position end sim:/image_darkener_tb/ast_out_data 
add wave -color blue -position end sim:/image_darkener_tb/ast_in_ready
run -all
quit
