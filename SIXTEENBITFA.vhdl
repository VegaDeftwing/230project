library IEEE;
use IEEE.std_logic_1164.ALL;


entity SIXTEENBITFA is
	port(
		A, B : in std_logic_vector(15 downto 0);
		Cin : in std_logic;
		F : out std_logic_vector(15 downto 0);
		C14, C15 : out std_logic
	);
end SIXTEENBITFA;

architecture FUADD of SIXTEENBITFA is
COMPONENT FA 
	PORT( A, B, Cin: in std_logic;
	S, Cout : out std_logic);	
END COMPONENT;

signal Carry : std_logic_vector(14 downto 0);	

begin	
	add0 : FA PORT MAP(A(0),B(0),Cin,F(0),Carry(0));
	add1 : FA PORT MAP(A(1),B(1),Carry(0),F(1),Carry(1));
	add2 : FA PORT MAP(A(2),B(2),Carry(1),F(2),Carry(2));
	add3 : FA PORT MAP(A(3),B(3),Carry(2),F(3),Carry(3));
	add4 : FA PORT MAP(A(4),B(4),Carry(3),F(4),Carry(4));
	add5 : FA PORT MAP(A(5),B(5),Carry(4),F(5),Carry(5));
	add6 : FA PORT MAP(A(6),B(6),Carry(5),F(6),Carry(6));
	add7 : FA PORT MAP(A(7),B(7),Carry(6),F(7),Carry(7));
	add8 : FA PORT MAP(A(8),B(8),Carry(7),F(8),Carry(8));
	add9 : FA PORT MAP(A(9),B(9),Carry(8),F(9),Carry(9));
	add10 : FA PORT MAP(A(10),B(10),Carry(9),F(10),Carry(10));
	add11 : FA PORT MAP(A(11),B(11),Carry(10),F(11),Carry(11));
	add12 : FA PORT MAP(A(12),B(12),Carry(11),F(12),Carry(12));
	add13 : FA PORT MAP(A(13),B(13),Carry(12),F(13),Carry(13));
	add14 : FA PORT MAP(A(14),B(14),Carry(13),F(14),Carry(14));
	C14 <= Carry(14);
	add15 : FA PORT MAP(A(15),B(15),Carry(14),F(15),C15);

	
end FUADD;
		
	