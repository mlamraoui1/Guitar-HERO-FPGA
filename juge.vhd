----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2017 02:04:53
-- Design Name: 
-- Module Name: juge - Behavioral
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

entity juge is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           appui : in STD_LOGIC;
           code : in STD_LOGIC_VECTOR(3 downto 0);
           cpt_retard : in STD_LOGIC_VECTOR(3 downto 0);
           bouton : in STD_LOGIC_VECTOR(3 downto 0);
           lance : out STD_LOGIC;
           stop : out STD_LOGIC;
           gain : out STD_LOGIC_VECTOR(3 downto 0));
end juge;

architecture Behavioral of juge is
    type state is (init, continu, correct, bof, rate, test);
    signal curr_state, next_state : state;

begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    curr_state <= init;
                else
                    curr_state <= next_state;
                end if;
            end if;
    end process;

     process(cpt_retard, code, curr_state)
        begin
            case curr_state is 
                when init => if (code = "0000") then
                                next_state <= init;
                            else
--                                next_state <= continu;
                                  next_state <= test;
                            end if;
                when continu => if (appui = '1') then
                                    if (bouton = code) then
                                        if (to_integer(unsigned(cpt_retard)) < 3) then
                                            next_state <= correct;
                                        else
                                            if (to_integer(unsigned(cpt_retard)) < 6) then
                                                next_state <= bof;
                                            end if;
                                        end if;
                                    else 
                                        next_state <= rate;
                                    end if;
                                else
                                    next_state <= continu;
                                end if;
                                if (to_integer(unsigned(cpt_retard)) > 6) then
                                    next_state <= rate;
                                end if;
                when correct => next_state <= init;
                when bof => next_state <= init;
                when rate => next_state <= init;  
                when test => next_state <= init;              
            end case;
    end process;
    
    process(curr_state)
        begin
            case curr_state is
                when init => gain <= STD_LOGIC_VECTOR(to_unsigned(0,4));
                             stop <= '0';
                             lance <= '0';
                when continu => gain <= STD_LOGIC_VECTOR(to_unsigned(0,4));
                                stop <= '0';
                                lance <= '1';
                when correct => gain <= STD_LOGIC_VECTOR(to_unsigned(10,4));
                                stop <= '1';
                                lance <= '0';
                when bof => gain <= STD_LOGIC_VECTOR(to_unsigned(5,4));
                            stop <= '1';
                            lance <= '0';
                when rate => gain <= STD_LOGIC_VECTOR(to_unsigned(0,4));
                             stop <= '1';
                             lance <= '0';
                when test => gain <= STD_LOGIC_VECTOR(to_unsigned(10,4));
                             stop <= '0';
                             lance <= '0';
            end case;
    end process;
    
end Behavioral;
