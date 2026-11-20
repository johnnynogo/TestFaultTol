set_messages -display
read_netlist -library ../pdt2002.v
read_netlist ../ex1_structural_tmax.vhd -format vhdl -insensitive
run_build_model ex1
run_drc ../ex1.stil
set_patterns -external ../ex1.stil
run_simulation
set_faults -model stuck
set_faults -summary verbose 
set_faults -fault_coverage
add_faults -all
run_fault_sim
report_summaries
write_faults ex1_fsim_faults.txt -all -uncollapsed -replace
report_commands -history
quit

