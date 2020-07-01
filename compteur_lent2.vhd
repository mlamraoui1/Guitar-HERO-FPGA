----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 23:28:58
-- Design Name: 
-- Module Name: compteur_lent2 - Behavioral
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

entity compteur_lent2 is
  Port (clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        ce : in STD_LOGIC;
        goin : in STD_LOGIC;
        goout : out STD_LOGIC;
        cpt : out STD_LOGIC_VECTOR(1 downto 0));
end compteur_lent2;

architecture Behavioral of compteur_lent2 is
    
    signal cpt_s : integer;
    signal flag : STD_LOGIC;
    
begin

    process(goin,cpt_s)
        begin
            if (goin = '1') then
                flag <= '1';
            else
                if (cpt_s = 3) then
                    flag <= '0';
                end if;
            end if;
    end process;
    
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    cpt_s <= 0;
                else
                    if (flag = '1') then
                        if (ce = '1') then
                            if (cpt_s = 3) then
                                cpt_s <= 0;
                                goout <= '1';
                            else
                                cpt_s <= cpt_s + 1;
                                goout <= '0';
                            end if;
                        end if;
                    end if;
                end if;
            end if;
    end process;

    cpt <= STD_LOGIC_VECTOR(to_unsigned(cpt_s,2));

end Behavioral;
