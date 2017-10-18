library IEEE;
use IEEE.std_logic_1164.ALL;


entity FA is
	port(
		A, B, Cin : in std_logic;
		S, Cout : out std_logic
	);
end FA;

architecture ADD of FA is

begin	
		S <= (A XOR B XOR Cin);
		Cout <= ((A AND B) OR (A AND Cin) OR (B AND Cin));
end ADD;
		
	