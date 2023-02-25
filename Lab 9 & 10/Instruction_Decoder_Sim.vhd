----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.07.2022 14:41:47
-- Design Name: 
-- Module Name: Instruction_Decoder_Sim - Behavioral
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

entity Instruction_Decoder_Sim is
--  Port ( );
end Instruction_Decoder_Sim;

architecture Behavioral of Instruction_Decoder_Sim is

component Instruction_Decorder
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
end component;

signal instructionbus : std_logic_vector (11 downto 0);
signal regcheck, immediateval : std_logic_vector (3 downto 0);
signal regen, regsel1, regsel2, jumpaddress : std_logic_vector (2 downto 0);
signal loadsel, jumpflag, addsubsel : std_logic;

begin

UUT : Instruction_Decorder
    port map (
        instructionbus => InstructionBus,
        regcheck => RegCheck,
        regen => RegEn,
        loadsel => LoadSel,
        immediateval => ImmediateVal,
        regsel1 => RegSel1,
        regsel2 => RegSel2,
        jumpflag => JumpFlag,
        jumpaddress => JumpAddress,
        addsubsel => AddSubSel);

process
begin
    InstructionBus <= "000010100000"; --add R1 R2
    RegCheck <= "0000";
    wait for 100ns;
    
    InstructionBus <= "010100000000"; --neg R2
    RegCheck <= "0000";
    wait for 100ns;
    
    InstructionBus <= "100110001010"; --movi R3 10
    RegCheck <= "0000";
    wait for 100ns;
    
    InstructionBus <= "110100000101"; --jzr R2 101
    RegCheck <= "0001";
    wait for 100ns;
    
    InstructionBus <= "110100000101"; --jzr R2 101
    RegCheck <= "0000";
    wait;
end process;

end Behavioral;
