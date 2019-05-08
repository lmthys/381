--
-- Ones' complimenter implementation with generic feature
-- . by default, this will generate a 32-bit ones complimenter 
-- . you can set N to any integer
--
library IEEE;
use IEEE.std_logic_1164.all;

entity ones_comp_generic is
  generic(N : integer := 32); -- 32 is the default value
  port (i_A : in  std_logic_vector(N-1 downto 0);
        o_F : out std_logic_vector(N-1 downto 0));
end ones_comp_generic;

architecture dataflow of ones_comp_generic is
begin
  o_F <= NOT i_A;
end dataflow;