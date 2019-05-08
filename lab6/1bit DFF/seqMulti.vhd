-- full adder (1-bit)

library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity seq_multi is
	port (	i_As : in std_logic_vector(31 downto 0);
		i_Bs : in std_logic_vector(31 downto 0);
		i_CLK : in std_logic;     -- Clock input
       		i_RST : in std_logic;     -- Reset input
       		i_WE  : in std_logic;     -- Write enable input
      		o_Q    : out std_logic_vector(63 downto 0));   -- Data value output


end seq_multi;


architecture dataflow of seq_multi is

    component full_adder64 is
	port (	i_As : in std_logic_vector(63 downto 0);
		i_Bs : in std_logic_vector(63 downto 0);
		i_Carry_ins : in std_logic;
		o_Sums : out std_logic_vector(63 downto 0);
		o_Carry_outs : out std_logic);	
    end component;
    component multicand is 
	port(i_CLK        : in std_logic;     -- Clock input
       	     i_RST        : in std_logic;     -- Reset input
       	     i_WE         : in std_logic;     -- Write enable input
             i_D          : in std_logic_vector(31 downto 0);     -- Data value input
       	     o_Q          : out std_logic_vector(63 downto 0));   -- Data value output 
    end component;
    component multi is 
	port(i_CLK        : in std_logic;     -- Clock input
       	     i_RST        : in std_logic;     -- Reset input
       	     i_WE         : in std_logic;     -- Write enable input
       	     i_D          : in std_logic_vector(31 downto 0);     -- Data value input
       	     o_Q          : out std_logic_vector(31 downto 0));   -- Data value output
    end component; 
    component mux_2 is 
         port (	i_A : in std_logic_vector(0 to 63);
		i_B : in std_logic_vector(0 to 63);
		i_sel : in std_logic;
		o_Mux : out std_logic_vector(0 to 63));	
    end component;
    component reg is 
	 port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic_vector(63 downto 0);     -- Data value input
       o_Q          : out std_logic_vector(63 downto 0));   -- Data value output
    end component;


   -- Signals to store C*c
   signal sVALUE_MuxO : std_logic_vector (63 downto 0);
   signal sVALUE_MO  : std_logic_vector (31 downto 0);
   signal sVALUE_MCandO  : std_logic_vector (63 downto 0);
   signal sVALUE_RegO  : std_logic_vector (63 downto 0) := x"0000000000000000";
   signal sVALUE_AdderO  : std_logic_vector (63 downto 0);
   signal o_Carry_out : std_logic := '0';
   
  

begin
  ---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  mult1i: multi
   port MAP( i_CLK		=> i_CLK, 
       	     i_RST		=> i_RST,
       	     i_WE		=> i_WE,
       	     i_D		=> i_As, 
       	     o_Q		=> sVALUE_MO);      

---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  g_Mulcand: multicand
   port MAP( i_CLK		=> i_CLK, 
       	     i_RST		=> i_RST,
       	     i_WE		=> i_WE,
       	     i_D		=> i_Bs, 
       	     o_Q		=> sVALUE_MCandO);       
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  g_Mux: mux_2
   port MAP( i_A           => sVALUE_MCandO,
	     i_B           => x"0000000000000000",
	     i_sel         => sVALUE_MO(0),
	     o_Mux         => sVALUE_MuxO);
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 
  g_Adder3: full_adder64
   port MAP(	i_As           => sVALUE_MuxO,
		i_Bs           => sVALUE_RegO,
		i_Carry_ins    => o_Carry_out,
		o_Sums         => sVALUE_AdderO,
		o_Carry_outs   => o_Carry_out);
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
 g_Reg: reg
   port MAP( i_CLK		=> i_CLK, 
       	     i_RST		=> i_RST,
       	     i_WE		=> i_WE,
       	     i_D		=> sVALUE_AdderO, 
       	     o_Q		=> sVALUE_RegO); 
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  --------------------------------------------------------------------------- 

   o_Q <= sVALUE_RegO; 



end dataflow;