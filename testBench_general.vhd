----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 19:08:39
-- Design Name: 
-- Module Name: testBench_general - Behavioral
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

entity testBench_general is
--  Port ( );
end testBench_general;

architecture Behavioral of testBench_general is
    component clavier_hero_pap 
  Port (clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        start : in STD_LOGIC;
        JA : inout STD_LOGIC_VECTOR(7 downto 0);
        AN : out STD_LOGIC_VECTOR(7 downto 0);
        segments : out STD_LOGIC_VECTOR(6 downto 0));
    end component;
    
    signal clock : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal start : STD_LOGIC;
    signal JA : STD_LOGIC_VECTOR(7 downto 0);
    signal AN : STD_LOGIC_VECTOR(7 downto 0);
    signal segments : STD_LOGIC_VECTOR(6 downto 0);
    
begin

    process
        begin
            clock <= '0';
            wait for 5 ns;
            clock <= '1';
            wait for 5 ns;
    end process;
    
    process
        begin
            reset <= '0';
            JA <= "00000000";
            wait for 10 ns;
            reset <= '1';
            wait for 10 ns;
            reset <= '0';
            start <= '1';
            wait;
    end process;    
    
    uut : clavier_hero_pap PORT MAP
    ( clock => clock,
      reset => reset,
      JA => JA,
      AN => AN,
      start => start,
      segments => segments);
      
end Behavioral;
