library IEEE;
use IEEE.std_logic_1164.ALL;


entity MUXC is
	PORT(
	c_select : in std_logic_vector(1 downto 0);
	Rin : in std_logic_vector(3 downto 0);
	Din : in std_logic_vector(3 downto 0);
	LiReg : in std_logic_vector(3 downto 0);
	muxCout : out std_logic_vector(3 downto 0)
	);
end MUXC;
--MUXY is the MUX that is used to determine proper DataD output, signaling the end of instructions which use RZ out from ALU, Memory Data from memory, or the Return Address
--y_select is the flag which comes from the CU to determine this.
architecture MUX of MUXC is
begin	
	with C_select select muxCout <=
		Rin	when "00" ,
		Din	when "01" ,
		"1111" when "10" ,
		LiReg when "11" ,
		 "0000" when others;

end MUX;
		
	