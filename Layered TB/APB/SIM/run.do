vlib work
vlog ../RTL/apb.v ../TEST/apb_pkg.sv ../TOP/apb_top.sv +incdir+../ENV +incdir+../TEST
vsim -novopt apb_top -suppress 12110
do wave.do
run -all
