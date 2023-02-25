----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 02:02:45 AM
-- Design Name: 
-- Module Name: TB_AddSub_4bit - Behavioral
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

entity TB_AddSub_4bit is
--  Port ( );
end TB_AddSub_4bit;

architecture Behavioral of TB_AddSub_4bit is

component AddSub_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Overflow: out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

SIGNAL A,B,S : STD_LOGIC_VECTOR (3 downto 0) ;
SIGNAL Sel,C_out,Overflow,Zero : STD_LOGIC ;

begin

    uut : AddSub_4bit
        port map(
            A => A,
            B => B,
            S => S,
            Sel => Sel,
            Overflow => Overflow,
            Zero => Zero
        );
    
    process
    begin
        
        A <= "0001" ; 
        B <= "0000" ;
        Sel <= '0';
        wait for 100ns;
        
        A <="1010";
        B <= "0000" ;
        sel <= '0' ;
        wait for 100ns ;
        
        A <= "0101" ;
        B <= "0000" ;
        wait ;
    end process;


end Behavioral;
