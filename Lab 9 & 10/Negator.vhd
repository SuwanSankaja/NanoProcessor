----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 11:29:43 PM
-- Design Name: 
-- Module Name: Negator - Behavioral
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

entity Negator is
    Port ( Neg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Neg_out : out STD_LOGIC_VECTOR (3 downto 0));
end Negator;

architecture Behavioral of Negator is

component RCA_4
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       C_in : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       C_out : out STD_LOGIC);
end component;

SIGNAL N : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Z : STD_LOGIC;

begin

N(0) <= NOT(Neg_in(0)) ;
N(1) <= NOT(Neg_in(1)) ;
N(2) <= NOT(Neg_in(2)) ;
N(3) <= NOT(Neg_in(3)) ;

RCA_4_0 : RCA_4
    port map(
       A => N,
       B => "0001",
       C_in => '0',
       S => Neg_out
    );

end Behavioral;
