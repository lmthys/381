library IEEE;
use IEEE.std_logic_1164.all;

entity einstein is

  port(iCLK             : in std_logic;
       iM 		            : in integer;
       oE 		            : out integer);

end einstein;
architecture structure of einstein is
  
  -- Describe the component entities as defined in Adder.vhd 
  -- and Multiplier.vhd (not strictly necessary).
  component Adder
    port(iCLK           : in std_logic;
         iA             : in integer;
         iB             : in integer;
         oC             : out integer);
  end component;

  component Multiplier
    port(iCLK           : in std_logic;
         iA             : in integer;
         iB             : in integer;
         oC             : out integer);
  end component;

  -- Arbitrary constants for the e value. No need to change these.
  constant cC : integer := 9487;

  -- Signals to store C*c
  signal sVALUE_Cc : integer;
  

begin

---------------------------------------------------------------------------
  -- Level 1: Calculate c * c
  ---------------------------------------------------------------------------
  g_Mult1: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => cC,
             iB               => cC,
             oC               => sVALUE_Cc);

 ---------------------------------------------------------------------------
  -- Level 2: Calculate c^2 * m
  ---------------------------------------------------------------------------
  g_Mult2: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => sVALUE_Cc,
             iB               => iM,
             oC               => oE);


end structure;  