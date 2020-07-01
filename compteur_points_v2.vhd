----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.01.2018 19:56:40
-- Design Name: 
-- Module Name: compteur_points_v2 - Behavioral
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

entity compteur_points_v2 is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           gain : in STD_LOGIC_VECTOR (3 downto 0);
           nombre_points : out STD_LOGIC_VECTOR (13 downto 0));
end compteur_points_v2;

architecture Behavioral of compteur_points_v2 is

type state is (state_zero, state_sum, state_init);
signal current_state : state;
signal next_state : state;
signal nombre : unsigned(13 downto 0);
begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if(reset = '1') then
                    current_state <= state_init;
                else 
                    current_state <= next_state;
                end if;
            end if;
    end process;
    
    process(gain, current_state)
        begin
            case current_state is
                when state_zero => if (unsigned(gain) > 0) then
                                       next_state <= state_sum;
                                   end if; 
                when state_sum => next_state <= state_zero;
                when state_init => next_state <= state_zero;
            end case;
    end process;

    process(current_state)
        begin
            case current_state is
                when state_zero => nombre_points <= STD_LOGIC_VECTOR(nombre);
                when state_sum => nombre <= nombre + unsigned(gain);
                when state_init => nombre <= to_unsigned(0,14);
            end case;
    end process;
end Behavioral;
