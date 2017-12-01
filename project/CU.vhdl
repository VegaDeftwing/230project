library IEEE;
use IEEE.std_logic_1164.ALL;


entity CU is
	port(
		opCode, Cond : in std_logic_vector(3 downto 0);
      S : in std_logic;
		opx : in std_logic_vector(2 downto 0);
		Immediate : in std_logic_vector(6 downto 0);
		LabelConst : in std_logic_vector(15 downto 0);
		N, C, V, Z, mfc, clock, reset : in std_logic;
		IOkey : in std_logic_vector(3 downto 0);
		alu_op : out std_logic_vector(2 downto 0);
		c_select, y_select : out std_logic_vector(1 downto 0);
		rf_write, b_select, a_inv, b_inv : out std_logic;
		extend : out std_logic_vector(1 downto 0);
		ir_enable, ma_select, mem_read, Mem_write : out std_logic;
		pc_select : out std_logic_vector(1 downto 0);
		pc_enable, inc_select, ps_enable : out std_logic;
		Stage_output: out integer;
		mem_select : out std_logic	
	);
end CU;





ARCHITECTURE behavior OF CU IS
signal wmfc: std_logic;
signal cond_true : std_logic;
shared variable stage: integer:= 0;
BEGIN PROCESS( clock ,	reset ) --Set up the	process	to	be	sensitive	to	clock	and	reset
	BEGIN	--Start	the	process
--in downclock we check if cond is verified. we need to do this or else we cannot operate conditionals.
		--First we make sure that the type is of R, D, or B type	
		IF( falling_edge(clock)) THEN
			IF(opCode = "0000" OR opCode = "0011" OR opCode = "0010" OR opCode = "0001" OR opCode = "0100" OR opCode = "0101" OR opCode = "0110" OR opCode = "0111" OR opCode = "1000" OR opCode = "1001")THEN	
				IF(Cond(3)= '0')THEN
					IF(Cond(2)='0')THEN
						IF(Cond(1)='0')THEN
							IF(Cond(0)='0')THEN
							--Cond is always true when 0000
								cond_true <='1';
							ELSIF(Cond(0)='1')THEN
							--Cond is Never true when 0001
								cond_true <='0';
							END IF;
						ELSIF(Cond(1)='1')THEN
							IF(Cond(0)='0')THEN
							--EQ Condition	
								IF(Z='1')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							ELSIF(Cond(0)='1')THEN
							--NEQ Condition
								IF(Z='0')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							END IF;
						END IF;
					ELSIF(Cond(2)='1')THEN
						IF(Cond(1)='0')THEN
							IF(Cond(0)='0')THEN
							--VS Condition (Overflow)
								IF(V='1')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							ELSIF(Cond(0)='1')THEN
							--VC Condition (No Overflow)
								IF(V='0')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							END IF;
						ELSIF(Cond(1)='1')THEN
							IF(Cond(0)='0')THEN
							--MI Condition (Negative)
								IF(N='1')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							ELSIF(Cond(0)='1')THEN
							--PL Condition (Positive or Zero)
								IF(N='0')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							END IF;
						END IF;					
					END IF;
				ELSIF(Cond(3)= '1')THEN
					IF(Cond(2)='0')THEN
						IF(Cond(1)='0')THEN
							IF(Cond(0)='0')THEN
								--CS Condition (Unsigned higher or same)
								IF(C='1')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							ELSIF(Cond(0)='1')THEN
								--CC Condition (Unsigned lower)
								IF(C='0')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							END IF;
						ELSIF(Cond(1)='1')THEN
							IF(Cond(0)='0')THEN
								--HI Condition (Unsigned Higher)
								IF(C='1' AND Z='0')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							ELSIF(Cond(0)='1')THEN
								--LS Condition (Unsigned Lower or same)
								IF(C='0' OR Z='1')THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							END IF;
						END IF;
					ELSIF(Cond(2)='1')THEN
						IF(Cond(1)='0')THEN
							IF(Cond(0)='0')THEN
								--GT Condition (Greater Than)
								IF(Z='0' AND ((N='1' AND V='1')OR(N='0' AND V='0')))THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							ELSIF(Cond(0)='1')THEN
								--LT Condition (Less Than)
								IF((N='1' AND V='0')OR(Z='0' AND V='1'))THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;	
							END IF;
						ELSIF(Cond(1)='1')THEN
							IF(Cond(0)='0')THEN
								--GE Condition (Greater Than or equal)
								IF((N='1' AND V='1')OR(N='0' AND V='0'))THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;
							ELSIF(Cond(0)='1')THEN
								--LE Condition (Less Than or equal)
								IF(Z='1' OR((N='1' AND V='0') OR (Z='0' AND V='1')))THEN
								cond_true <= '1';
								ELSE
								cond_true <= '0';
								END IF;	
							END IF;
						END IF;
					END IF;
				END IF;		
			END IF;
			IF(opCode="1100" OR opCode="1101" OR opCode="1110")THEN
			cond_true<='1';
			END IF;
		END IF;
		-----------------------------------------------
	IF( rising_edge(clock)) THEN
		IF(reset='1')THEN 
		stage:=0;
		END IF;
		IF((mfc= '1' or wmfc = '0')) THEN 
		stage:= stage mod 5 + 1 ; 
		END IF;
		
		-- instruction fetch
		Stage_output <= stage;
		IF(stage = 1) THEN

		wmfc <= '1';
		alu_op <= "000";
		y_select <= "00";
		c_select <= "00";
		rf_write <= '0';
		b_select <= '0';
		a_inv <= '0';
		b_inv <= '0';
		extend <= "00";
		ir_enable <= '1';
		ma_select <= '1';
		mem_read <= '1';
		mem_write <= '0';
		mem_write <='0';
		pc_select <= "01";
		pc_enable <= mfc;
		inc_select <= '0';
		ps_enable <= '0';
		mem_select<='0';

		--cond_true <= '1';
		-- register load
		ELSIF(stage = 2) THEN
		wmfc <= '0';
		ir_enable <= '0';
		mem_read <= '0';
		pc_enable <= '0';
		
		
		ELSIF(stage = 3 AND cond_true='1') THEN
		--	rf_write <= '1';
			--R-Type instructions
			IF(opCode(3) = '0' AND opCode(2) = '0') THEN
			ps_enable <= S;
	
				IF(opCode(1) = '0' AND opCode(0) = '1') THEN
				--This is for JR, just fill in the values for the if statement
				--help
				pc_select <= "00";
				pc_enable <= '1';
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for cmp
				alu_op <= "011";
				b_inv <= '1';
				ELSIF(opCode(1)='1' AND opCode(0)='1') THEN
				--This is for sll
				--ShiftLeftLogical instruction
				alu_op <= "101";
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
					END IF;
				END IF;
			END IF;
		 	--D-Type
			IF(opCode(3) = '0' AND opCode(2) = '1') THEN
				ps_enable <= S;
			--	c_select <= "01";
				IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for lw
				b_select <= '1';
				alu_op <= "011";
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for sw
				b_select <= '1';
				alu_op <= "011";
					IF(immediate(6)='1' OR immediate(5)='1' OR immediate(4)='1' OR immediate(3)='1') THEN
					extend <= "10";
					END IF;
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for addi
				alu_op <= "011";
				b_select <= '1';
					--how to know when we need to extend?
					IF(immediate(6)='1') THEN
					extend <= "01";
					END IF;
				ELSIF(opCode(1) = '1' AND opCode(0) = '1') THEN
				--THIS is for slli (UNUSED AS OF YET)
				alu_op <= "101";
				b_select <= '1';
				END IF;
			END IF;
		 	--B-Type
			IF(opCode(3) = '1' AND opCode(2) = '0') THEN

				IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for b
				pc_select <= "01";
				pc_enable <= '1';
				inc_select <= '1';
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for bal
			--	c_select <= "10";
				pc_select <= "01";
				pc_enable <= '1';
				inc_select <= '1';
				END IF;
			END IF;
		 
			--J-Type-- (IN PROGRESS)
			IF(opCode(3) = '1' AND opCode(2) = '1') THEN
				IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for j (UNUSED AS OF YET)

				pc_select <= "10";
				pc_enable <= '1';
				inc_select <= '0';
				
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for jal (UNUSED AS OF YET)
				pc_enable <= '1';
				pc_select <= "10";
				inc_select <= '0';
			
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for li (UNUSED AS OF YET)
				
				
				
				
				END IF;
			END IF;
		 
		ELSIF(stage = 4 AND cond_true='1') THEN	
			--IO memory flags--
			IF(IOKey="0000") THEN
				mem_select<='0';
			ELSE
				mem_select<='1';
			END IF;	
			--R-Type instructions
			IF(opCode(3) = '0' AND opCode(2) = '0') THEN
			y_select <= "00";
				IF(opCode(1) = '0' AND opCode(0) = '1') THEN
				--This is for JR, just fill in the values for the if statement
				ma_select <= '1';
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
				IR_enable <= '0';
				If(mfc = '1') THEN
				y_select <= "01";
				END IF;
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for sw
				ma_select <= '0';
				mem_write <= '1';
				--wmfc <= '1';
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
				pc_enable <= '0';
				inc_select <= '0';
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for bal
				y_select <= "10";
				pc_enable <= '0';
				inc_select <= '0';
				END IF;
			END IF;
		 	--J-Type
			IF(opCode(3) = '1' AND opCode(2) = '1') THEN
				IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for j (UNUSED AS OF YET)
				pc_enable <= '0';

				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for jal (UNUSED AS OF YET)
				y_select <= "10";
				pc_enable <= '0';

				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for li (UNUSED AS OF YET)
				y_select <= "11";

				-- add stw flags (Because we are just storing the immediate value)
				
				END IF;
			END IF;
		
		
		ELSIF(stage = 5 AND cond_true='1') THEN
		
			mem_write <= '0';
			--R-Type instructions
			IF(opCode(3) = '0' AND opCode(2) = '0') THEN
			c_select <= "00";
				IF(opCode(1) = '0' AND opCode(0) = '1') THEN
				--This is for JR
							rf_write <= '1';

				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for cmp
				
					
				ELSIF(opCode(1)='1' AND opCode(0)='1') THEN
				--This is for sll
							rf_write <= '1';

				ELSIF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--THIS is for the other instructions
							rf_write <= '1';

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
			c_select <="01";
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
				--THIS is for slli (UNUSED AS OF YET)
					c_select <="01";
					rf_write <= '1';
				END IF;
			END IF;
		 	--B-Type
			IF(opCode(3) = '1' AND opCode(2) = '0') THEN
			
				IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for b
				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for bal
					c_select <= "10";
					rf_write <= '1';
				END IF;
			END IF;
		 	--J-Type
			IF(opCode(3) = '1' AND opCode(2) = '1') THEN
				IF(opCode(1) = '0' AND opCode(0) = '0') THEN
				--This is for j (UNUSED AS OF YET)

				ELSIF(opCode(1)='0' AND opCode(0)='1') THEN
				--This is for jal (UNUSED AS OF YET)
				c_select<= "10";
				rf_write <= '1';
				ELSIF(opCode(1)='1' AND opCode(0)='0') THEN
				--This is for li (UNUSED AS OF YET)
				c_select <="11";
				rf_write <= '1';
	
				
				END IF;
			END IF;
		END IF;
	END IF; -- ENDED MAIN IF OF PROCESS
END PROCESS;	--All	processes	must end
END behavior;	--All	behaivors	must end

