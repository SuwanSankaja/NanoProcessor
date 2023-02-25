----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 02:29:50 AM
-- Design Name: 
-- Module Name: Adder_3bit - Behavioral
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

entity Adder_3bit is
    Port ( A :in STD_LOGIC_VECTOR (2 downto 0);
           B :in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end Adder_3bit;

architecture Behavioral of Adder_3bit is
component FA
    PORT(  A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;
signal FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C: std_logic;
begin
 FA_0 : FA 
 port map ( 
 A => A(0), 
 B => B(0), 
 C_in => '0', -- Set to ground 
 S => S(0), 
 C_Out => FA0_C); 
 FA_1 : FA 
 port map ( 
 A => A(1), 
 B => B(1), 
 C_in => FA0_C, 
 S => S(1), 
 C_Out => FA1_C); 
 FA_2 : FA 
 port map ( 
 A => A(2), 
 B => B(2), 
 C_in => FA1_C, 
 S => S(2), 
 C_Out => C_out); 

end Behavioral;
