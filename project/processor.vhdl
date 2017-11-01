library IEEE;
use IEEE.std_logic_1164.ALL;


entity processor is
	port(
	Instruction : in std_logic_vector(23 downto 0);
	clock, reset : in std_logic
	);
end processor;

architecture LOGIC of processor is
COMPONENT ALU 
	PORT(
		A, B : in std_logic_vector(15 downto 0);
		alu_op : in std_logic_vector(2 downto 0);
		A_inv, B_inv : in std_logic;
		ALU_out : out std_logic_vector(15 downto 0);
		N, Z, V, C : out std_logic
	);
END COMPONENT;
COMPONENT CU
	port(
		opCode, Cond : in std_logic_vector(3 downto 0);
		opx : in std_logic_vector(2 downto 0);
		S, N, C, V, Z, mfc, clock, reset : in std_logic;
		alu_op : out std_logic_vector(2 downto 0);
		c_select, y_select : out std_logic_vector(1 downto 0);
		rf_write, b_select, a_inv, b_inv : out std_logic;
		extend : out std_logic_vector(1 downto 0);
		ir_enable, ma_select, mem_read, mem_write, pc_select, pc_enable, inc_select : out std_logic
	);
END COMPONENT;
COMPONENT REG16
	PORT(
		data :IN std_logic_vector(15 downto 0);
		enable, reset, Clock	:IN std_logic;
		output :OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;
	COMPONENT RA
	PORT(
		data :IN std_logic_vector(15 downto 0);
		reset, Clock	:IN std_logic;
		output :OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;
	COMPONENT RB
	PORT(
		data :IN std_logic_vector(15 downto 0);
		reset, Clock	:IN std_logic;
		output :OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;
	COMPONENT RM
	PORT(
		data :IN std_logic_vector(15 downto 0);
		reset, Clock	:IN std_logic;
		output :OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;
COMPONENT RY
	PORT(
		data :IN std_logic_vector(15 downto 0);
		reset, Clock	:IN std_logic;
		output :OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;
COMPONENT RZ
	PORT(
		data :IN std_logic_vector(15 downto 0);
		reset, Clock	:IN std_logic;
		output :OUT std_logic_vector(15 downto 0)
	);	
END COMPONENT;
COMPONENT Registry
	port(
		Reset, Enable, Clock : in std_logic;
		RegD, RegT, RegS : in std_logic_vector(3 downto 0);
		DataD : in std_logic_vector(15 downto 0);
		DataS, DataT : out std_logic_vector(15 downto 0)
	);
END COMPONENT;
COMPONENT MUXB
	PORT(
	b_select : in std_logic;
	immediateB : in std_logic_vector(15 downto 0);
	muxBin : in std_logic_vector(15 downto 0);
	muxBout : out std_logic_vector(15 downto 0)
	);
END COMPONENT;
COMPONENT MUXY
	PORT(
	y_select : in std_logic_vector(1 downto 0);
	muxYin : in std_logic_vector(15 downto 0);
	memIn : in std_logic_vector(15 downto 0);
	ReturnA : in std_logic_vector(15 downto 0);
	muxYout : out std_logic_vector(15 downto 0)
	);
END COMPONENT;
COMPONENT PS
	PORT(
	N, C, V, Z : in std_logic;
	Clock, reset: in std_logic;
--	enable: in std_logic; Will simply be 1 for now
	Nout, Cout, Vout, Zout : out std_logic
	);
END COMPONENT;
COMPONENT immediate
	PORT(
		 immed: in std_logic_vector(6 downto 0);
		 extend: in std_logic_vector(1 downto 0);
		 immedEx: out std_logic_vector(15 downto 0)	
	);
END COMPONENT;
	COMPONENT IR
	PORT(
		IRin :IN std_logic_vector(23 downto 0);
		reset, Clock, enable	:IN std_logic;
		Instruction :OUT std_logic_vector(23 downto 0)
	);
	END COMPONENT;

--signal S, MUXAOUT, MUXBOUT : std_logic_vector(15 downto 0);
--signal C14, C15 : std_logic;
begin	
--	MUXA : MUX PORT MAP(A, (NOT A), A_inv, MUXAOUT);
--	MUXB : MUX PORT MAP(B, (NOT B), B_inv, MUXBOUT);
--	RIPPLEADD : SIXTEENBITFA PORT MAP(MUXAOUT, MUXBOUT, (A_inv OR B_inv), S, C14, C15);
--	MUXFINAL : MUX4TO1 PORT MAP(alu_op,(MUXAOUT AND MUXBOUT),(MUXAOUT OR MUXBOUT),(MUXAOUT XOR MUXBOUT),S,ALU_out);
--	FLAGCHECK : FLAGLOGIC PORT MAP(C14, C15, S, N, C, Z, V);
end LOGIC;
		
	