--
-- Testbench (tb) for ones complimenter
-- TB is usedful to automate the testing process
-- You can set up multiple different test cases to throughly test your component.
-- Here, we call the module to test as MUT (module under test).
-- Note that, this TB generates clock which is not necessary to test ones complimenter. However, it will come handy when you need a clock.

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ones_comp is
  generic(gCLK_HPER : time := 50 ns; -- duration of half clock cycle
		  gN : integer := 8); -- global N
end tb_ones_comp;

architecture behavior of tb_ones_comp is

-- declare the modules to be used here
component ones_comp_generic is
  generic(N : integer := 32); -- 32 is the default value
  port (i_A : in  std_logic_vector(N-1 downto 0);
        o_F : out std_logic_vector(N-1 downto 0));
end component;

component ones_comp_ForGenerate is
  generic(N : integer := 32); -- 32 is the default value
  port (i_A : in  std_logic_vector(N-1 downto 0);
        o_F : out std_logic_vector(N-1 downto 0));
end component;

-- declare constants that never change!
constant cCLK_PER : time := gCLK_HPER * 2;

-- declare some internal signals for MUT
signal sIn, sOut1, sOut2 : std_logic_vector(gN-1 downto 0);
signal sCLK : std_logic;

begin
  -- Instantiate ones_comp modules and wire the signals for in and output
  -- Input will be shared (we want to test multiple modules which do the
  -- same thing!
  -- But, output will be separately checked to compare one with the other.
  MUT1 : ones_comp_generic
  generic map(N => gN) -- we can overwrite the N with the global N (gN)
  port map(i_A => sIn,
		   o_F => sOut1);

  MUT2 : ones_comp_ForGenerate
  generic map(N => gN) -- we can overwrite the N with the global N (gN)
  port map(i_A => sIn,
		   o_F => sOut2);
		   
  -- This process automatically generate clock signal
  -- In this example, however, clock is not needed
  p_clock: process 
  begin
    sCLK <= '0';
	wait for gCLK_HPER;
	sCLK <= '1';
	wait for gCLK_HPER;
  end process;
		   
  -- Below is the testbench which runs multiple test cases
  -- In general, it defines multiple test cases with different input values
  -- At the end of each clock cycle, we'll check the sOut signal
  -- to see if the mudule is outputting as we expected
  test_process: process
  begin
    -- NOTE: it is better to have more and more test cases!
	
    -- test case #1
    sIn <= "00000000";
	wait for cCLK_PER;
	
	-- test case #2	
	sIn <= "11111111";
	wait for cCLK_PER;
	
	-- test case #3
	sIn <= "11110000";
	wait for cCLK_PER;
	
	-- test case #4
	sIn <= "00001111";
	wait for cCLK_PER;
	
	-- test case #5
	sIn <= "11001100";
	wait for cCLK_PER;
	
	-- test case #6
	sIn <= "00110011";
	wait for cCLK_PER;
	
	-- test case #7
	sIn <= "10101010";
	wait for cCLK_PER;
	
	-- test case #8
	sIn <= "01010101";
	wait for cCLK_PER;
	
	-- no further cases
	wait; -- end of the case cases
  end process;
end behavior;