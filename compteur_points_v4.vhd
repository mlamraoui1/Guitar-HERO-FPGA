----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2018 11:02:09
-- Design Name: 
-- Module Name: compteur_points_v4 - Behavioral
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

entity compteur_points_v4 is
    Port ( clock : in STD_LOGIC;
           ce : in STD_LOGIC;
           sum : in STD_LOGIC;
           start : in STD_LOGIC;
           score : out STD_LOGIC_VECTOR (13 downto 0);
           reset : in STD_LOGIC);
end compteur_points_v4;

architecture Behavioral of compteur_points_v4 is
    signal score_tmp : unsigned(13 downto 0);
    signal flag : STD_LOGIC;
begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    score_tmp <= to_unsigned(0,14);
                    flag <= '0';
                else
                    if (flag = '1') then
                        if (ce = '1') then
                            if (sum = '1') then
                                score_tmp <= score_tmp + to_unsigned(100,14);
                            end if;
                        end if;
                    end if;
                    if (start = '1') then
                        flag <= '1';
                    end if;
                end if;
            end if;
    end process;
    
    score <= STD_LOGIC_VECTOR(score_tmp);


end Behavioral;
