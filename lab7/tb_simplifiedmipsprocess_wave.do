onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_simplifiedmipsprocessor/gCLK_HPER
add wave -noupdate /tb_simplifiedmipsprocessor/CLK
add wave -noupdate /tb_simplifiedmipsprocessor/reset
add wave -noupdate /tb_simplifiedmipsprocessor/reg_we
add wave -noupdate /tb_simplifiedmipsprocessor/reg_dest
add wave -noupdate /tb_simplifiedmipsprocessor/sel_imm
add wave -noupdate /tb_simplifiedmipsprocessor/mem_we
add wave -noupdate /tb_simplifiedmipsprocessor/rs_sel
add wave -noupdate /tb_simplifiedmipsprocessor/rt_sel
add wave -noupdate /tb_simplifiedmipsprocessor/w_addr
add wave -noupdate /tb_simplifiedmipsprocessor/shamt
add wave -noupdate /tb_simplifiedmipsprocessor/ALU_OP
add wave -noupdate /tb_simplifiedmipsprocessor/immediate
add wave -noupdate /tb_simplifiedmipsprocessor/rs_data
add wave -noupdate /tb_simplifiedmipsprocessor/rt_data
add wave -noupdate /tb_simplifiedmipsprocessor/ALU_out
add wave -noupdate -radix decimal /tb_simplifiedmipsprocessor/dmem_out
add wave -noupdate -radix decimal /tb_simplifiedmipsprocessor/cCLK_PER
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_A
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_B
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_C
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_D
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_E
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_F
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_G
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_H
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_I
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_J
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_K
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_L
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_M
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_N
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_O
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_P
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_Q
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_R
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_S
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_T
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_U
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_V
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_W
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_X
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_Y
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_Z
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_AA
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_AB
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_AC
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_AD
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_AE
add wave -noupdate -expand -group Registers /tb_simplifiedmipsprocessor/MySimplifiedMIPSProcess/mregister_file/i_AF
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 416
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {116990 ps} {163576 ps}
