----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2018 14:41:20
-- Design Name: 
-- Module Name: juge_test - Behavioral
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

entity juge_test is
    Port ( ce : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           cpt : in STD_LOGIC_VECTOR(3 downto 0);
           gain : out STD_LOGIC_VECTOR(3 downto 0));
end juge_test;

architecture Behavioral of juge_test is

begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    gain <= "0000";
                else
                    if (ce = '1') then
                        if (unsigned(cpt) < to_unsigned(4,4)) then
                            gain <= "0000";
                        else
                            if (unsigned(cpt) < to_unsigned(8,4)) then
                                gain <= "0101";
                            else
                                gain <= "1010";
                            end if;
                        end if;
                    end if;
                end if;    
            end if;
    end process;


end Behavioral;
