
library IEEE;
use IEEE.std_logic_1164.all;

entity ones_comp_1bit is
  port (i_A : in  std_logic;
        o_F : out std_logic);
end ones_comp_1bit;

architecture dataflow of ones_comp_1bit is
begin
  -- NOT operator works for both std_logic and std_logic_vector
  o_F <= NOT i_A; 
end dataflow;