onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /quadratic/iCLK
add wave -noupdate /quadratic/iX
add wave -noupdate /quadratic/oY
add wave -noupdate /quadratic/sVALUE_Ax
add wave -noupdate /quadratic/sVALUE_Bx
add wave -noupdate /quadratic/sVALUE_Axx
add wave -noupdate /quadratic/sVALUE_BxpC
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {50 ns} {1050 ns}
