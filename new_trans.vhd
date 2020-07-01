----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2018 18:01:38
-- Design Name: 
-- Module Name: new_trans - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity new_trans is
    Port ( nombre_de_points : in STD_LOGIC_VECTOR(9 downto 0);
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
end new_trans;

architecture Behavioral of new_trans is

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

    process(nombre_de_points)
        begin
            case nombre_de_points is
                when "0000000000" => -- 0
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "0000001"; 
                when "0000000001" => -- 1
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "1001111"; 
                when "0000000010" => -- 2
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "0010010"; 
                when "0000000011" => -- 3
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "0000110";
                when "0000000100" => -- 4
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "1001100";
                when "0000000101" => -- 5
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "0100100";
                when "0000000110" => -- 6
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "0100000";
                when "0000000111" => -- 7
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "0001111";
                when "0000001000" => -- 8
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "0000000";
                when "0000001001" => -- 9
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "0000001";
                    nb_unite <= "0000100";
                when "0000001010" => -- 10
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "0000001"; 
                when "0000001011" => -- 11
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "1001111"; 
                when "0000001100" => -- 12
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "0010010"; 
                when "0000001101" => -- 13
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "0000110";
                when "0000001110" => -- 14
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "1001100";
                when "0000001111" => -- 15
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "0100100";
                when "0000010000" => -- 16
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "0100000";
                when "0000010001" => -- 17
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "0001111";
                when "0000010010" => -- 18
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "0000000";
                when "0000010011" => -- 19
                    nb_millier <= "0000001";
                    nb_centaine <= "0000001";
                    nb_dizaine <= "1001111";
                    nb_unite <= "0000100";
                when "0000010100" => -- 20
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0010010";
                   nb_unite <= "0000001"; 
                when "0000010101" => -- 21
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0010010";
                   nb_unite <= "1001111"; 
                when "0000010110" => -- 22
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0010010";
                   nb_unite <= "0010010"; 
                when "0000010111" => -- 23
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0010010";
                   nb_unite <= "0000110";
                when "0000011000" => -- 24
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0010010";
                   nb_unite <= "1001100";
                when "0000011001" => -- 25
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0010010";
                   nb_unite <= "0100100";
                when "0000011010" => -- 26
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0010010";
                   nb_unite <= "0100000";
                when "0000011011" => -- 27
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0010010";
                   nb_unite <= "0001111";
                when "0000011100" => -- 28
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0010010";
                   nb_unite <= "0000000";
                when "0000011101" => -- 29
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001111";
                   nb_unite <= "0000100";
               when "0000011110" => -- 30
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "0000001"; 
               when "0000011111" => -- 31
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "1001111"; 
               when "0000100000" => -- 32
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "0010010"; 
               when "0000100001" => -- 33
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "0000110";
               when "0000100010" => -- 34
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "1001100";
               when "0000100011" => -- 35
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "0100100";
               when "0000100100" => -- 36
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "0100000";
               when "0000100101" => -- 37
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "0001111";
               when "0000100110" => -- 38
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "0000000";
               when "0000100111" => -- 39
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "0000110";
                   nb_unite <= "0000100";
               when "0000101000" => -- 40
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "0000001"; 
              when "0000101001" => -- 41
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "1001111"; 
              when "0000101010" => -- 42
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "0010010"; 
              when "0000101011" => -- 43
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "0000110";
              when "0000101100" => -- 44
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "1001100";
              when "0000101101" => -- 45
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "0100100";
              when "0000101110" => -- 46
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "0100000";
              when "0000101111" => -- 47
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "0001111";
              when "0000110000" => -- 48
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "0000000";
              when "0000110001" => -- 49
                   nb_millier <= "0000001";
                   nb_centaine <= "0000001";
                   nb_dizaine <= "1001100";
                   nb_unite <= "0000100";
             when  "0000110010" => -- 50
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "0000001"; 
             when "0000110011" => -- 51
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "1001111"; 
             when "0000110100" => -- 52
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "0010010"; 
             when "0000110101" => -- 53
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "0000110";
             when "0000110110" => -- 54
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "1001100";
             when "0000110111" => -- 55
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "0100100";
             when "0000111000" => -- 56
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "0100000";
             when "0000111001" => -- 57
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "0001111";
             when "0000111010" => -- 58
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "0000000";
             when "0000111011" => -- 59
                  nb_millier <= "0000001";
                  nb_centaine <= "0000001";
                  nb_dizaine <= "0100100";
                  nb_unite <= "0000100";
            end case;
    end process;

end Behavioral;
