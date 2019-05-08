onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /projecta/reset
add wave -noupdate /projecta/clock
add wave -noupdate /projecta/four
add wave -noupdate /projecta/ALU_out
add wave -noupdate -radix binary /projecta/concat
add wave -noupdate /projecta/o_F
add wave -noupdate /projecta/o_PC
add wave -noupdate /projecta/o_shifted
add wave -noupdate /projecta/q
add wave -noupdate -divider dmem
add wave -noupdate /projecta/b2v_dmemory/address
add wave -noupdate /projecta/b2v_dmemory/byteena
add wave -noupdate /projecta/b2v_dmemory/clock
add wave -noupdate /projecta/b2v_dmemory/data
add wave -noupdate /projecta/b2v_dmemory/wren
add wave -noupdate /projecta/b2v_dmemory/q
add wave -noupdate /projecta/b2v_dmemory/data_mask
add wave -noupdate /projecta/b2v_dmemory/write_data
add wave -noupdate -expand /projecta/b2v_dmemory/mem
add wave -noupdate -divider imem
add wave -noupdate /projecta/b2v_imemory/address
add wave -noupdate /projecta/b2v_imemory/byteena
add wave -noupdate /projecta/b2v_imemory/clock
add wave -noupdate /projecta/b2v_imemory/data
add wave -noupdate /projecta/b2v_imemory/wren
add wave -noupdate /projecta/b2v_imemory/q
add wave -noupdate /projecta/b2v_imemory/data_mask
add wave -noupdate /projecta/b2v_imemory/write_data
add wave -noupdate -divider registers
add wave -noupdate /projecta/b2v_registerFile/CLK
add wave -noupdate /projecta/b2v_registerFile/rs_sel
add wave -noupdate /projecta/b2v_registerFile/rt_sel
add wave -noupdate /projecta/b2v_registerFile/w_data
add wave -noupdate /projecta/b2v_registerFile/w_sel
add wave -noupdate /projecta/b2v_registerFile/w_en
add wave -noupdate /projecta/b2v_registerFile/reset
add wave -noupdate /projecta/b2v_registerFile/rs_data
add wave -noupdate /projecta/b2v_registerFile/rt_data
add wave -noupdate /projecta/b2v_registerFile/registers
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {701 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 245
configure wave -valuecolwidth 238
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
WaveRestoreZoom {0 ns} {906 ns}
