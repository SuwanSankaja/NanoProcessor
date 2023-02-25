----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.07.2022 20:52:36
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0)
           );
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component Reg_bank 
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
end component;

component MUX_8_to_1
    port( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component AddSub_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Overflow: out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

component MUX_2_Way_4_bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component Adder_3bit
    Port ( A :in STD_LOGIC_VECTOR (2 downto 0);
           B :in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end component;

component MUX_2_Way_3_bit
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;    

component Instruction_Decorder
    Port ( InstructionBus : in STD_LOGIC_VECTOR (11 downto 0);
           RegCheck : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           ImmediateVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           JumpFlag : out STD_LOGIC;
           JumpAddress : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSel : out STD_LOGIC);
end component;

component Program_Counter
    Port ( PC_in : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           M_sel : out STD_LOGIC_VECTOR (2 downto 0)); 
end component; 

component Program_ROM 
    Port ( MemSelect : in STD_LOGIC_VECTOR (2 downto 0);
           InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));    
end component;

component Slow_Clk 
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);   
end component;

signal databus: STD_LOGIC_VECTOR(31 downto 0);
signal mux1, mux2: STD_LOGIC_VECTOR(3 downto 0);
--signal addsub_out: STD_LOGIC_VECTOR (3 downto 0);
signal Slow_clk_out , LoadSel: STD_LOGIC; 
signal en: STD_LOGIC_VECTOR (2 downto 0); 
signal Input: STD_LOGIC_VECTOR (3 downto 0);  
signal Reg_sel_A, Reg_sel_B, JumpAddress ,Mux_3_2_out ,Adder_3bit_out: STD_LOGIC_VECTOR (2 downto 0); 
signal ProgramCounterOut : STD_LOGIC_VECTOR (2 downto 0); 
signal Mux_A_out, Mux_B_out: STD_LOGIC_VECTOR (3 downto 0); 
signal AddSubSel,JumpFlag: STD_LOGIC;  
signal Sum , ImmediateVal , RegBankBus : STD_LOGIC_VECTOR (3 downto 0);
signal InstructionBus : STD_LOGIC_VECTOR (11 downto 0);
                                 
begin

Reg_bank_0: Reg_bank 
    port map(
        Clk => Slow_clk_out,
        R0 => databus(3 downto 0),
        R1 => databus(7 downto 4),
        R2 => databus(11 downto 8),
        R3 => databus(15 downto 12),
        R4 => databus(19 downto 16),
        R5 => databus(23 downto 20),
        R6 => databus(27 downto 24),
        R7 => databus(31 downto 28),
        REG_EN => en,
        Input => RegBankBus,
        Reset => Reset
    );
MUX_8_to_1_A: MUX_8_to_1 
        Port map( 
            R0 => databus(3 downto 0),
            R1 => databus(7 downto 4),
            R2 => databus(11 downto 8),
            R3 => databus(15 downto 12),
            R4 => databus(19 downto 16),
            R5 => databus(23 downto 20),
            R6 => databus(27 downto 24),
            R7 => databus(31 downto 28),
            S => Reg_sel_A,  
            O => Mux_A_out            
       );
MUX_8_to_1_B: MUX_8_to_1 
               Port map( 
                   R0 => databus(3 downto 0),
                   R1 => databus(7 downto 4),
                   R2 => databus(11 downto 8),
                   R3 => databus(15 downto 12),
                   R4 => databus(19 downto 16),
                   R5 => databus(23 downto 20),
                   R6 => databus(27 downto 24),
                   R7 => databus(31 downto 28),
                   S => Reg_sel_B,
                   O => Mux_B_out    
                );
AddSub_4bit_0: AddSub_4bit
    port map(
               A => Mux_A_out,
               B  => Mux_B_out,
               S => Sum,
               Sel => AddSubSel,
               Overflow => Overflow,
               Zero => Zero  
    );
    
Adder_3bit_0 : Adder_3bit
    port map(
        A => ProgramCounterOut,
        B => "001",
        C_in =>'0',
        S => Adder_3bit_out
    );

MUX_2_Way_3_bit_0 : MUX_2_Way_3_bit
    port map(
        I0 => Adder_3bit_out,
        I1 => JumpAddress,
        S => JumpFlag,
        Y => Mux_3_2_out
    );  


Program_Counter_0 : Program_Counter
    port map(
        PC_in => Mux_3_2_out,
        Clk => Slow_clk_out,
        Reset => Reset,
        M_sel => ProgramCounterOut
    );

Program_ROM_0 : Program_ROM
    port map(
        MemSelect => ProgramCounterOut,
        InstructionBus => InstructionBus
    );
    
Instruction_Decorder_0 : Instruction_Decorder
    port map(
        InstructionBus => InstructionBus,
        RegCheck => Mux_A_out,
        RegEn => en,
        LoadSel => LoadSel,
        ImmediateVal => ImmediateVal,
        RegSel1 => Reg_sel_A,
        RegSel2 => Reg_sel_B,
        JumpFlag => JumpFlag,
        JumpAddress => JumpAddress,
        AddSubSel => AddSubSel
    
    );
    
    
MUX_2_Way_4_bit_1 : MUX_2_Way_4_bit
    port map(
        A => ImmediateVal,
        B => Sum,
        Sel => LoadSel,
        Mux_out => RegBankBus
    );
   
Slow_Clk_0 : Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => Slow_clk_out
    );
    
LED_out <= databus (31 downto 28);

end Behavioral;
