----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 17:35:58
-- Design Name: 
-- Module Name: gestion_frequences - Behavioral
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

entity gestion_frequences is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce_anode : out STD_LOGIC;
           ce_memoire : out STD_LOGIC;
           ce_retard : out STD_LOGIC;
           ce_rapide : out STD_LOGIC;
           ce_normal : out STD_LOGIC;
           ce_lent : out STD_LOGIC);
end gestion_frequences;

architecture Behavioral of gestion_frequences is

    signal cpt_anode : integer;
    signal cpt_memoire : integer;
    signal cpt_retard : integer;
    signal cpt_rapide : integer;
    signal cpt_normal : integer;
    signal cpt_lent : integer;
    
begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    cpt_anode <= 0;
                    cpt_memoire <= 0;
                    cpt_retard <= 0;
                    cpt_rapide <= 0;
                    cpt_normal <= 0;
                    cpt_lent <= 0;
                else
                    -- Gestion anode 3kHz
                    if (cpt_anode = 0) then
                        ce_anode <= '1';
                    else
                        ce_anode <= '0';
                    end if;
                    if (cpt_anode = 33332) then
                        cpt_anode <= 0;
                    else
                        cpt_anode <= cpt_anode + 1;
                    end if;
                    -- Gestion memoire 40kHz
                    if (cpt_memoire = 0) then
                        ce_memoire <= '1';
                    else
                        ce_memoire <= '0';
                    end if;
                    if (cpt_memoire = 2499) then
                        cpt_memoire <= 0;
                    else
                        cpt_memoire <= cpt_memoire + 1;
                    end if;
                    -- Gestion retard 100 Hz
                    if (cpt_retard = 0) then
                        ce_retard <= '1';
                    else
                        ce_retard <= '0';
                    end if;
                    if (cpt_retard = 999999) then
                        cpt_retard <= 0;
                    else
                        cpt_retard <= cpt_retard + 1;
                    end if;
                    -- Gestion rapide 3 Hz
                    if (cpt_rapide = 0) then
                        ce_rapide <= '1';
                    else
                        ce_rapide <= '0';
                    end if;
                    if (cpt_rapide = 33333332) then
                        cpt_rapide <= 0;
                    else 
                        cpt_rapide <= cpt_rapide + 1;
                    end if;
                    -- Gestion normal 2 Hz
                    if (cpt_normal = 0) then
                        ce_normal <= '1';
                    else
                        ce_normal <= '0';
                    end if;
                    if (cpt_normal = 49999999) then
                        cpt_normal <= 0;
                    else 
                        cpt_normal <= cpt_normal + 1;
                    end if; 
                    -- Gestion lent 1 Hz
                    if (cpt_lent = 0) then
                        ce_lent <= '1';
                    else
                        ce_lent <= '0';
                    end if;
                    if (cpt_lent = 99999999) then
                        cpt_lent <= 0;
                    else
                        cpt_lent <= cpt_lent + 1;
                    end if;
                end if;
            end if;
    end process;


end Behavioral;
