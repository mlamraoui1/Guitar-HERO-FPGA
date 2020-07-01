----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2018 10:50:03
-- Design Name: 
-- Module Name: reste_appuye - Behavioral
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

entity reste_appuye is
    Port ( code : in STD_LOGIC_VECTOR (3 downto 0);
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           code_corrige : out STD_LOGIC_VECTOR (3 downto 0);
           ce : in STD_LOGIC);
end reste_appuye;

architecture Behavioral of reste_appuye is

begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    code_corrige <= "0000";
                else
                    if (ce = '1') then
                        code_corrige <= code;
                    end if;
                end if;
            end if;
    end process;


end Behavioral;
