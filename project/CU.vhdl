library IEEE;
use IEEE.std_logic_1164.ALL;


entity CU is
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
end CU;





ARCHITECTURE behavior OF CU IS
signal wmfc: std_logic;
shared variable stage: integer:= 0;
BEGIN PROCESS( clock ,	reset ) --Set up the	process	to	be	sensitive	to	clock	and	reset
	BEGIN	--Start	the	process
	IF( rising_edge(clock)) THEN
		IF(reset='1')THEN 
		stage:=0;
		END IF;
		IF((mfc= '1' or wmfc = '0')) THEN 
		stage:= stage mod 5 + 1 ; 
		END IF;
		
		-- instruction fetch

		IF(stage = 1) THEN

		wmfc <= '1';
		alu_op <= "000";
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
				 alu_op <= "000";
				ELSIF(opx = "110") THEN
					--OR INSTRUCTION
					alu_op <= "001";
				ELSIF(opx = "101") THEN
					--XOR instruction
					alu_op <= "010";
				ELSIF(opx = "100") THEN
					--ADD instruction
					alu_op <= "011";
				ELSIF(opx = "011") THEN
					--SUB instruction
					alu_op <= "011";
					b_inv <= '1';
				ELSIF(opx = "010") THEN
					--MULT instruction
					alu_op <= "100";
				ELSIF(opx = "001") THEN
					--DIV instruction
					alu_op <= "101";
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
			ELSIF(opCode(1) = '0' AND opCode(0) = '0') THEN
				rf_write <= '1';
				END IF;
				END IF;
				END IF;	
		END IF; -- ENDED MAIN IF OF PROCESS
END PROCESS;	--All	processes	must end
END behavior;	--All	behaivors	must end

