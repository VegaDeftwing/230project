library IEEE;
use IEEE.std_logic_1164.ALL;


entity processor is
	port(
	Instruction : in std_logic_vector(23 downto 0);
	clock, reset : in std_logic;
	
	
	
	
 InR : out std_logic_vector(23 downto 0);
 opCode, Cond : out std_logic_vector(3 downto 0);
 S : out std_logic;
 opx : out std_logic_vector(2 downto 0);
 ir_enable, ma_select, mem_read, mem_write, pc_select, pc_enable, inc_select : out std_logic;
 extend, y_select, c_select : out std_logic_vector(1 downto 0);
 rf_write,  b_select, a_inv, b_inv : out std_logic;
 alu_op : out std_logic_vector(2 downto 0);
 N, C, V, Z : out std_logic;
 Nout, Cout, Vout, Zout : out std_logic;
 mfc : out std_logic;
 A, B : out std_logic_vector(15 downto 0);
 ALU_out : out std_logic_vector(15 downto 0);
 RegD, RegT, RegS : out std_logic_vector(3 downto 0);
 DataD : out std_logic_vector(15 downto 0);
 DataS, DataT : out std_logic_vector(15 downto 0);
 DataA : out std_logic_vector(15 downto 0);	
 DataB : out std_logic_vector(15 downto 0);
 DataM : out std_logic_vector(15 downto 0);
 DataY : out std_logic_vector(15 downto 0);
 DataZ : out std_logic_vector(15 downto 0);
 enablePS : out std_logic;
 immediateB : out std_logic_vector(15 downto 0);
 muxBout : out std_logic_vector(15 downto 0);
 memIn : out std_logic_vector(15 downto 0);
 ReturnAddress : out std_logic_vector(15 downto 0);
 muxYout : out std_logic_vector(15 downto 0)
	
	
	
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


signal SigInR : std_logic_vector(23 downto 0);
signal SigopCode, SigCond : std_logic_vector(3 downto 0);
signal SigS : std_logic;
signal Sigopx : std_logic_vector(2 downto 0);
signal Sigir_enable, Sigma_select, Sigmem_read, Sigmem_write, Sigpc_select, Sigpc_enable, Siginc_select : std_logic;
signal Sigextend, Sigy_select, Sigc_select : std_logic_vector(1 downto 0);
signal Sigrf_write,  Sigb_select, Siga_inv, Sigb_inv : std_logic;
signal Sigalu_op : std_logic_vector(2 downto 0);
signal SigN, SigC, SigV, SigZ : std_logic;
signal SigNout, SigCout, SigVout, SigZout : std_logic;

signal Sigmfc : std_logic;
signal SigA, SigB : std_logic_vector(15 downto 0);
signal SigALU_out : std_logic_vector(15 downto 0);
signal SigEnable : std_logic;
signal SigRegD, SigRegT, SigRegS : std_logic_vector(3 downto 0);
signal SigDataD : std_logic_vector(15 downto 0);
signal SigDataS, SigDataT : std_logic_vector(15 downto 0);
signal SigDataA : std_logic_vector(15 downto 0);	
signal SigDataB : std_logic_vector(15 downto 0);
signal SigDataM : std_logic_vector(15 downto 0);
signal SigDataY : std_logic_vector(15 downto 0);
signal SigDataZ : std_logic_vector(15 downto 0);
signal SigenablePS : std_logic;
signal SigimmediateB : std_logic_vector(15 downto 0);
signal SigmuxBout : std_logic_vector(15 downto 0);
signal SigmemIn : std_logic_vector(15 downto 0);
signal SigReturnAddress : std_logic_vector(15 downto 0);
signal SigmuxYout : std_logic_vector(15 downto 0);
begin
SigopCode <= SigInR(23 downto 20);
SigCond <= SigInR(19 downto 16);
SigS <= SigInR(15);
Sigopx <= SigInR(14 downto 12);
SigRegD <= SigInR(11 downto 8);
SigRegS <= SigInR(7 downto 4);
SigRegT <= SigInR(3 downto 0);
SigenablePS <= '1';

Step1 : CU PORT MAP(SigopCode, SigCond, SigS, Sigopx, SigNout, SigCout, SigVout, SigZout, Sigmfc, Clock, Reset, SigALU_op, Sigc_select, Sigy_select, Sigrf_write, Sigb_select, Siga_inv, Sigb_inv, Sigextend, Sigir_enable, Sigma_select, Sigmem_read, Sigmem_write, Sigpc_select, Sigpc_enable, Siginc_select);
Step2 : Registry PORT MAP(Reset, Sigrf_write, Clock, SigRegD, SigRegT, SigRegS, SigDataD, SigDataS, SigDataT);
Step3 : RA PORT MAP(SigDataS, Reset, Clock, SigDataA);	
Step4 : RB PORT MAP(SigDataT, Reset, Clock, SigDataB);	
Step5 : RM PORT MAP(SigDataB, Reset, Clock, SigDataM);	
Step6 : RY PORT MAP(SigmuxYout, Reset, Clock, SigDataD);	
Step7 : RZ PORT MAP(SigALU_out, Reset, Clock, SigDataZ);
Step8 : MUXB PORT MAP(Sigb_select, SigimmediateB, SigDataB, SigmuxBout);	
Step9 : MUXY PORT MAP(Sigy_select, SigDataZ, SigmemIn, SigReturnAddress, SigmuxYout);
Step10: ALU PORT MAP(SigDataA, SigmuxBout, Sigalu_op, Siga_inv, Sigb_inv, SigALU_out, SigN, SigZ, SigV, SigC);
Step11: PS PORT MAP(SigN, SigC, SigV, SigZ, Clock, Reset, SigenablePS, SigNout, SigCout, SigVout, SigZout);
Step12: IR PORT MAP(Instruction, Reset, Clock, Sigir_enable, SigInR);
Step13: immediate PORT MAP(SigInR(14 downto 8), Sigextend, SigimmediateB);



InR <= SigInR;
opCode <= SigopCode;
Cond <= SigCond;
S <= SigS;
opx <= Sigopx;
ir_enable <= Sigir_enable;
ma_select <= Sigma_select;
mem_read <= Sigmem_read;
mem_write <= Sigmem_write;
pc_select <= Sigpc_select;
pc_enable <= Sigpc_enable;
inc_select <= Siginc_select;
extend <= Sigextend;
y_select <= Sigy_select;
c_select <= Sigc_select;
rf_write <= Sigrf_write;
b_select <= Sigb_select;
a_inv <= Siga_inv;
b_inv <= Sigb_inv;
alu_op <= Sigalu_op;
N <= SigN;
C <= SigC;
V <= SigV;
Z <= SigZ;
mfc <= Sigmfc;
A <= SigA;
B <= SigB;
ALU_out <= SigALU_out;
RegD <= SigRegD;
RegT <= SigRegT;
RegS <= SigRegS;
DataD <= SigDataD;
DataS <= SigDataS;
DataT <= SigDataT;
DataA <=	SigDataA;
DataB <= SigDataB;
DataM <= SigDataM;
DataY <= SigDataY;
DataZ <= SigDataZ;
enablePS <= SigenablePS;
immediateB <= SigimmediateB;
muxBout <= SigmuxBout;
memIn <= SigmemIn;
ReturnAddress <= SigReturnAddress; 
muxYout <= SigmuxYout;
Nout <= SigNout;
Cout <= SigCout;
Vout <= SigVout;
Zout <= SigZout;




end LOGIC;
		
	