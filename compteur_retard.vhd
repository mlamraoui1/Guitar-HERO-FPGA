----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2017 01:48:30
-- Design Name: 
-- Module Name: compteur_retard - Behavioral
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

entity compteur_retard is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           goout : in STD_LOGIC;
           stop : in STD_LOGIC;
           ce_retard : in STD_LOGIC;
           cpt_retard : out STD_LOGIC_VECTOR (3 downto 0));
end compteur_retard;

architecture Behavioral of compteur_retard is

    signal cpt_retard_s : integer;
    signal flag : STD_LOGIC;
    
begin
    process(stop, goout)
        begin
            if (goout = '1') then
                flag <= '1';
            end if;
            if (stop = '1') then
                flag <= '0';
            end if;
    end process;
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    cpt_retard_s <= 0;
                else
                    if (flag = '1') then
                        if (ce_retard = '1') then
                            if (cpt_retard_s < 10) then
                                cpt_retard_s <= cpt_retard_s + 1;
                            end if; 
                        end if;                    
                    end if;
                end if;
            end if;
    end process;


end Behavioral;
