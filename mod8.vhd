----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 18:47:33
-- Design Name: 
-- Module Name: mod8 - Behavioral
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

entity mod8 is
    Port ( clock : in STD_LOGIC;
           ce_anode : in STD_LOGIC;
           reset : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           commande_AN : out STD_LOGIC_VECTOR (2 downto 0));
end mod8;

architecture Behavioral of mod8 is
    signal cpt_anode : unsigned(2 downto 0);
begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    cpt_anode <= to_unsigned(0,3);
                else
                    if (ce_anode = '1') then
                        cpt_anode <= cpt_anode + to_unsigned(1,3);
                    end if;
                end if;
            end if;
    end process;
    
    commande_AN <= STD_LOGIC_VECTOR(cpt_anode);
    process(cpt_anode)
        begin
            case cpt_anode is
                when to_unsigned(0,3) => AN <= "01111111";
                when to_unsigned(1,3) => AN <= "10111111";
                when to_unsigned(2,3) => AN <= "11011111";
                when to_unsigned(3,3) => AN <= "11101111";
                when to_unsigned(4,3) => AN <= "11110111";
                when to_unsigned(5,3) => AN <= "11111011";
                when to_unsigned(6,3) => AN <= "11111101";
                when to_unsigned(7,3) => AN <= "11111110";
                when others => AN <= "00000000";
            end case;
    end process;
end Behavioral;
