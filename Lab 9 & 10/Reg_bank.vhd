----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 09:28:24 PM
-- Design Name: 
-- Module Name: Reg_bank - Behavioral
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

entity Reg_bank is
    Port ( Clk : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0));
end Reg_bank;

architecture Behavioral of Reg_bank is

COMPONENT Decoder_3_to_8
    Port (  I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT Reg
Port (     D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

signal Decoder_out:std_logic_vector(7 downto 0); 
signal Bank_in :std_logic_vector(3 downto 0); 

begin

Decoder_3_to_8_0 : Decoder_3_to_8
port map(
    I => Reg_EN,
    EN => '1',
    Y => Decoder_out
);

Reg0 : Reg
port map(
    D => "0000",
    En =>'1',
    Clk => Clk,
    Q => R0
);
Reg1 : Reg
port map(
    D => Input,
    En => Decoder_out(1),
    Clk => Clk,
    Q => R1
);
Reg2 : Reg
port map(
    D => Input,
    En => Decoder_out(2),
    Clk => Clk,
    Q => R2
);
Reg3 : Reg
port map(
    D => Input,
    En => Decoder_out(3),
    Clk => Clk,
    Q => R3
);
Reg4 : Reg
port map(
    D => Input,
    En => Decoder_out(4),
    Clk => Clk,
    Q => R4
);
Reg5 : Reg
port map(
    D => Input,
    En => Decoder_out(5),
    Clk => Clk,
    Q => R5
);
Reg6 : Reg
port map(
    D => Input,
    En => Decoder_out(6),
    Clk => Clk,
    Q => R6
);
Reg7 : Reg
port map(
    D => Input,
    En => Decoder_out(7),
    Clk => Clk,
    Q => R7
);

end Behavioral;
