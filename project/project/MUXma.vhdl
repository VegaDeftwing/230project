library IEEE;
use IEEE.std_logic_1164.ALL;


entity MUXma is
	PORT(
	ma_select : in std_logic;
	RZin : in std_logic_vector(15 downto 0);
	IAGin: in std_logic_vector(15 downto 0);
	Address : out std_logic_vector(15 downto 0)
	);
end MUXma;
--chooses whether to use RZ input or Address from IAG, outputs address
architecture MUX of MUXma is
begin	
	with ma_select select Address <=
		 RZin when '0' ,
		 IAGin when '1' ,
		 "0000000000000000" when others;

end MUX;
		
	