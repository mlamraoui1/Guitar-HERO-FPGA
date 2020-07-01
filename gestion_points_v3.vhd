----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2018 16:34:41
-- Design Name: 
-- Module Name: gestion_points_v3 - Behavioral
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

entity gestion_points_v3 is
    Port ( nombre_correct : in STD_LOGIC_VECTOR (3 downto 0);
           score : out STD_LOGIC_VECTOR (13 downto 0));
end gestion_points_v3;

architecture Behavioral of gestion_points_v3 is

begin
    process(nombre_correct)
        begin
            case nombre_correct is
                when "0000" => score <= STD_LOGIC_VECTOR(to_unsigned(0,14));
                when "0001" => score <= STD_LOGIC_VECTOR(to_unsigned(100,14));
                when "0010" => score <= STD_LOGIC_VECTOR(to_unsigned(200,14));
                when "0011" => score <= STD_LOGIC_VECTOR(to_unsigned(300,14));
                when "0100" => score <= STD_LOGIC_VECTOR(to_unsigned(400,14));
                when "0101" => score <= STD_LOGIC_VECTOR(to_unsigned(500,14));
                when "0110" => score <= STD_LOGIC_VECTOR(to_unsigned(600,14));
                when "0111" => score <= STD_LOGIC_VECTOR(to_unsigned(700,14));
                when "1000" => score <= STD_LOGIC_VECTOR(to_unsigned(800,14));
                when "1001" => score <= STD_LOGIC_VECTOR(to_unsigned(900,14));
                when "1010" => score <= STD_LOGIC_VECTOR(to_unsigned(1000,14));
                when "1011" => score <= STD_LOGIC_VECTOR(to_unsigned(1100,14));
                when "1100" => score <= STD_LOGIC_VECTOR(to_unsigned(1200,14));
                when "1101" => score <= STD_LOGIC_VECTOR(to_unsigned(1300,14));
                when "1110" => score <= STD_LOGIC_VECTOR(to_unsigned(1400,14));
                when "1111" => score <= STD_LOGIC_VECTOR(to_unsigned(1500,14));
                when others => score <= STD_LOGIC_VECTOR(to_unsigned(666,14));
            end case;
    end process;

end Behavioral;
