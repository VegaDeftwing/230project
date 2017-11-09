library ieee;
use ieee.std_logic_1164.all;

entity PS is
	PORT(
	N, C, V, Z : in std_logic;
	Clock, reset : in std_logic;
	enable: in std_logic; --Will simply be 1 for now
	Nout, Cout, Vout, Zout : out std_logic
	);
end PS;

architecture arch of PS is
-- stores flags. see processor.vhdl for better documentation
begin
PROCESS(Clock, reset)
	BEGIN
		IF(reset = '1') THEN	
			Nout <= '0';
			Cout <= '0';
			Vout <= '0';
			Zout <= '0';
		ELSIF(rising_edge(Clock)) THEN
			IF(enable = '1') THEN
				Nout <= N;
				Cout <= C;
				Vout <= V;
				Zout <= Z;
			END IF;
		END IF;
	END PROCESS;
end arch;