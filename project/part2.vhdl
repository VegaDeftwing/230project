library IEEE;
use IEEE.std_logic_1164.ALL;


entity processor is
	port(
	poop : in std_logic_vector(15 downto 1)
	);
end processor;

architecture LOGIC of processor is
--COMPONENT SIXTEENBITFA 
--	PORT(
--		A, B : in std_logic_vector(15 downto 0);
--		Cin : in std_logic;
--		F : out std_logic_vector(15 downto 0);
--		C14, C15 : out std_logic);
--END COMPONENT;
--COMPONENT MUX
--	PORT(
--		VAR, NVAR : in std_logic_vector(15 downto 0);
--		SEL : in std_logic;
--		MUX_OUT : out std_logic_vector(15 downto 0));
--END COMPONENT;
--COMPONENT MUX4TO1
--	PORT(
--		alu_op : in std_logic_vector(1 downto 0);
--		in1, in2, in3, in4 : in std_logic_vector(15 downto 0);
--		ALU_out : out std_logic_vector(15 downto 0)
--	);
--END COMPONENT;
--COMPONENT FLAGLOGIC
--	PORT(
--		C14, C15 : in std_logic;
--		S : in std_logic_vector(15 downto 0);
--		N, C, Z, V : out std_logic);
--END COMPONENT;
--signal S, MUXAOUT, MUXBOUT : std_logic_vector(15 downto 0);
--signal C14, C15 : std_logic;
begin	
--	MUXA : MUX PORT MAP(A, (NOT A), A_inv, MUXAOUT);
--	MUXB : MUX PORT MAP(B, (NOT B), B_inv, MUXBOUT);
--	RIPPLEADD : SIXTEENBITFA PORT MAP(MUXAOUT, MUXBOUT, (A_inv OR B_inv), S, C14, C15);
--	MUXFINAL : MUX4TO1 PORT MAP(alu_op,(MUXAOUT AND MUXBOUT),(MUXAOUT OR MUXBOUT),(MUXAOUT XOR MUXBOUT),S,ALU_out);
--	FLAGCHECK : FLAGLOGIC PORT MAP(C14, C15, S, N, C, Z, V);
end LOGIC;
		
	