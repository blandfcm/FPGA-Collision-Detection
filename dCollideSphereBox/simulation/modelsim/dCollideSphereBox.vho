-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"

-- DATE "06/16/2016 14:21:23"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	dCollideSphereBox IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	x1 : IN std_logic_vector(31 DOWNTO 0);
	y1 : IN std_logic_vector(31 DOWNTO 0);
	z1 : IN std_logic_vector(31 DOWNTO 0);
	x2 : IN std_logic_vector(31 DOWNTO 0);
	y2 : IN std_logic_vector(31 DOWNTO 0);
	z2 : IN std_logic_vector(31 DOWNTO 0);
	r0 : INOUT std_logic_vector(31 DOWNTO 0);
	r1 : INOUT std_logic_vector(31 DOWNTO 0);
	r2 : INOUT std_logic_vector(31 DOWNTO 0);
	r4 : INOUT std_logic_vector(31 DOWNTO 0);
	r5 : INOUT std_logic_vector(31 DOWNTO 0);
	r6 : INOUT std_logic_vector(31 DOWNTO 0);
	r8 : INOUT std_logic_vector(31 DOWNTO 0);
	r9 : IN std_logic_vector(31 DOWNTO 0);
	r10 : IN std_logic_vector(31 DOWNTO 0);
	ret : OUT std_logic;
	done : OUT std_logic
	);
END dCollideSphereBox;

-- Design Ports Information
-- rst	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ret	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- done	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[23]	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[24]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[25]	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[26]	=>  Location: PIN_AG3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[27]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[28]	=>  Location: PIN_AE5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[29]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[30]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[0]	=>  Location: PIN_AF3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[1]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[2]	=>  Location: PIN_AG4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[3]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[4]	=>  Location: PIN_AD8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[5]	=>  Location: PIN_AC7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[6]	=>  Location: PIN_AG6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[7]	=>  Location: PIN_AH6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[8]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[9]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[10]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[11]	=>  Location: PIN_AG7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[12]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[13]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[14]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[15]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[16]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[17]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[18]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[19]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[20]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[21]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[22]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[23]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[24]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[25]	=>  Location: PIN_AE10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[26]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[27]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[28]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[29]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[30]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[0]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[1]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[2]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[3]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[4]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[5]	=>  Location: PIN_AH11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[6]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[7]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[8]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[9]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[10]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[11]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[12]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[13]	=>  Location: PIN_AC11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[14]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[15]	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[16]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[17]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[18]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[19]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[20]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[21]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[22]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[23]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[24]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[25]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[26]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[27]	=>  Location: PIN_AG14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[28]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[29]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[30]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[0]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[1]	=>  Location: PIN_AG15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[2]	=>  Location: PIN_AH15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[3]	=>  Location: PIN_AC15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[4]	=>  Location: PIN_AD15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[5]	=>  Location: PIN_AE15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[6]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[7]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[8]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[9]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[10]	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[11]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[12]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[13]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[14]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[15]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[16]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[17]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[18]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[19]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[20]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[21]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[22]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[23]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[24]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[25]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[26]	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[27]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[28]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[29]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[30]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[0]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[1]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[2]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[3]	=>  Location: PIN_AE20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[4]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[5]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[6]	=>  Location: PIN_AE21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[7]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[8]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[9]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[10]	=>  Location: PIN_AE25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[11]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[12]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[13]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[14]	=>  Location: PIN_AC19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[15]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[16]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[17]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[18]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[19]	=>  Location: PIN_AF22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[20]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[21]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[22]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[23]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[24]	=>  Location: PIN_AC21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[25]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[26]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[27]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[28]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[29]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[30]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[0]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[1]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[2]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[3]	=>  Location: PIN_AD22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[4]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[5]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[6]	=>  Location: PIN_AH26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[7]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[8]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[9]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[10]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[11]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[12]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[13]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[14]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[15]	=>  Location: PIN_AF27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[16]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[17]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[18]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[19]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[20]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[21]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[22]	=>  Location: PIN_AD28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[23]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[24]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[25]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[26]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[27]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[28]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[29]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[30]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[1]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[2]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[3]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[4]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[5]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[6]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[7]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[8]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[9]	=>  Location: PIN_V28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[10]	=>  Location: PIN_V27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[11]	=>  Location: PIN_V26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[12]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[13]	=>  Location: PIN_V24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[14]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[15]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[16]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[17]	=>  Location: PIN_V22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[18]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[19]	=>  Location: PIN_U26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[20]	=>  Location: PIN_U25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[21]	=>  Location: PIN_U28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[22]	=>  Location: PIN_U27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[23]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[24]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[25]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[26]	=>  Location: PIN_T26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[27]	=>  Location: PIN_T25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[28]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[29]	=>  Location: PIN_T21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[30]	=>  Location: PIN_R26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[0]	=>  Location: PIN_R25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[1]	=>  Location: PIN_R28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[2]	=>  Location: PIN_R27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[4]	=>  Location: PIN_R23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[5]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[6]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[7]	=>  Location: PIN_P21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[8]	=>  Location: PIN_Y28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[9]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[10]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[11]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[12]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[13]	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[14]	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[15]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[16]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[17]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[18]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[19]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[20]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[21]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[22]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[23]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[24]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[25]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[26]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[27]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[28]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[29]	=>  Location: PIN_V3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[30]	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[0]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[1]	=>  Location: PIN_AB2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[2]	=>  Location: PIN_AB1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[3]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[4]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[5]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[6]	=>  Location: PIN_U5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[7]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[8]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[9]	=>  Location: PIN_AC2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[10]	=>  Location: PIN_AC1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[11]	=>  Location: PIN_AC3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[12]	=>  Location: PIN_AD3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[13]	=>  Location: PIN_AD2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[14]	=>  Location: PIN_AD1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[15]	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[16]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[17]	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[18]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[19]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[20]	=>  Location: PIN_AE2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[21]	=>  Location: PIN_AE1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[22]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z2[31]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2[31]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x2[31]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z1[31]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1[31]	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x1[31]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r10[31]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r9[31]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[0]	=>  Location: PIN_C26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[1]	=>  Location: PIN_A22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[2]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[3]	=>  Location: PIN_B26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[4]	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[5]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[6]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[7]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[8]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[9]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[10]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[11]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[12]	=>  Location: PIN_A26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[13]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[14]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[15]	=>  Location: PIN_A25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[16]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[17]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[18]	=>  Location: PIN_B25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[19]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[20]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[21]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[22]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[23]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[24]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[25]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[26]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[27]	=>  Location: PIN_D25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[28]	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[29]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[30]	=>  Location: PIN_C25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r0[31]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[0]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[1]	=>  Location: PIN_A23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[3]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[4]	=>  Location: PIN_B23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[5]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[6]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[7]	=>  Location: PIN_D23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[8]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[9]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[10]	=>  Location: PIN_C23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[11]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[12]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[13]	=>  Location: PIN_C24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[14]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[15]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[16]	=>  Location: PIN_D24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[17]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[18]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[19]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[20]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[21]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[22]	=>  Location: PIN_D21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[23]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[24]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[25]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[26]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[27]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[28]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[29]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[30]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r1[31]	=>  Location: PIN_C21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[0]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[1]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[2]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[3]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[4]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[5]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[6]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[7]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[8]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[9]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[10]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[11]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[12]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[13]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[14]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[15]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[16]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[17]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[18]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[19]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[20]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[21]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[22]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[23]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[24]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[25]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[26]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[27]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[28]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[29]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[30]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r2[31]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[0]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[1]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[2]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[3]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[4]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[5]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[6]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[7]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[8]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[9]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[10]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[11]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[12]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[13]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[14]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[15]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[16]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[17]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[18]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[19]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[20]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[21]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[22]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[23]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[24]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[25]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[26]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[27]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[28]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[29]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[30]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r4[31]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[0]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[1]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[2]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[3]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[4]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[5]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[6]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[7]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[8]	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[9]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[10]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[11]	=>  Location: PIN_L23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[12]	=>  Location: PIN_D28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[13]	=>  Location: PIN_K28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[14]	=>  Location: PIN_D27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[15]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[16]	=>  Location: PIN_K27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[17]	=>  Location: PIN_C27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[18]	=>  Location: PIN_P26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[19]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[20]	=>  Location: PIN_D26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[21]	=>  Location: PIN_P25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[22]	=>  Location: PIN_J26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[23]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[24]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[25]	=>  Location: PIN_J25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[26]	=>  Location: PIN_L21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[27]	=>  Location: PIN_P27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[28]	=>  Location: PIN_G28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[29]	=>  Location: PIN_J24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[30]	=>  Location: PIN_N26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r5[31]	=>  Location: PIN_G27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[0]	=>  Location: PIN_J23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[1]	=>  Location: PIN_N25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[2]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[3]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[4]	=>  Location: PIN_M28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[5]	=>  Location: PIN_K26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[6]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[7]	=>  Location: PIN_M27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[8]	=>  Location: PIN_K25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[9]	=>  Location: PIN_H24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[10]	=>  Location: PIN_M26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[11]	=>  Location: PIN_F28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[12]	=>  Location: PIN_H23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[13]	=>  Location: PIN_M25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[14]	=>  Location: PIN_F27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[15]	=>  Location: PIN_G26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[16]	=>  Location: PIN_L28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[17]	=>  Location: PIN_E28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[18]	=>  Location: PIN_G25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[19]	=>  Location: PIN_L27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[20]	=>  Location: PIN_E27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[21]	=>  Location: PIN_F25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[22]	=>  Location: PIN_L24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[23]	=>  Location: PIN_H26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[24]	=>  Location: PIN_F24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[25]	=>  Location: PIN_H25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[26]	=>  Location: PIN_G24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[27]	=>  Location: PIN_E26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[28]	=>  Location: PIN_G23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[29]	=>  Location: PIN_F26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[30]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r6[31]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[0]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[1]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[2]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[3]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[4]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[5]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[6]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[7]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[8]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[9]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[10]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[11]	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[12]	=>  Location: PIN_J4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[13]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[14]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[15]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[16]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[17]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[18]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[19]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[20]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[21]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[22]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[23]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[24]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[25]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[26]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[27]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[28]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[29]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[30]	=>  Location: PIN_K4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r8[31]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF dCollideSphereBox IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_x1 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_y1 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_z1 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_x2 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_y2 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_z2 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_r9 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_r10 : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_ret : std_logic;
SIGNAL ww_done : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \r10[23]~input_o\ : std_logic;
SIGNAL \r10[24]~input_o\ : std_logic;
SIGNAL \r10[25]~input_o\ : std_logic;
SIGNAL \r10[26]~input_o\ : std_logic;
SIGNAL \r10[27]~input_o\ : std_logic;
SIGNAL \r10[28]~input_o\ : std_logic;
SIGNAL \r10[29]~input_o\ : std_logic;
SIGNAL \r10[30]~input_o\ : std_logic;
SIGNAL \r10[0]~input_o\ : std_logic;
SIGNAL \r10[1]~input_o\ : std_logic;
SIGNAL \r10[2]~input_o\ : std_logic;
SIGNAL \r10[3]~input_o\ : std_logic;
SIGNAL \r10[4]~input_o\ : std_logic;
SIGNAL \r10[5]~input_o\ : std_logic;
SIGNAL \r10[6]~input_o\ : std_logic;
SIGNAL \r10[7]~input_o\ : std_logic;
SIGNAL \r10[8]~input_o\ : std_logic;
SIGNAL \r10[9]~input_o\ : std_logic;
SIGNAL \r10[10]~input_o\ : std_logic;
SIGNAL \r10[11]~input_o\ : std_logic;
SIGNAL \r10[12]~input_o\ : std_logic;
SIGNAL \r10[13]~input_o\ : std_logic;
SIGNAL \r10[14]~input_o\ : std_logic;
SIGNAL \r10[15]~input_o\ : std_logic;
SIGNAL \r10[16]~input_o\ : std_logic;
SIGNAL \r10[17]~input_o\ : std_logic;
SIGNAL \r10[18]~input_o\ : std_logic;
SIGNAL \r10[19]~input_o\ : std_logic;
SIGNAL \r10[20]~input_o\ : std_logic;
SIGNAL \r10[21]~input_o\ : std_logic;
SIGNAL \r10[22]~input_o\ : std_logic;
SIGNAL \r9[23]~input_o\ : std_logic;
SIGNAL \r9[24]~input_o\ : std_logic;
SIGNAL \r9[25]~input_o\ : std_logic;
SIGNAL \r9[26]~input_o\ : std_logic;
SIGNAL \r9[27]~input_o\ : std_logic;
SIGNAL \r9[28]~input_o\ : std_logic;
SIGNAL \r9[29]~input_o\ : std_logic;
SIGNAL \r9[30]~input_o\ : std_logic;
SIGNAL \r9[0]~input_o\ : std_logic;
SIGNAL \r9[1]~input_o\ : std_logic;
SIGNAL \r9[2]~input_o\ : std_logic;
SIGNAL \r9[3]~input_o\ : std_logic;
SIGNAL \r9[4]~input_o\ : std_logic;
SIGNAL \r9[5]~input_o\ : std_logic;
SIGNAL \r9[6]~input_o\ : std_logic;
SIGNAL \r9[7]~input_o\ : std_logic;
SIGNAL \r9[8]~input_o\ : std_logic;
SIGNAL \r9[9]~input_o\ : std_logic;
SIGNAL \r9[10]~input_o\ : std_logic;
SIGNAL \r9[11]~input_o\ : std_logic;
SIGNAL \r9[12]~input_o\ : std_logic;
SIGNAL \r9[13]~input_o\ : std_logic;
SIGNAL \r9[14]~input_o\ : std_logic;
SIGNAL \r9[15]~input_o\ : std_logic;
SIGNAL \r9[16]~input_o\ : std_logic;
SIGNAL \r9[17]~input_o\ : std_logic;
SIGNAL \r9[18]~input_o\ : std_logic;
SIGNAL \r9[19]~input_o\ : std_logic;
SIGNAL \r9[20]~input_o\ : std_logic;
SIGNAL \r9[21]~input_o\ : std_logic;
SIGNAL \r9[22]~input_o\ : std_logic;
SIGNAL \z2[23]~input_o\ : std_logic;
SIGNAL \z2[24]~input_o\ : std_logic;
SIGNAL \z2[25]~input_o\ : std_logic;
SIGNAL \z2[26]~input_o\ : std_logic;
SIGNAL \z2[27]~input_o\ : std_logic;
SIGNAL \z2[28]~input_o\ : std_logic;
SIGNAL \z2[29]~input_o\ : std_logic;
SIGNAL \z2[30]~input_o\ : std_logic;
SIGNAL \z2[0]~input_o\ : std_logic;
SIGNAL \z2[1]~input_o\ : std_logic;
SIGNAL \z2[2]~input_o\ : std_logic;
SIGNAL \z2[3]~input_o\ : std_logic;
SIGNAL \z2[4]~input_o\ : std_logic;
SIGNAL \z2[5]~input_o\ : std_logic;
SIGNAL \z2[6]~input_o\ : std_logic;
SIGNAL \z2[7]~input_o\ : std_logic;
SIGNAL \z2[8]~input_o\ : std_logic;
SIGNAL \z2[9]~input_o\ : std_logic;
SIGNAL \z2[10]~input_o\ : std_logic;
SIGNAL \z2[11]~input_o\ : std_logic;
SIGNAL \z2[12]~input_o\ : std_logic;
SIGNAL \z2[13]~input_o\ : std_logic;
SIGNAL \z2[14]~input_o\ : std_logic;
SIGNAL \z2[15]~input_o\ : std_logic;
SIGNAL \z2[16]~input_o\ : std_logic;
SIGNAL \z2[17]~input_o\ : std_logic;
SIGNAL \z2[18]~input_o\ : std_logic;
SIGNAL \z2[19]~input_o\ : std_logic;
SIGNAL \z2[20]~input_o\ : std_logic;
SIGNAL \z2[21]~input_o\ : std_logic;
SIGNAL \z2[22]~input_o\ : std_logic;
SIGNAL \y2[23]~input_o\ : std_logic;
SIGNAL \y2[24]~input_o\ : std_logic;
SIGNAL \y2[25]~input_o\ : std_logic;
SIGNAL \y2[26]~input_o\ : std_logic;
SIGNAL \y2[27]~input_o\ : std_logic;
SIGNAL \y2[28]~input_o\ : std_logic;
SIGNAL \y2[29]~input_o\ : std_logic;
SIGNAL \y2[30]~input_o\ : std_logic;
SIGNAL \y2[0]~input_o\ : std_logic;
SIGNAL \y2[1]~input_o\ : std_logic;
SIGNAL \y2[2]~input_o\ : std_logic;
SIGNAL \y2[3]~input_o\ : std_logic;
SIGNAL \y2[4]~input_o\ : std_logic;
SIGNAL \y2[5]~input_o\ : std_logic;
SIGNAL \y2[6]~input_o\ : std_logic;
SIGNAL \y2[7]~input_o\ : std_logic;
SIGNAL \y2[8]~input_o\ : std_logic;
SIGNAL \y2[9]~input_o\ : std_logic;
SIGNAL \y2[10]~input_o\ : std_logic;
SIGNAL \y2[11]~input_o\ : std_logic;
SIGNAL \y2[12]~input_o\ : std_logic;
SIGNAL \y2[13]~input_o\ : std_logic;
SIGNAL \y2[14]~input_o\ : std_logic;
SIGNAL \y2[15]~input_o\ : std_logic;
SIGNAL \y2[16]~input_o\ : std_logic;
SIGNAL \y2[17]~input_o\ : std_logic;
SIGNAL \y2[18]~input_o\ : std_logic;
SIGNAL \y2[19]~input_o\ : std_logic;
SIGNAL \y2[20]~input_o\ : std_logic;
SIGNAL \y2[21]~input_o\ : std_logic;
SIGNAL \y2[22]~input_o\ : std_logic;
SIGNAL \x2[23]~input_o\ : std_logic;
SIGNAL \x2[24]~input_o\ : std_logic;
SIGNAL \x2[25]~input_o\ : std_logic;
SIGNAL \x2[26]~input_o\ : std_logic;
SIGNAL \x2[27]~input_o\ : std_logic;
SIGNAL \x2[28]~input_o\ : std_logic;
SIGNAL \x2[29]~input_o\ : std_logic;
SIGNAL \x2[30]~input_o\ : std_logic;
SIGNAL \x2[0]~input_o\ : std_logic;
SIGNAL \x2[1]~input_o\ : std_logic;
SIGNAL \x2[2]~input_o\ : std_logic;
SIGNAL \x2[3]~input_o\ : std_logic;
SIGNAL \x2[4]~input_o\ : std_logic;
SIGNAL \x2[5]~input_o\ : std_logic;
SIGNAL \x2[6]~input_o\ : std_logic;
SIGNAL \x2[7]~input_o\ : std_logic;
SIGNAL \x2[8]~input_o\ : std_logic;
SIGNAL \x2[9]~input_o\ : std_logic;
SIGNAL \x2[10]~input_o\ : std_logic;
SIGNAL \x2[11]~input_o\ : std_logic;
SIGNAL \x2[12]~input_o\ : std_logic;
SIGNAL \x2[13]~input_o\ : std_logic;
SIGNAL \x2[14]~input_o\ : std_logic;
SIGNAL \x2[15]~input_o\ : std_logic;
SIGNAL \x2[16]~input_o\ : std_logic;
SIGNAL \x2[17]~input_o\ : std_logic;
SIGNAL \x2[18]~input_o\ : std_logic;
SIGNAL \x2[19]~input_o\ : std_logic;
SIGNAL \x2[20]~input_o\ : std_logic;
SIGNAL \x2[21]~input_o\ : std_logic;
SIGNAL \x2[22]~input_o\ : std_logic;
SIGNAL \z1[23]~input_o\ : std_logic;
SIGNAL \z1[24]~input_o\ : std_logic;
SIGNAL \z1[25]~input_o\ : std_logic;
SIGNAL \z1[26]~input_o\ : std_logic;
SIGNAL \z1[27]~input_o\ : std_logic;
SIGNAL \z1[28]~input_o\ : std_logic;
SIGNAL \z1[29]~input_o\ : std_logic;
SIGNAL \z1[30]~input_o\ : std_logic;
SIGNAL \z1[0]~input_o\ : std_logic;
SIGNAL \z1[1]~input_o\ : std_logic;
SIGNAL \z1[2]~input_o\ : std_logic;
SIGNAL \z1[3]~input_o\ : std_logic;
SIGNAL \z1[4]~input_o\ : std_logic;
SIGNAL \z1[5]~input_o\ : std_logic;
SIGNAL \z1[6]~input_o\ : std_logic;
SIGNAL \z1[7]~input_o\ : std_logic;
SIGNAL \z1[8]~input_o\ : std_logic;
SIGNAL \z1[9]~input_o\ : std_logic;
SIGNAL \z1[10]~input_o\ : std_logic;
SIGNAL \z1[11]~input_o\ : std_logic;
SIGNAL \z1[12]~input_o\ : std_logic;
SIGNAL \z1[13]~input_o\ : std_logic;
SIGNAL \z1[14]~input_o\ : std_logic;
SIGNAL \z1[15]~input_o\ : std_logic;
SIGNAL \z1[16]~input_o\ : std_logic;
SIGNAL \z1[17]~input_o\ : std_logic;
SIGNAL \z1[18]~input_o\ : std_logic;
SIGNAL \z1[19]~input_o\ : std_logic;
SIGNAL \z1[20]~input_o\ : std_logic;
SIGNAL \z1[21]~input_o\ : std_logic;
SIGNAL \z1[22]~input_o\ : std_logic;
SIGNAL \y1[23]~input_o\ : std_logic;
SIGNAL \y1[24]~input_o\ : std_logic;
SIGNAL \y1[25]~input_o\ : std_logic;
SIGNAL \y1[26]~input_o\ : std_logic;
SIGNAL \y1[27]~input_o\ : std_logic;
SIGNAL \y1[28]~input_o\ : std_logic;
SIGNAL \y1[29]~input_o\ : std_logic;
SIGNAL \y1[30]~input_o\ : std_logic;
SIGNAL \y1[0]~input_o\ : std_logic;
SIGNAL \y1[1]~input_o\ : std_logic;
SIGNAL \y1[2]~input_o\ : std_logic;
SIGNAL \y1[3]~input_o\ : std_logic;
SIGNAL \y1[4]~input_o\ : std_logic;
SIGNAL \y1[5]~input_o\ : std_logic;
SIGNAL \y1[6]~input_o\ : std_logic;
SIGNAL \y1[7]~input_o\ : std_logic;
SIGNAL \y1[8]~input_o\ : std_logic;
SIGNAL \y1[9]~input_o\ : std_logic;
SIGNAL \y1[10]~input_o\ : std_logic;
SIGNAL \y1[11]~input_o\ : std_logic;
SIGNAL \y1[12]~input_o\ : std_logic;
SIGNAL \y1[13]~input_o\ : std_logic;
SIGNAL \y1[14]~input_o\ : std_logic;
SIGNAL \y1[15]~input_o\ : std_logic;
SIGNAL \y1[16]~input_o\ : std_logic;
SIGNAL \y1[17]~input_o\ : std_logic;
SIGNAL \y1[18]~input_o\ : std_logic;
SIGNAL \y1[19]~input_o\ : std_logic;
SIGNAL \y1[20]~input_o\ : std_logic;
SIGNAL \y1[21]~input_o\ : std_logic;
SIGNAL \y1[22]~input_o\ : std_logic;
SIGNAL \x1[23]~input_o\ : std_logic;
SIGNAL \x1[24]~input_o\ : std_logic;
SIGNAL \x1[25]~input_o\ : std_logic;
SIGNAL \x1[26]~input_o\ : std_logic;
SIGNAL \x1[27]~input_o\ : std_logic;
SIGNAL \x1[28]~input_o\ : std_logic;
SIGNAL \x1[29]~input_o\ : std_logic;
SIGNAL \x1[30]~input_o\ : std_logic;
SIGNAL \x1[0]~input_o\ : std_logic;
SIGNAL \x1[1]~input_o\ : std_logic;
SIGNAL \x1[2]~input_o\ : std_logic;
SIGNAL \x1[3]~input_o\ : std_logic;
SIGNAL \x1[4]~input_o\ : std_logic;
SIGNAL \x1[5]~input_o\ : std_logic;
SIGNAL \x1[6]~input_o\ : std_logic;
SIGNAL \x1[7]~input_o\ : std_logic;
SIGNAL \x1[8]~input_o\ : std_logic;
SIGNAL \x1[9]~input_o\ : std_logic;
SIGNAL \x1[10]~input_o\ : std_logic;
SIGNAL \x1[11]~input_o\ : std_logic;
SIGNAL \x1[12]~input_o\ : std_logic;
SIGNAL \x1[13]~input_o\ : std_logic;
SIGNAL \x1[14]~input_o\ : std_logic;
SIGNAL \x1[15]~input_o\ : std_logic;
SIGNAL \x1[16]~input_o\ : std_logic;
SIGNAL \x1[17]~input_o\ : std_logic;
SIGNAL \x1[18]~input_o\ : std_logic;
SIGNAL \x1[19]~input_o\ : std_logic;
SIGNAL \x1[20]~input_o\ : std_logic;
SIGNAL \x1[21]~input_o\ : std_logic;
SIGNAL \x1[22]~input_o\ : std_logic;
SIGNAL \z2[31]~input_o\ : std_logic;
SIGNAL \y2[31]~input_o\ : std_logic;
SIGNAL \x2[31]~input_o\ : std_logic;
SIGNAL \z1[31]~input_o\ : std_logic;
SIGNAL \y1[31]~input_o\ : std_logic;
SIGNAL \x1[31]~input_o\ : std_logic;
SIGNAL \r10[31]~input_o\ : std_logic;
SIGNAL \r9[31]~input_o\ : std_logic;
SIGNAL \r0[0]~input_o\ : std_logic;
SIGNAL \r0[1]~input_o\ : std_logic;
SIGNAL \r0[2]~input_o\ : std_logic;
SIGNAL \r0[3]~input_o\ : std_logic;
SIGNAL \r0[4]~input_o\ : std_logic;
SIGNAL \r0[5]~input_o\ : std_logic;
SIGNAL \r0[6]~input_o\ : std_logic;
SIGNAL \r0[7]~input_o\ : std_logic;
SIGNAL \r0[8]~input_o\ : std_logic;
SIGNAL \r0[9]~input_o\ : std_logic;
SIGNAL \r0[10]~input_o\ : std_logic;
SIGNAL \r0[11]~input_o\ : std_logic;
SIGNAL \r0[12]~input_o\ : std_logic;
SIGNAL \r0[13]~input_o\ : std_logic;
SIGNAL \r0[14]~input_o\ : std_logic;
SIGNAL \r0[15]~input_o\ : std_logic;
SIGNAL \r0[16]~input_o\ : std_logic;
SIGNAL \r0[17]~input_o\ : std_logic;
SIGNAL \r0[18]~input_o\ : std_logic;
SIGNAL \r0[19]~input_o\ : std_logic;
SIGNAL \r0[20]~input_o\ : std_logic;
SIGNAL \r0[21]~input_o\ : std_logic;
SIGNAL \r0[22]~input_o\ : std_logic;
SIGNAL \r0[23]~input_o\ : std_logic;
SIGNAL \r0[24]~input_o\ : std_logic;
SIGNAL \r0[25]~input_o\ : std_logic;
SIGNAL \r0[26]~input_o\ : std_logic;
SIGNAL \r0[27]~input_o\ : std_logic;
SIGNAL \r0[28]~input_o\ : std_logic;
SIGNAL \r0[29]~input_o\ : std_logic;
SIGNAL \r0[30]~input_o\ : std_logic;
SIGNAL \r0[31]~input_o\ : std_logic;
SIGNAL \r1[0]~input_o\ : std_logic;
SIGNAL \r1[1]~input_o\ : std_logic;
SIGNAL \r1[2]~input_o\ : std_logic;
SIGNAL \r1[3]~input_o\ : std_logic;
SIGNAL \r1[4]~input_o\ : std_logic;
SIGNAL \r1[5]~input_o\ : std_logic;
SIGNAL \r1[6]~input_o\ : std_logic;
SIGNAL \r1[7]~input_o\ : std_logic;
SIGNAL \r1[8]~input_o\ : std_logic;
SIGNAL \r1[9]~input_o\ : std_logic;
SIGNAL \r1[10]~input_o\ : std_logic;
SIGNAL \r1[11]~input_o\ : std_logic;
SIGNAL \r1[12]~input_o\ : std_logic;
SIGNAL \r1[13]~input_o\ : std_logic;
SIGNAL \r1[14]~input_o\ : std_logic;
SIGNAL \r1[15]~input_o\ : std_logic;
SIGNAL \r1[16]~input_o\ : std_logic;
SIGNAL \r1[17]~input_o\ : std_logic;
SIGNAL \r1[18]~input_o\ : std_logic;
SIGNAL \r1[19]~input_o\ : std_logic;
SIGNAL \r1[20]~input_o\ : std_logic;
SIGNAL \r1[21]~input_o\ : std_logic;
SIGNAL \r1[22]~input_o\ : std_logic;
SIGNAL \r1[23]~input_o\ : std_logic;
SIGNAL \r1[24]~input_o\ : std_logic;
SIGNAL \r1[25]~input_o\ : std_logic;
SIGNAL \r1[26]~input_o\ : std_logic;
SIGNAL \r1[27]~input_o\ : std_logic;
SIGNAL \r1[28]~input_o\ : std_logic;
SIGNAL \r1[29]~input_o\ : std_logic;
SIGNAL \r1[30]~input_o\ : std_logic;
SIGNAL \r1[31]~input_o\ : std_logic;
SIGNAL \r2[0]~input_o\ : std_logic;
SIGNAL \r2[1]~input_o\ : std_logic;
SIGNAL \r2[2]~input_o\ : std_logic;
SIGNAL \r2[3]~input_o\ : std_logic;
SIGNAL \r2[4]~input_o\ : std_logic;
SIGNAL \r2[5]~input_o\ : std_logic;
SIGNAL \r2[6]~input_o\ : std_logic;
SIGNAL \r2[7]~input_o\ : std_logic;
SIGNAL \r2[8]~input_o\ : std_logic;
SIGNAL \r2[9]~input_o\ : std_logic;
SIGNAL \r2[10]~input_o\ : std_logic;
SIGNAL \r2[11]~input_o\ : std_logic;
SIGNAL \r2[12]~input_o\ : std_logic;
SIGNAL \r2[13]~input_o\ : std_logic;
SIGNAL \r2[14]~input_o\ : std_logic;
SIGNAL \r2[15]~input_o\ : std_logic;
SIGNAL \r2[16]~input_o\ : std_logic;
SIGNAL \r2[17]~input_o\ : std_logic;
SIGNAL \r2[18]~input_o\ : std_logic;
SIGNAL \r2[19]~input_o\ : std_logic;
SIGNAL \r2[20]~input_o\ : std_logic;
SIGNAL \r2[21]~input_o\ : std_logic;
SIGNAL \r2[22]~input_o\ : std_logic;
SIGNAL \r2[23]~input_o\ : std_logic;
SIGNAL \r2[24]~input_o\ : std_logic;
SIGNAL \r2[25]~input_o\ : std_logic;
SIGNAL \r2[26]~input_o\ : std_logic;
SIGNAL \r2[27]~input_o\ : std_logic;
SIGNAL \r2[28]~input_o\ : std_logic;
SIGNAL \r2[29]~input_o\ : std_logic;
SIGNAL \r2[30]~input_o\ : std_logic;
SIGNAL \r2[31]~input_o\ : std_logic;
SIGNAL \r4[0]~input_o\ : std_logic;
SIGNAL \r4[1]~input_o\ : std_logic;
SIGNAL \r4[2]~input_o\ : std_logic;
SIGNAL \r4[3]~input_o\ : std_logic;
SIGNAL \r4[4]~input_o\ : std_logic;
SIGNAL \r4[5]~input_o\ : std_logic;
SIGNAL \r4[6]~input_o\ : std_logic;
SIGNAL \r4[7]~input_o\ : std_logic;
SIGNAL \r4[8]~input_o\ : std_logic;
SIGNAL \r4[9]~input_o\ : std_logic;
SIGNAL \r4[10]~input_o\ : std_logic;
SIGNAL \r4[11]~input_o\ : std_logic;
SIGNAL \r4[12]~input_o\ : std_logic;
SIGNAL \r4[13]~input_o\ : std_logic;
SIGNAL \r4[14]~input_o\ : std_logic;
SIGNAL \r4[15]~input_o\ : std_logic;
SIGNAL \r4[16]~input_o\ : std_logic;
SIGNAL \r4[17]~input_o\ : std_logic;
SIGNAL \r4[18]~input_o\ : std_logic;
SIGNAL \r4[19]~input_o\ : std_logic;
SIGNAL \r4[20]~input_o\ : std_logic;
SIGNAL \r4[21]~input_o\ : std_logic;
SIGNAL \r4[22]~input_o\ : std_logic;
SIGNAL \r4[23]~input_o\ : std_logic;
SIGNAL \r4[24]~input_o\ : std_logic;
SIGNAL \r4[25]~input_o\ : std_logic;
SIGNAL \r4[26]~input_o\ : std_logic;
SIGNAL \r4[27]~input_o\ : std_logic;
SIGNAL \r4[28]~input_o\ : std_logic;
SIGNAL \r4[29]~input_o\ : std_logic;
SIGNAL \r4[30]~input_o\ : std_logic;
SIGNAL \r4[31]~input_o\ : std_logic;
SIGNAL \r5[0]~input_o\ : std_logic;
SIGNAL \r5[1]~input_o\ : std_logic;
SIGNAL \r5[2]~input_o\ : std_logic;
SIGNAL \r5[3]~input_o\ : std_logic;
SIGNAL \r5[4]~input_o\ : std_logic;
SIGNAL \r5[5]~input_o\ : std_logic;
SIGNAL \r5[6]~input_o\ : std_logic;
SIGNAL \r5[7]~input_o\ : std_logic;
SIGNAL \r5[8]~input_o\ : std_logic;
SIGNAL \r5[9]~input_o\ : std_logic;
SIGNAL \r5[10]~input_o\ : std_logic;
SIGNAL \r5[11]~input_o\ : std_logic;
SIGNAL \r5[12]~input_o\ : std_logic;
SIGNAL \r5[13]~input_o\ : std_logic;
SIGNAL \r5[14]~input_o\ : std_logic;
SIGNAL \r5[15]~input_o\ : std_logic;
SIGNAL \r5[16]~input_o\ : std_logic;
SIGNAL \r5[17]~input_o\ : std_logic;
SIGNAL \r5[18]~input_o\ : std_logic;
SIGNAL \r5[19]~input_o\ : std_logic;
SIGNAL \r5[20]~input_o\ : std_logic;
SIGNAL \r5[21]~input_o\ : std_logic;
SIGNAL \r5[22]~input_o\ : std_logic;
SIGNAL \r5[23]~input_o\ : std_logic;
SIGNAL \r5[24]~input_o\ : std_logic;
SIGNAL \r5[25]~input_o\ : std_logic;
SIGNAL \r5[26]~input_o\ : std_logic;
SIGNAL \r5[27]~input_o\ : std_logic;
SIGNAL \r5[28]~input_o\ : std_logic;
SIGNAL \r5[29]~input_o\ : std_logic;
SIGNAL \r5[30]~input_o\ : std_logic;
SIGNAL \r5[31]~input_o\ : std_logic;
SIGNAL \r6[0]~input_o\ : std_logic;
SIGNAL \r6[1]~input_o\ : std_logic;
SIGNAL \r6[2]~input_o\ : std_logic;
SIGNAL \r6[3]~input_o\ : std_logic;
SIGNAL \r6[4]~input_o\ : std_logic;
SIGNAL \r6[5]~input_o\ : std_logic;
SIGNAL \r6[6]~input_o\ : std_logic;
SIGNAL \r6[7]~input_o\ : std_logic;
SIGNAL \r6[8]~input_o\ : std_logic;
SIGNAL \r6[9]~input_o\ : std_logic;
SIGNAL \r6[10]~input_o\ : std_logic;
SIGNAL \r6[11]~input_o\ : std_logic;
SIGNAL \r6[12]~input_o\ : std_logic;
SIGNAL \r6[13]~input_o\ : std_logic;
SIGNAL \r6[14]~input_o\ : std_logic;
SIGNAL \r6[15]~input_o\ : std_logic;
SIGNAL \r6[16]~input_o\ : std_logic;
SIGNAL \r6[17]~input_o\ : std_logic;
SIGNAL \r6[18]~input_o\ : std_logic;
SIGNAL \r6[19]~input_o\ : std_logic;
SIGNAL \r6[20]~input_o\ : std_logic;
SIGNAL \r6[21]~input_o\ : std_logic;
SIGNAL \r6[22]~input_o\ : std_logic;
SIGNAL \r6[23]~input_o\ : std_logic;
SIGNAL \r6[24]~input_o\ : std_logic;
SIGNAL \r6[25]~input_o\ : std_logic;
SIGNAL \r6[26]~input_o\ : std_logic;
SIGNAL \r6[27]~input_o\ : std_logic;
SIGNAL \r6[28]~input_o\ : std_logic;
SIGNAL \r6[29]~input_o\ : std_logic;
SIGNAL \r6[30]~input_o\ : std_logic;
SIGNAL \r6[31]~input_o\ : std_logic;
SIGNAL \r8[0]~input_o\ : std_logic;
SIGNAL \r8[1]~input_o\ : std_logic;
SIGNAL \r8[2]~input_o\ : std_logic;
SIGNAL \r8[3]~input_o\ : std_logic;
SIGNAL \r8[4]~input_o\ : std_logic;
SIGNAL \r8[5]~input_o\ : std_logic;
SIGNAL \r8[6]~input_o\ : std_logic;
SIGNAL \r8[7]~input_o\ : std_logic;
SIGNAL \r8[8]~input_o\ : std_logic;
SIGNAL \r8[9]~input_o\ : std_logic;
SIGNAL \r8[10]~input_o\ : std_logic;
SIGNAL \r8[11]~input_o\ : std_logic;
SIGNAL \r8[12]~input_o\ : std_logic;
SIGNAL \r8[13]~input_o\ : std_logic;
SIGNAL \r8[14]~input_o\ : std_logic;
SIGNAL \r8[15]~input_o\ : std_logic;
SIGNAL \r8[16]~input_o\ : std_logic;
SIGNAL \r8[17]~input_o\ : std_logic;
SIGNAL \r8[18]~input_o\ : std_logic;
SIGNAL \r8[19]~input_o\ : std_logic;
SIGNAL \r8[20]~input_o\ : std_logic;
SIGNAL \r8[21]~input_o\ : std_logic;
SIGNAL \r8[22]~input_o\ : std_logic;
SIGNAL \r8[23]~input_o\ : std_logic;
SIGNAL \r8[24]~input_o\ : std_logic;
SIGNAL \r8[25]~input_o\ : std_logic;
SIGNAL \r8[26]~input_o\ : std_logic;
SIGNAL \r8[27]~input_o\ : std_logic;
SIGNAL \r8[28]~input_o\ : std_logic;
SIGNAL \r8[29]~input_o\ : std_logic;
SIGNAL \r8[30]~input_o\ : std_logic;
SIGNAL \r8[31]~input_o\ : std_logic;
SIGNAL \r0[0]~output_o\ : std_logic;
SIGNAL \r0[1]~output_o\ : std_logic;
SIGNAL \r0[2]~output_o\ : std_logic;
SIGNAL \r0[3]~output_o\ : std_logic;
SIGNAL \r0[4]~output_o\ : std_logic;
SIGNAL \r0[5]~output_o\ : std_logic;
SIGNAL \r0[6]~output_o\ : std_logic;
SIGNAL \r0[7]~output_o\ : std_logic;
SIGNAL \r0[8]~output_o\ : std_logic;
SIGNAL \r0[9]~output_o\ : std_logic;
SIGNAL \r0[10]~output_o\ : std_logic;
SIGNAL \r0[11]~output_o\ : std_logic;
SIGNAL \r0[12]~output_o\ : std_logic;
SIGNAL \r0[13]~output_o\ : std_logic;
SIGNAL \r0[14]~output_o\ : std_logic;
SIGNAL \r0[15]~output_o\ : std_logic;
SIGNAL \r0[16]~output_o\ : std_logic;
SIGNAL \r0[17]~output_o\ : std_logic;
SIGNAL \r0[18]~output_o\ : std_logic;
SIGNAL \r0[19]~output_o\ : std_logic;
SIGNAL \r0[20]~output_o\ : std_logic;
SIGNAL \r0[21]~output_o\ : std_logic;
SIGNAL \r0[22]~output_o\ : std_logic;
SIGNAL \r0[23]~output_o\ : std_logic;
SIGNAL \r0[24]~output_o\ : std_logic;
SIGNAL \r0[25]~output_o\ : std_logic;
SIGNAL \r0[26]~output_o\ : std_logic;
SIGNAL \r0[27]~output_o\ : std_logic;
SIGNAL \r0[28]~output_o\ : std_logic;
SIGNAL \r0[29]~output_o\ : std_logic;
SIGNAL \r0[30]~output_o\ : std_logic;
SIGNAL \r0[31]~output_o\ : std_logic;
SIGNAL \r1[0]~output_o\ : std_logic;
SIGNAL \r1[1]~output_o\ : std_logic;
SIGNAL \r1[2]~output_o\ : std_logic;
SIGNAL \r1[3]~output_o\ : std_logic;
SIGNAL \r1[4]~output_o\ : std_logic;
SIGNAL \r1[5]~output_o\ : std_logic;
SIGNAL \r1[6]~output_o\ : std_logic;
SIGNAL \r1[7]~output_o\ : std_logic;
SIGNAL \r1[8]~output_o\ : std_logic;
SIGNAL \r1[9]~output_o\ : std_logic;
SIGNAL \r1[10]~output_o\ : std_logic;
SIGNAL \r1[11]~output_o\ : std_logic;
SIGNAL \r1[12]~output_o\ : std_logic;
SIGNAL \r1[13]~output_o\ : std_logic;
SIGNAL \r1[14]~output_o\ : std_logic;
SIGNAL \r1[15]~output_o\ : std_logic;
SIGNAL \r1[16]~output_o\ : std_logic;
SIGNAL \r1[17]~output_o\ : std_logic;
SIGNAL \r1[18]~output_o\ : std_logic;
SIGNAL \r1[19]~output_o\ : std_logic;
SIGNAL \r1[20]~output_o\ : std_logic;
SIGNAL \r1[21]~output_o\ : std_logic;
SIGNAL \r1[22]~output_o\ : std_logic;
SIGNAL \r1[23]~output_o\ : std_logic;
SIGNAL \r1[24]~output_o\ : std_logic;
SIGNAL \r1[25]~output_o\ : std_logic;
SIGNAL \r1[26]~output_o\ : std_logic;
SIGNAL \r1[27]~output_o\ : std_logic;
SIGNAL \r1[28]~output_o\ : std_logic;
SIGNAL \r1[29]~output_o\ : std_logic;
SIGNAL \r1[30]~output_o\ : std_logic;
SIGNAL \r1[31]~output_o\ : std_logic;
SIGNAL \r2[0]~output_o\ : std_logic;
SIGNAL \r2[1]~output_o\ : std_logic;
SIGNAL \r2[2]~output_o\ : std_logic;
SIGNAL \r2[3]~output_o\ : std_logic;
SIGNAL \r2[4]~output_o\ : std_logic;
SIGNAL \r2[5]~output_o\ : std_logic;
SIGNAL \r2[6]~output_o\ : std_logic;
SIGNAL \r2[7]~output_o\ : std_logic;
SIGNAL \r2[8]~output_o\ : std_logic;
SIGNAL \r2[9]~output_o\ : std_logic;
SIGNAL \r2[10]~output_o\ : std_logic;
SIGNAL \r2[11]~output_o\ : std_logic;
SIGNAL \r2[12]~output_o\ : std_logic;
SIGNAL \r2[13]~output_o\ : std_logic;
SIGNAL \r2[14]~output_o\ : std_logic;
SIGNAL \r2[15]~output_o\ : std_logic;
SIGNAL \r2[16]~output_o\ : std_logic;
SIGNAL \r2[17]~output_o\ : std_logic;
SIGNAL \r2[18]~output_o\ : std_logic;
SIGNAL \r2[19]~output_o\ : std_logic;
SIGNAL \r2[20]~output_o\ : std_logic;
SIGNAL \r2[21]~output_o\ : std_logic;
SIGNAL \r2[22]~output_o\ : std_logic;
SIGNAL \r2[23]~output_o\ : std_logic;
SIGNAL \r2[24]~output_o\ : std_logic;
SIGNAL \r2[25]~output_o\ : std_logic;
SIGNAL \r2[26]~output_o\ : std_logic;
SIGNAL \r2[27]~output_o\ : std_logic;
SIGNAL \r2[28]~output_o\ : std_logic;
SIGNAL \r2[29]~output_o\ : std_logic;
SIGNAL \r2[30]~output_o\ : std_logic;
SIGNAL \r2[31]~output_o\ : std_logic;
SIGNAL \r4[0]~output_o\ : std_logic;
SIGNAL \r4[1]~output_o\ : std_logic;
SIGNAL \r4[2]~output_o\ : std_logic;
SIGNAL \r4[3]~output_o\ : std_logic;
SIGNAL \r4[4]~output_o\ : std_logic;
SIGNAL \r4[5]~output_o\ : std_logic;
SIGNAL \r4[6]~output_o\ : std_logic;
SIGNAL \r4[7]~output_o\ : std_logic;
SIGNAL \r4[8]~output_o\ : std_logic;
SIGNAL \r4[9]~output_o\ : std_logic;
SIGNAL \r4[10]~output_o\ : std_logic;
SIGNAL \r4[11]~output_o\ : std_logic;
SIGNAL \r4[12]~output_o\ : std_logic;
SIGNAL \r4[13]~output_o\ : std_logic;
SIGNAL \r4[14]~output_o\ : std_logic;
SIGNAL \r4[15]~output_o\ : std_logic;
SIGNAL \r4[16]~output_o\ : std_logic;
SIGNAL \r4[17]~output_o\ : std_logic;
SIGNAL \r4[18]~output_o\ : std_logic;
SIGNAL \r4[19]~output_o\ : std_logic;
SIGNAL \r4[20]~output_o\ : std_logic;
SIGNAL \r4[21]~output_o\ : std_logic;
SIGNAL \r4[22]~output_o\ : std_logic;
SIGNAL \r4[23]~output_o\ : std_logic;
SIGNAL \r4[24]~output_o\ : std_logic;
SIGNAL \r4[25]~output_o\ : std_logic;
SIGNAL \r4[26]~output_o\ : std_logic;
SIGNAL \r4[27]~output_o\ : std_logic;
SIGNAL \r4[28]~output_o\ : std_logic;
SIGNAL \r4[29]~output_o\ : std_logic;
SIGNAL \r4[30]~output_o\ : std_logic;
SIGNAL \r4[31]~output_o\ : std_logic;
SIGNAL \r5[0]~output_o\ : std_logic;
SIGNAL \r5[1]~output_o\ : std_logic;
SIGNAL \r5[2]~output_o\ : std_logic;
SIGNAL \r5[3]~output_o\ : std_logic;
SIGNAL \r5[4]~output_o\ : std_logic;
SIGNAL \r5[5]~output_o\ : std_logic;
SIGNAL \r5[6]~output_o\ : std_logic;
SIGNAL \r5[7]~output_o\ : std_logic;
SIGNAL \r5[8]~output_o\ : std_logic;
SIGNAL \r5[9]~output_o\ : std_logic;
SIGNAL \r5[10]~output_o\ : std_logic;
SIGNAL \r5[11]~output_o\ : std_logic;
SIGNAL \r5[12]~output_o\ : std_logic;
SIGNAL \r5[13]~output_o\ : std_logic;
SIGNAL \r5[14]~output_o\ : std_logic;
SIGNAL \r5[15]~output_o\ : std_logic;
SIGNAL \r5[16]~output_o\ : std_logic;
SIGNAL \r5[17]~output_o\ : std_logic;
SIGNAL \r5[18]~output_o\ : std_logic;
SIGNAL \r5[19]~output_o\ : std_logic;
SIGNAL \r5[20]~output_o\ : std_logic;
SIGNAL \r5[21]~output_o\ : std_logic;
SIGNAL \r5[22]~output_o\ : std_logic;
SIGNAL \r5[23]~output_o\ : std_logic;
SIGNAL \r5[24]~output_o\ : std_logic;
SIGNAL \r5[25]~output_o\ : std_logic;
SIGNAL \r5[26]~output_o\ : std_logic;
SIGNAL \r5[27]~output_o\ : std_logic;
SIGNAL \r5[28]~output_o\ : std_logic;
SIGNAL \r5[29]~output_o\ : std_logic;
SIGNAL \r5[30]~output_o\ : std_logic;
SIGNAL \r5[31]~output_o\ : std_logic;
SIGNAL \r6[0]~output_o\ : std_logic;
SIGNAL \r6[1]~output_o\ : std_logic;
SIGNAL \r6[2]~output_o\ : std_logic;
SIGNAL \r6[3]~output_o\ : std_logic;
SIGNAL \r6[4]~output_o\ : std_logic;
SIGNAL \r6[5]~output_o\ : std_logic;
SIGNAL \r6[6]~output_o\ : std_logic;
SIGNAL \r6[7]~output_o\ : std_logic;
SIGNAL \r6[8]~output_o\ : std_logic;
SIGNAL \r6[9]~output_o\ : std_logic;
SIGNAL \r6[10]~output_o\ : std_logic;
SIGNAL \r6[11]~output_o\ : std_logic;
SIGNAL \r6[12]~output_o\ : std_logic;
SIGNAL \r6[13]~output_o\ : std_logic;
SIGNAL \r6[14]~output_o\ : std_logic;
SIGNAL \r6[15]~output_o\ : std_logic;
SIGNAL \r6[16]~output_o\ : std_logic;
SIGNAL \r6[17]~output_o\ : std_logic;
SIGNAL \r6[18]~output_o\ : std_logic;
SIGNAL \r6[19]~output_o\ : std_logic;
SIGNAL \r6[20]~output_o\ : std_logic;
SIGNAL \r6[21]~output_o\ : std_logic;
SIGNAL \r6[22]~output_o\ : std_logic;
SIGNAL \r6[23]~output_o\ : std_logic;
SIGNAL \r6[24]~output_o\ : std_logic;
SIGNAL \r6[25]~output_o\ : std_logic;
SIGNAL \r6[26]~output_o\ : std_logic;
SIGNAL \r6[27]~output_o\ : std_logic;
SIGNAL \r6[28]~output_o\ : std_logic;
SIGNAL \r6[29]~output_o\ : std_logic;
SIGNAL \r6[30]~output_o\ : std_logic;
SIGNAL \r6[31]~output_o\ : std_logic;
SIGNAL \r8[0]~output_o\ : std_logic;
SIGNAL \r8[1]~output_o\ : std_logic;
SIGNAL \r8[2]~output_o\ : std_logic;
SIGNAL \r8[3]~output_o\ : std_logic;
SIGNAL \r8[4]~output_o\ : std_logic;
SIGNAL \r8[5]~output_o\ : std_logic;
SIGNAL \r8[6]~output_o\ : std_logic;
SIGNAL \r8[7]~output_o\ : std_logic;
SIGNAL \r8[8]~output_o\ : std_logic;
SIGNAL \r8[9]~output_o\ : std_logic;
SIGNAL \r8[10]~output_o\ : std_logic;
SIGNAL \r8[11]~output_o\ : std_logic;
SIGNAL \r8[12]~output_o\ : std_logic;
SIGNAL \r8[13]~output_o\ : std_logic;
SIGNAL \r8[14]~output_o\ : std_logic;
SIGNAL \r8[15]~output_o\ : std_logic;
SIGNAL \r8[16]~output_o\ : std_logic;
SIGNAL \r8[17]~output_o\ : std_logic;
SIGNAL \r8[18]~output_o\ : std_logic;
SIGNAL \r8[19]~output_o\ : std_logic;
SIGNAL \r8[20]~output_o\ : std_logic;
SIGNAL \r8[21]~output_o\ : std_logic;
SIGNAL \r8[22]~output_o\ : std_logic;
SIGNAL \r8[23]~output_o\ : std_logic;
SIGNAL \r8[24]~output_o\ : std_logic;
SIGNAL \r8[25]~output_o\ : std_logic;
SIGNAL \r8[26]~output_o\ : std_logic;
SIGNAL \r8[27]~output_o\ : std_logic;
SIGNAL \r8[28]~output_o\ : std_logic;
SIGNAL \r8[29]~output_o\ : std_logic;
SIGNAL \r8[30]~output_o\ : std_logic;
SIGNAL \r8[31]~output_o\ : std_logic;
SIGNAL \ret~output_o\ : std_logic;
SIGNAL \done~output_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_x1 <= x1;
ww_y1 <= y1;
ww_z1 <= z1;
ww_x2 <= x2;
ww_y2 <= y2;
ww_z2 <= z2;
ww_r9 <= r9;
ww_r10 <= r10;
ret <= ww_ret;
done <= ww_done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X113_Y73_N2
\r0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[0]~output_o\);

-- Location: IOOBUF_X89_Y73_N9
\r0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[1]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\r0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[2]~output_o\);

-- Location: IOOBUF_X113_Y73_N9
\r0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[3]~output_o\);

-- Location: IOOBUF_X89_Y73_N16
\r0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[4]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\r0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[5]~output_o\);

-- Location: IOOBUF_X111_Y73_N2
\r0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[6]~output_o\);

-- Location: IOOBUF_X89_Y73_N23
\r0[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[7]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\r0[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[8]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\r0[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[9]~output_o\);

-- Location: IOOBUF_X87_Y73_N2
\r0[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[10]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\r0[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[11]~output_o\);

-- Location: IOOBUF_X109_Y73_N2
\r0[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[12]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\r0[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[13]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\r0[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[14]~output_o\);

-- Location: IOOBUF_X109_Y73_N9
\r0[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[15]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\r0[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[16]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\r0[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[17]~output_o\);

-- Location: IOOBUF_X107_Y73_N2
\r0[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[18]~output_o\);

-- Location: IOOBUF_X87_Y73_N23
\r0[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[19]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\r0[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[20]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\r0[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[21]~output_o\);

-- Location: IOOBUF_X85_Y73_N2
\r0[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[22]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\r0[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[23]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\r0[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[24]~output_o\);

-- Location: IOOBUF_X85_Y73_N9
\r0[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[25]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\r0[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[26]~output_o\);

-- Location: IOOBUF_X105_Y73_N2
\r0[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[27]~output_o\);

-- Location: IOOBUF_X85_Y73_N16
\r0[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[28]~output_o\);

-- Location: IOOBUF_X67_Y73_N16
\r0[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[29]~output_o\);

-- Location: IOOBUF_X105_Y73_N9
\r0[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[30]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\r0[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r0[31]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\r1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[0]~output_o\);

-- Location: IOOBUF_X102_Y73_N2
\r1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[1]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\r1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[2]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\r1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[3]~output_o\);

-- Location: IOOBUF_X102_Y73_N9
\r1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[4]~output_o\);

-- Location: IOOBUF_X83_Y73_N9
\r1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[5]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\r1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[6]~output_o\);

-- Location: IOOBUF_X100_Y73_N16
\r1[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[7]~output_o\);

-- Location: IOOBUF_X83_Y73_N16
\r1[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[8]~output_o\);

-- Location: IOOBUF_X62_Y73_N16
\r1[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[9]~output_o\);

-- Location: IOOBUF_X100_Y73_N23
\r1[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[10]~output_o\);

-- Location: IOOBUF_X81_Y73_N2
\r1[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[11]~output_o\);

-- Location: IOOBUF_X62_Y73_N23
\r1[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[12]~output_o\);

-- Location: IOOBUF_X98_Y73_N16
\r1[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[13]~output_o\);

-- Location: IOOBUF_X81_Y73_N9
\r1[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[14]~output_o\);

-- Location: IOOBUF_X60_Y73_N2
\r1[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[15]~output_o\);

-- Location: IOOBUF_X98_Y73_N23
\r1[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[16]~output_o\);

-- Location: IOOBUF_X81_Y73_N16
\r1[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[17]~output_o\);

-- Location: IOOBUF_X60_Y73_N9
\r1[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[18]~output_o\);

-- Location: IOOBUF_X96_Y73_N16
\r1[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[19]~output_o\);

-- Location: IOOBUF_X81_Y73_N23
\r1[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[20]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\r1[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[21]~output_o\);

-- Location: IOOBUF_X96_Y73_N23
\r1[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[22]~output_o\);

-- Location: IOOBUF_X79_Y73_N2
\r1[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[23]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\r1[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[24]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\r1[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[25]~output_o\);

-- Location: IOOBUF_X79_Y73_N9
\r1[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[26]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\r1[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[27]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\r1[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[28]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\r1[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[29]~output_o\);

-- Location: IOOBUF_X58_Y73_N9
\r1[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[30]~output_o\);

-- Location: IOOBUF_X91_Y73_N16
\r1[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r1[31]~output_o\);

-- Location: IOOBUF_X74_Y73_N23
\r2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[0]~output_o\);

-- Location: IOOBUF_X58_Y73_N16
\r2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[1]~output_o\);

-- Location: IOOBUF_X58_Y73_N23
\r2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\r2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[3]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\r2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[4]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\r2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[5]~output_o\);

-- Location: IOOBUF_X35_Y73_N23
\r2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[6]~output_o\);

-- Location: IOOBUF_X16_Y73_N16
\r2[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[7]~output_o\);

-- Location: IOOBUF_X33_Y73_N2
\r2[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[8]~output_o\);

-- Location: IOOBUF_X16_Y73_N23
\r2[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[9]~output_o\);

-- Location: IOOBUF_X54_Y73_N2
\r2[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[10]~output_o\);

-- Location: IOOBUF_X33_Y73_N9
\r2[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[11]~output_o\);

-- Location: IOOBUF_X13_Y73_N2
\r2[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[12]~output_o\);

-- Location: IOOBUF_X54_Y73_N9
\r2[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[13]~output_o\);

-- Location: IOOBUF_X31_Y73_N2
\r2[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[14]~output_o\);

-- Location: IOOBUF_X13_Y73_N9
\r2[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[15]~output_o\);

-- Location: IOOBUF_X52_Y73_N2
\r2[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[16]~output_o\);

-- Location: IOOBUF_X31_Y73_N9
\r2[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[17]~output_o\);

-- Location: IOOBUF_X13_Y73_N16
\r2[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[18]~output_o\);

-- Location: IOOBUF_X52_Y73_N9
\r2[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[19]~output_o\);

-- Location: IOOBUF_X29_Y73_N2
\r2[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[20]~output_o\);

-- Location: IOOBUF_X11_Y73_N2
\r2[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[21]~output_o\);

-- Location: IOOBUF_X52_Y73_N16
\r2[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[22]~output_o\);

-- Location: IOOBUF_X29_Y73_N9
\r2[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[23]~output_o\);

-- Location: IOOBUF_X11_Y73_N9
\r2[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[24]~output_o\);

-- Location: IOOBUF_X52_Y73_N23
\r2[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[25]~output_o\);

-- Location: IOOBUF_X27_Y73_N16
\r2[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[26]~output_o\);

-- Location: IOOBUF_X11_Y73_N16
\r2[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[27]~output_o\);

-- Location: IOOBUF_X49_Y73_N16
\r2[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[28]~output_o\);

-- Location: IOOBUF_X27_Y73_N23
\r2[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[29]~output_o\);

-- Location: IOOBUF_X11_Y73_N23
\r2[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[30]~output_o\);

-- Location: IOOBUF_X49_Y73_N23
\r2[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r2[31]~output_o\);

-- Location: IOOBUF_X25_Y73_N16
\r4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[0]~output_o\);

-- Location: IOOBUF_X9_Y73_N2
\r4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[1]~output_o\);

-- Location: IOOBUF_X47_Y73_N2
\r4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[2]~output_o\);

-- Location: IOOBUF_X25_Y73_N23
\r4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[3]~output_o\);

-- Location: IOOBUF_X9_Y73_N9
\r4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[4]~output_o\);

-- Location: IOOBUF_X45_Y73_N2
\r4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[5]~output_o\);

-- Location: IOOBUF_X23_Y73_N2
\r4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[6]~output_o\);

-- Location: IOOBUF_X7_Y73_N16
\r4[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[7]~output_o\);

-- Location: IOOBUF_X45_Y73_N9
\r4[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[8]~output_o\);

-- Location: IOOBUF_X23_Y73_N9
\r4[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[9]~output_o\);

-- Location: IOOBUF_X7_Y73_N23
\r4[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[10]~output_o\);

-- Location: IOOBUF_X42_Y73_N2
\r4[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[11]~output_o\);

-- Location: IOOBUF_X23_Y73_N16
\r4[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[12]~output_o\);

-- Location: IOOBUF_X5_Y73_N2
\r4[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[13]~output_o\);

-- Location: IOOBUF_X42_Y73_N9
\r4[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[14]~output_o\);

-- Location: IOOBUF_X23_Y73_N23
\r4[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[15]~output_o\);

-- Location: IOOBUF_X5_Y73_N9
\r4[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[16]~output_o\);

-- Location: IOOBUF_X40_Y73_N2
\r4[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[17]~output_o\);

-- Location: IOOBUF_X20_Y73_N2
\r4[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[18]~output_o\);

-- Location: IOOBUF_X5_Y73_N23
\r4[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[19]~output_o\);

-- Location: IOOBUF_X40_Y73_N9
\r4[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[20]~output_o\);

-- Location: IOOBUF_X20_Y73_N9
\r4[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[21]~output_o\);

-- Location: IOOBUF_X3_Y73_N2
\r4[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[22]~output_o\);

-- Location: IOOBUF_X38_Y73_N2
\r4[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[23]~output_o\);

-- Location: IOOBUF_X20_Y73_N16
\r4[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[24]~output_o\);

-- Location: IOOBUF_X3_Y73_N9
\r4[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[25]~output_o\);

-- Location: IOOBUF_X38_Y73_N9
\r4[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[26]~output_o\);

-- Location: IOOBUF_X20_Y73_N23
\r4[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[27]~output_o\);

-- Location: IOOBUF_X3_Y73_N23
\r4[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[28]~output_o\);

-- Location: IOOBUF_X38_Y73_N16
\r4[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[29]~output_o\);

-- Location: IOOBUF_X18_Y73_N16
\r4[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[30]~output_o\);

-- Location: IOOBUF_X1_Y73_N2
\r4[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r4[31]~output_o\);

-- Location: IOOBUF_X38_Y73_N23
\r5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[0]~output_o\);

-- Location: IOOBUF_X18_Y73_N23
\r5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[1]~output_o\);

-- Location: IOOBUF_X1_Y73_N9
\r5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[2]~output_o\);

-- Location: IOOBUF_X35_Y73_N16
\r5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[3]~output_o\);

-- Location: IOOBUF_X16_Y73_N2
\r5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[4]~output_o\);

-- Location: IOOBUF_X1_Y73_N16
\r5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[5]~output_o\);

-- Location: IOOBUF_X16_Y73_N9
\r5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[6]~output_o\);

-- Location: IOOBUF_X1_Y73_N23
\r5[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[7]~output_o\);

-- Location: IOOBUF_X47_Y73_N16
\r5[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[8]~output_o\);

-- Location: IOOBUF_X27_Y73_N9
\r5[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[9]~output_o\);

-- Location: IOOBUF_X13_Y73_N23
\r5[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[10]~output_o\);

-- Location: IOOBUF_X115_Y49_N9
\r5[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[11]~output_o\);

-- Location: IOOBUF_X115_Y60_N16
\r5[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[12]~output_o\);

-- Location: IOOBUF_X115_Y49_N2
\r5[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[13]~output_o\);

-- Location: IOOBUF_X115_Y61_N23
\r5[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[14]~output_o\);

-- Location: IOOBUF_X115_Y40_N9
\r5[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[15]~output_o\);

-- Location: IOOBUF_X115_Y50_N9
\r5[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[16]~output_o\);

-- Location: IOOBUF_X115_Y61_N16
\r5[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[17]~output_o\);

-- Location: IOOBUF_X115_Y40_N2
\r5[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[18]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\r5[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[19]~output_o\);

-- Location: IOOBUF_X115_Y62_N23
\r5[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[20]~output_o\);

-- Location: IOOBUF_X115_Y41_N9
\r5[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[21]~output_o\);

-- Location: IOOBUF_X115_Y51_N9
\r5[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[22]~output_o\);

-- Location: IOOBUF_X115_Y62_N16
\r5[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[23]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\r5[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[24]~output_o\);

-- Location: IOOBUF_X115_Y51_N2
\r5[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[25]~output_o\);

-- Location: IOOBUF_X115_Y62_N9
\r5[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[26]~output_o\);

-- Location: IOOBUF_X115_Y44_N9
\r5[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[27]~output_o\);

-- Location: IOOBUF_X115_Y52_N9
\r5[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[28]~output_o\);

-- Location: IOOBUF_X115_Y63_N9
\r5[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[29]~output_o\);

-- Location: IOOBUF_X115_Y44_N2
\r5[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[30]~output_o\);

-- Location: IOOBUF_X115_Y52_N2
\r5[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r5[31]~output_o\);

-- Location: IOOBUF_X115_Y63_N2
\r6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[0]~output_o\);

-- Location: IOOBUF_X115_Y45_N23
\r6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[1]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\r6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[2]~output_o\);

-- Location: IOOBUF_X115_Y64_N9
\r6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[3]~output_o\);

-- Location: IOOBUF_X115_Y45_N16
\r6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[4]~output_o\);

-- Location: IOOBUF_X115_Y55_N23
\r6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[5]~output_o\);

-- Location: IOOBUF_X115_Y64_N2
\r6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[6]~output_o\);

-- Location: IOOBUF_X115_Y46_N9
\r6[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[7]~output_o\);

-- Location: IOOBUF_X115_Y55_N16
\r6[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[8]~output_o\);

-- Location: IOOBUF_X115_Y65_N23
\r6[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[9]~output_o\);

-- Location: IOOBUF_X115_Y46_N2
\r6[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[10]~output_o\);

-- Location: IOOBUF_X115_Y56_N23
\r6[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[11]~output_o\);

-- Location: IOOBUF_X115_Y65_N16
\r6[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[12]~output_o\);

-- Location: IOOBUF_X115_Y47_N23
\r6[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[13]~output_o\);

-- Location: IOOBUF_X115_Y56_N16
\r6[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[14]~output_o\);

-- Location: IOOBUF_X115_Y66_N23
\r6[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[15]~output_o\);

-- Location: IOOBUF_X115_Y47_N16
\r6[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[16]~output_o\);

-- Location: IOOBUF_X115_Y57_N23
\r6[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[17]~output_o\);

-- Location: IOOBUF_X115_Y66_N16
\r6[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[18]~output_o\);

-- Location: IOOBUF_X115_Y48_N9
\r6[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[19]~output_o\);

-- Location: IOOBUF_X115_Y57_N16
\r6[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[20]~output_o\);

-- Location: IOOBUF_X115_Y68_N23
\r6[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[21]~output_o\);

-- Location: IOOBUF_X115_Y48_N2
\r6[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[22]~output_o\);

-- Location: IOOBUF_X115_Y58_N23
\r6[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[23]~output_o\);

-- Location: IOOBUF_X115_Y68_N16
\r6[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[24]~output_o\);

-- Location: IOOBUF_X115_Y58_N16
\r6[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[25]~output_o\);

-- Location: IOOBUF_X115_Y69_N23
\r6[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[26]~output_o\);

-- Location: IOOBUF_X115_Y59_N23
\r6[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[27]~output_o\);

-- Location: IOOBUF_X115_Y69_N16
\r6[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[28]~output_o\);

-- Location: IOOBUF_X115_Y59_N16
\r6[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[29]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\r6[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[30]~output_o\);

-- Location: IOOBUF_X115_Y42_N16
\r6[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r6[31]~output_o\);

-- Location: IOOBUF_X115_Y53_N16
\r8[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[0]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\r8[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[1]~output_o\);

-- Location: IOOBUF_X0_Y69_N9
\r8[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[2]~output_o\);

-- Location: IOOBUF_X0_Y60_N16
\r8[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[3]~output_o\);

-- Location: IOOBUF_X0_Y48_N2
\r8[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[4]~output_o\);

-- Location: IOOBUF_X0_Y68_N2
\r8[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[5]~output_o\);

-- Location: IOOBUF_X0_Y59_N16
\r8[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[6]~output_o\);

-- Location: IOOBUF_X0_Y48_N9
\r8[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[7]~output_o\);

-- Location: IOOBUF_X0_Y68_N9
\r8[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[8]~output_o\);

-- Location: IOOBUF_X0_Y59_N23
\r8[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[9]~output_o\);

-- Location: IOOBUF_X0_Y47_N16
\r8[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[10]~output_o\);

-- Location: IOOBUF_X0_Y67_N16
\r8[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[11]~output_o\);

-- Location: IOOBUF_X0_Y57_N16
\r8[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[12]~output_o\);

-- Location: IOOBUF_X0_Y47_N23
\r8[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[13]~output_o\);

-- Location: IOOBUF_X0_Y67_N23
\r8[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[14]~output_o\);

-- Location: IOOBUF_X0_Y57_N23
\r8[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[15]~output_o\);

-- Location: IOOBUF_X0_Y46_N16
\r8[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[16]~output_o\);

-- Location: IOOBUF_X0_Y66_N16
\r8[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[17]~output_o\);

-- Location: IOOBUF_X0_Y55_N9
\r8[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[18]~output_o\);

-- Location: IOOBUF_X0_Y46_N23
\r8[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[19]~output_o\);

-- Location: IOOBUF_X0_Y66_N23
\r8[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[20]~output_o\);

-- Location: IOOBUF_X0_Y55_N16
\r8[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[21]~output_o\);

-- Location: IOOBUF_X0_Y45_N16
\r8[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[22]~output_o\);

-- Location: IOOBUF_X0_Y65_N16
\r8[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[23]~output_o\);

-- Location: IOOBUF_X0_Y55_N23
\r8[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[24]~output_o\);

-- Location: IOOBUF_X0_Y45_N23
\r8[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[25]~output_o\);

-- Location: IOOBUF_X0_Y64_N2
\r8[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[26]~output_o\);

-- Location: IOOBUF_X0_Y54_N9
\r8[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[27]~output_o\);

-- Location: IOOBUF_X0_Y44_N2
\r8[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[28]~output_o\);

-- Location: IOOBUF_X0_Y63_N16
\r8[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[29]~output_o\);

-- Location: IOOBUF_X0_Y53_N2
\r8[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[30]~output_o\);

-- Location: IOOBUF_X0_Y44_N9
\r8[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \r8[31]~output_o\);

-- Location: IOOBUF_X0_Y11_N16
\ret~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ret~output_o\);

-- Location: IOOBUF_X0_Y11_N23
\done~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \done~output_o\);

-- Location: IOIBUF_X1_Y0_N22
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X1_Y0_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X1_Y0_N8
\r10[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(23),
	o => \r10[23]~input_o\);

-- Location: IOIBUF_X1_Y0_N1
\r10[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(24),
	o => \r10[24]~input_o\);

-- Location: IOIBUF_X3_Y0_N22
\r10[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(25),
	o => \r10[25]~input_o\);

-- Location: IOIBUF_X3_Y0_N15
\r10[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(26),
	o => \r10[26]~input_o\);

-- Location: IOIBUF_X3_Y0_N1
\r10[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(27),
	o => \r10[27]~input_o\);

-- Location: IOIBUF_X5_Y0_N22
\r10[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(28),
	o => \r10[28]~input_o\);

-- Location: IOIBUF_X5_Y0_N15
\r10[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(29),
	o => \r10[29]~input_o\);

-- Location: IOIBUF_X5_Y0_N8
\r10[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(30),
	o => \r10[30]~input_o\);

-- Location: IOIBUF_X7_Y0_N22
\r10[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(0),
	o => \r10[0]~input_o\);

-- Location: IOIBUF_X7_Y0_N15
\r10[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(1),
	o => \r10[1]~input_o\);

-- Location: IOIBUF_X9_Y0_N22
\r10[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(2),
	o => \r10[2]~input_o\);

-- Location: IOIBUF_X9_Y0_N15
\r10[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(3),
	o => \r10[3]~input_o\);

-- Location: IOIBUF_X9_Y0_N8
\r10[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(4),
	o => \r10[4]~input_o\);

-- Location: IOIBUF_X9_Y0_N1
\r10[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(5),
	o => \r10[5]~input_o\);

-- Location: IOIBUF_X11_Y0_N22
\r10[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(6),
	o => \r10[6]~input_o\);

-- Location: IOIBUF_X11_Y0_N15
\r10[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(7),
	o => \r10[7]~input_o\);

-- Location: IOIBUF_X11_Y0_N8
\r10[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(8),
	o => \r10[8]~input_o\);

-- Location: IOIBUF_X11_Y0_N1
\r10[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(9),
	o => \r10[9]~input_o\);

-- Location: IOIBUF_X13_Y0_N22
\r10[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(10),
	o => \r10[10]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\r10[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(11),
	o => \r10[11]~input_o\);

-- Location: IOIBUF_X16_Y0_N8
\r10[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(12),
	o => \r10[12]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\r10[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(13),
	o => \r10[13]~input_o\);

-- Location: IOIBUF_X18_Y0_N22
\r10[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(14),
	o => \r10[14]~input_o\);

-- Location: IOIBUF_X18_Y0_N15
\r10[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(15),
	o => \r10[15]~input_o\);

-- Location: IOIBUF_X18_Y0_N8
\r10[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(16),
	o => \r10[16]~input_o\);

-- Location: IOIBUF_X18_Y0_N1
\r10[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(17),
	o => \r10[17]~input_o\);

-- Location: IOIBUF_X20_Y0_N22
\r10[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(18),
	o => \r10[18]~input_o\);

-- Location: IOIBUF_X20_Y0_N15
\r10[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(19),
	o => \r10[19]~input_o\);

-- Location: IOIBUF_X20_Y0_N8
\r10[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(20),
	o => \r10[20]~input_o\);

-- Location: IOIBUF_X20_Y0_N1
\r10[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(21),
	o => \r10[21]~input_o\);

-- Location: IOIBUF_X23_Y0_N22
\r10[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(22),
	o => \r10[22]~input_o\);

-- Location: IOIBUF_X23_Y0_N15
\r9[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(23),
	o => \r9[23]~input_o\);

-- Location: IOIBUF_X27_Y0_N22
\r9[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(24),
	o => \r9[24]~input_o\);

-- Location: IOIBUF_X29_Y0_N22
\r9[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(25),
	o => \r9[25]~input_o\);

-- Location: IOIBUF_X29_Y0_N15
\r9[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(26),
	o => \r9[26]~input_o\);

-- Location: IOIBUF_X31_Y0_N8
\r9[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(27),
	o => \r9[27]~input_o\);

-- Location: IOIBUF_X31_Y0_N1
\r9[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(28),
	o => \r9[28]~input_o\);

-- Location: IOIBUF_X33_Y0_N8
\r9[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(29),
	o => \r9[29]~input_o\);

-- Location: IOIBUF_X33_Y0_N1
\r9[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(30),
	o => \r9[30]~input_o\);

-- Location: IOIBUF_X35_Y0_N22
\r9[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(0),
	o => \r9[0]~input_o\);

-- Location: IOIBUF_X35_Y0_N15
\r9[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(1),
	o => \r9[1]~input_o\);

-- Location: IOIBUF_X38_Y0_N8
\r9[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(2),
	o => \r9[2]~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\r9[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(3),
	o => \r9[3]~input_o\);

-- Location: IOIBUF_X40_Y0_N22
\r9[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(4),
	o => \r9[4]~input_o\);

-- Location: IOIBUF_X40_Y0_N15
\r9[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(5),
	o => \r9[5]~input_o\);

-- Location: IOIBUF_X42_Y0_N22
\r9[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(6),
	o => \r9[6]~input_o\);

-- Location: IOIBUF_X42_Y0_N15
\r9[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(7),
	o => \r9[7]~input_o\);

-- Location: IOIBUF_X45_Y0_N22
\r9[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(8),
	o => \r9[8]~input_o\);

-- Location: IOIBUF_X45_Y0_N15
\r9[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(9),
	o => \r9[9]~input_o\);

-- Location: IOIBUF_X47_Y0_N1
\r9[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(10),
	o => \r9[10]~input_o\);

-- Location: IOIBUF_X49_Y0_N22
\r9[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(11),
	o => \r9[11]~input_o\);

-- Location: IOIBUF_X49_Y0_N15
\r9[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(12),
	o => \r9[12]~input_o\);

-- Location: IOIBUF_X49_Y0_N8
\r9[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(13),
	o => \r9[13]~input_o\);

-- Location: IOIBUF_X49_Y0_N1
\r9[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(14),
	o => \r9[14]~input_o\);

-- Location: IOIBUF_X52_Y0_N22
\r9[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(15),
	o => \r9[15]~input_o\);

-- Location: IOIBUF_X52_Y0_N15
\r9[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(16),
	o => \r9[16]~input_o\);

-- Location: IOIBUF_X52_Y0_N8
\r9[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(17),
	o => \r9[17]~input_o\);

-- Location: IOIBUF_X52_Y0_N1
\r9[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(18),
	o => \r9[18]~input_o\);

-- Location: IOIBUF_X54_Y0_N22
\r9[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(19),
	o => \r9[19]~input_o\);

-- Location: IOIBUF_X54_Y0_N15
\r9[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(20),
	o => \r9[20]~input_o\);

-- Location: IOIBUF_X54_Y0_N8
\r9[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(21),
	o => \r9[21]~input_o\);

-- Location: IOIBUF_X54_Y0_N1
\r9[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(22),
	o => \r9[22]~input_o\);

-- Location: IOIBUF_X56_Y0_N22
\z2[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(23),
	o => \z2[23]~input_o\);

-- Location: IOIBUF_X56_Y0_N15
\z2[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(24),
	o => \z2[24]~input_o\);

-- Location: IOIBUF_X56_Y0_N8
\z2[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(25),
	o => \z2[25]~input_o\);

-- Location: IOIBUF_X56_Y0_N1
\z2[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(26),
	o => \z2[26]~input_o\);

-- Location: IOIBUF_X58_Y0_N22
\z2[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(27),
	o => \z2[27]~input_o\);

-- Location: IOIBUF_X58_Y0_N15
\z2[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(28),
	o => \z2[28]~input_o\);

-- Location: IOIBUF_X7_Y0_N8
\z2[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(29),
	o => \z2[29]~input_o\);

-- Location: IOIBUF_X27_Y0_N8
\z2[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(30),
	o => \z2[30]~input_o\);

-- Location: IOIBUF_X47_Y0_N8
\z2[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(0),
	o => \z2[0]~input_o\);

-- Location: IOIBUF_X58_Y0_N8
\z2[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(1),
	o => \z2[1]~input_o\);

-- Location: IOIBUF_X58_Y0_N1
\z2[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(2),
	o => \z2[2]~input_o\);

-- Location: IOIBUF_X60_Y0_N22
\z2[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(3),
	o => \z2[3]~input_o\);

-- Location: IOIBUF_X60_Y0_N15
\z2[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(4),
	o => \z2[4]~input_o\);

-- Location: IOIBUF_X60_Y0_N8
\z2[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(5),
	o => \z2[5]~input_o\);

-- Location: IOIBUF_X60_Y0_N1
\z2[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(6),
	o => \z2[6]~input_o\);

-- Location: IOIBUF_X62_Y0_N22
\z2[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(7),
	o => \z2[7]~input_o\);

-- Location: IOIBUF_X62_Y0_N15
\z2[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(8),
	o => \z2[8]~input_o\);

-- Location: IOIBUF_X65_Y0_N22
\z2[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(9),
	o => \z2[9]~input_o\);

-- Location: IOIBUF_X65_Y0_N15
\z2[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(10),
	o => \z2[10]~input_o\);

-- Location: IOIBUF_X65_Y0_N8
\z2[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(11),
	o => \z2[11]~input_o\);

-- Location: IOIBUF_X65_Y0_N1
\z2[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(12),
	o => \z2[12]~input_o\);

-- Location: IOIBUF_X67_Y0_N15
\z2[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(13),
	o => \z2[13]~input_o\);

-- Location: IOIBUF_X67_Y0_N8
\z2[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(14),
	o => \z2[14]~input_o\);

-- Location: IOIBUF_X67_Y0_N1
\z2[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(15),
	o => \z2[15]~input_o\);

-- Location: IOIBUF_X69_Y0_N8
\z2[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(16),
	o => \z2[16]~input_o\);

-- Location: IOIBUF_X69_Y0_N1
\z2[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(17),
	o => \z2[17]~input_o\);

-- Location: IOIBUF_X72_Y0_N8
\z2[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(18),
	o => \z2[18]~input_o\);

-- Location: IOIBUF_X72_Y0_N1
\z2[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(19),
	o => \z2[19]~input_o\);

-- Location: IOIBUF_X74_Y0_N22
\z2[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(20),
	o => \z2[20]~input_o\);

-- Location: IOIBUF_X74_Y0_N15
\z2[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(21),
	o => \z2[21]~input_o\);

-- Location: IOIBUF_X74_Y0_N8
\z2[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(22),
	o => \z2[22]~input_o\);

-- Location: IOIBUF_X74_Y0_N1
\y2[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(23),
	o => \y2[23]~input_o\);

-- Location: IOIBUF_X79_Y0_N22
\y2[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(24),
	o => \y2[24]~input_o\);

-- Location: IOIBUF_X79_Y0_N15
\y2[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(25),
	o => \y2[25]~input_o\);

-- Location: IOIBUF_X79_Y0_N8
\y2[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(26),
	o => \y2[26]~input_o\);

-- Location: IOIBUF_X79_Y0_N1
\y2[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(27),
	o => \y2[27]~input_o\);

-- Location: IOIBUF_X81_Y0_N22
\y2[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(28),
	o => \y2[28]~input_o\);

-- Location: IOIBUF_X81_Y0_N15
\y2[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(29),
	o => \y2[29]~input_o\);

-- Location: IOIBUF_X83_Y0_N22
\y2[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(30),
	o => \y2[30]~input_o\);

-- Location: IOIBUF_X83_Y0_N15
\y2[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(0),
	o => \y2[0]~input_o\);

-- Location: IOIBUF_X83_Y0_N8
\y2[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(1),
	o => \y2[1]~input_o\);

-- Location: IOIBUF_X83_Y0_N1
\y2[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(2),
	o => \y2[2]~input_o\);

-- Location: IOIBUF_X85_Y0_N22
\y2[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(3),
	o => \y2[3]~input_o\);

-- Location: IOIBUF_X85_Y0_N15
\y2[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(4),
	o => \y2[4]~input_o\);

-- Location: IOIBUF_X85_Y0_N8
\y2[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(5),
	o => \y2[5]~input_o\);

-- Location: IOIBUF_X85_Y0_N1
\y2[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(6),
	o => \y2[6]~input_o\);

-- Location: IOIBUF_X87_Y0_N22
\y2[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(7),
	o => \y2[7]~input_o\);

-- Location: IOIBUF_X89_Y0_N22
\y2[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(8),
	o => \y2[8]~input_o\);

-- Location: IOIBUF_X89_Y0_N15
\y2[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(9),
	o => \y2[9]~input_o\);

-- Location: IOIBUF_X89_Y0_N8
\y2[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(10),
	o => \y2[10]~input_o\);

-- Location: IOIBUF_X89_Y0_N1
\y2[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(11),
	o => \y2[11]~input_o\);

-- Location: IOIBUF_X91_Y0_N22
\y2[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(12),
	o => \y2[12]~input_o\);

-- Location: IOIBUF_X91_Y0_N15
\y2[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(13),
	o => \y2[13]~input_o\);

-- Location: IOIBUF_X94_Y0_N8
\y2[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(14),
	o => \y2[14]~input_o\);

-- Location: IOIBUF_X94_Y0_N1
\y2[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(15),
	o => \y2[15]~input_o\);

-- Location: IOIBUF_X96_Y0_N22
\y2[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(16),
	o => \y2[16]~input_o\);

-- Location: IOIBUF_X96_Y0_N15
\y2[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(17),
	o => \y2[17]~input_o\);

-- Location: IOIBUF_X96_Y0_N8
\y2[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(18),
	o => \y2[18]~input_o\);

-- Location: IOIBUF_X96_Y0_N1
\y2[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(19),
	o => \y2[19]~input_o\);

-- Location: IOIBUF_X98_Y0_N22
\y2[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(20),
	o => \y2[20]~input_o\);

-- Location: IOIBUF_X98_Y0_N15
\y2[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(21),
	o => \y2[21]~input_o\);

-- Location: IOIBUF_X100_Y0_N22
\y2[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(22),
	o => \y2[22]~input_o\);

-- Location: IOIBUF_X100_Y0_N15
\x2[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(23),
	o => \x2[23]~input_o\);

-- Location: IOIBUF_X102_Y0_N22
\x2[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(24),
	o => \x2[24]~input_o\);

-- Location: IOIBUF_X102_Y0_N15
\x2[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(25),
	o => \x2[25]~input_o\);

-- Location: IOIBUF_X105_Y0_N22
\x2[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(26),
	o => \x2[26]~input_o\);

-- Location: IOIBUF_X105_Y0_N15
\x2[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(27),
	o => \x2[27]~input_o\);

-- Location: IOIBUF_X105_Y0_N8
\x2[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(28),
	o => \x2[28]~input_o\);

-- Location: IOIBUF_X105_Y0_N1
\x2[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(29),
	o => \x2[29]~input_o\);

-- Location: IOIBUF_X107_Y0_N8
\x2[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(30),
	o => \x2[30]~input_o\);

-- Location: IOIBUF_X107_Y0_N1
\x2[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(0),
	o => \x2[0]~input_o\);

-- Location: IOIBUF_X109_Y0_N8
\x2[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(1),
	o => \x2[1]~input_o\);

-- Location: IOIBUF_X109_Y0_N1
\x2[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(2),
	o => \x2[2]~input_o\);

-- Location: IOIBUF_X111_Y0_N8
\x2[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(3),
	o => \x2[3]~input_o\);

-- Location: IOIBUF_X111_Y0_N1
\x2[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(4),
	o => \x2[4]~input_o\);

-- Location: IOIBUF_X113_Y0_N8
\x2[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(5),
	o => \x2[5]~input_o\);

-- Location: IOIBUF_X113_Y0_N1
\x2[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(6),
	o => \x2[6]~input_o\);

-- Location: IOIBUF_X67_Y0_N22
\x2[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(7),
	o => \x2[7]~input_o\);

-- Location: IOIBUF_X87_Y0_N15
\x2[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(8),
	o => \x2[8]~input_o\);

-- Location: IOIBUF_X100_Y0_N1
\x2[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(9),
	o => \x2[9]~input_o\);

-- Location: IOIBUF_X115_Y4_N22
\x2[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(10),
	o => \x2[10]~input_o\);

-- Location: IOIBUF_X115_Y4_N15
\x2[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(11),
	o => \x2[11]~input_o\);

-- Location: IOIBUF_X115_Y5_N15
\x2[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(12),
	o => \x2[12]~input_o\);

-- Location: IOIBUF_X115_Y6_N15
\x2[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(13),
	o => \x2[13]~input_o\);

-- Location: IOIBUF_X115_Y7_N15
\x2[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(14),
	o => \x2[14]~input_o\);

-- Location: IOIBUF_X115_Y8_N22
\x2[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(15),
	o => \x2[15]~input_o\);

-- Location: IOIBUF_X115_Y8_N15
\x2[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(16),
	o => \x2[16]~input_o\);

-- Location: IOIBUF_X115_Y10_N8
\x2[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(17),
	o => \x2[17]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\x2[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(18),
	o => \x2[18]~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\x2[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(19),
	o => \x2[19]~input_o\);

-- Location: IOIBUF_X115_Y11_N1
\x2[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(20),
	o => \x2[20]~input_o\);

-- Location: IOIBUF_X115_Y12_N8
\x2[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(21),
	o => \x2[21]~input_o\);

-- Location: IOIBUF_X115_Y12_N1
\x2[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(22),
	o => \x2[22]~input_o\);

-- Location: IOIBUF_X115_Y13_N8
\z1[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(23),
	o => \z1[23]~input_o\);

-- Location: IOIBUF_X115_Y13_N1
\z1[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(24),
	o => \z1[24]~input_o\);

-- Location: IOIBUF_X115_Y14_N8
\z1[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(25),
	o => \z1[25]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\z1[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(26),
	o => \z1[26]~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\z1[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(27),
	o => \z1[27]~input_o\);

-- Location: IOIBUF_X115_Y15_N1
\z1[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(28),
	o => \z1[28]~input_o\);

-- Location: IOIBUF_X115_Y16_N8
\z1[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(29),
	o => \z1[29]~input_o\);

-- Location: IOIBUF_X115_Y16_N1
\z1[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(30),
	o => \z1[30]~input_o\);

-- Location: IOIBUF_X115_Y17_N8
\z1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(0),
	o => \z1[0]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\z1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(1),
	o => \z1[1]~input_o\);

-- Location: IOIBUF_X115_Y18_N8
\z1[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(2),
	o => \z1[2]~input_o\);

-- Location: IOIBUF_X115_Y18_N1
\z1[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(3),
	o => \z1[3]~input_o\);

-- Location: IOIBUF_X115_Y19_N8
\z1[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(4),
	o => \z1[4]~input_o\);

-- Location: IOIBUF_X115_Y19_N1
\z1[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(5),
	o => \z1[5]~input_o\);

-- Location: IOIBUF_X115_Y20_N8
\z1[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(6),
	o => \z1[6]~input_o\);

-- Location: IOIBUF_X115_Y20_N1
\z1[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(7),
	o => \z1[7]~input_o\);

-- Location: IOIBUF_X115_Y21_N15
\z1[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(8),
	o => \z1[8]~input_o\);

-- Location: IOIBUF_X115_Y22_N22
\z1[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(9),
	o => \z1[9]~input_o\);

-- Location: IOIBUF_X115_Y22_N15
\z1[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(10),
	o => \z1[10]~input_o\);

-- Location: IOIBUF_X115_Y23_N8
\z1[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(11),
	o => \z1[11]~input_o\);

-- Location: IOIBUF_X115_Y23_N1
\z1[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(12),
	o => \z1[12]~input_o\);

-- Location: IOIBUF_X115_Y24_N8
\z1[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(13),
	o => \z1[13]~input_o\);

-- Location: IOIBUF_X115_Y24_N1
\z1[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(14),
	o => \z1[14]~input_o\);

-- Location: IOIBUF_X115_Y25_N22
\z1[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(15),
	o => \z1[15]~input_o\);

-- Location: IOIBUF_X115_Y25_N15
\z1[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(16),
	o => \z1[16]~input_o\);

-- Location: IOIBUF_X115_Y26_N22
\z1[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(17),
	o => \z1[17]~input_o\);

-- Location: IOIBUF_X115_Y26_N15
\z1[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(18),
	o => \z1[18]~input_o\);

-- Location: IOIBUF_X115_Y27_N8
\z1[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(19),
	o => \z1[19]~input_o\);

-- Location: IOIBUF_X115_Y27_N1
\z1[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(20),
	o => \z1[20]~input_o\);

-- Location: IOIBUF_X115_Y28_N1
\z1[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(21),
	o => \z1[21]~input_o\);

-- Location: IOIBUF_X115_Y29_N8
\z1[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(22),
	o => \z1[22]~input_o\);

-- Location: IOIBUF_X115_Y29_N1
\y1[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(23),
	o => \y1[23]~input_o\);

-- Location: IOIBUF_X115_Y30_N8
\y1[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(24),
	o => \y1[24]~input_o\);

-- Location: IOIBUF_X115_Y30_N1
\y1[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(25),
	o => \y1[25]~input_o\);

-- Location: IOIBUF_X115_Y31_N8
\y1[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(26),
	o => \y1[26]~input_o\);

-- Location: IOIBUF_X115_Y31_N1
\y1[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(27),
	o => \y1[27]~input_o\);

-- Location: IOIBUF_X115_Y32_N8
\y1[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(28),
	o => \y1[28]~input_o\);

-- Location: IOIBUF_X115_Y32_N1
\y1[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(29),
	o => \y1[29]~input_o\);

-- Location: IOIBUF_X115_Y33_N8
\y1[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(30),
	o => \y1[30]~input_o\);

-- Location: IOIBUF_X115_Y33_N1
\y1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(0),
	o => \y1[0]~input_o\);

-- Location: IOIBUF_X115_Y34_N22
\y1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(1),
	o => \y1[1]~input_o\);

-- Location: IOIBUF_X115_Y34_N15
\y1[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(2),
	o => \y1[2]~input_o\);

-- Location: IOIBUF_X115_Y35_N22
\y1[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(3),
	o => \y1[3]~input_o\);

-- Location: IOIBUF_X115_Y35_N15
\y1[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(4),
	o => \y1[4]~input_o\);

-- Location: IOIBUF_X115_Y36_N15
\y1[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(5),
	o => \y1[5]~input_o\);

-- Location: IOIBUF_X115_Y36_N8
\y1[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(6),
	o => \y1[6]~input_o\);

-- Location: IOIBUF_X115_Y36_N1
\y1[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(7),
	o => \y1[7]~input_o\);

-- Location: IOIBUF_X115_Y37_N22
\y1[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(8),
	o => \y1[8]~input_o\);

-- Location: IOIBUF_X115_Y37_N15
\y1[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(9),
	o => \y1[9]~input_o\);

-- Location: IOIBUF_X115_Y9_N22
\y1[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(10),
	o => \y1[10]~input_o\);

-- Location: IOIBUF_X115_Y22_N1
\y1[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(11),
	o => \y1[11]~input_o\);

-- Location: IOIBUF_X115_Y28_N8
\y1[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(12),
	o => \y1[12]~input_o\);

-- Location: IOIBUF_X0_Y36_N15
\y1[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(13),
	o => \y1[13]~input_o\);

-- Location: IOIBUF_X0_Y36_N22
\y1[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(14),
	o => \y1[14]~input_o\);

-- Location: IOIBUF_X0_Y35_N1
\y1[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(15),
	o => \y1[15]~input_o\);

-- Location: IOIBUF_X0_Y35_N8
\y1[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(16),
	o => \y1[16]~input_o\);

-- Location: IOIBUF_X0_Y35_N15
\y1[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(17),
	o => \y1[17]~input_o\);

-- Location: IOIBUF_X0_Y34_N1
\y1[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(18),
	o => \y1[18]~input_o\);

-- Location: IOIBUF_X0_Y34_N8
\y1[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(19),
	o => \y1[19]~input_o\);

-- Location: IOIBUF_X0_Y34_N15
\y1[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(20),
	o => \y1[20]~input_o\);

-- Location: IOIBUF_X0_Y34_N22
\y1[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(21),
	o => \y1[21]~input_o\);

-- Location: IOIBUF_X0_Y33_N15
\y1[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(22),
	o => \y1[22]~input_o\);

-- Location: IOIBUF_X0_Y33_N22
\x1[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(23),
	o => \x1[23]~input_o\);

-- Location: IOIBUF_X0_Y32_N15
\x1[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(24),
	o => \x1[24]~input_o\);

-- Location: IOIBUF_X0_Y32_N22
\x1[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(25),
	o => \x1[25]~input_o\);

-- Location: IOIBUF_X0_Y30_N1
\x1[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(26),
	o => \x1[26]~input_o\);

-- Location: IOIBUF_X0_Y30_N8
\x1[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(27),
	o => \x1[27]~input_o\);

-- Location: IOIBUF_X0_Y29_N15
\x1[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(28),
	o => \x1[28]~input_o\);

-- Location: IOIBUF_X0_Y29_N22
\x1[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(29),
	o => \x1[29]~input_o\);

-- Location: IOIBUF_X0_Y28_N15
\x1[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(30),
	o => \x1[30]~input_o\);

-- Location: IOIBUF_X0_Y28_N22
\x1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(0),
	o => \x1[0]~input_o\);

-- Location: IOIBUF_X0_Y27_N15
\x1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(1),
	o => \x1[1]~input_o\);

-- Location: IOIBUF_X0_Y27_N22
\x1[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(2),
	o => \x1[2]~input_o\);

-- Location: IOIBUF_X0_Y26_N15
\x1[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(3),
	o => \x1[3]~input_o\);

-- Location: IOIBUF_X0_Y25_N15
\x1[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(4),
	o => \x1[4]~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\x1[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(5),
	o => \x1[5]~input_o\);

-- Location: IOIBUF_X0_Y24_N1
\x1[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(6),
	o => \x1[6]~input_o\);

-- Location: IOIBUF_X0_Y24_N8
\x1[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(7),
	o => \x1[7]~input_o\);

-- Location: IOIBUF_X0_Y24_N15
\x1[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(8),
	o => \x1[8]~input_o\);

-- Location: IOIBUF_X0_Y24_N22
\x1[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(9),
	o => \x1[9]~input_o\);

-- Location: IOIBUF_X0_Y23_N15
\x1[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(10),
	o => \x1[10]~input_o\);

-- Location: IOIBUF_X0_Y23_N22
\x1[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(11),
	o => \x1[11]~input_o\);

-- Location: IOIBUF_X0_Y22_N15
\x1[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(12),
	o => \x1[12]~input_o\);

-- Location: IOIBUF_X0_Y22_N22
\x1[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(13),
	o => \x1[13]~input_o\);

-- Location: IOIBUF_X0_Y21_N15
\x1[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(14),
	o => \x1[14]~input_o\);

-- Location: IOIBUF_X0_Y21_N22
\x1[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(15),
	o => \x1[15]~input_o\);

-- Location: IOIBUF_X0_Y19_N1
\x1[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(16),
	o => \x1[16]~input_o\);

-- Location: IOIBUF_X0_Y19_N8
\x1[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(17),
	o => \x1[17]~input_o\);

-- Location: IOIBUF_X0_Y18_N15
\x1[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(18),
	o => \x1[18]~input_o\);

-- Location: IOIBUF_X0_Y18_N22
\x1[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(19),
	o => \x1[19]~input_o\);

-- Location: IOIBUF_X0_Y17_N15
\x1[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(20),
	o => \x1[20]~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\x1[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(21),
	o => \x1[21]~input_o\);

-- Location: IOIBUF_X0_Y16_N22
\x1[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(22),
	o => \x1[22]~input_o\);

-- Location: IOIBUF_X0_Y15_N15
\z2[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z2(31),
	o => \z2[31]~input_o\);

-- Location: IOIBUF_X0_Y15_N22
\y2[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y2(31),
	o => \y2[31]~input_o\);

-- Location: IOIBUF_X0_Y14_N1
\x2[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x2(31),
	o => \x2[31]~input_o\);

-- Location: IOIBUF_X0_Y14_N8
\z1[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z1(31),
	o => \z1[31]~input_o\);

-- Location: IOIBUF_X0_Y13_N1
\y1[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y1(31),
	o => \y1[31]~input_o\);

-- Location: IOIBUF_X0_Y13_N8
\x1[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1(31),
	o => \x1[31]~input_o\);

-- Location: IOIBUF_X0_Y12_N15
\r10[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r10(31),
	o => \r10[31]~input_o\);

-- Location: IOIBUF_X0_Y12_N22
\r9[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_r9(31),
	o => \r9[31]~input_o\);

-- Location: IOIBUF_X113_Y73_N1
\r0[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(0),
	o => \r0[0]~input_o\);

-- Location: IOIBUF_X89_Y73_N8
\r0[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(1),
	o => \r0[1]~input_o\);

-- Location: IOIBUF_X72_Y73_N1
\r0[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(2),
	o => \r0[2]~input_o\);

-- Location: IOIBUF_X113_Y73_N8
\r0[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(3),
	o => \r0[3]~input_o\);

-- Location: IOIBUF_X89_Y73_N15
\r0[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(4),
	o => \r0[4]~input_o\);

-- Location: IOIBUF_X72_Y73_N8
\r0[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(5),
	o => \r0[5]~input_o\);

-- Location: IOIBUF_X111_Y73_N1
\r0[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(6),
	o => \r0[6]~input_o\);

-- Location: IOIBUF_X89_Y73_N22
\r0[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(7),
	o => \r0[7]~input_o\);

-- Location: IOIBUF_X72_Y73_N15
\r0[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(8),
	o => \r0[8]~input_o\);

-- Location: IOIBUF_X111_Y73_N8
\r0[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(9),
	o => \r0[9]~input_o\);

-- Location: IOIBUF_X87_Y73_N1
\r0[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(10),
	o => \r0[10]~input_o\);

-- Location: IOIBUF_X72_Y73_N22
\r0[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(11),
	o => \r0[11]~input_o\);

-- Location: IOIBUF_X109_Y73_N1
\r0[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(12),
	o => \r0[12]~input_o\);

-- Location: IOIBUF_X87_Y73_N8
\r0[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(13),
	o => \r0[13]~input_o\);

-- Location: IOIBUF_X69_Y73_N1
\r0[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(14),
	o => \r0[14]~input_o\);

-- Location: IOIBUF_X109_Y73_N8
\r0[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(15),
	o => \r0[15]~input_o\);

-- Location: IOIBUF_X87_Y73_N15
\r0[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(16),
	o => \r0[16]~input_o\);

-- Location: IOIBUF_X69_Y73_N15
\r0[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(17),
	o => \r0[17]~input_o\);

-- Location: IOIBUF_X107_Y73_N1
\r0[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(18),
	o => \r0[18]~input_o\);

-- Location: IOIBUF_X87_Y73_N22
\r0[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(19),
	o => \r0[19]~input_o\);

-- Location: IOIBUF_X69_Y73_N22
\r0[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(20),
	o => \r0[20]~input_o\);

-- Location: IOIBUF_X107_Y73_N8
\r0[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(21),
	o => \r0[21]~input_o\);

-- Location: IOIBUF_X85_Y73_N1
\r0[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(22),
	o => \r0[22]~input_o\);

-- Location: IOIBUF_X67_Y73_N1
\r0[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(23),
	o => \r0[23]~input_o\);

-- Location: IOIBUF_X107_Y73_N15
\r0[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(24),
	o => \r0[24]~input_o\);

-- Location: IOIBUF_X85_Y73_N8
\r0[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(25),
	o => \r0[25]~input_o\);

-- Location: IOIBUF_X67_Y73_N8
\r0[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(26),
	o => \r0[26]~input_o\);

-- Location: IOIBUF_X105_Y73_N1
\r0[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(27),
	o => \r0[27]~input_o\);

-- Location: IOIBUF_X85_Y73_N15
\r0[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(28),
	o => \r0[28]~input_o\);

-- Location: IOIBUF_X67_Y73_N15
\r0[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(29),
	o => \r0[29]~input_o\);

-- Location: IOIBUF_X105_Y73_N8
\r0[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(30),
	o => \r0[30]~input_o\);

-- Location: IOIBUF_X85_Y73_N22
\r0[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r0(31),
	o => \r0[31]~input_o\);

-- Location: IOIBUF_X67_Y73_N22
\r1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(0),
	o => \r1[0]~input_o\);

-- Location: IOIBUF_X102_Y73_N1
\r1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(1),
	o => \r1[1]~input_o\);

-- Location: IOIBUF_X83_Y73_N1
\r1[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(2),
	o => \r1[2]~input_o\);

-- Location: IOIBUF_X65_Y73_N15
\r1[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(3),
	o => \r1[3]~input_o\);

-- Location: IOIBUF_X102_Y73_N8
\r1[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(4),
	o => \r1[4]~input_o\);

-- Location: IOIBUF_X83_Y73_N8
\r1[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(5),
	o => \r1[5]~input_o\);

-- Location: IOIBUF_X65_Y73_N22
\r1[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(6),
	o => \r1[6]~input_o\);

-- Location: IOIBUF_X100_Y73_N15
\r1[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(7),
	o => \r1[7]~input_o\);

-- Location: IOIBUF_X83_Y73_N15
\r1[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(8),
	o => \r1[8]~input_o\);

-- Location: IOIBUF_X62_Y73_N15
\r1[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(9),
	o => \r1[9]~input_o\);

-- Location: IOIBUF_X100_Y73_N22
\r1[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(10),
	o => \r1[10]~input_o\);

-- Location: IOIBUF_X81_Y73_N1
\r1[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(11),
	o => \r1[11]~input_o\);

-- Location: IOIBUF_X62_Y73_N22
\r1[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(12),
	o => \r1[12]~input_o\);

-- Location: IOIBUF_X98_Y73_N15
\r1[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(13),
	o => \r1[13]~input_o\);

-- Location: IOIBUF_X81_Y73_N8
\r1[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(14),
	o => \r1[14]~input_o\);

-- Location: IOIBUF_X60_Y73_N1
\r1[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(15),
	o => \r1[15]~input_o\);

-- Location: IOIBUF_X98_Y73_N22
\r1[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(16),
	o => \r1[16]~input_o\);

-- Location: IOIBUF_X81_Y73_N15
\r1[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(17),
	o => \r1[17]~input_o\);

-- Location: IOIBUF_X60_Y73_N8
\r1[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(18),
	o => \r1[18]~input_o\);

-- Location: IOIBUF_X96_Y73_N15
\r1[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(19),
	o => \r1[19]~input_o\);

-- Location: IOIBUF_X81_Y73_N22
\r1[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(20),
	o => \r1[20]~input_o\);

-- Location: IOIBUF_X60_Y73_N15
\r1[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(21),
	o => \r1[21]~input_o\);

-- Location: IOIBUF_X96_Y73_N22
\r1[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(22),
	o => \r1[22]~input_o\);

-- Location: IOIBUF_X79_Y73_N1
\r1[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(23),
	o => \r1[23]~input_o\);

-- Location: IOIBUF_X60_Y73_N22
\r1[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(24),
	o => \r1[24]~input_o\);

-- Location: IOIBUF_X94_Y73_N1
\r1[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(25),
	o => \r1[25]~input_o\);

-- Location: IOIBUF_X79_Y73_N8
\r1[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(26),
	o => \r1[26]~input_o\);

-- Location: IOIBUF_X58_Y73_N1
\r1[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(27),
	o => \r1[27]~input_o\);

-- Location: IOIBUF_X94_Y73_N8
\r1[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(28),
	o => \r1[28]~input_o\);

-- Location: IOIBUF_X74_Y73_N15
\r1[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(29),
	o => \r1[29]~input_o\);

-- Location: IOIBUF_X58_Y73_N8
\r1[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(30),
	o => \r1[30]~input_o\);

-- Location: IOIBUF_X91_Y73_N15
\r1[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r1(31),
	o => \r1[31]~input_o\);

-- Location: IOIBUF_X74_Y73_N22
\r2[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(0),
	o => \r2[0]~input_o\);

-- Location: IOIBUF_X58_Y73_N15
\r2[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(1),
	o => \r2[1]~input_o\);

-- Location: IOIBUF_X58_Y73_N22
\r2[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(2),
	o => \r2[2]~input_o\);

-- Location: IOIBUF_X107_Y73_N22
\r2[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(3),
	o => \r2[3]~input_o\);

-- Location: IOIBUF_X83_Y73_N22
\r2[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(4),
	o => \r2[4]~input_o\);

-- Location: IOIBUF_X65_Y73_N8
\r2[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(5),
	o => \r2[5]~input_o\);

-- Location: IOIBUF_X35_Y73_N22
\r2[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(6),
	o => \r2[6]~input_o\);

-- Location: IOIBUF_X16_Y73_N15
\r2[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(7),
	o => \r2[7]~input_o\);

-- Location: IOIBUF_X33_Y73_N1
\r2[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(8),
	o => \r2[8]~input_o\);

-- Location: IOIBUF_X16_Y73_N22
\r2[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(9),
	o => \r2[9]~input_o\);

-- Location: IOIBUF_X54_Y73_N1
\r2[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(10),
	o => \r2[10]~input_o\);

-- Location: IOIBUF_X33_Y73_N8
\r2[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(11),
	o => \r2[11]~input_o\);

-- Location: IOIBUF_X13_Y73_N1
\r2[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(12),
	o => \r2[12]~input_o\);

-- Location: IOIBUF_X54_Y73_N8
\r2[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(13),
	o => \r2[13]~input_o\);

-- Location: IOIBUF_X31_Y73_N1
\r2[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(14),
	o => \r2[14]~input_o\);

-- Location: IOIBUF_X13_Y73_N8
\r2[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(15),
	o => \r2[15]~input_o\);

-- Location: IOIBUF_X52_Y73_N1
\r2[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(16),
	o => \r2[16]~input_o\);

-- Location: IOIBUF_X31_Y73_N8
\r2[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(17),
	o => \r2[17]~input_o\);

-- Location: IOIBUF_X13_Y73_N15
\r2[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(18),
	o => \r2[18]~input_o\);

-- Location: IOIBUF_X52_Y73_N8
\r2[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(19),
	o => \r2[19]~input_o\);

-- Location: IOIBUF_X29_Y73_N1
\r2[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(20),
	o => \r2[20]~input_o\);

-- Location: IOIBUF_X11_Y73_N1
\r2[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(21),
	o => \r2[21]~input_o\);

-- Location: IOIBUF_X52_Y73_N15
\r2[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(22),
	o => \r2[22]~input_o\);

-- Location: IOIBUF_X29_Y73_N8
\r2[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(23),
	o => \r2[23]~input_o\);

-- Location: IOIBUF_X11_Y73_N8
\r2[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(24),
	o => \r2[24]~input_o\);

-- Location: IOIBUF_X52_Y73_N22
\r2[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(25),
	o => \r2[25]~input_o\);

-- Location: IOIBUF_X27_Y73_N15
\r2[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(26),
	o => \r2[26]~input_o\);

-- Location: IOIBUF_X11_Y73_N15
\r2[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(27),
	o => \r2[27]~input_o\);

-- Location: IOIBUF_X49_Y73_N15
\r2[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(28),
	o => \r2[28]~input_o\);

-- Location: IOIBUF_X27_Y73_N22
\r2[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(29),
	o => \r2[29]~input_o\);

-- Location: IOIBUF_X11_Y73_N22
\r2[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(30),
	o => \r2[30]~input_o\);

-- Location: IOIBUF_X49_Y73_N22
\r2[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r2(31),
	o => \r2[31]~input_o\);

-- Location: IOIBUF_X25_Y73_N15
\r4[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(0),
	o => \r4[0]~input_o\);

-- Location: IOIBUF_X9_Y73_N1
\r4[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(1),
	o => \r4[1]~input_o\);

-- Location: IOIBUF_X47_Y73_N1
\r4[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(2),
	o => \r4[2]~input_o\);

-- Location: IOIBUF_X25_Y73_N22
\r4[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(3),
	o => \r4[3]~input_o\);

-- Location: IOIBUF_X9_Y73_N8
\r4[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(4),
	o => \r4[4]~input_o\);

-- Location: IOIBUF_X45_Y73_N1
\r4[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(5),
	o => \r4[5]~input_o\);

-- Location: IOIBUF_X23_Y73_N1
\r4[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(6),
	o => \r4[6]~input_o\);

-- Location: IOIBUF_X7_Y73_N15
\r4[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(7),
	o => \r4[7]~input_o\);

-- Location: IOIBUF_X45_Y73_N8
\r4[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(8),
	o => \r4[8]~input_o\);

-- Location: IOIBUF_X23_Y73_N8
\r4[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(9),
	o => \r4[9]~input_o\);

-- Location: IOIBUF_X7_Y73_N22
\r4[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(10),
	o => \r4[10]~input_o\);

-- Location: IOIBUF_X42_Y73_N1
\r4[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(11),
	o => \r4[11]~input_o\);

-- Location: IOIBUF_X23_Y73_N15
\r4[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(12),
	o => \r4[12]~input_o\);

-- Location: IOIBUF_X5_Y73_N1
\r4[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(13),
	o => \r4[13]~input_o\);

-- Location: IOIBUF_X42_Y73_N8
\r4[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(14),
	o => \r4[14]~input_o\);

-- Location: IOIBUF_X23_Y73_N22
\r4[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(15),
	o => \r4[15]~input_o\);

-- Location: IOIBUF_X5_Y73_N8
\r4[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(16),
	o => \r4[16]~input_o\);

-- Location: IOIBUF_X40_Y73_N1
\r4[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(17),
	o => \r4[17]~input_o\);

-- Location: IOIBUF_X20_Y73_N1
\r4[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(18),
	o => \r4[18]~input_o\);

-- Location: IOIBUF_X5_Y73_N22
\r4[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(19),
	o => \r4[19]~input_o\);

-- Location: IOIBUF_X40_Y73_N8
\r4[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(20),
	o => \r4[20]~input_o\);

-- Location: IOIBUF_X20_Y73_N8
\r4[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(21),
	o => \r4[21]~input_o\);

-- Location: IOIBUF_X3_Y73_N1
\r4[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(22),
	o => \r4[22]~input_o\);

-- Location: IOIBUF_X38_Y73_N1
\r4[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(23),
	o => \r4[23]~input_o\);

-- Location: IOIBUF_X20_Y73_N15
\r4[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(24),
	o => \r4[24]~input_o\);

-- Location: IOIBUF_X3_Y73_N8
\r4[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(25),
	o => \r4[25]~input_o\);

-- Location: IOIBUF_X38_Y73_N8
\r4[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(26),
	o => \r4[26]~input_o\);

-- Location: IOIBUF_X20_Y73_N22
\r4[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(27),
	o => \r4[27]~input_o\);

-- Location: IOIBUF_X3_Y73_N22
\r4[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(28),
	o => \r4[28]~input_o\);

-- Location: IOIBUF_X38_Y73_N15
\r4[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(29),
	o => \r4[29]~input_o\);

-- Location: IOIBUF_X18_Y73_N15
\r4[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(30),
	o => \r4[30]~input_o\);

-- Location: IOIBUF_X1_Y73_N1
\r4[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r4(31),
	o => \r4[31]~input_o\);

-- Location: IOIBUF_X38_Y73_N22
\r5[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(0),
	o => \r5[0]~input_o\);

-- Location: IOIBUF_X18_Y73_N22
\r5[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(1),
	o => \r5[1]~input_o\);

-- Location: IOIBUF_X1_Y73_N8
\r5[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(2),
	o => \r5[2]~input_o\);

-- Location: IOIBUF_X35_Y73_N15
\r5[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(3),
	o => \r5[3]~input_o\);

-- Location: IOIBUF_X16_Y73_N1
\r5[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(4),
	o => \r5[4]~input_o\);

-- Location: IOIBUF_X1_Y73_N15
\r5[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(5),
	o => \r5[5]~input_o\);

-- Location: IOIBUF_X16_Y73_N8
\r5[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(6),
	o => \r5[6]~input_o\);

-- Location: IOIBUF_X1_Y73_N22
\r5[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(7),
	o => \r5[7]~input_o\);

-- Location: IOIBUF_X47_Y73_N15
\r5[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(8),
	o => \r5[8]~input_o\);

-- Location: IOIBUF_X27_Y73_N8
\r5[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(9),
	o => \r5[9]~input_o\);

-- Location: IOIBUF_X13_Y73_N22
\r5[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(10),
	o => \r5[10]~input_o\);

-- Location: IOIBUF_X115_Y49_N8
\r5[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(11),
	o => \r5[11]~input_o\);

-- Location: IOIBUF_X115_Y60_N15
\r5[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(12),
	o => \r5[12]~input_o\);

-- Location: IOIBUF_X115_Y49_N1
\r5[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(13),
	o => \r5[13]~input_o\);

-- Location: IOIBUF_X115_Y61_N22
\r5[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(14),
	o => \r5[14]~input_o\);

-- Location: IOIBUF_X115_Y40_N8
\r5[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(15),
	o => \r5[15]~input_o\);

-- Location: IOIBUF_X115_Y50_N8
\r5[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(16),
	o => \r5[16]~input_o\);

-- Location: IOIBUF_X115_Y61_N15
\r5[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(17),
	o => \r5[17]~input_o\);

-- Location: IOIBUF_X115_Y40_N1
\r5[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(18),
	o => \r5[18]~input_o\);

-- Location: IOIBUF_X115_Y50_N1
\r5[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(19),
	o => \r5[19]~input_o\);

-- Location: IOIBUF_X115_Y62_N22
\r5[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(20),
	o => \r5[20]~input_o\);

-- Location: IOIBUF_X115_Y41_N8
\r5[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(21),
	o => \r5[21]~input_o\);

-- Location: IOIBUF_X115_Y51_N8
\r5[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(22),
	o => \r5[22]~input_o\);

-- Location: IOIBUF_X115_Y62_N15
\r5[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(23),
	o => \r5[23]~input_o\);

-- Location: IOIBUF_X115_Y41_N1
\r5[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(24),
	o => \r5[24]~input_o\);

-- Location: IOIBUF_X115_Y51_N1
\r5[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(25),
	o => \r5[25]~input_o\);

-- Location: IOIBUF_X115_Y62_N8
\r5[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(26),
	o => \r5[26]~input_o\);

-- Location: IOIBUF_X115_Y44_N8
\r5[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(27),
	o => \r5[27]~input_o\);

-- Location: IOIBUF_X115_Y52_N8
\r5[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(28),
	o => \r5[28]~input_o\);

-- Location: IOIBUF_X115_Y63_N8
\r5[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(29),
	o => \r5[29]~input_o\);

-- Location: IOIBUF_X115_Y44_N1
\r5[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(30),
	o => \r5[30]~input_o\);

-- Location: IOIBUF_X115_Y52_N1
\r5[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r5(31),
	o => \r5[31]~input_o\);

-- Location: IOIBUF_X115_Y63_N1
\r6[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(0),
	o => \r6[0]~input_o\);

-- Location: IOIBUF_X115_Y45_N22
\r6[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(1),
	o => \r6[1]~input_o\);

-- Location: IOIBUF_X115_Y54_N15
\r6[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(2),
	o => \r6[2]~input_o\);

-- Location: IOIBUF_X115_Y64_N8
\r6[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(3),
	o => \r6[3]~input_o\);

-- Location: IOIBUF_X115_Y45_N15
\r6[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(4),
	o => \r6[4]~input_o\);

-- Location: IOIBUF_X115_Y55_N22
\r6[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(5),
	o => \r6[5]~input_o\);

-- Location: IOIBUF_X115_Y64_N1
\r6[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(6),
	o => \r6[6]~input_o\);

-- Location: IOIBUF_X115_Y46_N8
\r6[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(7),
	o => \r6[7]~input_o\);

-- Location: IOIBUF_X115_Y55_N15
\r6[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(8),
	o => \r6[8]~input_o\);

-- Location: IOIBUF_X115_Y65_N22
\r6[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(9),
	o => \r6[9]~input_o\);

-- Location: IOIBUF_X115_Y46_N1
\r6[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(10),
	o => \r6[10]~input_o\);

-- Location: IOIBUF_X115_Y56_N22
\r6[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(11),
	o => \r6[11]~input_o\);

-- Location: IOIBUF_X115_Y65_N15
\r6[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(12),
	o => \r6[12]~input_o\);

-- Location: IOIBUF_X115_Y47_N22
\r6[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(13),
	o => \r6[13]~input_o\);

-- Location: IOIBUF_X115_Y56_N15
\r6[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(14),
	o => \r6[14]~input_o\);

-- Location: IOIBUF_X115_Y66_N22
\r6[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(15),
	o => \r6[15]~input_o\);

-- Location: IOIBUF_X115_Y47_N15
\r6[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(16),
	o => \r6[16]~input_o\);

-- Location: IOIBUF_X115_Y57_N22
\r6[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(17),
	o => \r6[17]~input_o\);

-- Location: IOIBUF_X115_Y66_N15
\r6[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(18),
	o => \r6[18]~input_o\);

-- Location: IOIBUF_X115_Y48_N8
\r6[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(19),
	o => \r6[19]~input_o\);

-- Location: IOIBUF_X115_Y57_N15
\r6[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(20),
	o => \r6[20]~input_o\);

-- Location: IOIBUF_X115_Y68_N22
\r6[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(21),
	o => \r6[21]~input_o\);

-- Location: IOIBUF_X115_Y48_N1
\r6[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(22),
	o => \r6[22]~input_o\);

-- Location: IOIBUF_X115_Y58_N22
\r6[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(23),
	o => \r6[23]~input_o\);

-- Location: IOIBUF_X115_Y68_N15
\r6[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(24),
	o => \r6[24]~input_o\);

-- Location: IOIBUF_X115_Y58_N15
\r6[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(25),
	o => \r6[25]~input_o\);

-- Location: IOIBUF_X115_Y69_N22
\r6[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(26),
	o => \r6[26]~input_o\);

-- Location: IOIBUF_X115_Y59_N22
\r6[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(27),
	o => \r6[27]~input_o\);

-- Location: IOIBUF_X115_Y69_N15
\r6[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(28),
	o => \r6[28]~input_o\);

-- Location: IOIBUF_X115_Y59_N15
\r6[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(29),
	o => \r6[29]~input_o\);

-- Location: IOIBUF_X115_Y69_N1
\r6[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(30),
	o => \r6[30]~input_o\);

-- Location: IOIBUF_X115_Y42_N15
\r6[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r6(31),
	o => \r6[31]~input_o\);

-- Location: IOIBUF_X115_Y53_N15
\r8[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(0),
	o => \r8[0]~input_o\);

-- Location: IOIBUF_X115_Y67_N15
\r8[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(1),
	o => \r8[1]~input_o\);

-- Location: IOIBUF_X0_Y69_N8
\r8[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(2),
	o => \r8[2]~input_o\);

-- Location: IOIBUF_X0_Y60_N15
\r8[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(3),
	o => \r8[3]~input_o\);

-- Location: IOIBUF_X0_Y48_N1
\r8[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(4),
	o => \r8[4]~input_o\);

-- Location: IOIBUF_X0_Y68_N1
\r8[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(5),
	o => \r8[5]~input_o\);

-- Location: IOIBUF_X0_Y59_N15
\r8[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(6),
	o => \r8[6]~input_o\);

-- Location: IOIBUF_X0_Y48_N8
\r8[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(7),
	o => \r8[7]~input_o\);

-- Location: IOIBUF_X0_Y68_N8
\r8[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(8),
	o => \r8[8]~input_o\);

-- Location: IOIBUF_X0_Y59_N22
\r8[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(9),
	o => \r8[9]~input_o\);

-- Location: IOIBUF_X0_Y47_N15
\r8[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(10),
	o => \r8[10]~input_o\);

-- Location: IOIBUF_X0_Y67_N15
\r8[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(11),
	o => \r8[11]~input_o\);

-- Location: IOIBUF_X0_Y57_N15
\r8[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(12),
	o => \r8[12]~input_o\);

-- Location: IOIBUF_X0_Y47_N22
\r8[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(13),
	o => \r8[13]~input_o\);

-- Location: IOIBUF_X0_Y67_N22
\r8[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(14),
	o => \r8[14]~input_o\);

-- Location: IOIBUF_X0_Y57_N22
\r8[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(15),
	o => \r8[15]~input_o\);

-- Location: IOIBUF_X0_Y46_N15
\r8[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(16),
	o => \r8[16]~input_o\);

-- Location: IOIBUF_X0_Y66_N15
\r8[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(17),
	o => \r8[17]~input_o\);

-- Location: IOIBUF_X0_Y55_N8
\r8[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(18),
	o => \r8[18]~input_o\);

-- Location: IOIBUF_X0_Y46_N22
\r8[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(19),
	o => \r8[19]~input_o\);

-- Location: IOIBUF_X0_Y66_N22
\r8[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(20),
	o => \r8[20]~input_o\);

-- Location: IOIBUF_X0_Y55_N15
\r8[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(21),
	o => \r8[21]~input_o\);

-- Location: IOIBUF_X0_Y45_N15
\r8[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(22),
	o => \r8[22]~input_o\);

-- Location: IOIBUF_X0_Y65_N15
\r8[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(23),
	o => \r8[23]~input_o\);

-- Location: IOIBUF_X0_Y55_N22
\r8[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(24),
	o => \r8[24]~input_o\);

-- Location: IOIBUF_X0_Y45_N22
\r8[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(25),
	o => \r8[25]~input_o\);

-- Location: IOIBUF_X0_Y64_N1
\r8[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(26),
	o => \r8[26]~input_o\);

-- Location: IOIBUF_X0_Y54_N8
\r8[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(27),
	o => \r8[27]~input_o\);

-- Location: IOIBUF_X0_Y44_N1
\r8[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(28),
	o => \r8[28]~input_o\);

-- Location: IOIBUF_X0_Y63_N15
\r8[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(29),
	o => \r8[29]~input_o\);

-- Location: IOIBUF_X0_Y53_N1
\r8[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(30),
	o => \r8[30]~input_o\);

-- Location: IOIBUF_X0_Y44_N8
\r8[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => r8(31),
	o => \r8[31]~input_o\);

ww_ret <= \ret~output_o\;

ww_done <= \done~output_o\;

r0(0) <= \r0[0]~output_o\;

r0(1) <= \r0[1]~output_o\;

r0(2) <= \r0[2]~output_o\;

r0(3) <= \r0[3]~output_o\;

r0(4) <= \r0[4]~output_o\;

r0(5) <= \r0[5]~output_o\;

r0(6) <= \r0[6]~output_o\;

r0(7) <= \r0[7]~output_o\;

r0(8) <= \r0[8]~output_o\;

r0(9) <= \r0[9]~output_o\;

r0(10) <= \r0[10]~output_o\;

r0(11) <= \r0[11]~output_o\;

r0(12) <= \r0[12]~output_o\;

r0(13) <= \r0[13]~output_o\;

r0(14) <= \r0[14]~output_o\;

r0(15) <= \r0[15]~output_o\;

r0(16) <= \r0[16]~output_o\;

r0(17) <= \r0[17]~output_o\;

r0(18) <= \r0[18]~output_o\;

r0(19) <= \r0[19]~output_o\;

r0(20) <= \r0[20]~output_o\;

r0(21) <= \r0[21]~output_o\;

r0(22) <= \r0[22]~output_o\;

r0(23) <= \r0[23]~output_o\;

r0(24) <= \r0[24]~output_o\;

r0(25) <= \r0[25]~output_o\;

r0(26) <= \r0[26]~output_o\;

r0(27) <= \r0[27]~output_o\;

r0(28) <= \r0[28]~output_o\;

r0(29) <= \r0[29]~output_o\;

r0(30) <= \r0[30]~output_o\;

r0(31) <= \r0[31]~output_o\;

r1(0) <= \r1[0]~output_o\;

r1(1) <= \r1[1]~output_o\;

r1(2) <= \r1[2]~output_o\;

r1(3) <= \r1[3]~output_o\;

r1(4) <= \r1[4]~output_o\;

r1(5) <= \r1[5]~output_o\;

r1(6) <= \r1[6]~output_o\;

r1(7) <= \r1[7]~output_o\;

r1(8) <= \r1[8]~output_o\;

r1(9) <= \r1[9]~output_o\;

r1(10) <= \r1[10]~output_o\;

r1(11) <= \r1[11]~output_o\;

r1(12) <= \r1[12]~output_o\;

r1(13) <= \r1[13]~output_o\;

r1(14) <= \r1[14]~output_o\;

r1(15) <= \r1[15]~output_o\;

r1(16) <= \r1[16]~output_o\;

r1(17) <= \r1[17]~output_o\;

r1(18) <= \r1[18]~output_o\;

r1(19) <= \r1[19]~output_o\;

r1(20) <= \r1[20]~output_o\;

r1(21) <= \r1[21]~output_o\;

r1(22) <= \r1[22]~output_o\;

r1(23) <= \r1[23]~output_o\;

r1(24) <= \r1[24]~output_o\;

r1(25) <= \r1[25]~output_o\;

r1(26) <= \r1[26]~output_o\;

r1(27) <= \r1[27]~output_o\;

r1(28) <= \r1[28]~output_o\;

r1(29) <= \r1[29]~output_o\;

r1(30) <= \r1[30]~output_o\;

r1(31) <= \r1[31]~output_o\;

r2(0) <= \r2[0]~output_o\;

r2(1) <= \r2[1]~output_o\;

r2(2) <= \r2[2]~output_o\;

r2(3) <= \r2[3]~output_o\;

r2(4) <= \r2[4]~output_o\;

r2(5) <= \r2[5]~output_o\;

r2(6) <= \r2[6]~output_o\;

r2(7) <= \r2[7]~output_o\;

r2(8) <= \r2[8]~output_o\;

r2(9) <= \r2[9]~output_o\;

r2(10) <= \r2[10]~output_o\;

r2(11) <= \r2[11]~output_o\;

r2(12) <= \r2[12]~output_o\;

r2(13) <= \r2[13]~output_o\;

r2(14) <= \r2[14]~output_o\;

r2(15) <= \r2[15]~output_o\;

r2(16) <= \r2[16]~output_o\;

r2(17) <= \r2[17]~output_o\;

r2(18) <= \r2[18]~output_o\;

r2(19) <= \r2[19]~output_o\;

r2(20) <= \r2[20]~output_o\;

r2(21) <= \r2[21]~output_o\;

r2(22) <= \r2[22]~output_o\;

r2(23) <= \r2[23]~output_o\;

r2(24) <= \r2[24]~output_o\;

r2(25) <= \r2[25]~output_o\;

r2(26) <= \r2[26]~output_o\;

r2(27) <= \r2[27]~output_o\;

r2(28) <= \r2[28]~output_o\;

r2(29) <= \r2[29]~output_o\;

r2(30) <= \r2[30]~output_o\;

r2(31) <= \r2[31]~output_o\;

r4(0) <= \r4[0]~output_o\;

r4(1) <= \r4[1]~output_o\;

r4(2) <= \r4[2]~output_o\;

r4(3) <= \r4[3]~output_o\;

r4(4) <= \r4[4]~output_o\;

r4(5) <= \r4[5]~output_o\;

r4(6) <= \r4[6]~output_o\;

r4(7) <= \r4[7]~output_o\;

r4(8) <= \r4[8]~output_o\;

r4(9) <= \r4[9]~output_o\;

r4(10) <= \r4[10]~output_o\;

r4(11) <= \r4[11]~output_o\;

r4(12) <= \r4[12]~output_o\;

r4(13) <= \r4[13]~output_o\;

r4(14) <= \r4[14]~output_o\;

r4(15) <= \r4[15]~output_o\;

r4(16) <= \r4[16]~output_o\;

r4(17) <= \r4[17]~output_o\;

r4(18) <= \r4[18]~output_o\;

r4(19) <= \r4[19]~output_o\;

r4(20) <= \r4[20]~output_o\;

r4(21) <= \r4[21]~output_o\;

r4(22) <= \r4[22]~output_o\;

r4(23) <= \r4[23]~output_o\;

r4(24) <= \r4[24]~output_o\;

r4(25) <= \r4[25]~output_o\;

r4(26) <= \r4[26]~output_o\;

r4(27) <= \r4[27]~output_o\;

r4(28) <= \r4[28]~output_o\;

r4(29) <= \r4[29]~output_o\;

r4(30) <= \r4[30]~output_o\;

r4(31) <= \r4[31]~output_o\;

r5(0) <= \r5[0]~output_o\;

r5(1) <= \r5[1]~output_o\;

r5(2) <= \r5[2]~output_o\;

r5(3) <= \r5[3]~output_o\;

r5(4) <= \r5[4]~output_o\;

r5(5) <= \r5[5]~output_o\;

r5(6) <= \r5[6]~output_o\;

r5(7) <= \r5[7]~output_o\;

r5(8) <= \r5[8]~output_o\;

r5(9) <= \r5[9]~output_o\;

r5(10) <= \r5[10]~output_o\;

r5(11) <= \r5[11]~output_o\;

r5(12) <= \r5[12]~output_o\;

r5(13) <= \r5[13]~output_o\;

r5(14) <= \r5[14]~output_o\;

r5(15) <= \r5[15]~output_o\;

r5(16) <= \r5[16]~output_o\;

r5(17) <= \r5[17]~output_o\;

r5(18) <= \r5[18]~output_o\;

r5(19) <= \r5[19]~output_o\;

r5(20) <= \r5[20]~output_o\;

r5(21) <= \r5[21]~output_o\;

r5(22) <= \r5[22]~output_o\;

r5(23) <= \r5[23]~output_o\;

r5(24) <= \r5[24]~output_o\;

r5(25) <= \r5[25]~output_o\;

r5(26) <= \r5[26]~output_o\;

r5(27) <= \r5[27]~output_o\;

r5(28) <= \r5[28]~output_o\;

r5(29) <= \r5[29]~output_o\;

r5(30) <= \r5[30]~output_o\;

r5(31) <= \r5[31]~output_o\;

r6(0) <= \r6[0]~output_o\;

r6(1) <= \r6[1]~output_o\;

r6(2) <= \r6[2]~output_o\;

r6(3) <= \r6[3]~output_o\;

r6(4) <= \r6[4]~output_o\;

r6(5) <= \r6[5]~output_o\;

r6(6) <= \r6[6]~output_o\;

r6(7) <= \r6[7]~output_o\;

r6(8) <= \r6[8]~output_o\;

r6(9) <= \r6[9]~output_o\;

r6(10) <= \r6[10]~output_o\;

r6(11) <= \r6[11]~output_o\;

r6(12) <= \r6[12]~output_o\;

r6(13) <= \r6[13]~output_o\;

r6(14) <= \r6[14]~output_o\;

r6(15) <= \r6[15]~output_o\;

r6(16) <= \r6[16]~output_o\;

r6(17) <= \r6[17]~output_o\;

r6(18) <= \r6[18]~output_o\;

r6(19) <= \r6[19]~output_o\;

r6(20) <= \r6[20]~output_o\;

r6(21) <= \r6[21]~output_o\;

r6(22) <= \r6[22]~output_o\;

r6(23) <= \r6[23]~output_o\;

r6(24) <= \r6[24]~output_o\;

r6(25) <= \r6[25]~output_o\;

r6(26) <= \r6[26]~output_o\;

r6(27) <= \r6[27]~output_o\;

r6(28) <= \r6[28]~output_o\;

r6(29) <= \r6[29]~output_o\;

r6(30) <= \r6[30]~output_o\;

r6(31) <= \r6[31]~output_o\;

r8(0) <= \r8[0]~output_o\;

r8(1) <= \r8[1]~output_o\;

r8(2) <= \r8[2]~output_o\;

r8(3) <= \r8[3]~output_o\;

r8(4) <= \r8[4]~output_o\;

r8(5) <= \r8[5]~output_o\;

r8(6) <= \r8[6]~output_o\;

r8(7) <= \r8[7]~output_o\;

r8(8) <= \r8[8]~output_o\;

r8(9) <= \r8[9]~output_o\;

r8(10) <= \r8[10]~output_o\;

r8(11) <= \r8[11]~output_o\;

r8(12) <= \r8[12]~output_o\;

r8(13) <= \r8[13]~output_o\;

r8(14) <= \r8[14]~output_o\;

r8(15) <= \r8[15]~output_o\;

r8(16) <= \r8[16]~output_o\;

r8(17) <= \r8[17]~output_o\;

r8(18) <= \r8[18]~output_o\;

r8(19) <= \r8[19]~output_o\;

r8(20) <= \r8[20]~output_o\;

r8(21) <= \r8[21]~output_o\;

r8(22) <= \r8[22]~output_o\;

r8(23) <= \r8[23]~output_o\;

r8(24) <= \r8[24]~output_o\;

r8(25) <= \r8[25]~output_o\;

r8(26) <= \r8[26]~output_o\;

r8(27) <= \r8[27]~output_o\;

r8(28) <= \r8[28]~output_o\;

r8(29) <= \r8[29]~output_o\;

r8(30) <= \r8[30]~output_o\;

r8(31) <= \r8[31]~output_o\;
END structure;


