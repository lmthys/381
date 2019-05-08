library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity Compliment is

  port(iCLK             : in std_logic;
       iA               : in std_logic_vector(0 to 7);
       oC               : out std_logic_vector(0 to 7));

end Compliment;

architecture dataflow of Compliment is

begin

  oC <= NOT (iA);
  
end dataflow;