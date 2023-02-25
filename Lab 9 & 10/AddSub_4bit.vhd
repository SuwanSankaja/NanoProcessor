----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 12:56:11 AM
-- Design Name: 
-- Module Name: AddSub_4bit - Behavioral
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

entity AddSub_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Overflow: out STD_LOGIC;
           Zero : out STD_LOGIC);
end AddSub_4bit;

architecture Behavioral of AddSub_4bit is

component RCA_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end component;

component Negator
    Port ( Neg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Neg_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2_Way_4_bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SiGNAL NegOut,MuxOut,Sum :STD_LOGIC_VECTOR (3 downto 0);

begin

Negator_0 : Negator
    port map(
        Neg_in => A,
        Neg_out => NegOut
    );
    
MUX_2_Way_4_bit_0 : MUX_2_Way_4_bit
    port map(
        A => NegOut,
        B => A,
        Sel => Sel,
        Mux_out => MuxOut
    );

RCA_4_0 : RCA_4
    port map(
        A => MuxOut ,
        B => B,
        C_in => '0',
        S => Sum
    );
    
Overflow <= ( B(3) AND MuxOut(3) AND NOT(Sum(3)) ) OR ( NOT(B(3)) AND NOT(MuxOut(3)) AND Sum(3) ) ;
Zero <= NOT(Sum(0) OR Sum(1) OR Sum(2) OR Sum(3)) ;
S <= Sum ;  


end Behavioral;
