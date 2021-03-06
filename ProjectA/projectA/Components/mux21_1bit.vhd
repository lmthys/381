library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity forward is
  port( mem_wb_regwrite, ex_mem_regwrite : in std_logic;
  	ex_mem_regRd, ex_mem_regRs, id_ex_regRs, id_ex_regRt : in std_logic;
        forwardA, forwardB : out std_logic_vector(1 downto 0));
 end forward;

architecture mixed of forward is 

begin


fwdUP process ()
if(mem_wb_regwrite and (mem_wb_regwrite != 0) and (mem_wb_regwrite = id_ex_regRs)) then 
	forwardA <= "01";

elsif(ex_mem_regwrite and (ex_mem_regRd != 0) and (ex_mem_regRd = id_ex_regRs)) then 
	forwardA <= "10";

else
	forwardA = "00";-- no fwd
end if;

end fwdUP;

fwdDOWM process ()
if(mem_wb_regwrite and (mem_wb_regwrite != 0) and (mem_wb_regwrite = id_ex_regRt)) then 
	forwardB <= "01";
elsif(ex_mem_regwrite and (ex_mem_regRd != 0) and (ex_mem_regRd = id_ex_regRt)) then 
	forwardB <= "10";
else
	forwardB = "00";-- no fwd

end fwdDOWN;


end mixed;