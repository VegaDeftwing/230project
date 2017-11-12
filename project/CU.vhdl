library IEEE;
use IEEE.std_logic_1164.ALL;


entity CU is
	port(
		opCode, Cond : in std_logic_vector(3 downto 0);
      S : in std_logic;
		opx : in std_logic_vector(2 downto 0);
		Immediate : in std_logic_vector(6 downto 0);
		BLabel : in std_logic_vector(15 downto 0);
		JConstant : in std_logic_vector(19 downto 0);
		N, C, V, Z, mfc, clock, reset : in std_logic;
		alu_op : out std_logic_vector(2 downto 0);
		c_select, y_select : out std_logic_vector(1 downto 0);
		rf_write, b_select, a_inv, b_inv : out std_logic;
		extend : out std_logic_vector(1 downto 0);
		ir_enable, ma_select, mem_read, mem_write, pc_select, pc_enable, inc_select, ps_enable: out std_logic
		
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
		c_select <= "00";
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
		ps_enable <= '0';
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
		c_select <= "00";
			IF(opCode(1) = '0' AND opCode(0) = '1') THEN
			--This is for JR, just fill in the values for the if statement
			--help
			
		ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
			--This is for cmp
			ps_enable <= S;
				
			ELSIF(opCode(1)='1' AND opCode(0)='1') THEN
			--This is for sll
				
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
					--ShiftLeftLogical instruction
					alu_op <= "101";
				END IF;
				END IF;
		 END IF;
		 	--D-Type
			IF(opCode(3) = '0' AND opCode(2) = '1') THEN
				ps_enable <= S;
			IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for lw
				b_select <= '1';
				alu_op <= "011";
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for sw
				b_select <= '1';
				alu_op <= "011";
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for addi
				alu_op <= "011";
				b_select <= '1';

				--how to know when we need to extend?
				IF(immediate(6)='1') THEN
				extend <= "01";
				--other potential method of implementation
				--b_inv <= '1';
				--potentially wrong behavior
				END IF;
				ELSIF(opCode(1) = '1' AND opCode(0) = '1') THEN
				--THIS is for si (UNUSED AS OF YET)
			
				END IF;
			END IF;
		 	--B-Type
			IF(opCode(3) = '1' AND opCode(2) = '0') THEN
			
			IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for b
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for bal
				c_select <= "10";
				END IF;
			END IF;
		 
		 --J-Type--
			IF(opCode(3) = '1' AND opCode(2) = '1') THEN
			IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for j (UNUSED AS OF YET)

				pc_select <= '1';
				pc_enable <= '1';
				inc_select <= '1';
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for jal (UNUSED AS OF YET)
				pc_enable <= '1';
				c_select <= "10";
				y_select <= "10";
				pc_select <= '1';
				inc_select <= '1';
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for li (UNUSED AS OF YET)
				c_select <="11";
				b_select <= '1';
				pc_select <= '0';
				-- add stw flags (Because we are just storing the immediate value)
				
				END IF;
			END IF;
		 
		 ELSIF(stage = 4) THEN			
			--R-Type instructions
		IF(opCode(3) = '0' AND opCode(2) = '0') THEN
			y_select <= '0';
			IF(opCode(1) = '0' AND opCode(0) = '1') THEN
			--This is for JR, just fill in the values for the if statement
			ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
			--This is for cmp
			
				
			ELSIF(opCode(1)='1' AND opCode(0)='1') THEN
			--This is for sll
				
			ELSIF(opCode(1) = '0' AND opCode(0) = '0') THEN
			--THIS is for the other instructions
			
			IF(opx= "111") THEN
				 --AND instruction
				
				ELSIF(opx = "110") THEN
					--OR INSTRUCTION
				
				ELSIF(opx = "101") THEN
					--XOR instruction
				
				ELSIF(opx = "100") THEN
					--ADD instruction
				
				ELSIF(opx = "011") THEN
					--SUB instruction
				
				
				ELSIF(opx = "010") THEN
					--MULT instruction
				
				ELSIF(opx = "001") THEN
					--ShiftLeftLogical instruction
				
				END IF;
				END IF;
		 END IF;
		 --D-Type--
			IF(opCode(3) = '0' AND opCode(2) = '1') THEN
			IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for lw
				ma_select <= '0';
				mem_read <= '1';
				If(mfc = '1') THEN
				y_select <= '1';
				END IF;
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for sw
				ma_select <= '0';
				mem_write <= '1';
				-- implement wait for MFC (while not mfc) then
				-- do something until it is, then ???
				
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for addi
				
				ELSIF(opCode(1) = '1' AND opCode(0) = '1') THEN
				--THIS is for si (UNUSED AS OF YET)
			
				END IF;
			END IF;
		 	--B-Type
			IF(opCode(3) = '1' AND opCode(2) = '0') THEN
			
			IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for b
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for bal
				
				END IF;
			END IF;
		 	--J-Type
			IF(opCode(3) = '1' AND opCode(2) = '1') THEN
			IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for j (UNUSED AS OF YET)

				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for jal (UNUSED AS OF YET)
			
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for li (UNUSED AS OF YET)
			
				-- add stw flags (Because we are just storing the immediate value)
				
				END IF;
			END IF;
			
		 ELSIF(stage = 5) THEN
		 --R-Type instructions
		IF(opCode(3) = '0' AND opCode(2) = '0') THEN
			rf_write <= '1';
			c_select <= "00";
			IF(opCode(1) = '0' AND opCode(0) = '1') THEN
			--This is for JR
		
			ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
			--This is for cmp
			
				
			ELSIF(opCode(1)='1' AND opCode(0)='1') THEN
			--This is for sll
				
			ELSIF(opCode(1) = '0' AND opCode(0) = '0') THEN
			--THIS is for the other instructions
			
			IF(opx= "111") THEN
				 --AND instruction
				
				ELSIF(opx = "110") THEN
					--OR INSTRUCTION
				
				ELSIF(opx = "101") THEN
					--XOR instruction
				
				ELSIF(opx = "100") THEN
					--ADD instruction
				
				ELSIF(opx = "011") THEN
					--SUB instruction
				
				
				ELSIF(opx = "010") THEN
					--MULT instruction
				
				ELSIF(opx = "001") THEN
					--ShiftLeftLogical instruction
				
				END IF;
				END IF;
		 END IF;
		 --D-Type--
			IF(opCode(3) = '0' AND opCode(2) = '1') THEN
		
			IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for lw
					c_select <="01";
					rf_write <= '1';
				
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for sw
				
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for addi
					c_select <="01";
					rf_write <= '1';
				ELSIF(opCode(1) = '1' AND opCode(0) = '1') THEN
				--THIS is for si (UNUSED AS OF YET)
			
				END IF;
			END IF;
		 	--B-Type
			IF(opCode(3) = '1' AND opCode(2) = '0') THEN
			
			IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for b
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for bal
				
				END IF;
			END IF;
		 	--J-Type
			IF(opCode(3) = '1' AND opCode(2) = '1') THEN
			IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for j (UNUSED AS OF YET)

				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for jal (UNUSED AS OF YET)
			
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for li (UNUSED AS OF YET)
			
				-- add stw flags (Because we are just storing the immediate value)
				
				END IF;
			END IF;
			
				END IF;	
		END IF; -- ENDED MAIN IF OF PROCESS
END PROCESS;	--All	processes	must end
END behavior;	--All	behaivors	must end

