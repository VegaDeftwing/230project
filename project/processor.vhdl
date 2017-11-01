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
		S : in std_logic;
		opx : in std_logic_vector(2 downto 0);
		N, C, V, Z, mfc, clock, reset : in std_logic;
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
	enable: in std_logic; 
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


signal InR : std_logic_vector(23 downto 0);
signal opCode, Cond : std_logic_vector(3 downto 0);
signal S : std_logic;
signal opx : std_logic_vector(2 downto 0);
signal ir_enable, ma_select, mem_read, mem_write, pc_select, pc_enable, inc_select : std_logic;
signal extend, c_select : std_logic_vector(1 downto 0);
signal rf_write, y_select, b_select, a_inv, b_inv : std_logic;
signal alu_op : std_logic_vector(2 downto 0);
signal N, C, V, Z : std_logic;
signal mfc : std_logic;
signal A, B : std_logic_vector(15 downto 0);
signal ALU_out : std_logic_vector(15 downto 0);
signal Enable : std_logic;
signal RegD, RegT, RegS : std_logic_vector(3 downto 0);
signal DataD : std_logic_vector(15 downto 0);
signal DataS, DataT : std_logic_vector(15 downto 0);
signal DataA : std_logic_vector(15 downto 0);	
signal DataB : std_logic_vector(15 downto 0);
signal DataM : std_logic_vector(15 downto 0);
signal DataY : std_logic_vector(15 downto 0);
signal DataZ : std_logic_vector(15 downto 0);
signal enablePS : std_logic;
signal immediateB : std_logic_vector(15 downto 0);
signal muxBout : std_logic_vector(15 downto 0);
signal memIn : std_logic_vector(15 downto 0);
signal ReturnAddress : std_logic_vector(15 downto 0);
signal muxYout : std_logic_vector(15 downto 0);
begin
opCode <= InR(23 downto 20);
Cond <= InR(19 downto 16);
S <= InR(15);
opx <= InR(14 downto 12);
RegD <= InR(11 downto 8);
RegS <= InR(7 downto 4);
RegT <= InR(3 downto 0);
enablePS <= '1';
Step1 : CU PORT MAP(opCode, Cond, S, opx, N, C, V, Z, mfc, Clock, Reset, c_select, y_select, rf_write, b_select, a_inv, b_inv,extend,ir_enable, ma_select, mem_read, mem_write, pc_select, pc_enable, inc_select);
Step2 : Registry PORT MAP(Reset, Enable, Clock, RegD, RegT, RegS, DataD, DataS, DataT);
Step3 : RA PORT MAP(DataS, Reset, Clock, DataA);	
Step4 : RB PORT MAP(DataT, Reset, Clock, DataB);	
Step5 : RM PORT MAP(DataB, Reset, Clock, DataM);	
Step6 : RY PORT MAP(muxYout, Reset, Clock, DataD);	
Step7 : RZ PORT MAP(ALU_out, Reset, Clock, DataZ);
Step8 : MUXB PORT MAP(b_select, immediateB, DataB, muxBout);	
Step9 : MUXY PORT MAP(y_select, DataZ, memIn, ReturnAddress, muxYout);
Step10: ALU PORT MAP(DataA, muxBout, alu_op, a_inv, b_inv, ALU_out, N, Z, V, C);
Step11: PS PORT MAP(N, C, V, Z, Clock, Reset, enablePS, N, C, V, Z);
Step12: IR PORT MAP(Instruction(23 downto 0), Reset, Clock, ir_enable, InR(23 downto 0));
Step13: immediate PORT MAP(InR(14 downto 8), extend, immediateB);


end LOGIC;
		
	