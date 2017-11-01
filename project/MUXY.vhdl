library IEEE;
use IEEE.std_logic_1164.ALL;


entity MUXY is
	PORT(
	y_select : in std_logic_vector(1 downto 0);
	muxYin : in std_logic_vector(15 downto 0);
	memIn : in std_logic_vector(15 downto 0);
	ReturnA : in std_logic_vector(15 downto 0);
	muxYout : out std_logic_vector(15 downto 0)
	);
end MUXY;

architecture MUX of MUXY is
begin	
	with y-select select muxYout <=
		 muxyin when "00" ,
		 memIn when "01" ,
		 ReturnA when "10" ,
		 "0000000000000000" when others;

end MUX;
		
	