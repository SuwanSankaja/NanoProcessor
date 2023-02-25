----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.07.2022 23:45:32
-- Design Name: 
-- Module Name: TB_OverallCPU - Behavioral
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

entity TB_OverallCPU is
--  Port ( );
end TB_OverallCPU;

architecture Behavioral of TB_OverallCPU is

component OverallCPU
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg_out : out std_logic_vector (6 downto 0);
           An : out std_logic_vector (3 downto 0)
           );
end component;

signal clk : STD_LOGIC := '0';
signal reset : STD_LOGIC := '1';
signal zero : STD_LOGIC;
signal overflow : STD_LOGIC;
signal led_out : STD_LOGIC_VECTOR (3 downto 0);
signal sevenseg_out : std_logic_vector (6 downto 0);
signal an : std_logic_vector (3 downto 0);

begin
    
UUT : OverallCPU
    port map
        (
        Clk => clk,
        Reset => reset,
        Zero => zero,
        Overflow => overflow,
        LED_out => led_out,
        SevenSeg_out => sevenseg_out,
        An => an
        );
        
            process
            begin
                wait for 5ns;
                clk <= not(clk);
            end process;
            
            process
            begin
                wait for 110ns;
                reset <= '0';
                wait;
            end process;

end Behavioral;
