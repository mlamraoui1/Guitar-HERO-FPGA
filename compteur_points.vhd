----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2017 09:58:07
-- Design Name: 
-- Module Name: compteur_points - Behavioral
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

entity compteur_points is
    Port ( nombre_points_p : in STD_LOGIC_VECTOR (13 downto 0);
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           nombre_points_f : out STD_LOGIC_VECTOR (13 downto 0);
           gain : in STD_LOGIC_VECTOR (3 downto 0));
end compteur_points;

architecture Behavioral of compteur_points is
    signal nombre_points_s : unsigned(13 downto 0);
begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    nombre_points_s <= to_unsigned(0,14);
                 else
                    nombre_points_s <= unsigned(nombre_points_p);
                end if;
            end if;
    end process;
    
    process(gain)
        begin
            nombre_points_f <= STD_LOGIC_VECTOR(nombre_points_s + unsigned(gain));
    end process;
    
end Behavioral;
