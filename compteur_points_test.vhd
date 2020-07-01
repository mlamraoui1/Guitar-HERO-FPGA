----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2018 15:19:35
-- Design Name: 
-- Module Name: compteur_points_test - Behavioral
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

entity compteur_points_test is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           nombre_points : out STD_LOGIC_VECTOR (13 downto 0);
           ce : in STD_LOGIC);
end compteur_points_test;

architecture Behavioral of compteur_points_test is
  
    component Cpt_test 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce : in STD_LOGIC;
           cpt_ce : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal cpt_ce : STD_LOGIC_VECTOR(3 downto 0);
    
    component juge_test
        Port ( ce : in STD_LOGIC;
               reset : in STD_LOGIC;
               clock : in STD_LOGIC;
               cpt : in STD_LOGIC_VECTOR(3 downto 0);
               gain : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    signal gain : STD_LOGIC_VECTOR(3 downto 0);
    
    component compteur_points 
        Port ( nombre_points_p : in STD_LOGIC_VECTOR (13 downto 0);
               clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               nombre_points_f : out STD_LOGIC_VECTOR (13 downto 0);
               gain : in STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal nombre : STD_LOGIC_VECTOR(13 downto 0);
    
    
begin
    inst1 : Cpt_test PORT MAP
    (clock => clock,
     reset => reset,
     ce => ce,
     cpt_ce => cpt_ce);
    inst2 : juge_test PORT MAP
    (ce => ce,
     clock => clock,
     reset => reset,
     cpt => cpt_ce,
     gain => gain);
    inst3 : compteur_points PORT MAP
    (nombre_points_p => nombre,
     clock => clock,
     reset => reset,
     nombre_points_f => nombre,
     gain => gain);
     nombre_points <= nombre;

end Behavioral;
