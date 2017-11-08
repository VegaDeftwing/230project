library IEEE;
use IEEE.std_logic_1164.ALL;


entity FAST4BITADDER is
	port(
		 A : in std_logic_vector(3 downto 0);
       B : in std_logic_vector(3 downto 0);
		 CarryIn	: in std_logic;
       S : out std_logic_vector(3 downto 0);
		 CarryOut : out std_logic
	);
end FAST4BITADDER;


--si = xi ⊕ yi ⊕ ci
--ci+1 = xiyi + xici + yici
--ci+1 = xiyi + (xi + yi)ci
--ci+1 = Gi + Pici
--Gi = xiyi and Pi = xi + yi
--ci+1 = Gi + PiGi−1 + PiPi−1ci−1

architecture CarryLookAheadAdd of FAST4BITADDER is
signal halfsum : std_logic_vector(3 downto 0);
signal gen : std_logic_vector(3 downto 0);
signal prop : std_logic_vector(3 downto 0);
signal C : std_logic_vector(3 downto 0);	

begin	

	 halfsum <= A XOR B;
    gen <= A AND B;
    prop <= A OR B;
			C(1) <= gen(0) OR (prop(0) AND CarryIn);
			C(2) <= gen(1) OR (prop(1) AND C(1));
			C(3) <= gen(2) OR (prop(2) AND C(2));
		CarryOut <= gen(3) OR (prop(3) AND C(3));
    S(3 downto 1) <= C(3 downto 1) XOR halfsum(3 downto 1);
    S(0) <= halfsum(0) XOR CarryIn;

	
end CarryLookAheadAdd;
		
	