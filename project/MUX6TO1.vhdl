library IEEE;
use IEEE.std_logic_1164.ALL;

--This is the MUX for the main ALU. 
entity MUX6TO1 is
	port(
		alu_op : in std_logic_vector(2 downto 0);
		in1, in2, in3, in4, in5, in6 : in std_logic_vector(15 downto 0);
		ALU_out : out std_logic_vector(15 downto 0)
	);
end MUX6TO1;

architecture mux of MUX6TO1 is
-- chooses which ALU potential output to use, based on alu_op
begin	
	with alu_op select ALU_out <=
		 in1 when "000" ,
		 in2 when "001" ,
		 in3 when "010" ,
		 in4 when "011" ,
		 in5 when "100" ,
		 in6 when "101",
		 "0000000000000000" when others;

end mux;
		
	