library IEEE;
use IEEE.std_logic_1164.ALL;


entity MUXmem is
	PORT(
	mem_select : in std_logic;
	MemData : in std_logic_vector(15 downto 0);
	IOMemData: in std_logic_vector(15 downto 0);
	MuxMemOut : out std_logic_vector(15 downto 0)
	);
end MUXmem;
--chooses whether to use RZ input or Address from IAG, outputs address
architecture MUX of MUXmem is
begin	
	with mem_select select MuxMemOut <=
		 MemData when '0' ,
		 IOMemData when '1' ,
		 "0000000000000000" when others;

end MUX;
		
	