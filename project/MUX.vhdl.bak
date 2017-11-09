library IEEE;
use IEEE.std_logic_1164.ALL;


entity MUX is
	port(
		VAR, NVAR : in std_logic_vector(15 downto 0);
		SEL : in std_logic;
		MUX_OUT : out std_logic_vector(15 downto 0)
	);
end MUX;

architecture TwoTo1 of MUX is

begin	
	with SEL select MUX_OUT <=
		 VAR when '0' ,
		 NVAR when '1' ,
		 "0000000000000000" when others;

end TwoTo1;
		
	