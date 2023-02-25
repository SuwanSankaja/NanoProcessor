----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2022 10:23:31 PM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC);
           
end Counter;

architecture Behavioral of Counter is

    component D_FF
        Port ( D : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC;
               Qbar : out STD_LOGIC);
    end component;
    
    component Slow_Clk 
        port ( Clk_in : in STD_LOGIC; 
               Clk_out: out STD_LOGIC);
    end component;
    
    signal D0, D1, D2 : std_logic; 
    signal Q_0, Q_1, Q_2 : std_logic; 
    signal Clk_slow : std_logic;
              
    
begin

    Slow_Clk0 : Slow_Clk
        port map(
        Clk_in => Clk,
        Clk_out => Clk_slow
        );
     
    D_FF_0 : D_FF
        port map(
            D => D0,
            Res => Res,
            Clk => Clk_slow,
            Q => Q_0
            );
        
    D_FF_1 : D_FF
        port map(
            D => D1,
            Res => Res,
            Clk => Clk_slow,
            Q => Q_1
            );
        
    D_FF_2 : D_FF
        port map(
            D => D2,
            Res => Res,
            Clk => Clk_slow,
            Q => Q_2
            );
        
    D0 <= (not (Q_2) and (not Dir)) or (Q_1 and Dir) or (not(Q_2) and Q_1);
    D1 <= (Q_2 and Dir) or (Q_0 and not(Dir)) or (Q_2 and Q_0);
    D2 <= (Q_1 and not(Q_0)) or (Q_1 and not(Dir)) or (not(Q_0) and Dir);
    Q0 <= Q_0;
    Q1 <= Q_1;
    Q2 <= Q_2;
end Behavioral;
