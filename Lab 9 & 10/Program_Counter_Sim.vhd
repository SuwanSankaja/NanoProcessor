----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.07.2022 21:33:04
-- Design Name: 
-- Module Name: Program_Counter_Sim - Behavioral
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

entity Program_Counter_Sim is
--  Port ( );
end Program_Counter_Sim;

architecture Behavioral of Program_Counter_Sim is

component Program_Counter
    Port ( Mux_3_2_out : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal mux_out, count : std_logic_vector (2 downto 0);
signal clk, reset : std_logic := '0'; 

begin

UUT : Program_Counter
    port map (
        Mux_3_2_out => mux_out,
        Clk => clk,
        Reset => reset,
        Count => count);

process 
begin
    wait for 20ns;
    clk <= not clk;
end process;

process
begin
    -- index number 200399G = 110 000 111 011 001 111
    mux_out <= "000";
    wait for 300ns;
    
    mux_out <= "110";
    wait for 200ns;
    
    mux_out <= "111";
    wait for 100ns;
    
    reset <= '1';
    wait for 100ns;
    
    reset <= '0';
    mux_out <= "011";
    wait;
end process;

end Behavioral;
