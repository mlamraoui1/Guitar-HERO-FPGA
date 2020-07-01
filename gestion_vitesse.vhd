----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 23:23:33
-- Design Name: 
-- Module Name: gestion_vitesse - Behavioral
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

entity gestion_vitesse is
    Port ( choix : in STD_LOGIC_VECTOR(1 downto 0);
           ce_rapide : in STD_LOGIC;
           ce_normal : in STD_LOGIC;
           ce_lent : in STD_LOGIC;
           ce : out STD_LOGIC);
end gestion_vitesse;

architecture Behavioral of gestion_vitesse is

begin
    process(choix)
        begin
            case choix is
                when "00" => ce <= ce_lent;
                when "01" => ce <= ce_normal;
                when "10" => ce <= ce_rapide;
                when others => 
            end case;
    end process;

end Behavioral;
