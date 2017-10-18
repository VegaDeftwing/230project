library IEEE;
use IEEE.std_logic_1164.ALL;


entity MUX4TO1 is
	port(
		alu_op : in std_logic_vector(1 downto 0);
		in1, in2, in3, in4 : in std_logic_vector(15 downto 0);
		ALU_out : out std_logic_vector(15 downto 0)
	);
end MUX4TO1;

architecture Four21 of MUX4TO1 is

begin	
	with alu_op select ALU_out <=
		 in1 when "00" ,
		 in2 when "01" ,
		 in3 when "10" ,
		 in4 when "11" ,
		 "0000000000000000" when others;

end Four21;
		
	