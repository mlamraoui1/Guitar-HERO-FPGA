----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2018 16:05:28
-- Design Name: 
-- Module Name: gestion_points - Behavioral
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

entity gestion_points is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           tps : in STD_LOGIC_VECTOR (5 downto 0);
           bouton : in STD_LOGIC_VECTOR (3 downto 0);
           score : out STD_LOGIC_VECTOR (13 downto 0));
end gestion_points;

architecture Behavioral of gestion_points is
type state is (init, s1, s1b, s1r, s2, s2b, s2r, s3, s3b, s3r, s4, s4b, s4r, s5, s5b, s5r, s6, s6b, s6r,
s7, s7b, s7r, s8, s8b, s8r, s9, s9b, s9r, s10, s10b, s10r, s11, s11b, s11r, s12, s12b, s12r, s13, s13b, s13r,
s14, s14b, s14r, s15, s15b, s15r, s16);
                        
signal current_state, next_state : state;
signal score_tmp : unsigned(13 downto 0);

begin
    process(clock)
        begin
            if (rising_edge(clock)) then
                if (reset = '1') then
                    current_state <= init;
                else
                    current_state <= next_state; 
                end if;
            end if;
    end process;

    process(tps, bouton)
        begin
            case current_state is
                when init => if (start = '1') then
                                next_state <= s1;
                             else 
                                next_state <= init;
                             end if;
                when s1 =>  if (unsigned(tps) = 3) then
                                if (bouton = "1000") then
                                      next_state <= s1b;
                                else
                                      next_state <= s1r;
                                end if;
                            else
                                next_state <= s1;
                            end if;
                when s2 => if (bouton = "0100") then
                               next_state <= s2b;
                           else
                               next_state <= s2r;
                           end if;
                when s3 => if (bouton = "0010") then
                               next_state <= s3b;
                           else
                               next_state <= s3r;
                           end if;
                when s4 => if (bouton = "1000") then
                               next_state <= s4b;
                           else
                               next_state <= s4r;
                           end if;
                when s5 => if (bouton = "0100") then
                               next_state <= s5b;
                           else
                               next_state <= s5r;
                           end if;
                when s6 => if (bouton = "0010") then
                               next_state <= s6b;
                           else
                               next_state <= s6r;
                           end if;
                when s7 => if (bouton = "0001") then
                               next_state <= s7b;
                           else
                               next_state <= s7r;
                           end if;
                when s8 => if (bouton = "1000") then
                               next_state <= s8b;
                           else
                               next_state <= s8r;
                           end if;
                when s9 => if (bouton = "0010") then
                               next_state <= s9b;
                           else
                               next_state <= s9r;
                           end if;
                when s10 => if (bouton = "1000") then
                                next_state <= s10b;
                            else
                                next_state <= s10r;
                            end if;
                when s11 => if (bouton = "0001") then
                                next_state <= s11b;
                            else
                                next_state <= s11r;
                            end if;
                when s12 => if (bouton = "0100") then
                                next_state <= s12b;
                            else
                                next_state <= s12r;
                            end if;
                when s13 => if (bouton = "1000") then
                                next_state <= s13b;
                            else
                                next_state <= s13r;
                            end if;
                when s14 => if (bouton = "0010") then
                                next_state <= s14b;
                            else
                                next_state <= s14r;
                            end if;
                when s15 => if (bouton = "0100") then
                                next_state <= s15b;
                            else
                                next_state <= s15r;
                            end if;
                when s16 => if (bouton = "1000") then
                                next_state <= s11b;
                            else
                                next_state <= s11r;
                            end if;
                when s1b => if (unsigned(tps) = 4) then
                                next_state <= s2;
                            else
                                next_state <= s1b;
                            end if;
                when s1r => if (unsigned(tps) = 4) then
                                next_state <= s2;
                            else
                                next_state <= s1r;
                            end if;
                when s2b => if (unsigned(tps) = 5) then
                                next_state <= s3;
                            else
                                next_state <= s2b;
                            end if;
                when s2r => if (unsigned(tps) = 5) then
                                next_state <= s3;
                            else
                                next_state <= s2r;
                            end if;
                when s3b => if (unsigned(tps) = 7) then
                                next_state <= s4;
                            else 
                                next_state <= s3b;
                            end if;
                when s3r => if (unsigned(tps) = 7) then
                                next_state <= s4;
                            else 
                                next_state <= s3r;
                            end if;
                when s4b => if (unsigned(tps) = 8) then
                                next_state <= s5;
                            else
                                next_state <= s4b;
                            end if;
                when s4r => if (unsigned(tps) = 8) then
                                next_state <= s5;
                            else
                                next_state <= s4r;
                            end if;
                when s5b => if (unsigned(tps) = 9) then
                                next_state <= s6;
                            else
                                next_state <= s5b;
                            end if;
                when s5r => if (unsigned(tps) = 9) then
                                next_state <= s6;
                            else
                                next_state <= s5r;
                            end if;
                when s6b => if (unsigned(tps) = 10) then
                                next_state <= s7;
                            else
                                next_state <= s6b;
                            end if;
                when s6r => if (unsigned(tps) = 10) then
                                next_state <= s7;
                            else
                                next_state <= s6r;
                            end if;
                when s7b => if (unsigned(tps) = 11) then
                                next_state <= s8;
                            else
                                next_state <= s7b;
                            end if;
                when s7r => if (unsigned(tps) = 11) then
                                next_state <= s8;
                            else
                                next_state <= s7r;
                            end if;
                when s8b => if (unsigned(tps) = 15) then
                                next_state <= s9;
                            else
                                next_state <= s8b;
                            end if;
                when s8r => if (unsigned(tps) = 15) then
                                next_state <= s9;
                            else 
                                next_state <= s8r;
                            end if;
                when s9b => if (unsigned(tps) = 16) then
                                next_state <= s10;
                            else
                                next_state <= s9b;
                            end if;
                when s9r => if (unsigned(tps) = 16) then
                                next_state <= s10;
                            else
                                next_state <= s9r;
                            end if;
                when s10b => if (unsigned(tps) = 17) then
                                next_state <= s11;
                             else
                                next_state <= s10b;
                             end if;
                when s10r=> if (unsigned(tps) = 17) then
                                next_state <= s11;
                            else
                                next_state <= s10r;
                            end if;
                when s11b => if (unsigned(tps) = 18) then
                                next_state <= s12;
                             else 
                                next_state <= s11b;
                             end if;
                when s11r => if (unsigned(tps) = 18) then
                                next_state <= s12;
                             else
                                next_state <= s11r;
                             end if;
                when s12b => if (unsigned(tps) = 19) then
                                next_state <= s13;
                            else
                                next_state <= s12b;
                             end if;
                when s12r => if (unsigned(tps) = 19) then
                                next_state <= s13;
                             else
                                next_state <= s12r;
                             end if;
                when s13b => if (unsigned(tps) = 20) then
                                next_state <= s14;
                             else
                                next_state <= s13b;
                             end if;
                when s13r => if (unsigned(tps) = 20) then
                                next_state <= s14;
                             else
                                next_state <= s13r;
                             end if;
                when s14b => if (unsigned(tps) = 21) then
                                next_state <= s15;
                             else
                                next_state <= s14b;
                             end if;
                when s14r => if (unsigned(tps) = 21) then
                                next_state <= s15;
                             else
                                next_state <= s14r;
                             end if;
                when s15b => if (unsigned(tps) = 25) then
                                next_state <= s16;
                             end if;
                when s15r => if (unsigned(tps) = 25) then
                             end if;
            end case;
    end process;
    
    process(current_state)
        begin
            case current_state is
                when init => score <= STD_LOGIC_VECTOR(to_unsigned(0,14)); 
                when s1b => score <= STD_LOGIC_VECTOR(to_unsigned(100,14));
                when s2b => score <= STD_LOGIC_VECTOR(to_unsigned(200,14));
                when s3b => score <= STD_LOGIC_VECTOR(to_unsigned(300,14));
                when s4b => score <= STD_LOGIC_VECTOR(to_unsigned(400,14));
                when s5b => score <= STD_LOGIC_VECTOR(to_unsigned(500,14));
                when s6b => score <= STD_LOGIC_VECTOR(to_unsigned(600,14));
                when s7b => score <= STD_LOGIC_VECTOR(to_unsigned(700,14));
                when s8b => score <= STD_LOGIC_VECTOR(to_unsigned(800,14));
                when s9b => score <= STD_LOGIC_VECTOR(to_unsigned(900,14));
                when s10b => score <= STD_LOGIC_VECTOR(to_unsigned(1000,14));
                when s11b => score <= STD_LOGIC_VECTOR(to_unsigned(1100,14));
                when s12b => score <= STD_LOGIC_VECTOR(to_unsigned(1200,14));
                when s13b => score <= STD_LOGIC_VECTOR(to_unsigned(1300,14));
                when s14b => score <= STD_LOGIC_VECTOR(to_unsigned(1400,14));
                when s15b => score <= STD_LOGIC_VECTOR(to_unsigned(1500,14));
                when s1 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s2 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s3 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s4 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s5 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s6 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s7 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s8 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s9 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s10 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s11 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s12 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s13 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s14 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s15 => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s1r => score <= STD_LOGIC_VECTOR(to_unsigned(0,14));
                when s2r => score <= STD_LOGIC_VECTOR(to_unsigned(1,14));
                when s3r => score <= STD_LOGIC_VECTOR(to_unsigned(2,14));
                when s4r => score <= STD_LOGIC_VECTOR(to_unsigned(3,14));
                when s5r => score <= STD_LOGIC_VECTOR(to_unsigned(4,14));
                when s6r =>score <= STD_LOGIC_VECTOR(to_unsigned(5,14));
                when s7r =>score <= STD_LOGIC_VECTOR(to_unsigned(6,14));
                when s8r => score <= STD_LOGIC_VECTOR(to_unsigned(7,14));
                when s9r => score <= STD_LOGIC_VECTOR(to_unsigned(8,14));
                when s10r => score <= STD_LOGIC_VECTOR(to_unsigned(9,14));
                when s11r => score <= STD_LOGIC_VECTOR(to_unsigned(10,14));
                when s12r => score <= STD_LOGIC_VECTOR(to_unsigned(11,14));
                when s13r => score <= STD_LOGIC_VECTOR(to_unsigned(12,14));
                when s14r => score <= STD_LOGIC_VECTOR(to_unsigned(13,14));
                when s15r => score <= STD_LOGIC_VECTOR(to_unsigned(14,14));
                when s16 =>score <= STD_LOGIC_VECTOR(to_unsigned(15,14));
            end case;
    end process;
end Behavioral;
