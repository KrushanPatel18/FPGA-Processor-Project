# Clock constraint
create_clock -period 10 [get_ports clk] # 100 MHz clock

# Pin assignments for LEDs
set_property PACKAGE_PIN V17 [get_ports led[0]]
set_property IOSTANDARD LVCMOS33 [get_ports led[0]]

# Pin assignments for switches
set_property PACKAGE_PIN W16 [get_ports switch[0]]
set_property IOSTANDARD LVCMOS33 [get_ports switch[0]]

# Define I/O standards
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports input_signal]

# Timing constraints (adjust delays as needed)
set_input_delay -clock [get_clocks clk] 2 [get_ports input_signal]
set_output_delay -clock [get_clocks clk] 2 [get_ports output_signal]
