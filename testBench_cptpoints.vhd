----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2018 15:40:37
-- Design Name: 
-- Module Name: testBench_cptpoints - Behavioral
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

entity testBench_cptpoints is
--  Port ( );
end testBench_cptpoints;

architecture Behavioral of testBench_cptpoints is
    
    component compteur_points_test 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           nombre_points : out STD_LOGIC_VECTOR (9 downto 0);
           ce : in STD_LOGIC);
    end component;

    signal clock : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal nombre_points : STD_LOGIC_VECTOR(9 downto 0);
    signal ce : STD_LOGIC;
    
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
            ce <= '0';
            wait for 5 ns;
            ce <= '1';
            wait for 5 ns;
            ce <= '0';
            wait for 50 ns;
    end process;
    
    process
        begin
           reset <= '0';
           wait for 5 ns;
           reset <= '1';
           wait for 20 ns;
           reset <= '0';
           wait;
    end process;
    
    uut : compteur_points_test PORT MAP
    (clock => clock,
     reset => reset,
     nombre_points => nombre_points,
     ce => ce);

end Behavioral;
