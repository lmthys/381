-- full adder (1-bit)

library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity scp is
	port (	i_CLK : in std_logic;     -- Clock input
       		i_RST : in std_logic;     -- Reset input
       		i_WE  : in std_logic;     -- Write enable input
      		o_Q    : out std_logic_vector(63 downto 0));   -- Data value output


end scp;


architecture dataflow of scp is

    component PC_reg is
	port(	CLK : in std_logic;
  		reset : in std_logic;
  		i_next_PC : in std_logic_vector(31 downto 0);
  	   	o_PC : out std_logic_vector(31 downto 0));
    end component;
    component imem is 
	generic(depth_exp_of_2 	: integer := 10;
			mif_filename 	: string := "imem.mif");
	port   	(address			: IN STD_LOGIC_VECTOR (depth_exp_of_2-1 DOWNTO 0) := (OTHERS => '0');
			byteena			: IN STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '1');
			clock			: IN STD_LOGIC := '1';
			data			: IN STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
			wren			: IN STD_LOGIC := '0';
			q				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));         
    end component;
    component main_control is 
	port( i_instruction : in std_logic_vector(31 downto 0);
  	    o_reg_dest : out std_logic;
  	    o_jump : out std_logic;
  	    o_branch : out std_logic;
  	    o_mem_to_reg : out std_logic;
  	    o_ALU_op : out std_logic_vector(3 downto 0);
  	    o_mem_write : out std_logic;
  	    o_ALU_src : out std_logic;
  	    o_reg_write : out std_logic
  	    );
    end component; 
    component adder_32 is 
  	port( i_A, i_B : in std_logic_vector(31 downto 0);
  	    o_F : out std_logic_vector(31 downto 0));
    end component;
    component register_file is 
  	port(CLK            : in  std_logic;
       	     rs_sel         : in  std_logic_vector(4 downto 0); -- first read address    
       	     rt_sel         : in  std_logic_vector(4 downto 0); -- second read address
             w_data         : in  std_logic_vector(31 downto 0); -- write data
             w_sel          : in  std_logic_vector(4 downto 0); -- write address
             w_en           : in  std_logic; -- write enable
             reset          : in  std_logic; -- resets all registers to 0
             rs_data        : out std_logic_vector(31 downto 0); -- first read data
             rt_data        : out std_logic_vector(31 downto 0)); -- second read data
    end component;
    component sign_extender_16_32 is 
      port(i_to_extend : in std_logic_vector(15 downto 0);
  	   o_extended : out std_logic_vector(31 downto 0));

    end component;
    component ALU is 
     port(ALU_OP        : in  std_logic_vector(3 downto 0);
       shamt         : in  std_logic_vector(4 downto 0);
       i_A           : in  std_logic_vector(31 downto 0);
       i_B           : in  std_logic_vector(31 downto 0);
       zero          : out std_logic;
       ALU_out       : out std_logic_vector(31 downto 0));


    end component;
    component dmem is 
	generic(depth_exp_of_2 	: integer := 10;
			mif_filename 	: string := "dmem.mif");
	port   (address			: IN STD_LOGIC_VECTOR (depth_exp_of_2-1 DOWNTO 0) := (OTHERS => '0');
			byteena			: IN STD_LOGIC_VECTOR (3 DOWNTO 0) := (OTHERS => '1');
			clock			: IN STD_LOGIC := '1';
			data			: IN STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
			wren			: IN STD_LOGIC := '0';
			q				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));     

    end component;
    component mux21_32bit is
  	port( i_0, i_1 : in std_logic_vector(31 downto 0);
  		i_sel : in std_logic;
  	        o_mux : out std_logic_vector(31 downto 0));
    end component;
     component mux21_5bit is
  	port( i_0, i_1 : in std_logic_vector(31 downto 0);
  		i_sel : in std_logic;
  	        o_mux : out std_logic_vector(31 downto 0));
    end component;
    component sll_2 is
  	port( i_to_shift : in std_logic_vector(31 downto 0);
  	    o_shifted : out std_logic_vector(31 downto 0));
    end component; 
    component and_2 is
  	port( i_A, i_B : in std_logic;
  	      o_F : out std_logic);
    end component;


   -- Signals to store C*c
   signal MuxOut0 : std_logic_vector(31 downto 0);
   signal MuxOut1: std_logic_vector(4 downto 0);
   signal MuxOut2: std_logic_vector(31 downto 0);
   signal MuxOut3: std_logic_vector(31 downto 0);
   signal MuxOut4: std_logic_vector(31 downto 0);
   signal extended: std_logic_vector(31 downto 0);
   signal shifted: std_logic_vector(31 downto 0);
   signal shifted2: std_logic_vector(31 downto 0);
   signal PC_out : std_logic_vector (31 downto 0);
   signal PC_4 : std_logic_vector (31 downto 0);
   signal rDataO1 : std_logic_vector (31 downto 0);
   signal rDataO2 : std_logic_vector (31 downto 0);
   signal imem_Out : std_logic_vector (31 downto 0);
   signal dmem_Out : std_logic_vector (31 downto 0);
   signal alu_Out : std_logic_vector (31 downto 0);
   signal alu_adder_Out : std_logic_vector (31 downto 0);
   signal sO_reg_dest : std_logic;
   signal sO_jump  : std_logic;      
   signal sO_branch  : std_logic;
   signal sO_mem_to_reg : std_logic;
   signal sO_ALU_op : std_logic_vector(3 downto 0);
   signal sO_mem_write : std_logic;
   signal sO_ALU_src  : std_logic;
   signal sO_reg_write : std_logic; 
   signal alu_zero_out : std_logic;  
   signal alu_adder_zero_out : std_logic; 
   signal and_select : std_logic; 
   
  

begin
  ---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  pc: PC_reg
   port MAP( CLK		=> i_CLK, 
       	     reset		=> i_RST,
       	     i_next_PC		=> MuxOut0,
       	     o_PC		=> PC_out);      

------mux21_5bit---------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  IMem1: imem
   port MAP( address		=> PC_out(11 downto 2), 
       	     byteena		=> "111",
       	     clock		=> i_CLK,
       	     data		=> x"0000000000000000", 
       	     wren		=> '0',
	     q                  => imem_Out);       
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  control: main_control
   port MAP(i_instruction  => imem_Out,
  	    o_reg_dest     => sO_reg_dest,
  	    o_jump         => sO_jump,
  	    o_branch       => sO_branch,
  	    o_mem_to_reg   => sO_mem_to_reg,
  	    o_ALU_op       => sO_ALU_op,
  	    o_mem_write    => sO_mem_write,
  	    o_ALU_src      => sO_ALU_src,
  	    o_reg_write    => sO_reg_write);
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 g_Adder: adder_32
   port MAP(	i_A           => PC_out,
		i_B           => "00000000000000000000000000000100",
		o_F           => PC_4);
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 mux1: mux21_5bit
   port MAP(	i_0           => PC_out(20 downto 16),
		i_1           => PC_out(15 downto 11),
		i_sel         => sO_reg_dest,
		o_mux         => MuxOut1);  
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 g_Reg: reg
   port MAP( CLK		=> i_CLK, 
       	     rs_sel		=> PC_out(25 downto 21),
       	     rt_sel		=> PC_out(20 downto 16),
       	     w_data		=> MuxOut2, 
       	     w_sel		=> MuxOut1,
	     w_en               => sO_reg_write,
	     reset              => i_RST, 
             rs_data            => rDataO1,
             rt_data            => rDataO2); 
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  --------------------------------------------------------------------------- 
  sign_extend: sign_extender_16_32
   port MAP(	i_to_extend   => PC_out(15 downto 0),
  		o_extended    => extended); 
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 mux3: mux21_32bit
   port MAP(	i_0           => rDataO2,
		i_1           => extended,
		i_sel         => sO_ALU_src,
		o_mux         => MuxOut3);  
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 alus: ALU
    port MAP( ALU_OP	=> sO_ALU_op,
	      shamt     => sO_ALU_op,
              i_A       => rDataO1,
              i_B       => MuxOut3,
              zero      => alu_zero_out,
              ALU_out   => alu_Out);
--------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  dmems: dmem
   port MAP( address		=> alu_Out(11 downto 2), 
       	     byteena		=> "111",
       	     clock		=> i_CLK,
       	     data		=> rDataO2, 
       	     wren		=> sO_mem_write,
	     q                  => dmem_Out);    
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 mux2: mux21_32bit
   port MAP(	i_0           => alu_Out,
		i_1           => dmem_Out,
		i_sel         => sO_mem_to_reg,
		o_mux         => MuxOut2);  
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 shift: sll_2
   port MAP(	i_to_shift           => PC_out,
		o_shifted            => shifted);  
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 shift2: sll_2
   port MAP(	i_to_shift           => extended,
		o_shifted            => shifted2);  
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 aluAdder: ALU
    port MAP( ALU_OP	=> "0001",
	      shamt     => "00000",
              i_A       => PC_4,
              i_B       => shifted2,
              zero      => alu_adder_zero_out,
              ALU_out   => alu_adder_Out);
--------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 ander: and_2
   port MAP(	i_A           => sO_branch,
		i_B           => alu_zero_out,
		o_F           => and_select);
--------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 mux4: mux21_32bit
   port MAP(	i_0           => PC_4,
		i_1           => alu_adder_Out,
		i_sel         => and_select,
		o_mux         => MuxOut4);  
--------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 mux0: mux21_32bit
   port MAP(	i_0           => MuxOut4,
		i_1           => shifted,
		i_sel         => sO_jump,
		o_mux         => MuxOut0);  

end dataflow;