----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 01:27:04 AM
-- Design Name: 
-- Module Name: MUX_2_Way_4_bit - Behavioral
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

entity MUX_2_Way_4_bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_Way_4_bit;

architecture Behavioral of MUX_2_Way_4_bit is

begin
    
    Mux_out(0) <= (NOT(Sel) AND A(0)) OR (Sel AND B(0));
    Mux_out(1) <= (NOT(Sel) AND A(1)) OR (Sel AND B(1));
    Mux_out(2) <= (NOT(Sel) AND A(2)) OR (Sel AND B(2));
    Mux_out(3) <= (NOT(Sel) AND A(3)) OR (Sel AND B(3));


end Behavioral;
