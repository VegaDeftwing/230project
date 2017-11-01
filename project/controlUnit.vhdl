LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controlUnit is
	PORT{
		Op,Cond											:IN STD_LOGIC_VECTOR(2 downto 0);
		S,mfc,clock,reset								:IN STD_LOGIC;
		opx												:IN STD_LOGIC_VECTOR(2 downto 0);
			
		-- These outputs are control signals for the
		-- datapath section.  They control mux's and
		-- what op the ALU does, and whether to write
		-- back to the register file
		alu_op, c_select, y_select						:OUT STD_LOGIC_VECTOR(1 downto 0);
		rf_write, b_select, a_inv, b_inv				:OUT STD_LOGIC;
		
		-- These outputs are control signals for the 
		-- memory interface and for the instruction
		-- register.  They choose what address to load
		-- from, to read or write.
		extend											:OUT STD_LOGIC_VECTOR(1 downto 0);
		ir_enable, ma_select, mem_read, mem_write		:OUT STD_LOGIC_VECTOR(1 downto 0);
		
		-- These outputs are control signals for the
		-- instruction address generator.  They decide
		-- if we move onto the next instruction, which
		-- instruction
		pc_select, pc_enable, inc_select				:OUT STD_LOGIC;
	}
END controlUnit;

ARCHITECTURE arch OF controlUnit IS
	SIGNAL wmfc:STD_LOGIC;
	SHARED VARIABLE stage: INTEGER:= 0;
BEGIN
	PROCESS(clock, reset)
	BEGIN
		-- We only want to operate on when the
		-- clock switches on
		IF(RISING_EDGE(clock)) THEN
			-- If the reset is 1 then we will set the stage back to zero
			IF(reset = '1') THEN
				stage := 0;
			END IF;
			-- As long as the memory is ready and the internal signal is off
			-- we change to the next stage
			IF(mfc = '1' OR wmfc = '0') THEN
				stage := stage mod 5 + 1;
			END IF;
			
			IF(stage = 1) THEN
				wmfc <= '1';
				alu_op <= '1';
				c_select <= "00";
				y_select <= "00";
				rf_write <= '0';
				b_select <= '0';
				a_inv <= '0';
				b_inv <= '0';
				extend <= "00";
				ir_enable <= '1';
				mem_read <= '1';
				ma_select <= '1';
				mem_write <= '0';
				pc_select <= '1';
				pc_enable <= '1';
				inc_select <= '0';
			ELSIF(stage = 2) THEN
				wmfc <= '0';
				ir_enable <= '0';
				mem_read <= '0';
				pc_enable <= '0';
			ELSIF(stage = 3) THEN
				-- R-type instruction.  Set the control signals
				-- for R-type instructions here by using if statements
				-- to determine what type of instruction
				IF()
			END IF;
		END IF;
			