library IEEE;
use IEEE.std_logic_1164.ALL;


entity HEXTRANSLATOR is
	port(
		BinaryIn: in std_logic_vector(15 downto 0);
		HexOut : out std_logic_vector(6 downto 0)
	);
end HEXTRANSLATOR;
--This Component translates from binary input to Hex Display Output
architecture Translate of HEXTRANSLATOR is
Begin PROCESS(BinaryIn)
begin	
		IF(BinaryIn = "000000000000000")THEN
		 HexOut <= "0111111";
		ELSIF(BinaryIn = "000000000000001")THEN
		 HexOut <= "0000110";
		ELSIF(BinaryIn = "000000000000010")THEN
		 HexOut <= "1011011";
		ELSIF(BinaryIn = "000000000000011")THEN
		 HexOut <= "1001111";
		ELSIF(BinaryIn = "000000000000100")THEN
		 HexOut <= "1100110";
		ELSIF(BinaryIn = "000000000000101")THEN
		 HexOut <= "1101101";
		ELSIF(BinaryIn = "000000000000110")THEN
		 HexOut <= "1111101";
		ELSIF(BinaryIn = "000000000000111")THEN
		 HexOut <= "0000111";
		ELSIF(BinaryIn = "000000000001000")THEN
		 HexOut <= "1111111";
		ELSIF(BinaryIn = "000000000001001")THEN
		 HexOut <= "1100111";
		ELSIF(BinaryIn = "000000000001010")THEN
		 HexOut <= "1110111";
		ELSIF(BinaryIn = "000000000001011")THEN
		 HexOut <= "1111100";
		ELSIF(BinaryIn = "000000000001100")THEN
		 HexOut <= "0111001";
		ELSIF(BinaryIn = "000000000001101")THEN
		 HexOut <= "1011110";
		ELSIF(BinaryIn = "000000000001110")THEN
		 HexOut <= "1111001";
		ELSIF(BinaryIn = "000000000001111")THEN
		 HexOut <= "1110001";
		ELSE 
		 HexOut <= "1000111";
		END IF;
END PROCESS;
end Translate;
		
	