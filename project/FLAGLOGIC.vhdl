library IEEE;
use IEEE.std_logic_1164.ALL;


entity FLAGLOGIC is
	port(
		C14, C15 : in std_logic;
		S : in std_logic_vector(15 downto 0);
		N, C, Z, V : out std_logic
	);
end FLAGLOGIC;

architecture LOGIC of FLAGLOGIC is
-- used in ALU to determine flags
begin	
		N <= S(15);
		C <= C15;
		with S select Z <=
		 '1' when "0000000000000000",
		 '0' when others;
		V <= C14 XOR C15;
end LOGIC;
		
	