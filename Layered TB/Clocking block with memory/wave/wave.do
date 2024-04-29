onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/clk
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/rd_addr
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/rd_data
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/rd_enb
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/rst
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/wr_addr
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/wr_data
add wave -noupdate -expand -label sim:/mem_top/dut/Group1 -group {Region: sim:/mem_top/dut} /mem_top/dut/wr_enb
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/clk
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/rd_addr
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/rd_data
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/rd_enb
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/rst
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/wr_addr
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/wr_data
add wave -noupdate -expand -label sim:/mem_top/intf/Group1 -group {Region: sim:/mem_top/intf} /mem_top/intf/wr_enb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {58 ns}
