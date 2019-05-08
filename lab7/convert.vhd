-- full adder (1-bit)

library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity convert is
	port (	i_A : in std_logic_vector(31 downto 0);
		 o : out std_logic_vector(9 downto 0));	
end convert;

architecture dataflow of convert is

begin 
	o <= i_A(11 downto 2);
		 

end dataflow;

