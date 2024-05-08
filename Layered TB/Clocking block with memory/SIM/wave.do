onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mem_top/dut/clk
add wave -noupdate /mem_top/dut/rst
add wave -noupdate /mem_top/dut/wr_enb
add wave -noupdate /mem_top/dut/wr_addr
add wave -noupdate /mem_top/dut/wr_data
add wave -noupdate /mem_top/dut/ram
add wave -noupdate /mem_top/dut/rd_enb
add wave -noupdate /mem_top/dut/rd_addr
add wave -noupdate /mem_top/dut/rd_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
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
WaveRestoreZoom {0 ns} {95 ns}
