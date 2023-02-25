----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.07.2022 15:10:38
-- Design Name: 
-- Module Name: Program_ROM_Sim - Behavioral
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

entity Program_ROM_Sim is
--  Port ( );
end Program_ROM_Sim;

architecture Behavioral of Program_ROM_Sim is

component Program_ROM
    Port ( MemSelect : in STD_LOGIC_VECTOR (2 downto 0);
           InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal memselect : std_logic_vector (2 downto 0);
signal instructionbus : std_logic_vector (11 downto 0);

begin

UUT : Program_ROM
    port map (
        memselect => MemSelect,
        instructionbus => InstructionBus);
        
 process
 begin
    -- 200175 110 000 110 111 101 111
    -- 200188 110 000 110 111 111 100
    wait for 100ns;
    memselect <= "110";
    
    wait for 100ns;
    memselect <= "000";
    
    wait for 100ns;
    memselect <= "111";    
    
    wait for 100ns;
    memselect <= "101";
    
    wait for 100ns;
    memselect <= "100";
    
    wait for 100ns;
    memselect <= "011";
    
    wait for 100ns;
    memselect <= "001";
    
    wait for 100ns;
    memselect <= "010";
    
    wait;
 end process;

end Behavioral;
