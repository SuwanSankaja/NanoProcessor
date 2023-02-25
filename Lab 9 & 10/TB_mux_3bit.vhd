----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2022 01:42:14
-- Design Name: 
-- Module Name: TB_mux_3bit - Behavioral
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

entity TB_mux_3bit is
--  Port ( );
end TB_mux_3bit;

architecture Behavioral of TB_mux_3bit is

component mux3bit_2_to_1
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal i0, i1, y : std_logic_vector (2 downto 0);
signal s : std_logic;

begin

UUT : mux3bit_2_to_1
port map (
    I0 => i0,
    I1 => i1,
    S => s,
    Y => y
);

process
begin
    -- 200186 110 000 110 111 111 010
    i0 <= "110";
    i1 <= "000";
    s <= '1';
    wait for 100ns;
    
    s <= '0';
    wait for 100ns;
    
    i0 <= "010";
    i1 <= "111";
    s <= '1';
    wait for 100ns;
        
    s <= '0';
    wait;
     
end process;

end Behavioral;
