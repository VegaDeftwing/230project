library IEEE;
use IEEE.std_logic_1164.ALL;


entity FASTADDER is
	port(
		A, B : in std_logic_vector(15 downto 0);
		Cin : in std_logic;
		F : out std_logic_vector(15 downto 0);
		C14, C15 : out std_logic
	);
end FASTADDER;

architecture FASTADD of FASTADDER is

COMPONENT FAST4BITADDER 
	PORT( 	 
	    A : in std_logic_vector(3 downto 0);
       B : in std_logic_vector(3 downto 0);
		 CarryIn	: in std_logic;
       S : out std_logic_vector(3 downto 0);
		 CarryOut : out std_logic
		);
END COMPONENT;

signal Cout1, Cout2, Cout3 : std_logic;
signal Cin2, Cin3, Cin4 : std_logic;
signal A1, A2, A3, A4 : std_logic_vector(3 downto 0);
signal B1, B2, B3, B4 : std_logic_vector(3 downto 0);
signal S1, S2, S3, S4 : std_logic_vector(3 downto 0);
signal SigC14 : std_logic;

begin	
A1 <= A(3 downto 0);
A2 <= A(7 downto 4);
A3 <= A(11 downto 8);
A4 <= A(15 downto 12);
B1 <= B(3 downto 0);
B2 <= B(7 downto 4);
B3 <= B(11 downto 8);
B4 <= B(15 downto 12);

	add0to3 : FAST4BITADDER PORT MAP(A1, B1, Cin, S1, Cout1);
	add4to7 : FAST4BITADDER PORT MAP(A2, B2, Cout1, S2, Cout2);
	add8to11 : FAST4BITADDER PORT MAP(A3, B3, Cout2, S3, Cout3);
	add12to15 : FAST4BITADDER PORT MAP(A4, B4, Cout3, S4, C15);
	C14 <= S4(3);
	F(3 downto 0) <= S1;
	F(7 downto 4) <= S2;
	F(11 downto 8) <= S3;
	F(15 downto 12) <= S4;

	
end FASTADD;
		
	