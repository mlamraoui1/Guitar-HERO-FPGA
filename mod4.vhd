----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 23:16:25
-- Design Name: 
-- Module Name: mod4 - Behavioral
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

entity mod4 is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce_lent : in STD_LOGIC;
           commande_jeu : out STD_LOGIC_VECTOR (3 downto 0));
end mod4;

architecture Behavioral of mod4 is
    signal cpt_4_s : unsigned(1 downto 0);
begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    cpt_4_s <= to_unsigned(0,2);
                else
                    if (ce_lent = '1') then
                        cpt_4_s <= cpt_4_s + 1;
                    end if;
                end if;
            end if;
    end process;
    
    process(cpt_4_s)
        begin
            case cpt_4_s is
                when to_unsigned(0,2) => commande_jeu <= "1000";
                when to_unsigned(1,2) => commande_jeu <= "0100";
                when to_unsigned(2,2) => commande_jeu <= "0010";
                when to_unsigned(3,2) => commande_jeu <= "0001";
                when others =>
            end case;
    end process;

end Behavioral;
