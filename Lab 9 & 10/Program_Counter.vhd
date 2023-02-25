library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    Port ( PC_in : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

component D_FF
Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;

begin

D_FF0 : D_FF
port map (
D => PC_in(0),
Res => Reset,
Clk => Clk,
Q => M_Sel(0));

D_FF1 : D_FF
port map (
D => PC_in(1),
Res => Reset,
Clk => Clk,
Q => M_Sel(1));

D_FF2 : D_FF
port map (
D => PC_in(2),
Res => Reset,
Clk => Clk,
Q => M_Sel(2));

end Behavioral;
