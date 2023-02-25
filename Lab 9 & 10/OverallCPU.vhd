----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.07.2022 23:43:32
-- Design Name: 
-- Module Name: OverallCPU - Behavioral
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

entity OverallCPU is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg_out : out std_logic_vector (6 downto 0);
           An : out std_logic_vector (3 downto 0)
           );
end OverallCPU;

architecture Behavioral of OverallCPU is

component NanoProcessor
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal led_out_signal : std_logic_vector (3 downto 0);

begin

NanoProcessor0 : NanoProcessor
    port map
        (
        Clk => Clk,
        Reset => Reset,
        Zero => Zero,
        Overflow => Overflow,
        LED_out => led_out_signal
        );
           
LUT0 : LUT_16_7
    port map
        (
        address => led_out_signal,
        data => SevenSeg_out
        );
        
LED_out <= led_out_signal;
An <= "1110";

end Behavioral;
