library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_to_1_Sim is
--  Port ( );
end MUX_8_to_1_Sim;

architecture Behavioral of MUX_8_to_1_Sim is
component Mux_8_to_1
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0));
end component;
signal R0,R1,R2,R3,R4,R5,R6,R7 : std_logic_vector(3 downto 0);
signal O: std_logic_vector(3 downto 0);
signal S : std_logic_vector(2 downto 0);

begin
UUT : Mux_8_to_1
port map(   R0(3 downto 0)=> R0(3 downto 0),
            R1(3 downto 0)=> R1(3 downto 0),
            R2(3 downto 0)=> R2(3 downto 0),
            R3(3 downto 0)=> R3(3 downto 0),
            R4(3 downto 0)=> R4(3 downto 0),
            R5(3 downto 0)=> R5(3 downto 0),
            R6(3 downto 0)=> R6(3 downto 0),
            R7(3 downto 0)=> R7(3 downto 0),
            O(3 downto 0)=> O(3 downto 0),
            S(2 downto 0)=> S(2 downto 0));

process 
begin


R0<="0001";
R1<="0010";
R2<="0011";
R3<="0100";
R4<="0101";
R5<="0110";
R6<="0111";
R7<="1000";
S<="000";
WAIT FOR 50ns;

S<="001";
WAIT FOR 20ns;
S<="010";
WAIT FOR 20ns;
S<="011";
WAIT FOR 20ns;
S<="100";
WAIT FOR 20ns;
S<="101";
WAIT FOR 20ns;
S<="110";
WAIT FOR 20ns;
S<="111";
WAIT;

end process;
end Behavioral;