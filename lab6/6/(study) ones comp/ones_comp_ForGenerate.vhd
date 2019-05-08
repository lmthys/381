--
-- For-generate is pretty much like a for-loop that you can find
-- in most computer programming languages
-- 
library IEEE;
use IEEE.std_logic_1164.all;

entity ones_comp_ForGenerate is
  generic(N : integer := 32); -- 32 is the default value
  port (i_A : in  std_logic_vector(N-1 downto 0);
        o_F : out std_logic_vector(N-1 downto 0));
end ones_comp_ForGenerate;

architecture dataflow of ones_comp_ForGenerate is

component ones_comp_1bit is
  port (i_A : in  std_logic;
        o_F : out std_logic);
end component;

begin
  genLoop : for i in N-1 downto 0 generate
    inst_i: ones_comp_1bit 
	port map(i_A => i_A(i),
			 o_F => o_F(i));
  end generate genLoop;
end dataflow;