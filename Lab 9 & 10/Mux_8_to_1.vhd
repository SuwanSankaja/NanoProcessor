----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2022 07:46:39 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity MUX_8_to_1 is
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0));
           
end MUX_8_to_1;

architecture Behavioral of MUX_8_to_1 is
Component Decoder_3_to_8
    port(   I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
 end component;

component Tri_State_Buffer
    port(  Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC);
end component;

Signal Y_Sig : std_logic_vector(7 downto 0);

begin
Decoder_3_to_8_0 : Decoder_3_to_8
    port map (  I => S,
                EN => '1',
                Y => Y_Sig);
Tri_State_Buffer_0 : Tri_State_Buffer
    port map (  Input => R0,
                EN=> Y_Sig(0),
                Output => O);
Tri_State_Buffer_1 : Tri_State_Buffer
    port map (  Input => R1,
                EN=> Y_Sig(1),
                Output => O);
Tri_State_Buffer_2 : Tri_State_Buffer
     port map (  Input => R2,
                 EN=> Y_Sig(2),
                 Output => O);
Tri_State_Buffer_3 : Tri_State_Buffer
     port map (  Input => R3,
                 EN=> Y_Sig(3),
                 Output => O); 
Tri_State_Buffer_4 : Tri_State_Buffer
     port map (  Input => R4,
                 EN=> Y_Sig(4),
                 Output => O);
Tri_State_Buffer_5 : Tri_State_Buffer
      port map ( Input => R5,
                 EN=> Y_Sig(5),
                 Output => O);
Tri_State_Buffer_6 : Tri_State_Buffer
     port map (  Input => R6,
                 EN=> Y_Sig(6),
                 Output => O);
Tri_State_Buffer_7 : Tri_State_Buffer
     port map (  Input => R7,
                 EN=> Y_Sig(7),
                 Output => O);                                                                            
end Behavioral;
