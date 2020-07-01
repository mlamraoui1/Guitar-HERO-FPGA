----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2018 12:28:50
-- Design Name: 
-- Module Name: audio - Behavioral
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

entity audio is
    Port ( clock : in STD_LOGIC;
           ce : in STD_LOGIC;
           odata : out STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC);
end audio;

architecture Behavioral of audio is
component PWM 
    Port ( idata : in STD_LOGIC_VECTOR(10 downto 0);
           CE : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           odata : out STD_LOGIC);
end component;

component ROM 
    Port ( commande : in STD_LOGIC_VECTOR (15 downto 0);
           clock : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (10 downto 0));
end component;

signal data : STD_LOGIC_VECTOR(10 downto 0);

component cpt_rom 
    Port ( clock : in STD_LOGIC;
           ce : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           commande : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal commande : STD_LOGIC_VECTOR(15 downto 0);
begin
    inst1 : cpt_rom PORT MAP
        (clock => clock,
         start => start,
         ce => ce,
         reset => reset,
         commande => commande);
    inst2 : ROM PORT MAP
        (clock => clock,
         commande => commande,
         data => data);
    inst3 : PWM PORT MAP
        (idata => data,
         ce => ce,
         reset => reset,
         clock => clock,
         odata => odata);

end Behavioral;
