library ieee;
use ieee.std_logic_1164.all;

entity IR is
	PORT(
		IRin :IN std_logic_vector(23 downto 0);
		reset, Clock, enable	:IN std_logic;
		Instruction :OUT std_logic_vector(23 downto 0)
	);
end IR;

architecture arch of IR is
-- instruction register. Checks for enable bit, resets when reset flag is on, and otherwise updates instruction on rising clock edge
begin
PROCESS(Clock, reset)
	BEGIN
		IF(reset = '1') THEN	
			Instruction <= (OTHERS =>'0');
		ELSIF(rising_edge(Clock)) THEN
			IF(enable = '1') THEN
				Instruction <= IRin;
			END IF;
		END IF;
	END PROCESS;
end arch;