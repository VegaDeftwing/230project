-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 11.1 Build 259 01/25/2012 Service Pack 2 SJ Web Edition"

-- DATE "11/05/2017 18:03:29"

-- 
-- Device: Altera EP2C5T144C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FASTADDER IS
    PORT (
	F : OUT std_logic_vector(15 DOWNTO 0);
	C14 : OUT std_logic;
	C15 : OUT std_logic;
	A : IN std_logic_vector(15 DOWNTO 0);
	B : IN std_logic_vector(15 DOWNTO 0);
	Cin : IN std_logic
	);
END FASTADDER;

-- Design Ports Information
-- F[0]	=>  Location: PIN_101,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[1]	=>  Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[2]	=>  Location: PIN_79,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[3]	=>  Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[4]	=>  Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[5]	=>  Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[6]	=>  Location: PIN_81,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[7]	=>  Location: PIN_96,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[8]	=>  Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[9]	=>  Location: PIN_104,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[10]	=>  Location: PIN_103,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[11]	=>  Location: PIN_75,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[12]	=>  Location: PIN_9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[13]	=>  Location: PIN_80,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[14]	=>  Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F[15]	=>  Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C14	=>  Location: PIN_25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C15	=>  Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- A[0]	=>  Location: PIN_125,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[0]	=>  Location: PIN_122,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Cin	=>  Location: PIN_118,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[1]	=>  Location: PIN_120,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[1]	=>  Location: PIN_92,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[2]	=>  Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[2]	=>  Location: PIN_129,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[3]	=>  Location: PIN_135,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[3]	=>  Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[4]	=>  Location: PIN_126,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[4]	=>  Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[5]	=>  Location: PIN_113,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[5]	=>  Location: PIN_136,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[6]	=>  Location: PIN_119,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[6]	=>  Location: PIN_115,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[7]	=>  Location: PIN_100,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[7]	=>  Location: PIN_112,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[8]	=>  Location: PIN_139,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[8]	=>  Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[9]	=>  Location: PIN_144,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[9]	=>  Location: PIN_142,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[10]	=>  Location: PIN_141,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[10]	=>  Location: PIN_143,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[11]	=>  Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[11]	=>  Location: PIN_4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[12]	=>  Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[12]	=>  Location: PIN_137,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[13]	=>  Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[13]	=>  Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[14]	=>  Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[14]	=>  Location: PIN_22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[15]	=>  Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[15]	=>  Location: PIN_93,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF FASTADDER IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_F : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_C14 : std_logic;
SIGNAL ww_C15 : std_logic;
SIGNAL ww_A : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Cin : std_logic;
SIGNAL \Cin~combout\ : std_logic;
SIGNAL \add0to3|S[0]~0_combout\ : std_logic;
SIGNAL \add0to3|C[1]~1_combout\ : std_logic;
SIGNAL \add0to3|C[1]~0_combout\ : std_logic;
SIGNAL \add0to3|C[2]~2_combout\ : std_logic;
SIGNAL \add0to3|S[2]~1_combout\ : std_logic;
SIGNAL \add0to3|C[3]~4_combout\ : std_logic;
SIGNAL \add0to3|C[3]~5_combout\ : std_logic;
SIGNAL \add0to3|C[3]~3_combout\ : std_logic;
SIGNAL \add0to3|CarryOut~0_combout\ : std_logic;
SIGNAL \add4to7|S[0]~0_combout\ : std_logic;
SIGNAL \add4to7|C[1]~1_combout\ : std_logic;
SIGNAL \add4to7|C[1]~0_combout\ : std_logic;
SIGNAL \add4to7|C[2]~2_combout\ : std_logic;
SIGNAL \add4to7|S[2]~1_combout\ : std_logic;
SIGNAL \add4to7|C[3]~3_combout\ : std_logic;
SIGNAL \add4to7|C[3]~4_combout\ : std_logic;
SIGNAL \add4to7|CarryOut~0_combout\ : std_logic;
SIGNAL \add8to11|S[0]~0_combout\ : std_logic;
SIGNAL \add8to11|C[1]~0_combout\ : std_logic;
SIGNAL \add8to11|C[1]~1_combout\ : std_logic;
SIGNAL \add8to11|C[2]~2_combout\ : std_logic;
SIGNAL \add8to11|S[2]~1_combout\ : std_logic;
SIGNAL \add8to11|C[3]~3_combout\ : std_logic;
SIGNAL \add8to11|C[3]~4_combout\ : std_logic;
SIGNAL \add8to11|CarryOut~0_combout\ : std_logic;
SIGNAL \add12to15|S[0]~0_combout\ : std_logic;
SIGNAL \add12to15|C[1]~1_combout\ : std_logic;
SIGNAL \add12to15|C[1]~0_combout\ : std_logic;
SIGNAL \add12to15|C[2]~2_combout\ : std_logic;
SIGNAL \add12to15|S[2]~1_combout\ : std_logic;
SIGNAL \add12to15|C[3]~3_combout\ : std_logic;
SIGNAL \add12to15|C[3]~4_combout\ : std_logic;
SIGNAL \add12to15|CarryOut~0_combout\ : std_logic;
SIGNAL \A~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \B~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \add0to3|S\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \add12to15|S\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \add8to11|S\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \add4to7|S\ : std_logic_vector(3 DOWNTO 0);

BEGIN

F <= ww_F;
C14 <= ww_C14;
C15 <= ww_C15;
ww_A <= A;
ww_B <= B;
ww_Cin <= Cin;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_122,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(0),
	combout => \B~combout\(0));

-- Location: PIN_125,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(0),
	combout => \A~combout\(0));

-- Location: PIN_118,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Cin~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Cin,
	combout => \Cin~combout\);

-- Location: LCCOMB_X21_Y11_N8
\add0to3|S[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|S[0]~0_combout\ = \B~combout\(0) $ (\A~combout\(0) $ (\Cin~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(0),
	datab => \A~combout\(0),
	datad => \Cin~combout\,
	combout => \add0to3|S[0]~0_combout\);

-- Location: PIN_120,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(1),
	combout => \B~combout\(1));

-- Location: LCCOMB_X21_Y11_N28
\add0to3|C[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|C[1]~1_combout\ = (\Cin~combout\ & ((\B~combout\(0)) # (\A~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(0),
	datab => \A~combout\(0),
	datad => \Cin~combout\,
	combout => \add0to3|C[1]~1_combout\);

-- Location: PIN_92,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(1),
	combout => \A~combout\(1));

-- Location: LCCOMB_X21_Y11_N2
\add0to3|C[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|C[1]~0_combout\ = (\A~combout\(0) & \B~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(0),
	datad => \B~combout\(0),
	combout => \add0to3|C[1]~0_combout\);

-- Location: LCCOMB_X21_Y11_N6
\add0to3|S[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|S\(1) = \B~combout\(1) $ (\A~combout\(1) $ (((\add0to3|C[1]~1_combout\) # (\add0to3|C[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(1),
	datab => \add0to3|C[1]~1_combout\,
	datac => \A~combout\(1),
	datad => \add0to3|C[1]~0_combout\,
	combout => \add0to3|S\(1));

-- Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(2),
	combout => \A~combout\(2));

-- Location: PIN_129,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(2),
	combout => \B~combout\(2));

-- Location: LCCOMB_X21_Y11_N0
\add0to3|C[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|C[2]~2_combout\ = (\B~combout\(1) & ((\add0to3|C[1]~1_combout\) # ((\A~combout\(1)) # (\add0to3|C[1]~0_combout\)))) # (!\B~combout\(1) & (\A~combout\(1) & ((\add0to3|C[1]~1_combout\) # (\add0to3|C[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(1),
	datab => \add0to3|C[1]~1_combout\,
	datac => \A~combout\(1),
	datad => \add0to3|C[1]~0_combout\,
	combout => \add0to3|C[2]~2_combout\);

-- Location: LCCOMB_X21_Y11_N10
\add0to3|S[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|S[2]~1_combout\ = \A~combout\(2) $ (\B~combout\(2) $ (\add0to3|C[2]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(2),
	datac => \B~combout\(2),
	datad => \add0to3|C[2]~2_combout\,
	combout => \add0to3|S[2]~1_combout\);

-- Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(3),
	combout => \A~combout\(3));

-- Location: PIN_135,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(3),
	combout => \B~combout\(3));

-- Location: LCCOMB_X21_Y11_N22
\add0to3|C[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|C[3]~4_combout\ = (\B~combout\(1) & ((\add0to3|C[1]~1_combout\) # ((\A~combout\(1)) # (\add0to3|C[1]~0_combout\)))) # (!\B~combout\(1) & (\A~combout\(1) & ((\add0to3|C[1]~1_combout\) # (\add0to3|C[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(1),
	datab => \add0to3|C[1]~1_combout\,
	datac => \A~combout\(1),
	datad => \add0to3|C[1]~0_combout\,
	combout => \add0to3|C[3]~4_combout\);

-- Location: LCCOMB_X21_Y11_N24
\add0to3|C[3]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|C[3]~5_combout\ = (\add0to3|C[3]~4_combout\ & ((\A~combout\(2)) # (\B~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(2),
	datac => \B~combout\(2),
	datad => \add0to3|C[3]~4_combout\,
	combout => \add0to3|C[3]~5_combout\);

-- Location: LCCOMB_X21_Y11_N12
\add0to3|C[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|C[3]~3_combout\ = (\A~combout\(2) & \B~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(2),
	datac => \B~combout\(2),
	combout => \add0to3|C[3]~3_combout\);

-- Location: LCCOMB_X21_Y11_N26
\add0to3|S[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|S\(3) = \A~combout\(3) $ (\B~combout\(3) $ (((\add0to3|C[3]~5_combout\) # (\add0to3|C[3]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(3),
	datab => \B~combout\(3),
	datac => \add0to3|C[3]~5_combout\,
	datad => \add0to3|C[3]~3_combout\,
	combout => \add0to3|S\(3));

-- Location: PIN_126,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(4),
	combout => \A~combout\(4));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(4),
	combout => \B~combout\(4));

-- Location: LCCOMB_X21_Y11_N4
\add0to3|CarryOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add0to3|CarryOut~0_combout\ = (\A~combout\(3) & ((\B~combout\(3)) # ((\add0to3|C[3]~5_combout\) # (\add0to3|C[3]~3_combout\)))) # (!\A~combout\(3) & (\B~combout\(3) & ((\add0to3|C[3]~5_combout\) # (\add0to3|C[3]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(3),
	datab => \B~combout\(3),
	datac => \add0to3|C[3]~5_combout\,
	datad => \add0to3|C[3]~3_combout\,
	combout => \add0to3|CarryOut~0_combout\);

-- Location: LCCOMB_X24_Y11_N16
\add4to7|S[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|S[0]~0_combout\ = \A~combout\(4) $ (\B~combout\(4) $ (\add0to3|CarryOut~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(4),
	datac => \B~combout\(4),
	datad => \add0to3|CarryOut~0_combout\,
	combout => \add4to7|S[0]~0_combout\);

-- Location: LCCOMB_X24_Y11_N12
\add4to7|C[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|C[1]~1_combout\ = (\add0to3|CarryOut~0_combout\ & ((\A~combout\(4)) # (\B~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(4),
	datac => \B~combout\(4),
	datad => \add0to3|CarryOut~0_combout\,
	combout => \add4to7|C[1]~1_combout\);

-- Location: LCCOMB_X24_Y11_N2
\add4to7|C[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|C[1]~0_combout\ = (\B~combout\(4) & \A~combout\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B~combout\(4),
	datad => \A~combout\(4),
	combout => \add4to7|C[1]~0_combout\);

-- Location: PIN_136,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(5),
	combout => \A~combout\(5));

-- Location: PIN_113,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(5),
	combout => \B~combout\(5));

-- Location: LCCOMB_X24_Y11_N22
\add4to7|S[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|S\(1) = \A~combout\(5) $ (\B~combout\(5) $ (((\add4to7|C[1]~1_combout\) # (\add4to7|C[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add4to7|C[1]~1_combout\,
	datab => \add4to7|C[1]~0_combout\,
	datac => \A~combout\(5),
	datad => \B~combout\(5),
	combout => \add4to7|S\(1));

-- Location: PIN_119,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(6),
	combout => \A~combout\(6));

-- Location: LCCOMB_X24_Y11_N0
\add4to7|C[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|C[2]~2_combout\ = (\A~combout\(5) & ((\add4to7|C[1]~1_combout\) # ((\add4to7|C[1]~0_combout\) # (\B~combout\(5))))) # (!\A~combout\(5) & (\B~combout\(5) & ((\add4to7|C[1]~1_combout\) # (\add4to7|C[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add4to7|C[1]~1_combout\,
	datab => \add4to7|C[1]~0_combout\,
	datac => \A~combout\(5),
	datad => \B~combout\(5),
	combout => \add4to7|C[2]~2_combout\);

-- Location: PIN_115,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(6),
	combout => \B~combout\(6));

-- Location: LCCOMB_X24_Y11_N18
\add4to7|S[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|S[2]~1_combout\ = \A~combout\(6) $ (\add4to7|C[2]~2_combout\ $ (\B~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(6),
	datab => \add4to7|C[2]~2_combout\,
	datac => \B~combout\(6),
	combout => \add4to7|S[2]~1_combout\);

-- Location: PIN_100,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(7),
	combout => \B~combout\(7));

-- Location: LCCOMB_X24_Y11_N28
\add4to7|C[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|C[3]~3_combout\ = (\A~combout\(6) & \B~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(6),
	datac => \B~combout\(6),
	combout => \add4to7|C[3]~3_combout\);

-- Location: PIN_112,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(7),
	combout => \A~combout\(7));

-- Location: LCCOMB_X24_Y11_N30
\add4to7|C[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|C[3]~4_combout\ = (\add4to7|C[2]~2_combout\ & ((\A~combout\(6)) # (\B~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(6),
	datab => \add4to7|C[2]~2_combout\,
	datac => \B~combout\(6),
	combout => \add4to7|C[3]~4_combout\);

-- Location: LCCOMB_X24_Y11_N24
\add4to7|S[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|S\(3) = \B~combout\(7) $ (\A~combout\(7) $ (((\add4to7|C[3]~3_combout\) # (\add4to7|C[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(7),
	datab => \add4to7|C[3]~3_combout\,
	datac => \A~combout\(7),
	datad => \add4to7|C[3]~4_combout\,
	combout => \add4to7|S\(3));

-- Location: LCCOMB_X24_Y11_N26
\add4to7|CarryOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add4to7|CarryOut~0_combout\ = (\B~combout\(7) & ((\add4to7|C[3]~3_combout\) # ((\A~combout\(7)) # (\add4to7|C[3]~4_combout\)))) # (!\B~combout\(7) & (\A~combout\(7) & ((\add4to7|C[3]~3_combout\) # (\add4to7|C[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(7),
	datab => \add4to7|C[3]~3_combout\,
	datac => \A~combout\(7),
	datad => \add4to7|C[3]~4_combout\,
	combout => \add4to7|CarryOut~0_combout\);

-- Location: PIN_139,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(8),
	combout => \A~combout\(8));

-- Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(8),
	combout => \B~combout\(8));

-- Location: LCCOMB_X1_Y12_N0
\add8to11|S[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|S[0]~0_combout\ = \add4to7|CarryOut~0_combout\ $ (\A~combout\(8) $ (\B~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add4to7|CarryOut~0_combout\,
	datab => \A~combout\(8),
	datac => \B~combout\(8),
	combout => \add8to11|S[0]~0_combout\);

-- Location: PIN_144,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(9),
	combout => \B~combout\(9));

-- Location: LCCOMB_X1_Y12_N2
\add8to11|C[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|C[1]~0_combout\ = (\B~combout\(8) & \A~combout\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B~combout\(8),
	datad => \A~combout\(8),
	combout => \add8to11|C[1]~0_combout\);

-- Location: PIN_142,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(9),
	combout => \A~combout\(9));

-- Location: LCCOMB_X1_Y12_N28
\add8to11|C[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|C[1]~1_combout\ = (\add4to7|CarryOut~0_combout\ & ((\A~combout\(8)) # (\B~combout\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add4to7|CarryOut~0_combout\,
	datab => \A~combout\(8),
	datac => \B~combout\(8),
	combout => \add8to11|C[1]~1_combout\);

-- Location: LCCOMB_X1_Y12_N6
\add8to11|S[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|S\(1) = \B~combout\(9) $ (\A~combout\(9) $ (((\add8to11|C[1]~0_combout\) # (\add8to11|C[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(9),
	datab => \add8to11|C[1]~0_combout\,
	datac => \A~combout\(9),
	datad => \add8to11|C[1]~1_combout\,
	combout => \add8to11|S\(1));

-- Location: PIN_141,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(10),
	combout => \A~combout\(10));

-- Location: LCCOMB_X1_Y12_N24
\add8to11|C[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|C[2]~2_combout\ = (\B~combout\(9) & ((\add8to11|C[1]~0_combout\) # ((\A~combout\(9)) # (\add8to11|C[1]~1_combout\)))) # (!\B~combout\(9) & (\A~combout\(9) & ((\add8to11|C[1]~0_combout\) # (\add8to11|C[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(9),
	datab => \add8to11|C[1]~0_combout\,
	datac => \A~combout\(9),
	datad => \add8to11|C[1]~1_combout\,
	combout => \add8to11|C[2]~2_combout\);

-- Location: PIN_143,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(10),
	combout => \B~combout\(10));

-- Location: LCCOMB_X1_Y12_N26
\add8to11|S[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|S[2]~1_combout\ = \A~combout\(10) $ (\add8to11|C[2]~2_combout\ $ (\B~combout\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(10),
	datac => \add8to11|C[2]~2_combout\,
	datad => \B~combout\(10),
	combout => \add8to11|S[2]~1_combout\);

-- Location: LCCOMB_X1_Y12_N12
\add8to11|C[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|C[3]~3_combout\ = (\A~combout\(10) & \B~combout\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A~combout\(10),
	datad => \B~combout\(10),
	combout => \add8to11|C[3]~3_combout\);

-- Location: PIN_4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(11),
	combout => \A~combout\(11));

-- Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(11),
	combout => \B~combout\(11));

-- Location: LCCOMB_X1_Y12_N22
\add8to11|C[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|C[3]~4_combout\ = (\add8to11|C[2]~2_combout\ & ((\A~combout\(10)) # (\B~combout\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(10),
	datac => \add8to11|C[2]~2_combout\,
	datad => \B~combout\(10),
	combout => \add8to11|C[3]~4_combout\);

-- Location: LCCOMB_X1_Y12_N16
\add8to11|S[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|S\(3) = \A~combout\(11) $ (\B~combout\(11) $ (((\add8to11|C[3]~3_combout\) # (\add8to11|C[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add8to11|C[3]~3_combout\,
	datab => \A~combout\(11),
	datac => \B~combout\(11),
	datad => \add8to11|C[3]~4_combout\,
	combout => \add8to11|S\(3));

-- Location: LCCOMB_X1_Y12_N10
\add8to11|CarryOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add8to11|CarryOut~0_combout\ = (\A~combout\(11) & ((\add8to11|C[3]~3_combout\) # ((\B~combout\(11)) # (\add8to11|C[3]~4_combout\)))) # (!\A~combout\(11) & (\B~combout\(11) & ((\add8to11|C[3]~3_combout\) # (\add8to11|C[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add8to11|C[3]~3_combout\,
	datab => \A~combout\(11),
	datac => \B~combout\(11),
	datad => \add8to11|C[3]~4_combout\,
	combout => \add8to11|CarryOut~0_combout\);

-- Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(12),
	combout => \A~combout\(12));

-- Location: PIN_137,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(12),
	combout => \B~combout\(12));

-- Location: LCCOMB_X1_Y6_N0
\add12to15|S[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|S[0]~0_combout\ = \add8to11|CarryOut~0_combout\ $ (\A~combout\(12) $ (\B~combout\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \add8to11|CarryOut~0_combout\,
	datac => \A~combout\(12),
	datad => \B~combout\(12),
	combout => \add12to15|S[0]~0_combout\);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(13),
	combout => \B~combout\(13));

-- Location: LCCOMB_X1_Y6_N28
\add12to15|C[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|C[1]~1_combout\ = (\add8to11|CarryOut~0_combout\ & ((\A~combout\(12)) # (\B~combout\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \add8to11|CarryOut~0_combout\,
	datac => \A~combout\(12),
	datad => \B~combout\(12),
	combout => \add12to15|C[1]~1_combout\);

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(13),
	combout => \A~combout\(13));

-- Location: LCCOMB_X1_Y6_N2
\add12to15|C[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|C[1]~0_combout\ = (\A~combout\(12) & \B~combout\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A~combout\(12),
	datad => \B~combout\(12),
	combout => \add12to15|C[1]~0_combout\);

-- Location: LCCOMB_X1_Y6_N6
\add12to15|S[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|S\(1) = \B~combout\(13) $ (\A~combout\(13) $ (((\add12to15|C[1]~1_combout\) # (\add12to15|C[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(13),
	datab => \add12to15|C[1]~1_combout\,
	datac => \A~combout\(13),
	datad => \add12to15|C[1]~0_combout\,
	combout => \add12to15|S\(1));

-- Location: LCCOMB_X1_Y6_N24
\add12to15|C[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|C[2]~2_combout\ = (\B~combout\(13) & ((\add12to15|C[1]~1_combout\) # ((\A~combout\(13)) # (\add12to15|C[1]~0_combout\)))) # (!\B~combout\(13) & (\A~combout\(13) & ((\add12to15|C[1]~1_combout\) # (\add12to15|C[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(13),
	datab => \add12to15|C[1]~1_combout\,
	datac => \A~combout\(13),
	datad => \add12to15|C[1]~0_combout\,
	combout => \add12to15|C[2]~2_combout\);

-- Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(14),
	combout => \A~combout\(14));

-- Location: PIN_22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(14),
	combout => \B~combout\(14));

-- Location: LCCOMB_X1_Y6_N18
\add12to15|S[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|S[2]~1_combout\ = \add12to15|C[2]~2_combout\ $ (\A~combout\(14) $ (\B~combout\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add12to15|C[2]~2_combout\,
	datab => \A~combout\(14),
	datac => \B~combout\(14),
	combout => \add12to15|S[2]~1_combout\);

-- Location: LCCOMB_X1_Y6_N12
\add12to15|C[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|C[3]~3_combout\ = (\A~combout\(14) & \B~combout\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \A~combout\(14),
	datac => \B~combout\(14),
	combout => \add12to15|C[3]~3_combout\);

-- Location: LCCOMB_X1_Y6_N30
\add12to15|C[3]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|C[3]~4_combout\ = (\add12to15|C[2]~2_combout\ & ((\A~combout\(14)) # (\B~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add12to15|C[2]~2_combout\,
	datab => \A~combout\(14),
	datac => \B~combout\(14),
	combout => \add12to15|C[3]~4_combout\);

-- Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(15),
	combout => \B~combout\(15));

-- Location: PIN_93,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(15),
	combout => \A~combout\(15));

-- Location: LCCOMB_X1_Y6_N16
\add12to15|S[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|S\(3) = \B~combout\(15) $ (\A~combout\(15) $ (((\add12to15|C[3]~3_combout\) # (\add12to15|C[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add12to15|C[3]~3_combout\,
	datab => \add12to15|C[3]~4_combout\,
	datac => \B~combout\(15),
	datad => \A~combout\(15),
	combout => \add12to15|S\(3));

-- Location: LCCOMB_X1_Y6_N26
\add12to15|CarryOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \add12to15|CarryOut~0_combout\ = (\B~combout\(15) & ((\add12to15|C[3]~3_combout\) # ((\add12to15|C[3]~4_combout\) # (\A~combout\(15))))) # (!\B~combout\(15) & (\A~combout\(15) & ((\add12to15|C[3]~3_combout\) # (\add12to15|C[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add12to15|C[3]~3_combout\,
	datab => \add12to15|C[3]~4_combout\,
	datac => \B~combout\(15),
	datad => \A~combout\(15),
	combout => \add12to15|CarryOut~0_combout\);

-- Location: PIN_101,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add0to3|S[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(0));

-- Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add0to3|S\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(1));

-- Location: PIN_79,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add0to3|S[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(2));

-- Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add0to3|S\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(3));

-- Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add4to7|S[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(4));

-- Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add4to7|S\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(5));

-- Location: PIN_81,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add4to7|S[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(6));

-- Location: PIN_96,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add4to7|S\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(7));

-- Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add8to11|S[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(8));

-- Location: PIN_104,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add8to11|S\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(9));

-- Location: PIN_103,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add8to11|S[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(10));

-- Location: PIN_75,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add8to11|S\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(11));

-- Location: PIN_9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add12to15|S[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(12));

-- Location: PIN_80,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add12to15|S\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(13));

-- Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add12to15|S[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(14));

-- Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add12to15|S\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F(15));

-- Location: PIN_25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C14~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add12to15|S\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C14);

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C15~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \add12to15|CarryOut~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C15);
END structure;


