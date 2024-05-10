onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /apb_top/dut/pclk
add wave -noupdate /apb_top/dut/presetn
add wave -noupdate /apb_top/dut/psel
add wave -noupdate /apb_top/dut/penable
add wave -noupdate /apb_top/dut/pready
add wave -noupdate /apb_top/dut/pwrite
add wave -noupdate /apb_top/dut/paddr
add wave -noupdate /apb_top/dut/pwdata
add wave -noupdate /apb_top/dut/mem
add wave -noupdate /apb_top/dut/prdata
add wave -noupdate /apb_top/dut/pslverr
add wave -noupdate /apb_top/dut/state
add wave -noupdate /apb_top/dut/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {329 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 83
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
WaveRestoreZoom {0 ns} {1016 ns}
