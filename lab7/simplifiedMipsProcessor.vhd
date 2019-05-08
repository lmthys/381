-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Standard Edition"
-- CREATED		"Mon Oct 23 10:58:51 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY simplifiedMipsProcessor IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		reg_dest :  IN  STD_LOGIC;
		sel_imm :  IN  STD_LOGIC;
		mem_we :  IN  STD_LOGIC;
		reg_we :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		ALU_op :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		imm :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rs_sel :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		rt_sel :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		shamt :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		w_addr :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ALU_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		dmem_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rs_data :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rt_data :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END simplifiedMipsProcessor;

ARCHITECTURE bdf_type OF simplifiedMipsProcessor IS 

COMPONENT alu
	PORT(ALU_OP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 i_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 shamt : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 zero : OUT STD_LOGIC;
		 ALU_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT convert
	PORT(i_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mem
GENERIC (depth_exp_of_2 : INTEGER;
			mif_filename : STRING
			);
	PORT(clock : IN STD_LOGIC;
		 wren : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 byteena : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux_2
	PORT(i_sel : IN STD_LOGIC;
		 i_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_Mux : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_file
GENERIC (N : INTEGER
			);
	PORT(CLK : IN STD_LOGIC;
		 w_en : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 rs_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rt_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 w_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 w_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rs_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rt_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	a :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ALU_out_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	c :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	d :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	f :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rt_dataO :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	s :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(0 TO 3);


BEGIN 
SYNTHESIZED_WIRE_0 <= "1111";



b2v_ALU1 : alu
PORT MAP(ALU_OP => ALU_op,
		 i_A => d,
		 i_B => f,
		 shamt => shamt,
		 ALU_out => ALU_out_ALTERA_SYNTHESIZED);


b2v_convert : convert
PORT MAP(i_A => ALU_out_ALTERA_SYNTHESIZED,
		 o => s);



b2v_mem1 : mem
GENERIC MAP(depth_exp_of_2 => 10,
			mif_filename => "dmem.mif"
			)
PORT MAP(clock => CLK,
		 wren => mem_we,
		 address => s,
		 byteena => SYNTHESIZED_WIRE_0,
		 data => rt_dataO,
		 q => a);


b2v_mux1 : mux_2
PORT MAP(i_sel => reg_dest,
		 i_A => a,
		 i_B => ALU_out_ALTERA_SYNTHESIZED,
		 o_Mux => c);


b2v_mux2 : mux_2
PORT MAP(i_sel => sel_imm,
		 i_A => rt_dataO,
		 i_B => imm,
		 o_Mux => f);


b2v_reg : register_file
GENERIC MAP(N => 32
			)
PORT MAP(CLK => CLK,
		 w_en => reg_we,
		 reset => reset,
		 rs_sel => rs_sel,
		 rt_sel => rt_sel,
		 w_data => c,
		 w_sel => w_addr,
		 rs_data => d,
		 rt_data => rt_dataO);

ALU_out <= ALU_out_ALTERA_SYNTHESIZED;
dmem_out <= a;
rs_data <= d;
rt_data <= rt_dataO;

END bdf_type;