----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2018 19:18:55
-- Design Name: 
-- Module Name: case_score - Behavioral
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

entity case_score is
    Port ( score_in : in STD_LOGIC_VECTOR (13 downto 0);
           score_out : out STD_LOGIC_VECTOR (13 downto 0));
end case_score;

architecture Behavioral of case_score is
signal score : unsigned(13 downto 0);
begin
    process(score_in)
        begin
            score <= score + unsigned(score_in);
    end process;
    
    score_out <= STD_LOGIC_VECTOR(score);


end Behavioral;
