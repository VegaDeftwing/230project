library IEEE;
use IEEE.std_logic_1164.ALL;


entity MUXB is
	PORT(
	b_select : in std_logic;
	immediateB : in std_logic_vector(15 downto 0);
	muxBin : in std_logic_vector(15 downto 0);
	muxBout : out std_logic_vector(15 downto 0)
	);
end MUXB;

architecture MUX of MUXB is
begin	
	with b_select select muxBout <=
		 muxBin when '0' ,
		 immediateB when '1' ,
		 "0000000000000000" when others;

end MUX;
		
	