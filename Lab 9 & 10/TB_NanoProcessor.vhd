----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2022 11:45:04 PM
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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

entity TB_NanoProcessor is
--  Port ( );
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is

component NanoProcessor
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0));
 end component;

signal Clk,Reset : STD_LOGIC :='0';
signal Zero , Overflow :STD_LOGIC;
signal led_out : std_logic_vector (3 downto 0);
begin

    uut : NanoProcessor
        port map(
            Clk => Clk,
            Reset =>Reset,
            Zero => Zero,
            Overflow => Overflow,
            LED_out => led_out
        );
    
    process
    begin
        wait for 5ns;
        Clk <= not(Clk);
    end process;
    
    process
    begin
        Reset <= '1';
        wait for 110ns;
        Reset <='0';
        wait;
    end process;
        
 
end Behavioral;
