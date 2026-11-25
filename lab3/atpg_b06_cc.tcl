read_netlist ../pdt2002.v -format verilog -insensitive -library
read_netlist ../b06_scan.v -format verilog -insensitive
run_build_model b06
set_drc ../b06_scan.spf
add_cell_constraints OX 1 -position 4
run_drc
set_faults -model stuck
set_faults -summary verbose
set_faults -fault_coverage
add_faults -all
run_atpg -auto_compression
report_summaries
write_faults b06_cc_faults.txt -all -uncollapsed -replace
write_patterns b06_cc.stil -format stil -replace
quit
