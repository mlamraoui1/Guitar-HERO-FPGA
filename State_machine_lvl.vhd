----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2018 11:49:35
-- Design Name: 
-- Module Name: State_machine_lvl - Behavioral
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

entity State_machine_lvl is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           tps : in STD_LOGIC_VECTOR(5 downto 0);
           start : in STD_LOGIC;
           --nombre_correct : inout STD_LOGIC_VECTOR(3 downto 0);
           sum : out STD_LOGIC;
           bouton : in STD_LOGIC_VECTOR(3 downto 0);
           ledd : out STD_LOGIC;
           ledc : out STD_LOGIC;
           ledb : out STD_lOGIC;
           leda : out STD_LOGIC;
           anode_gg : out STD_LOGIC_VECTOR(1 downto 0);
           anode_gd : out STD_LOGIC_VECTOR(1 downto 0);
           anode_dg : out STD_LOGIC_VECTOR(1 downto 0);
           anode_dd : out STD_LOGIC_VECTOR(1 downto 0));
end State_machine_lvl;

architecture Behavioral of State_machine_lvl is
type state is (init, etat1, etat2, etat3, etat4, etat5, etat6, etat7, etat8, etat9, etat10
, etat11, etat12, etat13, etat14, etat15, etat16, etat17, etat18, etat19, etat20, etat21,
etat22, etat23, etat24, etat25, etat26);
signal current_state, next_state : state;

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
    
    process(start, tps)
        begin
            case current_state is
                when init => if (start = '1') then
                                next_state <= etat1;
                             else
                                next_state <= init;
                             end if;
                when etat1 => if (tps = "000001") then
                                next_state <= etat2;
                              else
                                next_state <= etat1;
                              end if;
                when etat2 => if (tps = "000010") then
                                next_state <= etat3;
                              else
                                next_state <= etat2;
                              end if;
                when etat3 => if (tps = "000011") then
                                next_state <= etat4;
                              else
                                next_state <= etat3;
                              end if;
                when etat4 => if (tps = "000100") then
                                next_state <= etat5;
                              else
                                next_state <= etat4;
                              end if;
                when etat5 => if (tps = "000101") then
                                next_state <= etat6;
                              else
                                next_state <= etat5;
                              end if;
                when etat6 => if (tps = "000110") then
                                next_state <= etat7;
                              else
                                next_state <= etat6;
                              end if;
                when etat7 => if (tps = "000111") then
                                next_state <= etat8;
                              else
                                next_state <= etat7;
                              end if;
                when etat8 => if (tps = "001000") then
                                next_state <= etat9;
                              else
                                next_state <= etat8;
                              end if;
                when etat9 => if (tps = "001001") then
                                next_state <= etat10;
                              else
                                next_state <= etat9;
                              end if;
                when etat10 => if (tps = "001010") then
                                 next_state <= etat11;
                               else
                                 next_state <= etat10;
                               end if;
                when etat11 => if (tps = "001011") then
                                 next_state <= etat12;
                               else
                                 next_state <= etat11;
                               end if;
                when etat12 => if (tps = "001100") then
                                 next_state <= etat13;
                               else
                                 next_state <= etat12;
                               end if;
                when etat13 => if (tps = "001101") then
                                 next_state <= etat14;
                               else
                                 next_state <= etat13;
                               end if;
                when etat14 => if (tps = "001110") then
                                 next_state <= etat15;
                               else
                                 next_state <= etat14;
                               end if;
                when etat15 => if (tps = "001111") then
                                 next_state <= etat16;
                               else
                                 next_state <= etat15;
                               end if;
                when etat16 => if (tps = "010000") then
                                 next_state <= etat17;
                               else
                                 next_state <= etat16;
                               end if;
                when etat17 => if (tps = "010001") then
                                 next_state <= etat18;
                               else
                                 next_state <= etat17;
                               end if;
                when etat18 => if (tps = "010010") then
                                 next_state <= etat19;
                               else
                                 next_state <= etat18;
                               end if;
                when etat19 => if (tps = "010011") then
                                 next_state <= etat20;
                               else
                                 next_state <= etat19;
                               end if;
                when etat20 => if (tps = "010100") then
                                 next_state <= etat21;
                               else
                                 next_state <= etat20;
                               end if;
                when etat21 => if (tps = "010101") then
                                 next_state <= etat22;
                               else
                                 next_state <= etat21;
                               end if;
                when etat22 => if (tps = "010110") then
                                 next_state <= etat23;
                               else
                                 next_state <= etat22;
                               end if;
                when etat23 => if (tps = "010111") then
                                 next_state <= etat24;
                               else
                                 next_state <= etat23;
                               end if;
                when etat24 => if (tps = "011000") then
                                 next_state <= etat25;
                               else
                                 next_state <= etat24;
                               end if;
                when etat25 => if (tps = "011001") then
                                 next_state <= etat26;
                               else
                                 next_state <= etat25;
                               end if;
                when etat26 => next_state <= etat26;
            end case;
    end process;
    
    process(current_state, bouton)
        begin
            case current_state is
                when init => anode_gg <= "00";
                             anode_gd <= "00";
                             anode_dg <= "00";
                             anode_dd <= "00";
                             sum <= '0';
                             --nombre_correct <= "0000";
                             if (bouton = "1000") then
                                ledd <= '1';
                             else
                                ledd <= '0';
                             end if;
                             if (bouton = "0100") then
                                 ledc <= '1';
                              else
                                 ledc <= '0';
                              end if;
                             if (bouton = "0010") then
                                  ledb <= '1';
                               else
                                  ledb <= '0';
                               end if;
                              if (bouton = "0001") then
                                   leda <= '1';
                                else
                                   leda <= '0';
                                end if;
                when etat1 => anode_gg <= "01";
                              anode_gd <= "00";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              sum <= '0';
                              --nombre_correct <= nombre_correct;
                when etat2 => anode_gg <= "10";
                              anode_gd <= "01";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              sum <= '0';
                              --nombre_correct <= nombre_correct;
                when etat3 => anode_gg <= "11";
                              anode_gd <= "10";
                              anode_dg <= "01";
                              anode_dd <= "00";
                              if (bouton = "1000") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (bouton = "1000") then
--                                nombre_correct <= "0001";
--                              else
--                                nombre_correct <= "0000";
--                              end if;
                when etat4 => anode_gg <= "00";
                              anode_gd <= "11";
                              anode_dg <= "10";
                              anode_dd <= "00";
                              if (bouton = "0100") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "0001") then
--                                if (bouton = "0100") then
--                                    nombre_correct <= "0010";
--                                else
--                                    nombre_correct <= "0001";
--                                end if;
--                              else
--                                if (bouton = "0100") then
--                                    nombre_correct <= "0001";
--                                else
--                                    nombre_correct <= "0000";
--                                end if;
--                              end if;
                when etat5 => anode_gg <= "01";
                              anode_gd <= "00";
                              anode_dg <= "11";
                              anode_dd <= "00";
                              if (bouton = "0010") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "0010") then
--                                if (bouton = "0010") then   
--                                    nombre_correct <= "0011";
--                                else
--                                    nombre_correct <= nombre_correct;
--                                end if;
--                              else
--                                if (nombre_correct = "0001") then
--                                    if (bouton = "0010") then
--                                        nombre_correct <= "0010";
--                                    else
--                                        nombre_correct <= nombre_correct;
--                                    end if;
--                                else
--                                    if (bouton = "0010") then
--                                        nombre_correct <= "0001";
--                                    else
--                                        nombre_correct <= nombre_correct;
--                                    end if;
--                                end if;
--                              end if;
                when etat6 => anode_gg <= "10";
                              anode_gd <= "01";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              sum <= '0';
                             -- nombre_correct <= nombre_correct;
                when etat7 => anode_gg <= "11";
                              anode_gd <= "10";
                              anode_dg <= "01";
                              anode_dd <= "00";
                              if (bouton = "1000") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "0011") then
--                                if (bouton = "1000") then
--                                    nombre_correct <= "0100";
--                                else
--                                    nombre_correct <= nombre_correct;
--                                end if;
--                              else
--                                 if (nombre_correct = "0010") then
--                                     if (bouton = "1000") then
--                                         nombre_correct <= "0011";
--                                     else
--                                         nombre_correct <= nombre_correct;
--                                     end if;
--                                 else
--                                    if (nombre_correct = "0001") then
--                                          if (bouton = "1000") then
--                                              nombre_correct <= "0010";
--                                          else
--                                              nombre_correct <= nombre_correct;
--                                          end if;
--                                    else
--                                        if (nombre_correct = "0000") then
--                                             if (bouton = "1000") then
--                                                 nombre_correct <= "0001";
--                                             else
--                                                 nombre_correct <= nombre_correct;
--                                             end if;
--                                        end if;
--                                    end if;
--                                 end if;
--                              end if;
                when etat8 => anode_gg <= "00";
                              anode_gd <= "11";
                              anode_dg <= "10";
                              anode_dd <= "01";
                              if (bouton = "0100") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "0100") then
--                                 if (bouton = "0100") then
--                                     nombre_correct <= "0101";
--                                 else
--                                     nombre_correct <= nombre_correct;
--                                 end if;
--                              else
--                                  if (nombre_correct = "0011") then
--                                      if (bouton = "0100") then
--                                          nombre_correct <= "0100";
--                                      else
--                                          nombre_correct <= nombre_correct;
--                                      end if;
--                                  else
--                                     if (nombre_correct = "0010") then
--                                           if (bouton = "0100") then
--                                               nombre_correct <= "0011";
--                                           else
--                                               nombre_correct <= nombre_correct;
--                                           end if;
--                                     else
--                                         if (nombre_correct = "0001") then
--                                              if (bouton = "0100") then
--                                                  nombre_correct <= "0010";
--                                              else
--                                                  nombre_correct <= nombre_correct;
--                                              end if;
--                                         else
--                                            if (nombre_correct = "0000") then
--                                                if (bouton = "0100") then
--                                                    nombre_correct <= "0001";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                            end if;
--                                         end if;
--                                     end if;
--                                  end if;
--                              end if;
                when etat9 => anode_gg <= "01";
                              anode_gd <= "00";
                              anode_dg <= "11";
                              anode_dd <= "10";
                              if (bouton = "0010") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "0101") then
--                                   if (bouton = "0010") then
--                                       nombre_correct <= "0110";
--                                   else
--                                       nombre_correct <= nombre_correct;
--                                   end if;
--                              else
--                                    if (nombre_correct = "0100") then
--                                        if (bouton = "0010") then
--                                            nombre_correct <= "0101";
--                                        else
--                                            nombre_correct <= nombre_correct;
--                                        end if;
--                                    else
--                                       if (nombre_correct = "0011") then
--                                             if (bouton = "0010") then
--                                                 nombre_correct <= "0100";
--                                             else
--                                                 nombre_correct <= nombre_correct;
--                                             end if;
--                                       else
--                                           if (nombre_correct = "0010") then
--                                                if (bouton = "0010") then
--                                                    nombre_correct <= "0011";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                           else
--                                              if (nombre_correct = "0001") then
--                                                  if (bouton = "0010") then
--                                                      nombre_correct <= "0010";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                              else
--                                                  if (nombre_correct = "0000") then
--                                                    if (bouton = "0010") then
--                                                        nombre_correct <= "0001";
--                                                    else
--                                                        nombre_correct <= nombre_correct;
--                                                    end if;
--                                                  end if;
--                                              end if;
--                                           end if;
--                                       end if;
--                                    end if;
--                              end if;
                when etat10 => anode_gg <= "10";
                              anode_gd <= "00";
                              anode_dg <= "00";
                              anode_dd <= "11";
                              if (bouton = "0001") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "0110") then
--                                 if (bouton = "0001") then
--                                     nombre_correct <= "0111";
--                                 else
--                                     nombre_correct <= nombre_correct;
--                                 end if;
--                              else
--                                  if (nombre_correct = "0101") then
--                                      if (bouton = "0001") then
--                                          nombre_correct <= "0110";
--                                      else
--                                          nombre_correct <= nombre_correct;
--                                      end if;
--                                  else
--                                     if (nombre_correct = "0100") then
--                                           if (bouton = "0001") then
--                                               nombre_correct <= "0101";
--                                           else
--                                               nombre_correct <= nombre_correct;
--                                           end if;
--                                     else
--                                         if (nombre_correct = "0011") then
--                                              if (bouton = "0001") then
--                                                  nombre_correct <= "0100";
--                                              else
--                                                  nombre_correct <= nombre_correct;
--                                              end if;
--                                         else
--                                            if (nombre_correct = "0010") then
--                                                if (bouton = "0001") then
--                                                    nombre_correct <= "0011";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                            else
--                                                if (nombre_correct = "0001") then
--                                                  if (bouton = "0001") then
--                                                      nombre_correct <= "0010";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                                else 
--                                                    if (nombre_correct = "0000") then
--                                                        if (bouton = "0001") then
--                                                            nombre_correct <= "0001";
--                                                        else
--                                                            nombre_correct <= nombre_correct;
--                                                        end if;
--                                                    end if;
--                                                end if;
--                                            end if;
--                                         end if;
--                                     end if;
--                                  end if;
--                              end if;
                when etat11 => anode_gg <= "11";
                              anode_gd <= "00";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              if (bouton = "1000") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "0111") then
--                                   if (bouton = "1000") then
--                                       nombre_correct <= "1000";
--                                   else
--                                       nombre_correct <= nombre_correct;
--                                   end if;
--                              else
--                                    if (nombre_correct = "0110") then
--                                        if (bouton = "1000") then
--                                            nombre_correct <= "0111";
--                                        else
--                                            nombre_correct <= nombre_correct;
--                                        end if;
--                                    else
--                                       if (nombre_correct = "0101") then
--                                             if (bouton = "1000") then
--                                                 nombre_correct <= "0110";
--                                             else
--                                                 nombre_correct <= nombre_correct;
--                                             end if;
--                                       else
--                                           if (nombre_correct = "0100") then
--                                                if (bouton = "1000") then
--                                                    nombre_correct <= "0101";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                           else
--                                              if (nombre_correct = "0011") then
--                                                  if (bouton = "1000") then
--                                                      nombre_correct <= "0100";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                              else
--                                                  if (nombre_correct = "0010") then
--                                                    if (bouton = "1000") then
--                                                        nombre_correct <= "0011";
--                                                    else
--                                                        nombre_correct <= nombre_correct;
--                                                    end if;
--                                                  else 
--                                                      if (nombre_correct = "0001") then
--                                                          if (bouton = "1000") then
--                                                              nombre_correct <= "0010";
--                                                          else
--                                                              nombre_correct <= nombre_correct;
--                                                          end if;
--                                                      else
--                                                        if (nombre_correct = "0000") then
--                                                            if (bouton = "1000") then
--                                                                nombre_correct <= "0001";
--                                                            else
--                                                                nombre_correct <= nombre_correct;
--                                                            end if;
--                                                        end if;
--                                                      end if;
--                                                  end if;
--                                              end if;
--                                           end if;
--                                       end if;
--                                    end if;
--                              end if;
                when etat12 => anode_gg <= "00";
                              anode_gd <= "00";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              sum <= '0';
                              --nombre_correct <= nombre_correct;
                when etat13 => anode_gg <= "00";
                              anode_gd <= "00";
                              anode_dg <= "01";
                              anode_dd <= "00";
                              sum <= '0';
                              --nombre_correct <= nombre_correct;
                when etat14 => anode_gg <= "01";
                              anode_gd <= "00";
                              anode_dg <= "10";
                              anode_dd <= "00";
                              sum <= '0';
                              --nombre_correct <= nombre_correct;
                when etat15 => anode_gg <= "10";
                              anode_gd <= "00";
                              anode_dg <= "11";
                              anode_dd <= "01";
                              if (bouton = "0010") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "1000") then
--                                     if (bouton = "0010") then
--                                         nombre_correct <= "1001";
--                                     else
--                                         nombre_correct <= nombre_correct;
--                                     end if;
--                              else
--                                      if (nombre_correct = "0111") then
--                                          if (bouton = "0010") then
--                                              nombre_correct <= "1000";
--                                          else
--                                              nombre_correct <= nombre_correct;
--                                          end if;
--                                      else
--                                         if (nombre_correct = "0110") then
--                                               if (bouton = "0010") then
--                                                   nombre_correct <= "0111";
--                                               else
--                                                   nombre_correct <= nombre_correct;
--                                               end if;
--                                         else
--                                             if (nombre_correct = "0101") then
--                                                  if (bouton = "0010") then
--                                                      nombre_correct <= "0110";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                             else
--                                                if (nombre_correct = "0100") then
--                                                    if (bouton = "0010") then
--                                                        nombre_correct <= "0101";
--                                                    else
--                                                        nombre_correct <= nombre_correct;
--                                                    end if;
--                                                else
--                                                    if (nombre_correct = "0011") then
--                                                      if (bouton = "0010") then
--                                                          nombre_correct <= "0100";
--                                                      else
--                                                          nombre_correct <= nombre_correct;
--                                                      end if;
--                                                    else 
--                                                        if (nombre_correct = "0010") then
--                                                            if (bouton = "0010") then
--                                                                nombre_correct <= "0011";
--                                                            else
--                                                                nombre_correct <= nombre_correct;
--                                                            end if;
--                                                        else
--                                                          if (nombre_correct = "0001") then
--                                                              if (bouton = "0010") then
--                                                                  nombre_correct <= "0010";
--                                                              else
--                                                                  nombre_correct <= nombre_correct;
--                                                              end if;
--                                                          else
--                                                            if (nombre_correct = "0000") then
--                                                                if (bouton = "0010") then
--                                                                    nombre_correct <= "0001";
--                                                                else
--                                                                    nombre_correct <= nombre_correct;
--                                                                end if;
--                                                            end if;
--                                                          end if;
--                                                        end if;
--                                                    end if;
--                                                end if;
--                                             end if;
--                                         end if;
--                                      end if;
--                              end if;
                when etat16 => anode_gg <= "11";
                              anode_gd <= "01";
                              anode_dg <= "00";
                              anode_dd <= "10";
                              if (bouton = "1000") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "1001") then
--                                   if (bouton = "1000") then
--                                       nombre_correct <= "1010";
--                                   else
--                                       nombre_correct <= nombre_correct;
--                                   end if;
--                              else
--                                    if (nombre_correct = "1000") then
--                                        if (bouton = "1000") then
--                                            nombre_correct <= "1001";
--                                        else
--                                            nombre_correct <= nombre_correct;
--                                        end if;
--                                    else
--                                       if (nombre_correct = "0111") then
--                                             if (bouton = "1000") then
--                                                 nombre_correct <= "1000";
--                                             else
--                                                 nombre_correct <= nombre_correct;
--                                             end if;
--                                       else
--                                           if (nombre_correct = "0110") then
--                                                if (bouton = "1000") then
--                                                    nombre_correct <= "0111";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                           else
--                                              if (nombre_correct = "0101") then
--                                                  if (bouton = "1000") then
--                                                      nombre_correct <= "0110";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                              else
--                                                  if (nombre_correct = "0100") then
--                                                    if (bouton = "1000") then
--                                                        nombre_correct <= "0101";
--                                                    else
--                                                        nombre_correct <= nombre_correct;
--                                                    end if;
--                                                  else 
--                                                      if (nombre_correct = "0011") then
--                                                          if (bouton = "1000") then
--                                                              nombre_correct <= "0100";
--                                                          else
--                                                              nombre_correct <= nombre_correct;
--                                                          end if;
--                                                      else
--                                                        if (nombre_correct = "0010") then
--                                                            if (bouton = "1000") then
--                                                                nombre_correct <= "0011";
--                                                            else
--                                                                nombre_correct <= nombre_correct;
--                                                            end if;
--                                                        else
--                                                          if (nombre_correct = "0001") then
--                                                              if (bouton = "1000") then
--                                                                  nombre_correct <= "0010";
--                                                              else
--                                                                  nombre_correct <= nombre_correct;
--                                                              end if;
--                                                          else
--                                                            if (nombre_correct = "0000") then
--                                                                if (bouton = "1000") then
--                                                                    nombre_correct <= "0001";
--                                                                else
--                                                                    nombre_correct <= nombre_correct;
--                                                                end if;
--                                                            end if;
--                                                          end if;
--                                                        end if;
--                                                      end if;
--                                                  end if;
--                                              end if;
--                                           end if;
--                                       end if;
--                                    end if;
--                              end if;
                when etat17 => anode_gg <= "01";
                              anode_gd <= "10";
                              anode_dg <= "00";
                              anode_dd <= "11";
                              if (bouton = "0001") then
                                sum <= '1';
                              else
                                sum <= '0';
                              end if;
--                              if (nombre_correct = "1010") then
--                                 if (bouton = "0001") then
--                                     nombre_correct <= "1011";
--                                 else
--                                     nombre_correct <= nombre_correct;
--                                 end if;
--                              else
--                                  if (nombre_correct = "1001") then
--                                      if (bouton = "0001") then
--                                          nombre_correct <= "1010";
--                                      else
--                                          nombre_correct <= nombre_correct;
--                                      end if;
--                                  else
--                                     if (nombre_correct = "1000") then
--                                           if (bouton = "0001") then
--                                               nombre_correct <= "1001";
--                                           else
--                                               nombre_correct <= nombre_correct;
--                                           end if;
--                                     else
--                                         if (nombre_correct = "0111") then
--                                              if (bouton = "0001") then
--                                                  nombre_correct <= "1000";
--                                              else
--                                                  nombre_correct <= nombre_correct;
--                                              end if;
--                                         else
--                                            if (nombre_correct = "0110") then
--                                                if (bouton = "0001") then
--                                                    nombre_correct <= "0111";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                            else
--                                                if (nombre_correct = "0101") then
--                                                  if (bouton = "0001") then
--                                                      nombre_correct <= "0110";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                                else 
--                                                    if (nombre_correct = "0100") then
--                                                        if (bouton = "0001") then
--                                                            nombre_correct <= "0101";
--                                                        else
--                                                            nombre_correct <= nombre_correct;
--                                                        end if;
--                                                    else
--                                                      if (nombre_correct = "0011") then
--                                                          if (bouton = "0001") then
--                                                              nombre_correct <= "0100";
--                                                          else
--                                                              nombre_correct <= nombre_correct;
--                                                          end if;
--                                                      else
--                                                        if (nombre_correct = "0010") then
--                                                            if (bouton = "0001") then
--                                                                nombre_correct <= "0011";
--                                                            else
--                                                                nombre_correct <= nombre_correct;
--                                                            end if;
--                                                        else
--                                                          if (nombre_correct = "0001") then
--                                                              if (bouton = "0001") then
--                                                                  nombre_correct <= "0010";
--                                                              else
--                                                                  nombre_correct <= nombre_correct;
--                                                              end if;
--                                                          else
--                                                              if (nombre_correct = "0000") then
--                                                                    if (bouton = "0001") then
--                                                                        nombre_correct <= "0001";
--                                                                    else
--                                                                        nombre_correct <= nombre_correct;
--                                                                    end if;
--                                                              end if;
--                                                          end if;
--                                                        end if;
--                                                      end if;
--                                                    end if;
--                                                end if;
--                                            end if;
--                                         end if;
--                                     end if;
--                                  end if;
--                              end if;
                when etat18 => anode_gg <= "10";
                              anode_gd <= "11";
                              anode_dg <= "01";
                              anode_dd <= "00";
                              if (bouton = "0100") then
                                 sum <= '1';
                              else
                                 sum <= '0';
                              end if;
--                              if (nombre_correct = "1011") then
--                                   if (bouton = "0100") then
--                                       nombre_correct <= "1100";
--                                   else
--                                       nombre_correct <= nombre_correct;
--                                   end if;
--                              else
--                                    if (nombre_correct = "1010") then
--                                        if (bouton = "0100") then
--                                            nombre_correct <= "1011";
--                                        else
--                                            nombre_correct <= nombre_correct;
--                                        end if;
--                                    else
--                                       if (nombre_correct = "1001") then
--                                             if (bouton = "0100") then
--                                                 nombre_correct <= "1010";
--                                             else
--                                                 nombre_correct <= nombre_correct;
--                                             end if;
--                                       else
--                                           if (nombre_correct = "1000") then
--                                                if (bouton = "0100") then
--                                                    nombre_correct <= "1001";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                           else
--                                              if (nombre_correct = "0111") then
--                                                  if (bouton = "0100") then
--                                                      nombre_correct <= "1000";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                              else
--                                                  if (nombre_correct = "0110") then
--                                                    if (bouton = "0100") then
--                                                        nombre_correct <= "0111";
--                                                    else
--                                                        nombre_correct <= nombre_correct;
--                                                    end if;
--                                                  else 
--                                                      if (nombre_correct = "0101") then
--                                                          if (bouton = "0100") then
--                                                              nombre_correct <= "0110";
--                                                          else
--                                                              nombre_correct <= nombre_correct;
--                                                          end if;
--                                                      else
--                                                        if (nombre_correct = "0100") then
--                                                            if (bouton = "0100") then
--                                                                nombre_correct <= "0101";
--                                                            else
--                                                                nombre_correct <= nombre_correct;
--                                                            end if;
--                                                        else
--                                                          if (nombre_correct = "0011") then
--                                                              if (bouton = "0100") then
--                                                                  nombre_correct <= "0100";
--                                                              else
--                                                                  nombre_correct <= nombre_correct;
--                                                              end if;
--                                                          else
--                                                            if (nombre_correct = "0010") then
--                                                                if (bouton = "0100") then
--                                                                    nombre_correct <= "0011";
--                                                                else
--                                                                    nombre_correct <= nombre_correct;
--                                                                end if;
--                                                            else
--                                                                if (nombre_correct = "0001") then
--                                                                      if (bouton = "0100") then
--                                                                          nombre_correct <= "0010";
--                                                                      else
--                                                                          nombre_correct <= nombre_correct;
--                                                                      end if;
--                                                                else
--                                                                    if (nombre_correct = "0000") then
--                                                                        if (bouton = "0100") then
--                                                                            nombre_correct <= "0001";
--                                                                        else
--                                                                            nombre_correct <= nombre_correct;
--                                                                        end if;
--                                                                    end if;
--                                                                end if;
--                                                            end if;
--                                                          end if;
--                                                        end if;
--                                                      end if;
--                                                  end if;
--                                              end if;
--                                           end if;
--                                       end if;
--                                    end if;
--                              end if;
                when etat19 => anode_gg <= "11";
                              anode_gd <= "01";
                              anode_dg <= "10";
                              anode_dd <= "00";
                              if (bouton = "1000") then
                                  sum <= '1';
                              else
                                  sum <= '0';
                              end if;
--                              if (nombre_correct = "1100") then
--                                 if (bouton = "1000") then
--                                     nombre_correct <= "1101";
--                                 else
--                                     nombre_correct <= nombre_correct;
--                                 end if;
--                              else
--                                  if (nombre_correct = "1011") then
--                                      if (bouton = "1000") then
--                                          nombre_correct <= "1100";
--                                      else
--                                          nombre_correct <= nombre_correct;
--                                      end if;
--                                  else
--                                     if (nombre_correct = "1010") then
--                                           if (bouton = "1000") then
--                                               nombre_correct <= "1011";
--                                           else
--                                               nombre_correct <= nombre_correct;
--                                           end if;
--                                     else
--                                         if (nombre_correct = "1001") then
--                                              if (bouton = "1000") then
--                                                  nombre_correct <= "1010";
--                                              else
--                                                  nombre_correct <= nombre_correct;
--                                              end if;
--                                         else
--                                            if (nombre_correct = "1000") then
--                                                if (bouton = "1000") then
--                                                    nombre_correct <= "1001";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                            else
--                                                if (nombre_correct = "0111") then
--                                                  if (bouton = "1000") then
--                                                      nombre_correct <= "1000";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                                else 
--                                                    if (nombre_correct = "0110") then
--                                                        if (bouton = "1000") then
--                                                            nombre_correct <= "0111";
--                                                        else
--                                                            nombre_correct <= nombre_correct;
--                                                        end if;
--                                                    else
--                                                      if (nombre_correct = "0101") then
--                                                          if (bouton = "1000") then
--                                                              nombre_correct <= "0110";
--                                                          else
--                                                              nombre_correct <= nombre_correct;
--                                                          end if;
--                                                      else
--                                                        if (nombre_correct = "0100") then
--                                                            if (bouton = "1000") then
--                                                                nombre_correct <= "0101";
--                                                            else
--                                                                nombre_correct <= nombre_correct;
--                                                            end if;
--                                                        else
--                                                          if (nombre_correct = "0011") then
--                                                              if (bouton = "1000") then
--                                                                  nombre_correct <= "0100";
--                                                              else
--                                                                  nombre_correct <= nombre_correct;
--                                                              end if;
--                                                          else
--                                                              if (nombre_correct = "0010") then
--                                                                    if (bouton = "1000") then
--                                                                        nombre_correct <= "0011";
--                                                                    else
--                                                                        nombre_correct <= nombre_correct;
--                                                                    end if;
--                                                              else
--                                                                  if (nombre_correct = "0001") then
--                                                                      if (bouton = "1000") then
--                                                                          nombre_correct <= "0010";
--                                                                      else
--                                                                          nombre_correct <= nombre_correct;
--                                                                      end if;
--                                                                  else
--                                                                        if (nombre_correct = "0000") then
--                                                                            if (bouton = "1000") then
--                                                                                nombre_correct <= "0001";
--                                                                            else
--                                                                                nombre_correct <= nombre_correct;
--                                                                            end if;
--                                                                        end if;
--                                                                  end if;
--                                                              end if;
--                                                          end if;
--                                                        end if;
--                                                      end if;
--                                                    end if;
--                                                end if;
--                                            end if;
--                                         end if;
--                                     end if;
--                                  end if;
--                              end if;
                when etat20 => anode_gg <= "00";
                              anode_gd <= "10";
                              anode_dg <= "11";
                              anode_dd <= "00";
                              if (bouton = "0010") then
                                  sum <= '1';
                              else
                                  sum <= '0';
                              end if;
--                              if (nombre_correct = "1101") then
--                                   if (bouton = "0010") then
--                                       nombre_correct <= "1110";
--                                   else
--                                       nombre_correct <= nombre_correct;
--                                   end if;
--                              else
--                                    if (nombre_correct = "1100") then
--                                        if (bouton = "0010") then
--                                            nombre_correct <= "1101";
--                                        else
--                                            nombre_correct <= nombre_correct;
--                                        end if;
--                                    else
--                                       if (nombre_correct = "1011") then
--                                             if (bouton = "0010") then
--                                                 nombre_correct <= "1100";
--                                             else
--                                                 nombre_correct <= nombre_correct;
--                                             end if;
--                                       else
--                                           if (nombre_correct = "1010") then
--                                                if (bouton = "0010") then
--                                                    nombre_correct <= "1011";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                           else
--                                              if (nombre_correct = "1001") then
--                                                  if (bouton = "0010") then
--                                                      nombre_correct <= "1010";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                              else
--                                                  if (nombre_correct = "1000") then
--                                                    if (bouton = "0010") then
--                                                        nombre_correct <= "1001";
--                                                    else
--                                                        nombre_correct <= nombre_correct;
--                                                    end if;
--                                                  else 
--                                                      if (nombre_correct = "0111") then
--                                                          if (bouton = "0010") then
--                                                              nombre_correct <= "1000";
--                                                          else
--                                                              nombre_correct <= nombre_correct;
--                                                          end if;
--                                                      else
--                                                        if (nombre_correct = "0110") then
--                                                            if (bouton = "0010") then
--                                                                nombre_correct <= "0111";
--                                                            else
--                                                                nombre_correct <= nombre_correct;
--                                                            end if;
--                                                        else
--                                                          if (nombre_correct = "0101") then
--                                                              if (bouton = "0010") then
--                                                                  nombre_correct <= "0110";
--                                                              else
--                                                                  nombre_correct <= nombre_correct;
--                                                              end if;
--                                                          else
--                                                            if (nombre_correct = "0100") then
--                                                                if (bouton = "0010") then
--                                                                    nombre_correct <= "0101";
--                                                                else
--                                                                    nombre_correct <= nombre_correct;
--                                                                end if;
--                                                            else
--                                                                if (nombre_correct = "0011") then
--                                                                      if (bouton = "0010") then
--                                                                          nombre_correct <= "0100";
--                                                                      else
--                                                                          nombre_correct <= nombre_correct;
--                                                                      end if;
--                                                                else
--                                                                    if (nombre_correct = "0010") then
--                                                                        if (bouton = "0010") then
--                                                                            nombre_correct <= "0011";
--                                                                        else
--                                                                            nombre_correct <= nombre_correct;
--                                                                        end if;
--                                                                    else
--                                                                          if (nombre_correct = "0001") then
--                                                                              if (bouton = "0010") then
--                                                                                  nombre_correct <= "0010";
--                                                                              else
--                                                                                  nombre_correct <= nombre_correct;
--                                                                              end if;
--                                                                          else
--                                                                                if (nombre_correct = "0000") then
--                                                                                    if (bouton = "0010") then
--                                                                                        nombre_correct <= "0001";
--                                                                                    else
--                                                                                        nombre_correct <= nombre_correct;
--                                                                                    end if;
--                                                                                end if;
--                                                                          end if;
--                                                                    end if;
--                                                                end if;
--                                                            end if;
--                                                          end if;
--                                                        end if;
--                                                      end if;
--                                                  end if;
--                                              end if;
--                                           end if;
--                                       end if;
--                                    end if;
--                              end if;
                when etat21 => anode_gg <= "00";
                              anode_gd <= "11";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              if (bouton = "0100") then
                                  sum <= '1';
                              else
                                  sum <= '0';
                              end if;
--                              if (nombre_correct = "1110") then
--                                 if (bouton = "0010") then
--                                     nombre_correct <= "1111";
--                                 else
--                                     nombre_correct <= nombre_correct;
--                                 end if;
--                              else
--                                  if (nombre_correct = "1100") then
--                                      if (bouton = "0010") then
--                                          nombre_correct <= "1101";
--                                      else
--                                          nombre_correct <= nombre_correct;
--                                      end if;
--                                  else
--                                     if (nombre_correct = "1011") then
--                                           if (bouton = "0010") then
--                                               nombre_correct <= "1100";
--                                           else
--                                               nombre_correct <= nombre_correct;
--                                           end if;
--                                     else
--                                         if (nombre_correct = "1010") then
--                                              if (bouton = "0010") then
--                                                  nombre_correct <= "1011";
--                                              else
--                                                  nombre_correct <= nombre_correct;
--                                              end if;
--                                         else
--                                            if (nombre_correct = "1001") then
--                                                if (bouton = "0010") then
--                                                    nombre_correct <= "1010";
--                                                else
--                                                    nombre_correct <= nombre_correct;
--                                                end if;
--                                            else
--                                                if (nombre_correct = "1000") then
--                                                  if (bouton = "0010") then
--                                                      nombre_correct <= "1001";
--                                                  else
--                                                      nombre_correct <= nombre_correct;
--                                                  end if;
--                                                else 
--                                                    if (nombre_correct = "0111") then
--                                                        if (bouton = "0010") then
--                                                            nombre_correct <= "1000";
--                                                        else
--                                                            nombre_correct <= nombre_correct;
--                                                        end if;
--                                                    else
--                                                      if (nombre_correct = "0110") then
--                                                          if (bouton = "0010") then
--                                                              nombre_correct <= "0111";
--                                                          else
--                                                              nombre_correct <= nombre_correct;
--                                                          end if;
--                                                      else
--                                                        if (nombre_correct = "0101") then
--                                                            if (bouton = "0010") then
--                                                                nombre_correct <= "0110";
--                                                            else
--                                                                nombre_correct <= nombre_correct;
--                                                            end if;
--                                                        else
--                                                          if (nombre_correct = "0100") then
--                                                              if (bouton = "0010") then
--                                                                  nombre_correct <= "0101";
--                                                              else
--                                                                  nombre_correct <= nombre_correct;
--                                                              end if;
--                                                          else
--                                                              if (nombre_correct = "0011") then
--                                                                    if (bouton = "0010") then
--                                                                        nombre_correct <= "0100";
--                                                                    else
--                                                                        nombre_correct <= nombre_correct;
--                                                                    end if;
--                                                              else
--                                                                  if (nombre_correct = "0010") then
--                                                                      if (bouton = "0010") then
--                                                                          nombre_correct <= "0011";
--                                                                      else
--                                                                          nombre_correct <= nombre_correct;
--                                                                      end if;
--                                                                  else
--                                                                        if (nombre_correct = "0001") then
--                                                                            if (bouton = "0010") then
--                                                                                nombre_correct <= "0010";
--                                                                            else
--                                                                                nombre_correct <= nombre_correct;
--                                                                            end if;
--                                                                        else
--                                                                              if (nombre_correct = "0000") then
--                                                                                  if (bouton = "0010") then
--                                                                                      nombre_correct <= "0001";
--                                                                                  else
--                                                                                      nombre_correct <= nombre_correct;
--                                                                                  end if;
--                                                                              end if;
--                                                                        end if;
--                                                                  end if;
--                                                              end if;
--                                                          end if;
--                                                        end if;
--                                                      end if;
--                                                    end if;
--                                                end if;
--                                            end if;
--                                         end if;
--                                     end if;
--                                  end if;
--                              end if;
                when etat22 => anode_gg <= "00";
                              anode_gd <= "00";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              sum <= '0';
                              --nombre_correct <= nombre_correct;
                when etat23 => anode_gg <= "01";
                              anode_gd <= "00";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              sum <= '0';
                              --nombre_correct <= nombre_correct;
                when etat24 => anode_gg <= "10";
                              anode_gd <= "00";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              sum <= '0';
                              --nombre_correct <= nombre_correct;
                when etat25 => anode_gg <= "11";
                              anode_gd <= "00";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              if (bouton = "1000") then
                                  sum <= '1';
                              else
                                  sum <= '0';
                              end if;
                             -- nombre_correct <= nombre_correct;
                when etat26 => anode_gg <= "00";
                              anode_gd <= "00";
                              anode_dg <= "00";
                              anode_dd <= "00";
                              sum <= '0';
                              --nombre_correct <= nombre_correct;        
            end case;
    end process;

end Behavioral;
