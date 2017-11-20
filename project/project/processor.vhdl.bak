library IEEE;
use IEEE.std_logic_1164.ALL;


entity processor is
	port(
	

 --IO Pins	
 clock, reset : in std_logic;
 IOSwitch : in STD_LOGIC_VECTOR(9 DOWNTO 0);	
 IOPush : in std_logic_vector(3 downto 0);
 IOLEDG : out STD_LOGIC_VECTOR(7 DOWNTO 0);
 IOHEX0 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
	
	
 --Simply mapping outputs from signals, used not for calculation but for display during testing. Will revert once unneeded
 
 InR_Output : out std_logic_vector(23 downto 0);
opCode_Output, Cond_Output : out std_logic_vector(3 downto 0);
 --S_Output : out std_logic;
 --opx_Output : out std_logic_vector(2 downto 0);
 --extend_Output : out std_logic_vector(1 downto 0);
 ir_enable_Output, ma_select_Output, mem_read_Output, mem_write_Output, pc_select_Output, pc_enable_Output, inc_select_Output : out std_logic;
-- y_select_Output, c_select_Output : out std_logic_vector(1 downto 0);
 rf_write_Output,  b_select_Output, a_inv_Output, b_inv_Output : out std_logic;
-- alu_op_Output : out std_logic_vector(2 downto 0);
-- N_Output, C_Output, V_Output, Z_Output : out std_logic;
-- Nout_Output, Cout_Output, Vout_Output, Zout_Output : out std_logic;
-- mfc_Output : out std_logic;
-- ALU_out_Output : out std_logic_vector(15 downto 0);
 --RegD_Output, RegT_Output, RegS_Output : out std_logic_vector(3 downto 0);
 DataD_Output : out std_logic_vector(15 downto 0);
 --DataS_Output, DataT_Output : out std_logic_vector(15 downto 0);
 --DataA_Output : out std_logic_vector(15 downto 0);	
 --DataB_Output : out std_logic_vector(15 downto 0);
 DataM_Output : out std_logic_vector(15 downto 0);
 --DataZ_Output : out std_logic_vector(15 downto 0);
 --enablePS_Output : out std_logic;
 --immediateB_Output : out std_logic_vector(15 downto 0);
 --muxBout_Output : out std_logic_vector(15 downto 0);
 memOut_Output : out std_logic_vector(15 downto 0);
 ReturnAddress_Output : out std_logic_vector(15 downto 0);
 --muxYout_Output : out std_logic_vector(15 downto 0);
 IoMem_write_Output : out std_logic;
 InstructionAddress_Output : out std_logic_vector(15 downto 0);
 Address_Output : out std_logic_vector(15 downto 0);
 MemInstruction_Output: out std_logic_vector(15 downto 0);
 --muxCOUT_Output : out std_logic_vector(3 downto 0);
 Blabel_Output : out std_logic_vector(15 downto 0);
 IOmemData_Output : out std_logic_vector(15 downto 0);
 IOKEY_Output: out std_logic_vector(3 downto 0);
 Stage_Output: out integer
	
	
	);
end processor;

architecture LOGIC of processor is
--ALU is used for basic Arithmatic Logic, Taking in values and outputting values/control flags
COMPONENT ALU 
	PORT(
		A, B : in std_logic_vector(15 downto 0);
		alu_op : in std_logic_vector(2 downto 0);
		A_inv, B_inv : in std_logic;
		ALU_out : out std_logic_vector(15 downto 0);
		N, Z, V, C : out std_logic
	);
END COMPONENT;
-- The Control Unit takes in values from the Instruction Register, as well as Flags from the ALU. It essentially parses instructions and enables various flags and sets variables used elsewhere within the processor
-- Works based on clock, has 5 stages, used to varying levels depending on instruction
-- Is vital for ensuring proper logic
COMPONENT CU
		port(
		opCode, Cond : in std_logic_vector(3 downto 0);
      S : in std_logic;
		opx : in std_logic_vector(2 downto 0);
		Immediate : in std_logic_vector(6 downto 0);
		BLabel : in std_logic_vector(15 downto 0);
		JConstant : in std_logic_vector(19 downto 0);
		N, C, V, Z, mfc, clock, reset : in std_logic;
		IOKey : in std_logic_vector(3 downto 0);
		alu_op : out std_logic_vector(2 downto 0);
		c_select, y_select : out std_logic_vector(1 downto 0);
		rf_write, b_select, a_inv, b_inv : out std_logic;
		extend : out std_logic_vector(1 downto 0);
		ir_enable, ma_select, mem_read, MainMem_write, pc_select, pc_enable, inc_select, ps_enable : out std_logic;
		Stage_output : out integer;
		IOMem_write, mem_select : out std_logic
	);
END COMPONENT;
--Generic Buffer Register, mapped for all Buffer Registers RA-RZ
	COMPONENT BUFFREG
	PORT(
		data :IN std_logic_vector(15 downto 0);
		reset, Clock	:IN std_logic;
		output :OUT std_logic_vector(15 downto 0)
	);
END COMPONENT;
--Registry, takes in Register value codes that range from 15 to 0, leaving a potential Register for each. Each Register is made up of the REG16 component, and is selected and modified based on the RegD, RegS, RegT, and DataD ins. It utilizes a decoder to determine which 16 bit registers are used in a given operation
COMPONENT Registry
	port(
		Reset, Enable, Clock : in std_logic;
		RegD, RegT, RegS : in std_logic_vector(3 downto 0);
		DataD : in std_logic_vector(15 downto 0);
		DataS, DataT : out std_logic_vector(15 downto 0)
	);
END COMPONENT;
--MUXB is used in instructions which use the ALU. It's purpose is to, based on b_select, use either BUFFREG RB value (Comes from Register), or immediateB(immediate value for D-Type instructions)
COMPONENT MUXB
	PORT(
	b_select : in std_logic;
	immediateB : in std_logic_vector(15 downto 0);
	muxBin : in std_logic_vector(15 downto 0);
	muxBout : out std_logic_vector(15 downto 0)
	);
END COMPONENT;
--MUXY is the MUX that is used to determine proper DataD output, signaling the end of instructions which use RZ out from ALU, Memory Data from memory, or the Return Address
--y_select is the flag which comes from the CU to determine this.
COMPONENT MUXY
	PORT(
	y_select : in std_logic_vector(1 downto 0);
	muxYin : in std_logic_vector(15 downto 0);
	memIn : in std_logic_vector(15 downto 0);
	ReturnA : in std_logic_vector(15 downto 0);
	muxYout : out std_logic_vector(15 downto 0)
	);
END COMPONENT;
--PS is the Processor Status Register. Essentially, it has the ALU flags stored within it based on an enable flag from the CU, and, outputs based on that enable, and the clock
-- NOTE: CURRENTLY set to 1 unconditionally. This will be changed once we implement it's usage within the CU
COMPONENT PS
	PORT(
	N, C, V, Z : in std_logic;
	Clock, reset: in std_logic;
	enable: in std_logic; 
	Nout, Cout, Vout, Zout : out std_logic
	);
END COMPONENT;
--Immediate is the immediate block. It is used in D-Type instructions to pass an immediate value, which uses extend to determine value of immediate for addition.
COMPONENT immediate
	PORT(
		 immed: in std_logic_vector(6 downto 0);
		 extend: in std_logic_vector(1 downto 0);
		 immedEx: out std_logic_vector(15 downto 0)	
	);
END COMPONENT;
-- The IR takes in the input of Instruction, and, based on enable/reset flags, outputs corresponding instruction value to the rest of the components. Essentially the first step of the processor.
	COMPONENT IR
	PORT(
		IRin :IN std_logic_vector(23 downto 0);
		reset, Clock, enable	:IN std_logic;
		Instruction :OUT std_logic_vector(23 downto 0)
	);
	END COMPONENT;

	
--Phase 3 

--MUXC
COMPONENT MUXC
	PORT(
	c_select : in std_logic_vector(1 downto 0);
	Rin : in std_logic_vector(3 downto 0);
	Din : in std_logic_vector(3 downto 0);
	LiReg : in std_logic_vector(3 downto 0);
	muxCout : out std_logic_vector(3 downto 0)
	);
END COMPONENT;

--MUXma
COMPONENT MUXma 
	PORT(
	ma_select : in std_logic;
	RZin : in std_logic_vector(15 downto 0);
	IAGin: in std_logic_vector(15 downto 0);
	Address : out std_logic_vector(15 downto 0)
	);
END COMPONENT;


COMPONENT MUXA
	PORT(
	a_select : in std_logic;
	RegA : in std_logic_vector(15 downto 0);
	BLABEL : in std_logic_vector(15 downto 0);
	muxAout : out std_logic_vector(15 downto 0)
	);
end COMPONENT;

COMPONENT MemoryInterface
	PORT
	(
		MEM_read		:	 IN STD_LOGIC;
		MEM_write		:	 IN STD_LOGIC;
		DataIn		:	 IN STD_LOGIC_VECTOR(23 DOWNTO 0);
		Address		:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		clock		:	 IN STD_LOGIC;
		DataOut		:	 OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
		MFC		:	 OUT STD_LOGIC
	);
END COMPONENT;

--IAG is premade for us, behavior will be explained.
COMPONENT InstructionAddressGenerator
	PORT
	(
		RA		:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		PC_select		:	 IN STD_LOGIC;
		PC_enable		:	 IN STD_LOGIC;
		clock		:	 IN STD_LOGIC;
		aclr		:	 IN STD_LOGIC;
		Immediate		:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		INC_select		:	 IN STD_LOGIC;
		MuxY		:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		Address		:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;




--Phase 4 IO MEMORY INTERFACE	
	
COMPONENT IO_MemoryInterface
	PORT
	(
		clock		:	 IN STD_LOGIC;
		mem_write		:	 IN STD_LOGIC;
		mem_addr		:	 IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		mem_data		:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		KEY		:	 IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		SW		:	 IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		data_out		:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		LEDG		:	 OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		HEX0		:	 OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
	

COMPONENT MUXmem
	PORT(
	mem_select : in std_logic;
	MemData : in std_logic_vector(15 downto 0);
	IOMemData: in std_logic_vector(15 downto 0);
	MuxMemOut : out std_logic_vector(15 downto 0)
	);
END COMPONENT;	
	
	
--This is a block of signals. It is very long. These signals are used within mappings as both inputs and outputs for various components within the processor
Signal MemInstruction : std_logic_vector(15 downto 0);
Signal InR : std_logic_vector(23 downto 0);
Signal opCode, Cond : std_logic_vector(3 downto 0);
Signal S : std_logic;
Signal opx : std_logic_vector(2 downto 0);
Signal ir_enable, ma_select, mem_read, mem_write, pc_select, pc_enable, inc_select : std_logic;
Signal extend : std_logic_vector(1 downto 0);
Signal y_select, c_select : std_logic_vector(1 downto 0);
Signal rf_write,  b_select, a_inv, b_inv : std_logic;
Signal alu_op : std_logic_vector(2 downto 0);
Signal N, C, V, Z : std_logic;
Signal Nout, Cout, Vout, Zout : std_logic;
Signal mfc : std_logic;
Signal ALU_out : std_logic_vector(15 downto 0);
Signal Enable : std_logic;
Signal RegD, RegT, RegS : std_logic_vector(3 downto 0);
Signal DataD : std_logic_vector(15 downto 0);
Signal DataS, DataT : std_logic_vector(15 downto 0);
Signal DataA : std_logic_vector(15 downto 0);	
Signal DataB : std_logic_vector(15 downto 0);
Signal DataM : std_logic_vector(15 downto 0);
Signal DataZ : std_logic_vector(15 downto 0);
Signal enablePS : std_logic;
Signal immediateB : std_logic_vector(15 downto 0);
Signal muxBout : std_logic_vector(15 downto 0);
Signal memOut : std_logic_vector(15 downto 0);
Signal ReturnAddress : std_logic_vector(15 downto 0);
Signal muxYout : std_logic_vector(15 downto 0);
Signal immediateIn : std_logic_vector(6 downto 0);
Signal BLabel : std_logic_vector(15 downto 0);
Signal JConstant : std_logic_vector(19 downto 0);
Signal InstructionAddress : std_logic_vector(15 downto 0);
Signal Address : std_logic_vector(15 downto 0);
Signal MUXCOUT : std_logic_vector(3 downto 0);
Signal memoryIn : std_logic_vector(23 downto 0);
Signal MUXliOUT : std_logic_vector(3 downto 0);
Signal LiReg : std_logic_vector(3 downto 0);

Signal IOKey : STD_LOGIC_VECTOR(3 DOWNTO 0);
Signal MemData : STD_LOGIC_VECTOR(23 downto 0);
Signal IOMem_write : STD_LOGIC;
Signal IOMemData : STD_LOGIC_VECTOR(15 downto 0);
Signal Mem_select : std_logic;


begin

--These Signals are primarily used in the CU and Registry, and they all come from the InR output nal from the IR, as that is the first stage

--Register InR parses
RegD <= InR(11 downto 8);
RegS <= InR(7 downto 4);
RegT <= InR(3 downto 0);
LiReg<= InR(19 downto 16);
--CU InR parses
opCode <= InR(23 downto 20);
Cond <= InR(19 downto 16);
S <= InR(15);
opx <= InR(14 downto 12);
immediateIn <= InR(14 downto 8);
BLabel <= InR(15 downto 0);
JConstant <= InR(19 downto 0);

--Append bits to RM to make compatible with MemoryInterface
memoryIn <= "00000000" & DataM;
--Remove bits from MemInstruction to make compatible with MuxY
memOut <= MemData(15 downto 0);
--Get IOKey from ADDRESS from MuxMA
IOKey <= Address(15 downto 12);

--Port maps for each component.

--**DISCLAIMER**
-- (UNIMPLEMENTED) MEANS UNIMPLEMENTED, GET IT? ONCE IMPLEMENTED, REMOVE
-- StepX or XXX means that it is known that something needs to be done or stated as happening at sometime, but until implementation cannot be filled. Once referenced items are implemented, replace with proper values.
-- Step# does not necessarily correspond to order of execution in any sense.
--**DISCLAIMER END**


--MAP CU. Takes in opCode, Cond, S, opx, immediate, BLabel, JConstant inputs as parsings of InR from Step12 IR.
-- Takes in Nout, Cout, Vout, Zout inputs from Step11 PS
-- Takes in inputs clock and reset from test script, and input mfc from (XXX) in StepX
-- See CU.vhdl for documentation of internal logic.
-- Outputs ALU_op to Step10 ALU
-- Outputs c_select to MUXC in StepX, whose output is used in Step2 Registry for certain instructions (UNIMPLEMENTED)
-- Outputs y_select to MUXY in Step9
-- Outputs rf_write to Registry in Step2
-- Outputs b_select to MUXB in Step8
-- Outputs a_inv, b_inv to ALU in Step10
-- Outputs extend to immediate block in Step13
-- Outputs ir_enable to IR in Step12
-- Outputs MA_select to MuxMA in StepX. (MUX UNIMPLEMENTED, USES RZ INPUT DATA ADDRESS, INSTRUCTION ADDRESS INPUT PC, with MA_select being flag)
-- Outputs mem_read, mem_write to Memory and IO interface in StepX (UNIMPLEMENTED)
-- Outputs pc_select to MuxPC in StepX (UNIMPLEMENTED)
-- Outputs pc_enable to the PC in StepX (UNIMPLEMENTED)
-- Outputs inc_select to MuxINC in StepX (UNIMPLEMENTED, from Immediate Extension? See picture for future reference)
-- Outputs enablePS to Step11 PS (UNIMPLEMENTED, CURRENTLY SET TO 1 AS DEFAULT TO ALLOW FUNCTIONALITY FOR TESTING UNTIL IMPLEMENTATION)
Step1 : CU PORT MAP(opCode, Cond, S, opx, immediateIn, BLabel, JConstant, Nout, Cout, Vout, Zout, mfc, Clock, Reset, IOKey, ALU_op, c_select, y_select, rf_write, b_select, a_inv, b_inv, extend, ir_enable, ma_select, mem_read, mem_write, pc_select, pc_enable, inc_select, enablePS, Stage_Output, IOMem_write, mem_select);

--MAP Registry. Based on rf_write flag from Step1 CU, and the reset and Clock inputs, takes in RegD, RegT, and RegS signals that are parsed from the InR output of Step12 IR. Also takes in DataD from Step6 BUFFREG RY.
--Outputs DataS, DataT depending on internal logic, further described within Registry.vhdl
Step2 : Registry PORT MAP(Reset, rf_write, NOT Clock, MUXCOUT, RegT, RegS, DataD, DataS, DataT);

--MAP BUFFREG RA. Upon clock rising edge, takes DataS from Registry Step2, and outputs as DataA into  MuxPC in StepX and ALU in Step10. The different flags from CU Step1 determine what each do with it.
Step3 : BUFFREG PORT MAP(DataS, Reset, Clock, DataA);	

--MAP BUFFREG RB. Upon clock rising edge, takes DataT from Step2 Registry, and outputs DataB into both Step5 BUFFREG RM and Step8 MUXB.
Step4 : BUFFREG PORT MAP(DataT, Reset, Clock, DataB);	

--MAP BUFFREG RM. Upon clock rising edge, takes DataB from Step4 BUFFREG RB, and sends to (DataIn?) In Memory, in StepX, depending on flags from CU Step1.
Step5 : BUFFREG PORT MAP(DataB, Reset, Clock, DataM);	

--MAP BUFFREG RY. Upon clock rising edge, takes muxYout from Step9 MUXY, and DataD as output to Registry in Step2.
Step6 : BUFFREG PORT MAP(muxYout, Reset, Clock, DataD);	

--MAP BUFFREG RZ. Upon clock rising edge, takes ALU_out from Step10 ALU, and sends DataZ as output to MuxMA in StepX (as data address), and into MuxY for use in Step9. It's usage in MuxMA depends on control flag MA_select from the CU Step1
Step7 : BUFFREG PORT MAP(ALU_out, Reset, Clock, DataZ);

--Map MUXB, using b_select input flag from Step1 CU, selects either immediateB from Step13 immediate block, or DataB from Step4 BUFFREG RB. muxBout is the output and used in ALU in Step10 as an input.  
Step8 : MUXB PORT MAP(b_select, immediateB, DataB, muxBout);	

--Map MUXY, using y_select input flag from Step1 CU, and selects either DataZ from Step7 BUFFREG RZ, memIn from memory Data out(in some instructions) in StepX, or ReturnAddress from the PC_Temp in StepX.
--Outputs muxYout, used in Step6 BUFFREG RY 
Step9 : MUXY PORT MAP(y_select, DataZ, MemInstruction, ReturnAddress, muxYout);

--Map ALU, take in DataA from Buffer Register RA from Step 3, and take in the output of MuxB in step 8. Uses alu_op, a_inv, and b_inv from the CU as flags for determining various logics. See ALU documentation for greater detail.
--Outputs ALU_out based on the executed arithmatic instruction, and also outputs control flags N, Z, V, and C based on logics within FLAGLOGIC. ALU_out goes into Step7 BUFFREG RZ, and N,Z,V,C flags go into Step11 PS.
Step10: ALU PORT MAP(DataA, muxBout, alu_op, a_inv, b_inv, ALU_out, N, Z, V, C);

--Map Processor Status Register, Takes in FLAGLOGIC flags, updates on clock rising edge when enablePS flag is true. Inputs come from Step10 ALU, outputs go into Step1 CU.
Step11: PS PORT MAP(N, C, V, Z, Clock, Reset, enablePS, Nout, Cout, Vout, Zout);

--Map Instruction Register, Takes in instruction from test script, updates and outputs when the clock and enable flag allow it, reset when Reset flag is 1.
--The InR output signal is parsed as various inputs that go into the Control Unit and Register.
Step12: IR PORT MAP(MemData, Reset, Clock, ir_enable, InR);

--Map immediate block. Take in immediate value, extend flag, output immediateB when desired
Step13: immediate PORT MAP(immediateIn, extend, immediateB);

--Map Instruction Address Generator
Step14: InstructionAddressGenerator PORT MAP(DataA, PC_select, PC_enable, clock, reset, Blabel, inc_select, ReturnAddress, InstructionAddress);

--Map MUXma
Step15: MUXma PORT MAP(ma_select, DataZ, InstructionAddress, Address);

--Map MUXC to choose RegD input to Registry. Chooses based on instruction.
Step16: MUXC PORT MAP(c_select, RegD, RegT, LiReg, MUXCOUT);

--MAP MemoryInterface 
Step17: MemoryInterface PORT MAP(mem_read, mem_write, memoryIn, Address, clock, MemData, mfc);


--MAP IO_MemoryInterface. Will expand on logic at future time
Step18: IO_MemoryInterface PORT MAP(clock, IOMem_write, IOKEY, DataM, IOPush, IOSwitch, IOMemData, IOLEDG, IOHEX0);
	
--MAP MUXmem. Chooses what Memory data goes to MuxY.
Step19: MUXmem PORT MAP(mem_select, Memout, IOMemData, MemInstruction);
	
--Simply mapping outputs from Signals, used not for calculation but for display during testing. Will revert once unneeded
InR_Output <= InR;
opCode_Output <= opCode;
Cond_Output <= Cond;
--S_Output <= S;
--opx_Output <= opx;
ir_enable_Output <= ir_enable;
ma_select_Output <= ma_select;
mem_read_Output <= mem_read;
mem_write_Output <= mem_write;
--pc_select_Output <= pc_select;
--pc_enable_Output <= pc_enable;
--inc_select_Output <= inc_select;
--extend_Output <= extend;
--y_select_Output <= y_select;
--c_select_Output <= c_select;
rf_write_Output <= rf_write;
b_select_Output <= b_select;
--a_inv_Output <= a_inv;
--b_inv_Output <= b_inv;
--alu_op_Output <= alu_op;
--N_Output <= N;
--C_Output <= C;
--V_Output <= V;
--Z_Output <= Z;
--ALU_out_Output <= ALU_out;
---RegD_Output <= RegD;
--RegT_Output <= RegT;
--RegS_Output <= RegS;
DataD_Output <= DataD;
--DataS_Output <= DataS;
--DataT_Output <= DataT;
--DataA_Output <=	DataA;
--DataB_Output <= DataB;
DataM_Output <= DataM;
--DataZ_Output <= DataZ;
--enablePS_Output <= enablePS;
--immediateB_Output <= immediateB;
--muxBout_Output <= muxBout;
memOut_Output <= memOut;
ReturnAddress_Output <= ReturnAddress; 
--muxYout_Output <= muxYout;
--Nout_Output <= Nout;
--Cout_Output <= Cout;
--Vout_Output <= Vout;
--Zout_Output <= Zout;
InstructionAddress_Output <= InstructionAddress;
Address_Output<= Address;
MemInstruction_Output <= MemInstruction;
--muxCOUT_Output <= muxCOUT;
Blabel_Output <= Blabel;
IOmem_write_Output<= IOMem_write;
IOMemData_Output<= IOMemData;
IOKEY_Output <= IOKEY;
end LOGIC;
		
	