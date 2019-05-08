-- full adder (1-bit)

library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity full_adder3 is
	port (	i_As : in std_logic_vector(7 downto 0);
		i_Bs : in std_logic_vector(7 downto 0);
		i_Carry_ins : in std_logic;
		o_Sums : out std_logic_vector(7 downto 0);
		o_Carry_outs : out std_logic);	
end full_adder3;


architecture dataflow of full_adder3 is

    component full_adder is
	port (	i_A : in std_logic;
		i_B : in std_logic;
		i_Carry_in : in std_logic;
		o_Sum : out std_logic;
		o_Carry_out : out std_logic);	
     end component;
   -- Signals to store C*c
   signal sVALUE_CO0 : std_logic_vector (8 downto 0);
  

begin
	sVALUE_CO0(0) <= i_Carry_ins;
	
	Adder8:
	for i in 0 to 7 generate
		FAx: full_adder PORT MAP(
		i_A			=> i_As(i),
		i_B			=> i_Bs(i),
		i_Carry_in		=> sVALUE_CO0(i),
		o_Sum		=> o_Sums(i),
		o_Carry_out => sVALUE_CO0(i+1));
	end generate;
	
	o_Carry_outs <= sVALUE_CO0(8);

end dataflow;








	
	
