library IEEE;
use IEEE.std_logic_1164.ALL;


entity MUXA is
	PORT(
	a_select : in std_logic;
	RegA : in std_logic_vector(15 downto 0);
	BLABEL : in std_logic_vector(15 downto 0);
	muxAout : out std_logic_vector(15 downto 0)
	);
end MUXA;
--chooses whether to use immediate or registry value into ALU
architecture MUX of MUXA is
begin	
	with a_select select muxAout <=
		 RegA when '0' ,
		 BLABEL when '1' ,
		 "0000000000000000" when others;

end MUX;
		
	