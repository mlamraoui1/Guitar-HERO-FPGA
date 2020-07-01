----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2017 09:40:21
-- Design Name: 
-- Module Name: bouton - Behavioral
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

entity bouton is
    Port ( clock : in STD_LOGIC;
           JA : inout STD_LOGIC_VECTOR (7 downto 0);
           appui : out STD_LOGIC;
           ce : in STD_LOGIC;
           reset : in STD_LOGIC;
           Code : out STD_LOGIC_VECTOR (3 downto 0));
end bouton;

architecture Behavioral of bouton is
    component Decoder 
    Port (
          clock : in  STD_LOGIC;
          Row : in  STD_LOGIC_VECTOR (3 downto 0);
          Col : out  STD_LOGIC_VECTOR (3 downto 0);
          appui : out STD_LOGIC;
          reset : in STD_LOGIC;
		  Code : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal code_tmp : STD_LOGIC_VECTOR(3 downto 0);
    
    component reste_appuye 
        Port ( code : in STD_LOGIC_VECTOR (3 downto 0);
               clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               code_corrige : out STD_LOGIC_VECTOR (3 downto 0);
               ce : in STD_LOGIC);
    end component; 
    
begin
    inst1 : Decoder PORT MAP
    (clock => clock,
     Row => JA(7 downto 4),
     Col => JA(3 downto 0),
     appui => appui,
     Code => code,
     reset => reset);
--    inst2 : reste_appuye PORT MAP
--    (clock => clock,
--     reset => reset,
--     ce => ce,
--     code => code_tmp,
--     code_corrige => code);

end Behavioral;
