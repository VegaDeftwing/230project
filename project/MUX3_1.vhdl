library IEEE;
use IEEE.std_logic_1164.ALL;


entity MUX3_1 is
	port(
		PushIn, SwitchIn, GPIOIn: in std_logic_vector(15 downto 0);
		SEL : in std_logic_vector(3 downto 0);
		MUX_OUT : out std_logic_vector(15 downto 0)
	);
end MUX3_1;

architecture ThreeTo1 of MUX3_1 is
--very simple 2 to 1 mux, used in ALU for choosing whether to add or subtract 
begin	
	with SEL select MUX_OUT <=
		 PushIn when "0100" ,
		 SwitchIn when "1000" ,
		 GPIOIn when "1110",
		 "0000000000000000" when others;

end ThreeTo1;
		
	