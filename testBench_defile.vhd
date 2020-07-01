----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2017 11:44:36
-- Design Name: 
-- Module Name: testBench_defile - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testBench_defile is
--  Port ( );
end testBench_defile;

architecture Behavioral of testBench_defile is
    component compteur_points 
    Port ( nombre_points_p : in STD_LOGIC_VECTOR (9 downto 0);
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           nombre_points_f : out STD_LOGIC_VECTOR (9 downto 0);
           gain : in STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
   
    signal clock : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal nombre_points_f : STD_LOGIC_VECTOR(9 downto 0);
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
            gain <= STD_LOGIC_VECTOR(to_unsigned(10,4));
            wait for 10 ns;
            gain <= STD_LOGIC_VECTOR(to_unsigned(5,4));
            wait for 10 ns;
            gain <= STD_LOGIC_VECTOR(to_unsigned(10,4)); 
            wait for 10 ns;
            gain <= STD_LOGIC_VECTOR(to_unsigned(0,4)); 
            wait for 10 ns;
            gain <= STD_LOGIC_VECTOR(to_unsigned(5,4));
            wait;
    end process;

    uut : compteur_points PORT MAP
    (nombre_points_p => nombre_points_f,
     clock => clock,
     reset => reset,
     nombre_points_f => nombre_points_f,
     gain => gain);

end Behavioral;
