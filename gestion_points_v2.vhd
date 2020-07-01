----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2018 11:34:58
-- Design Name: 
-- Module Name: gestion_points_v2 - Behavioral
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

entity gestion_points_v2 is
    Port ( tps : in STD_LOGIC_VECTOR (5 downto 0);
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           score : out STD_LOGIC_VECTOR (13 downto 0);
           code : in STD_LOGIC_VECTOR (3 downto 0));
end gestion_points_v2;

architecture Behavioral of gestion_points_v2 is

signal score_tmp : unsigned(13 downto 0);

begin

    process(tps, clock)
        begin
            
                    case tps is
                        when STD_LOGIC_VECTOR(to_unsigned(0,14)) => score_tmp <= to_unsigned(0,14);
                        when STD_LOGIC_VECTOR(to_unsigned(3,14)) => --if (code = "1000") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(4,14)) => --if (code = "0100") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(5,14)) => --if (code = "0010") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(7,14)) => --if (code = "1000") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(8,14)) => --if (code = "0100") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(9,14)) => --if (code = "0010") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(10,14))=> --if (code = "0001") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(11,14))=> --if (code = "1000") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(15,14))=> --if (code = "0100") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(16,14))=> --if (code = "1000") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(17,14))=> --if (code = "0001") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(18,14))=> --if (code = "0100") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(19,14))=> --if (code = "1000") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(20,14))=> --if (code = "0010") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(21,14))=> --if (code = "0100") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when STD_LOGIC_VECTOR(to_unsigned(25,14))=> --if (code = "1000") then
                                                                        score_tmp <= score_tmp + to_unsigned(100,14);
                                                                    --end if;
                        when others =>
                    end case;
              
    end process;
    
    score <= STD_LOGIC_VECTOR(score_tmp);
end Behavioral;
