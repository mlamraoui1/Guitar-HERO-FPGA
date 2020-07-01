----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 19:39:53
-- Design Name: 
-- Module Name: mux8 - Behavioral
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

entity mux8 is
    Port ( commande_AN : in STD_LOGIC_VECTOR (2 downto 0);
           nb_millier : in STD_LOGIC_VECTOR (6 downto 0);
           nb_centaine : in STD_LOGIC_VECTOR (6 downto 0);
           nb_dizaine : in STD_LOGIC_VECTOR (6 downto 0);
           nb_unite : in STD_LOGIC_VECTOR (6 downto 0);
           out_anode_gg : in STD_LOGIC_VECTOR (6 downto 0);
           out_anode_gd : in STD_LOGIC_VECTOR (6 downto 0);
           out_anode_dg : in STD_LOGIC_VECTOR (6 downto 0);
           out_anode_dd : in STD_LOGIC_VECTOR (6 downto 0);
           segments : out STD_LOGIC_VECTOR (6 downto 0));
end mux8;

architecture Behavioral of mux8 is

begin
    process(commande_AN)
        begin
            case commande_AN is
                when "000" => segments <= nb_millier;
                when "001" => segments <= nb_centaine;
                when "010" => segments <= nb_dizaine;
                when "011" => segments <= nb_unite;
                when "100" => segments <= out_anode_gg;
                when "101" => segments <= out_anode_gd;
                when "110" => segments <= out_anode_dg;
                when "111" => segments <= out_anode_dd;
                when others => segments <= "0000000";
            end case;
    end process;


end Behavioral;
