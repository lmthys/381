library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity concatonate is
  port( highFourBits : in std_logic_vector(31 downto 0);
  	    low28Bits : in std_logic_vector(27 downto 0);
		concatonated : out std_logic_vector(31 downto 0));
 end concatonate;

architecture mixed of concatonate is 

begin

concatonated(31 downto 28) <= highFourBits(31 downto 28);
concatonated(27 downto 0) <= low28Bits(27 downto 0);

end mixed;