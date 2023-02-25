----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.07.2022 14:25:30
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( MemSelect : in STD_LOGIC_VECTOR (2 downto 0);
           InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is

type rom_type is array (0 to 7) of std_logic_vector (11 downto 0);
    signal programROM : rom_type := (
    --    "100010000110", -- MOVI R1,6 
    --    "100100000001", -- MOVI R2,1
    --    "000010100000", -- ADD R1,R2
    --    "010100000000", -- NEG R2
    --    "010010000000", -- NEG R1
    --    "000010100000", -- ADD R1,R2
    --    "110010000111", -- JZR R1,7
    --    "110000000011"  -- JZR R0,3
    
    --Sum of all integers from 1 to 3
        "100010000001", -- MOVI R1,1
        "100100000010", -- MOVI R2,2
        "100110000011", -- MOVI R3,3
        "101110000000", -- MOVI R7,0
        "001110010000", -- ADD R7,R1
        "001110100000", -- ADD R7,R2
        "001110110000", -- ADD R7,R3
        "110000000000"  -- JZR R0,0
    );

begin

InstructionBus <= programROM(to_integer(unsigned(MemSelect)));

end Behavioral;
