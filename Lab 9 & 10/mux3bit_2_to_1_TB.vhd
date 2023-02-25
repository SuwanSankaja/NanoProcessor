----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 04:14:26 AM
-- Design Name: 
-- Module Name: mux3bit_2_to_1_TB - Behavioral
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

entity mux3bit_2_to_1_TB is
--  Port ( );
end mux3bit_2_to_1_TB;

architecture Behavioral of mux3bit_2_to_1_TB is
component MUX_2_Way_3_bit
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal I0 : STD_LOGIC_VECTOR (2 downto 0);
signal I1 : STD_LOGIC_VECTOR (2 downto 0);
signal Y :STD_LOGIC_VECTOR (2 downto 0);
signal S: STD_LOGIC;

begin
UUT: MUX_2_Way_3_bit
    PORT MAP (
        I0 => I0,
        I1 => I1,
        S =>S,
        Y=>Y);
process

begin 
    I0 <= "001" ;  -- input0 = output from 3-bit adder  
    I1 <= "100" ;  -- input1 = instruction decoder address
    S <= '0' ;     -- selector = instruction decoder jump flag
    
    wait for 100ns;
    s <= '1';
    
    wait ;
    end process;

end Behavioral;
