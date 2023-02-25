----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 09:50:46 PM
-- Design Name: 
-- Module Name: Reg_bank_Sim - Behavioral
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

entity Reg_bank_sim is
--  Port ( );
end Reg_bank_sim;

architecture Behavioral of Reg_bank_sim is
COMPONENT Reg_bank
   PORT( Clk	:	IN	STD_LOGIC; 
          Reset	:	IN	STD_LOGIC; 
          R0	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R1	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R2	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R3	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R4	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R5	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R6	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R7	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          Input	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          Reg_EN	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0));
   END COMPONENT;

   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL Reset	:	STD_LOGIC;
   SIGNAL R0	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R1	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R2	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R3	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R4	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R5	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R6	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R7	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL Input	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL Reg_EN	:	STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

   UUT: Reg_bank PORT MAP(
		Clk => Clk, 
		Reset => Reset, 
		R0 => R0, 
		R1 => R1, 
		R2 => R2, 
		R3 => R3, 
		R4 => R4, 
		R5 => R5, 
		R6 => R6, 
		R7 => R7, 
		Input => Input, 
		Reg_EN => Reg_EN
   );

PROCESS
BEGIN
		Input <= "1010";
		Reset <= '0';
		CLK <= '0';
        Reg_EN <= "111";
		WAIT FOR 20 ns;
		
		CLK <= '1';
		WAIT FOR 20 ns;
		
		Reg_EN <= "001";
		CLK <= '0';
		WAIT FOR 20 ns;
		
		CLK <= '1';
		WAIT FOR 20 ns;
		
		Reg_EN <= "010";
		CLK <= '0';
		WAIT FOR 20 ns;
		
		CLK <= '1';
		WAIT FOR 20 ns;
		
		Reg_EN <= "011";
		CLK <= '0';
		WAIT FOR 20 ns;
		
		CLK <= '1';
		WAIT FOR 20 ns;
		
		Reg_EN <= "100";
		CLK <= '0';
		WAIT FOR 20 ns;
		
		CLK <= '1';
		WAIT FOR 20 ns;
		
		Reg_EN <= "101";
		CLK <= '0';
		WAIT FOR 20 ns;
		
		CLK <= '1';
		WAIT FOR 20 ns;
		
		Reg_EN <= "110";
		CLK <= '0';
		WAIT FOR 20 ns;
		
		CLK <= '1';
		WAIT FOR 20 ns;
		
		Reg_EN <= "111";
		CLK <= '0';
		WAIT FOR 20 ns;
		
		CLK <= '1';
		WAIT FOR 20 ns;
		
		Reset<='1';
		CLK <='0';
        WAIT FOR 20ns;
        
        CLK<='1';
        WAIT FOR 20 ns;
        
        CLK <= '0';
        Input<="1101";
        Reg_EN<="000";
        Reset<='0';
        WAIT FOR 20 ns;
        
        Clk <= '1';
        WAIT; 
        
   END PROCESS;

end Behavioral;
