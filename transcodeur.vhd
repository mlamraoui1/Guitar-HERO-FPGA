----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 19:23:13
-- Design Name: 
-- Module Name: transcodeur - Behavioral
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

entity transcodeur is
    Port ( nombre_de_points : in STD_LOGIC_VECTOR(13 downto 0);
           anode_gg : in STD_LOGIC_VECTOR(1 downto 0);
           anode_gd : in STD_LOGIC_VECTOR(1 downto 0);
           anode_dg : in STD_LOGIC_VECTOR(1 downto 0);
           anode_dd : in STD_LOGIC_VECTOR(1 downto 0);
           out_anode_gg : out STD_LOGIC_VECTOR(6 downto 0);
           out_anode_gd : out STD_LOGIC_VECTOR(6 downto 0);
           out_anode_dg : out STD_LOGIC_VECTOR(6 downto 0);
           out_anode_dd : out STD_LOGIC_VECTOR(6 downto 0);
           nb_millier : out STD_LOGIC_VECTOR (6 downto 0);
           nb_centaine : out STD_LOGIC_VECTOR (6 downto 0);
           nb_dizaine : out STD_LOGIC_VECTOR (6 downto 0);
           nb_unite : out STD_LOGIC_VECTOR (6 downto 0));
end transcodeur;

architecture Behavioral of transcodeur is
    signal nb_points_s : unsigned(13 downto 0);
    signal nb_points_sc : unsigned(13 downto 0);
    signal nb_points_sd : unsigned(13 downto 0);
    signal nb_points_uu : unsigned(13 downto 0);
begin

    process(anode_gg, anode_gd, anode_dg, anode_dd)
        begin
            case anode_gg is
                when "01" => out_anode_gg <= "0111111";
                when "10" => out_anode_gg <= "1111110";
                when "11" => out_anode_gg <= "1110111";
                when others => out_anode_gg <= "1111111";
            end case;
            case anode_gd is
                when "01" => out_anode_gd <= "0111111";
                when "10" => out_anode_gd <= "1111110";
                when "11" => out_anode_gd <= "1110111";
                when others => out_anode_gd <= "1111111";
            end case;
            case anode_dg is
                when "01" => out_anode_dg <= "0111111";
                when "10" => out_anode_dg <= "1111110";
                when "11" => out_anode_dg <= "1110111";
                when others => out_anode_dg <= "1111111";
            end case;
            case anode_dd is
                when "01" => out_anode_dd <= "0111111";
                when "10" => out_anode_dd <= "1111110";
                when "11" => out_anode_dd <= "1110111";
                when others => out_anode_dd <= "1111111";
            end case;
    end process;
    
    nb_points_s <= unsigned(nombre_de_points);
    
    process(nombre_de_points)
        begin
            --Traitement des milliers
            if (nb_points_s < to_unsigned(1000,14)) then
                nb_millier <= "0000001"; -- affiche 0
                nb_points_sc <= unsigned(nombre_de_points);
            else
                if (nb_points_s < to_unsigned(2000,14)) then
                    nb_millier <= "1001111"; -- affiche 1
                    nb_points_sc <= nb_points_s - to_unsigned(1000,14);
                else
                    if (nb_points_s < to_unsigned(3000,14)) then
                        nb_millier <= "0010010"; -- affiche 2
                        nb_points_sc <= nb_points_s - to_unsigned(2000,14);
                    else
                        if (nb_points_s < to_unsigned(4000,14)) then
                            nb_millier <= "0000110"; -- affiche 3
                            nb_points_sc <= nb_points_s - to_unsigned(3000,14);
                        else
                            if (nb_points_s < to_unsigned(5000,14)) then
                                nb_millier <= "1001100"; -- affiche 4
                                nb_points_sc <= nb_points_s - to_unsigned(4000,14);
                            else
                                if (nb_points_s < to_unsigned(6000,14)) then
                                    nb_millier <= "0100100"; -- affiche 5
                                    nb_points_sc <= nb_points_s - to_unsigned(5000,14);
                                else
                                    if (nb_points_s < to_unsigned(7000,14)) then
                                        nb_millier <= "0100000"; -- affiche 6
                                        nb_points_sc <= nb_points_s - to_unsigned(6000,14);
                                    else
                                        if (nb_points_s < to_unsigned(8000,14)) then
                                            nb_millier <= "0001111"; -- affiche 7
                                            nb_points_sc <= nb_points_s - to_unsigned(7000,14);
                                        else
                                            if (nb_points_s < to_unsigned(9000,14)) then
                                                nb_millier <= "0000000"; -- affiche 8
                                                nb_points_sc <= nb_points_s - to_unsigned(8000,14);
                                            else
                                                nb_millier <= "0000100"; -- affiche 9
                                                nb_points_sc <= nb_points_s - to_unsigned(9000,14);
                                            end if;
                                        end if;
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end process;
            -- Traitement centaines
    process(nb_points_sc)
        begin
            if (nb_points_sc < to_unsigned(100,14)) then
                nb_centaine <= "0000001"; -- affiche 0
                nb_points_sd <= nb_points_sc;
            else
                if (nb_points_sc < to_unsigned(200,14)) then
                    nb_centaine <= "1001111"; -- affiche 1
                    nb_points_sd <= nb_points_sc - to_unsigned(100,14);
                else
                    if (nb_points_sc < to_unsigned(300,14)) then
                        nb_centaine <= "0010010"; -- affiche 2
                        nb_points_sd <= nb_points_sc - to_unsigned(200,14);
                    else
                        if (nb_points_sc < to_unsigned(400,14)) then
                            nb_centaine <= "0000110"; -- affiche 3
                            nb_points_sd <= nb_points_sc - to_unsigned(300,14);
                        else
                            if (nb_points_sc < to_unsigned(500,14)) then
                                nb_centaine <= "1001100"; -- affiche 4
                                nb_points_sd <= nb_points_sc - to_unsigned(400,14);
                            else
                                if (nb_points_sc < to_unsigned(600,14)) then
                                    nb_centaine <= "0100100"; -- affiche 5
                                    nb_points_sd <= nb_points_sc - to_unsigned(500,14);
                                else
                                    if (nb_points_sc < to_unsigned(700,14)) then
                                        nb_centaine <= "0100000"; -- affiche 6
                                        nb_points_sd <= nb_points_sc - to_unsigned(600,14);
                                    else
                                        if (nb_points_sc < to_unsigned(800,14)) then
                                            nb_centaine <= "0001111"; -- affiche 7
                                            nb_points_sd <= nb_points_sc - to_unsigned(700,14);
                                        else
                                            if (nb_points_sc < to_unsigned(900,14)) then
                                                nb_centaine <= "0000000"; -- affiche 8
                                                nb_points_sd <= nb_points_sc - to_unsigned(800,14);
                                            else
                                                nb_centaine <= "0000100"; -- affiche 9
                                                nb_points_sd <= nb_points_sc - to_unsigned(900,14);
                                            end if;
                                        end if;
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end process;
        -- Traitement des dizaines
    process(nb_points_sd)
        begin
            if (nb_points_sd < to_unsigned(10,14)) then
                nb_dizaine <= "0000001"; -- affiche 0
                nb_points_uu <= nb_points_sd;
            else
                if (nb_points_sd < to_unsigned(20,14)) then
                    nb_dizaine <= "1001111"; -- affiche 1
                    nb_points_uu <= nb_points_sd - to_unsigned(10,14);
                else
                    if (nb_points_sd < to_unsigned(30,14)) then
                        nb_dizaine <= "0010010"; -- affiche 2
                        nb_points_uu <= nb_points_sd - to_unsigned(20,14);
                    else
                        if (nb_points_sd < to_unsigned(40,14)) then
                            nb_dizaine <= "0000110"; -- affiche 3
                            nb_points_uu <= nb_points_sd - to_unsigned(30,14);
                        else
                            if (nb_points_sd < to_unsigned(50,14)) then
                                nb_dizaine <= "1001100"; -- affiche 4
                                nb_points_uu <= nb_points_sd - to_unsigned(40,14);
                            else
                                if (nb_points_sd < to_unsigned(60,14)) then
                                    nb_dizaine <= "0100100"; -- affiche 5
                                    nb_points_uu <= nb_points_sd - to_unsigned(50,14);
                                else
                                    if (nb_points_sd < to_unsigned(70,14)) then
                                        nb_dizaine <= "0100000"; -- affiche 6
                                        nb_points_uu <= nb_points_sd - to_unsigned(60,14);
                                    else
                                        if (nb_points_sd < to_unsigned(80,14)) then
                                            nb_dizaine <= "0001111"; -- affiche 7
                                            nb_points_uu <= nb_points_sd - to_unsigned(70,14);
                                        else
                                            if (nb_points_sd < to_unsigned(90,14)) then
                                                nb_dizaine <= "0000000"; -- affiche 8
                                                nb_points_uu <= nb_points_sd - to_unsigned(80,14);
                                            else
                                                nb_dizaine <= "0000100"; -- affiche 9
                                                nb_points_uu <= nb_points_sd - to_unsigned(90,14);
                                           end if;
                                        end if;
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
    end process;
        -- Traitement des unités
    process(nb_points_uu)
        begin
            case nb_points_uu is
                when to_unsigned(0,14) => nb_unite <= "0000001"; -- affiche 0
                when to_unsigned(1,14) => nb_unite <= "1001111"; -- affiche 1
                when to_unsigned(2,14) => nb_unite <= "0010010"; -- affiche 2
                when to_unsigned(3,14) => nb_unite <= "0000110"; -- affiche 3
                when to_unsigned(4,14) => nb_unite <= "1001100"; -- affiche 4
                when to_unsigned(5,14) => nb_unite <= "0100100"; -- affiche 5
                when to_unsigned(6,14) => nb_unite <= "0100000"; -- affiche 6
                when to_unsigned(7,14) => nb_unite <= "0001111"; -- affiche 7
                when to_unsigned(8,14) => nb_unite <= "0000000"; -- affiche 8
                when to_unsigned(9,14) => nb_unite <= "0000100"; -- affiche 9
                when others => nb_unite <= "0000001"; -- affiche 0
        end case;
    end process;


end Behavioral;
