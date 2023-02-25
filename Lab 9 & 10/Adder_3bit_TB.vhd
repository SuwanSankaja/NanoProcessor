----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 02:38:18 AM
-- Design Name: 
-- Module Name: Adder_3bit_TB - Behavioral
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

entity Adder_3bit_TB is
--  Port ( );
end Adder_3bit_TB;

architecture Behavioral of Adder_3bit_TB is

component Adder_3bit
    Port ( A : in STD_LOGIC_vector (2 downto 0);
           B : in STD_LOGIC_vector (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_vector (2 downto 0);
           C_out : out STD_LOGIC);
end component;
signal a, b, s : std_logic_vector (2 downto 0);
signal c_in, c_out : std_logic;
begin
UUT : Adder_3bit 
    port map(
        A => a,
        B => b,
        c_in => C_in,
        S => s,
        c_out => C_out
    );
    
process
    begin
    -- 200580 = 110 000 111 110 000 100
        a <= "110";
        b <= "001";
        c_in <= '0';
        
        WAIT FOR 100 ns;
        a <= "111";
        b <= "001";
        
        WAIT FOR 100 ns;
        a <= "000";
        b <= "001";
            
        WAIT;
       
end process;
end Behavioral;
