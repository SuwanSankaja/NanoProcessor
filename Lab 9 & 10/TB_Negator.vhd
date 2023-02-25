----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 12:03:21 AM
-- Design Name: 
-- Module Name: TB_Negator - Behavioral
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

entity TB_Negator is
--  Port ( );
end TB_Negator;

architecture Behavioral of TB_Negator is

component Negator
    Port ( Neg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Neg_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL NegIn,NegOut: STD_LOGIC_VECTOR (3 downto 0);

begin

    uut : Negator
    port map(
        Neg_in => NegIn,
        Neg_out => NegOut
    );

    process
    begin
    
        NegIn <= "0000";
        wait for 100ns;
        
        NegIn <= "1010";
        wait for 100ns;
        
        NegIn <= "0111";
        wait for 100ns;
        
        NegIn <= "0101";
        
        wait for 100ns;
        NegIn <= "1001";
        wait;
        
    end process;




end Behavioral;
