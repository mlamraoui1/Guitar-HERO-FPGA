----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2018 14:37:30
-- Design Name: 
-- Module Name: Cpt_test - Behavior
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

entity Cpt_test is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           cpt_ce : out STD_LOGIC_VECTOR (3 downto 0));
end Cpt_test;

architecture Behavior of Cpt_test is

signal cpt_tmp : unsigned(3 downto 0);

begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    cpt_tmp <= "0000";
                else
                    if (ce = '1') then
                        cpt_tmp <= cpt_tmp + to_unsigned(1,4);
                    end if;
                end if;        
            end if;
    end process;

    cpt_ce <= STD_LOGIC_VECTOR(cpt_tmp);
    
end Behavior;
