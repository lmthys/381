// Copyright (C) 2016  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Standard Edition"
// CREATED		"Thu Oct 26 15:57:17 2017"

module projectA(
	reset,
	clock,
	wren,
	Instruction
);


input wire	reset;
input wire	clock;
input wire	wren;
input wire	[31:0] Instruction;

wire	[31:0] ALU_out;
wire	[31:0] concat;
wire	[31:0] o_PC;
wire	[31:0] o_shifted;
wire	[31:0] q;
wire	[0:4] SYNTHESIZED_WIRE_30;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[4:0] SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_18;
wire	[0:3] SYNTHESIZED_WIRE_19;
wire	[0:31] SYNTHESIZED_WIRE_20;
wire	[4:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	[0:3] SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	[0:3] SYNTHESIZED_WIRE_28;
wire	[31:0] SYNTHESIZED_WIRE_29;

assign	SYNTHESIZED_WIRE_30 = 0;
assign	SYNTHESIZED_WIRE_19 = 0;
assign	SYNTHESIZED_WIRE_20 = 0;
assign	SYNTHESIZED_WIRE_23 = 1;
assign	SYNTHESIZED_WIRE_28 = 1;




ALU	b2v_inst(
	.ALU_OP(SYNTHESIZED_WIRE_30[3:0]),
	.i_A(ALU_out),
	.i_B(SYNTHESIZED_WIRE_1),
	.shamt(SYNTHESIZED_WIRE_30),
	
	.ALU_out(SYNTHESIZED_WIRE_11));


ALU	b2v_inst1(
	.ALU_OP(SYNTHESIZED_WIRE_3),
	.i_A(SYNTHESIZED_WIRE_4),
	.i_B(SYNTHESIZED_WIRE_5),
	.shamt(q[10:6]),
	.zero(SYNTHESIZED_WIRE_9),
	.ALU_out(ALU_out));


sll_2	b2v_inst10(
	.i_to_shift(q),
	.o_shifted(o_shifted));


mux21_32bit	b2v_inst11(
	.i_sel(SYNTHESIZED_WIRE_6),
	.i_0(SYNTHESIZED_WIRE_7),
	.i_1(concat),
	.o_mux(SYNTHESIZED_WIRE_29));

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_8 & SYNTHESIZED_WIRE_9;


mux21_32bit	b2v_inst14(
	.i_sel(SYNTHESIZED_WIRE_10),
	.i_0(ALU_out),
	.i_1(SYNTHESIZED_WIRE_11),
	.o_mux(SYNTHESIZED_WIRE_7));

assign	concat[28:0] = o_shifted[28:0];



register_file	b2v_inst16(
	.CLK(clock),
	.w_en(SYNTHESIZED_WIRE_12),
	.reset(reset),
	.rs_sel(q[15:11]),
	.rt_sel(q[20:16]),
	.w_data(SYNTHESIZED_WIRE_13),
	.w_sel(SYNTHESIZED_WIRE_14),
	.rs_data(SYNTHESIZED_WIRE_4),
	.rt_data(SYNTHESIZED_WIRE_31));


mux21_32bit	b2v_inst17(
	.i_sel(SYNTHESIZED_WIRE_15),
	.i_0(SYNTHESIZED_WIRE_31),
	.i_1(SYNTHESIZED_WIRE_32),
	.o_mux(SYNTHESIZED_WIRE_5));


mux21_5bit	b2v_inst18(
	.i_sel(SYNTHESIZED_WIRE_18),
	.i_0(q[20:16]),
	.i_1(q[15:11]),
	.o_mux(SYNTHESIZED_WIRE_14));

assign	concat[31:28] = ALU_out[31:28];



ALU	b2v_inst2(
	.ALU_OP(SYNTHESIZED_WIRE_19),
	.i_A(q),
	.i_B(SYNTHESIZED_WIRE_20),
	.shamt(SYNTHESIZED_WIRE_21),
	
	.ALU_out(ALU_out));


dmem	b2v_inst20(
	.clock(clock),
	.wren(SYNTHESIZED_WIRE_22),
	.address(ALU_out[11:2]),
	.byteena(SYNTHESIZED_WIRE_23),
	.data(SYNTHESIZED_WIRE_31),
	.q(SYNTHESIZED_WIRE_26));
	defparam	b2v_inst20.depth_exp_of_2 = 10;
	defparam	b2v_inst20.mif_filename = "dmem.mif";


mux21_32bit	b2v_inst21(
	.i_sel(SYNTHESIZED_WIRE_25),
	.i_0(ALU_out),
	.i_1(SYNTHESIZED_WIRE_26),
	.o_mux(SYNTHESIZED_WIRE_13));


sign_extender_16_32	b2v_inst22(
	.i_to_extend(q[15:0]),
	.o_extended(SYNTHESIZED_WIRE_32));



sll_2	b2v_inst24(
	.i_to_shift(SYNTHESIZED_WIRE_32),
	.o_shifted(SYNTHESIZED_WIRE_1));


imem	b2v_inst25(
	.clock(clock),
	.wren(wren),
	.address(o_PC[11:2]),
	.byteena(SYNTHESIZED_WIRE_28),
	.data(Instruction),
	.q(q));
	defparam	b2v_inst25.depth_exp_of_2 = 10;
	defparam	b2v_inst25.mif_filename = "imem.mif";




main_control	b2v_inst5(
	.i_instruction(q),
	.o_reg_dest(SYNTHESIZED_WIRE_18),
	.o_jump(SYNTHESIZED_WIRE_6),
	.o_branch(SYNTHESIZED_WIRE_8),
	.o_mem_to_reg(SYNTHESIZED_WIRE_25),
	.o_mem_write(SYNTHESIZED_WIRE_22),
	.o_ALU_src(SYNTHESIZED_WIRE_15),
	.o_reg_write(SYNTHESIZED_WIRE_12),
	.o_ALU_op(SYNTHESIZED_WIRE_3));


PC_reg	b2v_inst6(
	.CLK(clock),
	.reset(reset),
	.i_next_PC(SYNTHESIZED_WIRE_29),
	.o_PC(o_PC));



lpm_constant_0	b2v_inst8(
	.result(SYNTHESIZED_WIRE_21));



endmodule

module lpm_constant_0(result);
/* synthesis black_box */

output [4:0] result;

endmodule
