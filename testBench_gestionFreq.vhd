----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 18:15:03
-- Design Name: 
-- Module Name: testBench_gestionFreq - Behavioral
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

entity testBench_gestionFreq is
--  Port ( );
end testBench_gestionFreq;

architecture Behavioral of testBench_gestionFreq is

    component gestion_frequences 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce_anode : out STD_LOGIC;
           ce_memoire : out STD_LOGIC;
           ce_retard : out STD_LOGIC;
           ce_rapide : out STD_LOGIC;
           ce_normal : out STD_LOGIC;
           ce_lent : out STD_LOGIC);
    end component;
    
    signal clock : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal ce_anode : STD_LOGIC;
    signal ce_memoire : STD_LOGIC;
    signal ce_retard : STD_LOGIC;
    signal ce_rapide : STD_LOGIC;
    signal ce_normal : STD_LOGIC;
    signal ce_lent : STD_LOGIC;
    
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
            wait for 10 ns;
            reset <= '1';
            wait for 10 ns;
            reset <= '0';
            wait;
    end process;
    
    uut : gestion_frequences PORT MAP
    (clock => clock,
     reset => reset,
     ce_anode => ce_anode,
     ce_memoire => ce_memoire,
     ce_retard => ce_retard,
     ce_rapide => ce_rapide,
     ce_normal => ce_normal,
     ce_lent => ce_lent);


end Behavioral;
