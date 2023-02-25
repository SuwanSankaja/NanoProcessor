----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 10:23:20 AM
-- Design Name: 
-- Module Name: Tri_State_Buffer - Behavioral
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

entity Tri_State_Buffer is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end Tri_State_Buffer;

architecture Behavioral of Tri_State_Buffer is

begin
    
    Output <= Input WHEN (EN='1') else "ZZZZ";

end Behavioral;
