set_messages -display
read_netlist -library ../pdt2002.v
read_netlist ../c6288.vhd -format vhdl -insensitive
run_build_model c6288
add_po_masks datao(1)
run_drc ../c6288.stil
set_patterns -external ../c6288.stil 
run_simulation
set_faults -model stuck
add_faults -all
run_fault_sim
report_summaries
write_faults c6288_fsim_faults.txt -all -uncollapsed -replace 
quit
