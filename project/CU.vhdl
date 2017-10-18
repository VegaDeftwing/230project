library IEEE;
use IEEE.std_logic_1164.ALL;


entity CU is
	port(
		opCode, Cond : in std_logic_vector(3 downto 0);
		opx : in std_logic_vector(2 downto 0);
		S, N, C, V, Z, mfc, clock, reset : in std_logic;
		alu_op, c_select, y_select : out std_logic_vector(1 downto 0);
		rf_write, b_select, a_inv, b_inv : out std_logic;
		extend : out std_logic vector(1 downto 0);
		ir_enable, ma_select, mem_read, mem_write, pc_select, pc_enable, inc_select : out std_logic
	);
end CU;




--YO THIS IS GARBAGE UNFINISHED DONT KEEP IT LIKE THIS
ARCHITECTURE behavior OF CU IS
BEGIN
	PROCESS( clock ,	reset ) --Set up the	process	to	be	sensitive	to	clock	and	reset
	BEGIN	--Start	the	process
		IF( reset = ’1 ’) THEN --Check i f reset is one output <= (OTHERS =>’0’) ; --If so , the output is zero
		
		ELSIF( rising  edge (Clock) ) THEN --else	Check	i f	the	clock	is	on the	rising	edge
		
		IF( enable = ’1 ’) THEN --If so , f i n a l l y check i f enable is 1 output <= data ; −−If so , update the value of the register END IF; −−All i f s must end
	END IF; --All	i f s	must end
	END PROCESS;	--All	processes	must end
	END behavior;	--All	behaivors	must end

-- AAAAAAAAAAAAAAAAAAA




if (opCode = "0000") then
  --do something
elsif(opCode(3) = '0' and opCode(2) = '0' and opCode(1) = '0' and opCode(0) = '1') then
  -- do something
end if;

-----------------

begin
  process(clock, reset)
  begin
    if (rising_edge(clock)) then
      --do a thing
      
    end if;
  end process;
end behavior

--------------------

if (reset = '1') then
  stage := 0;
end if;

-------------------

if ((mfc = '1' or wmfc = '0')) then
  stage := stage mod 5 + 1;
end if;

------------------

-- instruction fetch

IF(stage = 1) THEN

wmfc <= '1';
alu_op <= "00";
c_select <= "01";
y_select <= "00";
rf_write <= '0';
b_select <= '0';
a_inv <= '0';
b_inv <= '0';
extend <= "00";
ir_enable <= '1';
ma_select <= '1';
mem_read <= '1';
mem_write <= '0';
pc_select <= '1';
pc_enable <= mfc;
inc_select <= '0';

-- register load
ELSIF(stage = 2) THEN

wmfc <= '0';
ir_enable <= '0';
mem_read <= '0';
pc_enable <= '0';

--ALU, branch, jump operation
ELSIF(stage = 3) THEN
--R-Type instructions

IF(opCode(3) = '0' AND opCode(2) = '0') THEN
   IF(opCode(1) = '0' AND opCode(0) = '1') THEN
	--This is for JR, just fill in the values for the if statement
	ELSIF(opCode(1) = '0' AND opCode(0) = '0') THEN
	--THIS is for the other instructions
		IF(opx= "111") THEN
		 --AND instruction
		 alu_op <= "";
		ELSIF(opx = "110") THEN
			--OR INSTRUCTION
			alu_op <= "";
		ELSIF(opx = "101") THEN
			--XOR instruction
			alu_op <= "";
		ELSIF(opx = "100") THEN
			--ADD instruction
			alu_op <= "";
		ELSIF(opx = "011") THEN
			--SUB instruction
			alu_op <= "";
			b_inv <= '';
		END IF;	
	END IF;
 END IF;
 
 ELSIF(stage = 4) THEN
 --R-Type instruction
 IF(opCode(3) = '0' AND opCode(2) = '0') THEN	
	IF(opCode(1) = '0' AND opCode(0) = '1') THEN
	--This is for JR, just fill in the values for the if statement
	--We will have to set some flags here in the future
	END IF;
   END IF;
 ELSIF(stage = 5) THEN
 --R-Type instructions
 IF(opCode(3) = '0' AND opCode(2) = '0') THEN
	IF(opCode(1) = '0' AND opCode(0) = '1') THEN
		--THis is for JR, just fill in the values for the if statement
	ELSEIF(opCode(1) = '0' AND opCode(0) = '0') THEN
		rf_write <= '1';
		END IF;
	   END IF;
      END IF	
   
