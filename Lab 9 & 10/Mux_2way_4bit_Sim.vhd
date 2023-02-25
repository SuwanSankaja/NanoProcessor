----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2022 08:34:16 PM
-- Design Name: 
-- Module Name: Mux_2way_4bit_Sim - Behavioral
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

entity Mux_2way_4bit_Sim is
--  Port ( );
end Mux_2way_4bit_Sim;

architecture Behavioral of Mux_2way_4bit_Sim is
component MUX_2_Way_4_bit
   Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal a,b,O : std_logic_vector(3 downto 0);
signal sel : std_logic;
begin
UUT: MUX_2_Way_4_bit
port map(
        A => a,
        B => b,
        Sel => sel,
        Mux_out => O);
        
process
begin

-- Index: 200175R : 110000110111101111
-- Index: 200186C : 110000110111111010
-- Index: 200188j : 110000110111111100

-- Index: 200399G : 110000111011001111
-- Index: 200580E : 110000111110000100


a<="0010";
b<="1000";
sel<='0';
WAIT FOR 100ns;

sel<='1';
WAIT;
            


end process;
end Behavioral;