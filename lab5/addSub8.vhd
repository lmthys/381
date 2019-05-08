-- full adder (1-bit)

library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity addSub is
	port (	i_Aa : in std_logic_vector(0 to 7);
		i_Bb : in std_logic_vector(0 to 7);
		i_control : in std_logic;
		o_Sum : out std_logic_vector(0 to 7);
		o_Carry_out : out std_logic);	
end addSub;


architecture dataflow of addSub is

    component full_adder3 is
	port (	i_As : in std_logic_vector(0 to 7);
		i_Bs : in std_logic_vector(0 to 7);
		i_Carry_ins : in std_logic;
		o_Sums : out std_logic_vector(0 to 7);
		o_Carry_outs : out std_logic);	
     end component;
     
     component mux_2 is
        port (	i_A : in std_logic_vector(0 to 7);
		i_B : in std_logic_vector(0 to 7);
		i_sel : in std_logic;
		o_Mux : out std_logic_vector(0 to 7)); 
     end component;
     
     component Compliment is 
       port(iCLK             : in std_logic;
       iA               : in std_logic_vector(0 to 7);
       oC               : out std_logic_vector(0 to 7));
     end component;

   -- Signals to store C*c
   signal sVALUE_MB : std_logic_vector(0 to 7);
   signal sVALUE_OM : std_logic_vector(0 to 7);

begin

  ---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  g_1Comp: Compliment
   port MAP(	iCLK         => '1',
		iA           => i_Bb,
		oC           => sVALUE_MB);

---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  g_Mul: mux_2
   port MAP(	i_A           => sVALUE_MB,
		i_B           => i_Bb,
		i_sel         => i_control,
		o_Mux         => sVALUE_OM);
---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  g_Adder3: full_adder3
   port MAP(	i_As           => i_Aa,
		i_Bs           => sVALUE_OM,
		i_Carry_ins    => i_control,
		o_Sums         => o_Sum,
		o_Carry_outs   => o_Carry_out);




end dataflow;








	
	
 