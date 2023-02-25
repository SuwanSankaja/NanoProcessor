----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.07.2022 21:23:46
-- Design Name: 
-- Module Name: Instruction_Decorder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_Decorder is
    Port ( InstructionBus : in STD_LOGIC_VECTOR (11 downto 0);
           RegCheck : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           ImmediateVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           JumpFlag : out STD_LOGIC;
           JumpAddress : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSel : out STD_LOGIC);
end Instruction_Decorder;

architecture Behavioral of Instruction_Decorder is

component Decoder_2_to_4
    Port ( 
           I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

signal instruction : std_logic_vector (1 downto 0);
signal y : std_logic_vector (3 downto 0);
signal x1 : std_logic;
signal RegSel21, RegSel22 : std_logic_vector (2 downto 0);
signal JumpFlagOut : std_logic;
begin
    
    instruction <= InstructionBus (11 downto 10);
    
    Decoder : Decoder_2_to_4
        port map (
            I => instruction,
            EN => '1',
            Y => y);
    
    LoadSel <= not y(2);
    RegEn <= InstructionBus (9 downto 7);
    ImmediateVal <= InstructionBus (3 downto 0);
    RegSel1 <= InstructionBus (9 downto 7) and ((y(0) or y(1) or y(3)),(y(0) or y(1) or y(3)),(y(0) or y(1) or y(3)));
    RegSel2 <= InstructionBus (6 downto 4) and ((y(0) or y(1)),(y(0) or y(1)),(y(0) or y(1)));
    AddSubSel <= y(0);
    JumpAddress <= InstructionBus (2 downto 0);
    JumpFlag <= y(3) and not(RegCheck(0) or RegCheck(1) or RegCheck(2) or RegCheck(3));
    
end Behavioral;
