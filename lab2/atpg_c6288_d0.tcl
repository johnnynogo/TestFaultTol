set_messages -display
read_netlist -library ../pdt2002.v
read_netlist ../c6288.vhd -format vhdl -insensitive
run_build_model c6288
add_pi_constraints 0 datai(0)
report_pi_constraints
run_drc 
set_faults -model stuck
set_faults -summary verbose
set_faults -fault_coverage
add_faults -all
run_atpg -auto_compression
report_summaries
write_faults c6288_atpg_d0_faults.txt -all -uncollapsed -replace 
write_patterns c6288_d0_atpg.stil -format stil -replace
quit
