----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2018 12:49:07
-- Design Name: 
-- Module Name: cpt_tps - Behavioral
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

entity cpt_tps is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           ce : in STD_LOGIC;
           cpt_tps : out STD_LOGIC_VECTOR (5 downto 0));
end cpt_tps;

architecture Behavioral of cpt_tps is

signal cpt : unsigned(5 downto 0);
signal flag : STD_LOGIC;

begin
    process(clock) 
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    cpt <= "000000";
                    flag <= '0';
                else
                    if (start = '1') then
                        flag <= '1';
                    end if;
                    if (flag = '1') then
                        if (ce = '1') then
                            cpt <= cpt + to_unsigned(1,6);
                        end if;
                    end if;
                end if;
            end if;
    end process;

    cpt_tps <= STD_LOGIC_VECTOR(cpt);
    
end Behavioral;
