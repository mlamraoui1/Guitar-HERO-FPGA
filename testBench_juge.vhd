----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2017 11:02:38
-- Design Name: 
-- Module Name: testBench_juge - Behavioral
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

entity testBench_juge is
--  Port ( );
end testBench_juge;

architecture Behavioral of testBench_juge is
    component juge 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           appui : in STD_LOGIC;
           code : in STD_LOGIC_VECTOR(3 downto 0);
           cpt_retard : in STD_LOGIC_VECTOR(3 downto 0);
           bouton : in STD_LOGIC_VECTOR(3 downto 0);
           lance : out STD_LOGIC;
           stop : out STD_LOGIC;
           gain : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    signal clock : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal appui : STD_LOGIC;
    signal code : STD_LOGIC_VECTOR(3 downto 0);
    signal cpt_retard : STD_LOGIC_VECTOR(3 downto 0);
    signal bouton : STD_LOGIC_VECTOR(3 downto 0);
    signal lance : STD_LOGIC;
    signal stop : STD_LOGIC;
    signal gain : STD_LOGIC_VECTOR(3 downto 0);
     
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
            wait for 5 ns;
            reset <= '1';
            wait for 5 ns;
            reset <= '0';
            wait for 50 ns;
            code <= "0010";
            cpt_retard <= "1010";
            wait for 1 ms;
            code <= "0001";
            appui <= '1';
            bouton <= "0001";
            cpt_retard <= "0001";
            wait for 1 ms;
            code <= "1000";
            bouton <= "1000";
            cpt_retard <= "0100";
            wait;
    end process;
    

    uut : juge PORT MAP
    (clock => clock,
     reset => reset,
     appui => appui,
     code => code,
     cpt_retard => cpt_retard,
     bouton => bouton,
     lance => lance,
     stop => stop,
     gain => gain);

end Behavioral;
