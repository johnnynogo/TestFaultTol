read_netlist ../pdt2002.v -format verilog -insensitive -library
read_netlist ../b06_scan.v -format verilog -insensitive
run_build_model b06
set_drc ../b06_scan.spf

run_drc
report_scan_chains
report_scan_cells -all
report_nonscan_cells -summary
set_faults -model stuck
set_faults -summary verbose
set_faults -fault_coverage
add_faults -all
run_atpg -auto_compression
report_summaries
report_patterns -all
write_faults b06_atpg_faults.txt -all -uncollapsed -replace
write_patterns b06_atpg.stil -format stil -replace
quit
