set_messages -display
read_netlist -library ../pdt2002.v
read_netlist ../b10.v -format verilog -insensitive
run_build_model b10

run_drc ../b10.spf
set_faults -model stuck
set_faults -summary verbose
set_faults -fault_coverage
add_faults -all
run_atpg
report_summaries
set_atpg -full_seq_time 1
run_atpg full_sequential_only
report_summaries
write_faults b10_atpg_faults.txt -all -uncollapsed -replace 
write_patterns b10_atpg.stil -format stil -replace
quit
