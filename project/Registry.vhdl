library IEEE;
use IEEE.std_logic_1164.ALL;


entity Registry is
	port(
		Reset, Enable, Clock : in std_logic;
		RegD, RegT, RegS : in std_logic_vector(3 downto 0);
		DataD : in std_logic_vector(15 downto 0);
		DataS, DataT : out std_logic_vector(15 downto 0)
	);
end Registry;

architecture LOGIC of Registry is
COMPONENT mux16
PORT(
d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15 : IN std_logic_vector(15 downto 0); 
sel : IN std_logic_vector(3 downto 0); 
f : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;
COMPONENT reg16
PORT(
data : IN std_logic_vector(15 downto 0); 
enable, reset, Clock : IN std_logic;
output :OUT std_logic_vector(15 downto 0) 
);
END COMPONENT;
COMPONENT decoder16
PORT(
Sel : IN std_logic_vector(3 downto 0); 
Output : OUT std_logic_vector(15 downto 0) 
);
END COMPONENT;

signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15: std_logic_vector(15 downto 0);
signal decoderOut : std_logic_vector(15 downto 0);
begin	
	decoder : decoder16 PORT MAP(RegD, decoderOut);
	Q0 <= (OTHERS => '0'); 

	Register1 : reg16 PORT MAP(DataD, (Enable AND decoderOut(1)), Reset, Clock, Q1);
	Register2 : reg16 PORT MAP(DataD, (Enable AND decoderOut(2)), Reset, Clock, Q2);
	Register3 : reg16 PORT MAP(DataD, (Enable AND decoderOut(3)), Reset, Clock, Q3);
	Register4 : reg16 PORT MAP(DataD, (Enable AND decoderOut(4)), Reset, Clock, Q4);
	Register5 : reg16 PORT MAP(DataD, (Enable AND decoderOut(5)), Reset, Clock, Q5);
	Register6 : reg16 PORT MAP(DataD, (Enable AND decoderOut(6)), Reset, Clock, Q6);
	Register7 : reg16 PORT MAP(DataD, (Enable AND decoderOut(7)), Reset, Clock, Q7);
	Register8 : reg16 PORT MAP(DataD, (Enable AND decoderOut(8)), Reset, Clock, Q8);
	Register9 : reg16 PORT MAP(DataD, (Enable AND decoderOut(9)), Reset, Clock, Q9);
	Register10 : reg16 PORT MAP(DataD, (Enable AND decoderOut(10)), Reset, Clock, Q10);
	Register11 : reg16 PORT MAP(DataD, (Enable AND decoderOut(11)), Reset, Clock, Q11);
	Register12 : reg16 PORT MAP(DataD, (Enable AND decoderOut(12)), Reset, Clock, Q12);
	Register13 : reg16 PORT MAP(DataD, (Enable AND decoderOut(13)), Reset, Clock, Q13);
	Register14 : reg16 PORT MAP(DataD, (Enable AND decoderOut(14)), Reset, Clock, Q14);
	Register15 : reg16 PORT MAP(DataD, (Enable AND decoderOut(15)), Reset, Clock, Q15);
	MUXA : mux16 PORT MAP(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, RegS, DataS);
	MUXB : mux16 PORT MAP(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, RegT, DataT);
	
end LOGIC;
		
	