-- full adder (1-bit)

library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity mux_2 is
	port (	i_A : in std_logic_vector(31 downto 0);
		i_B : in std_logic_vector(31 downto 0);
		i_sel : in std_logic;
		o_Mux : out std_logic_vector(31 downto 0));	
end mux_2;

architecture dataflow of mux_2 is

begin 
with i_sel select
	o_Mux <= i_A when '1',
		 i_B when '0',
		 (others => '0') when others;

end dataflow;







	
	
