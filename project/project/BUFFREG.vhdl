LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY BUFFREG IS
	PORT(
		data									:IN std_logic_vector(15 downto 0);
		reset, Clock				:IN std_logic;
		output								:OUT std_logic_vector(15 downto 0)
	);
END BUFFREG;
--Simple buffer register, like a normal 16 bit register, but instead of needing an enable value, it simply buffers input and output values based on a clock
ARCHITECTURE BUFF OF BUFFREG IS
BEGIN
	PROCESS(Clock, reset)
	BEGIN
		IF(reset = '1') THEN	
			output <= (OTHERS =>'0');
		ELSIF(rising_edge(Clock)) THEN
				output <= data;
		END IF;
	END PROCESS;
END BUFF;