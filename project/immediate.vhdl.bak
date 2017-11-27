library ieee;
use ieee.std_logic_1164.all;

entity immediate is
	port(immed: in std_logic_vector(6 downto 0);
		 extend: in std_logic_vector(1 downto 0);
		 immedEx: out std_logic_vector(15 downto 0));
end immediate;

architecture arch of immediate is
-- extend is used as a flag to determine how the immediate should be extended, and the rest of the commented out logic code was already provided but completely defunct assuming one actually implements extend flag in the CU, as the project would suggest that we do, and in fact, an implementation within the CU without removing the commented out logic would lead to redundancy at best and incorrect extension at worst. The other option was to remove the extend flag entirely, and simply use the if else logic on the leftmost bit of the immediate. I opted to keep extend flag in CU as it is documented within example datapaths, and as such have removed the if then logic.
--extend has been reverted
begin
	process(immed, extend)
	begin
		if(extend = "00") then
			immedEx <= "000000000" & immed;
		elsif(extend = "10") then
			immedEx <= immed & "000000000";
		else
			if(immed(6) = '0') then
				immedEx <= "000000000" & immed;
			else
				immedEx <= "111111111" & immed;
			end if;
		end if;
	end process;
end arch;