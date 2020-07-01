----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2018 12:56:37
-- Design Name: 
-- Module Name: jeuv2 - Behavioral
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

entity jeuv2 is
  Port (clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        ce_retard : in STD_LOGIC;
        ce_rapide : in STD_LOGIC;
        ce_normal : in STD_LOGIC;
        ce_lent : in STD_LOGIC;
        start : in STD_LOGIC;
        appui : in STD_LOGIC;
        bouton : in STD_LOGIC_VECTOR(3 downto 0);
        ledd : out STD_LOGIC;
        ledc : out STD_LOGIC;
        ledb : out STD_lOGIC;
        leda : out STD_LOGIC;
        anode_gg : out STD_LOGIC_VECTOR(1 downto 0);
        anode_gd : out STD_LOGIC_VECTOR(1 downto 0);
        anode_dg : out STD_LOGIC_VECTOR(1 downto 0);
        anode_dd : out STD_LOGIC_VECTOR(1 downto 0);
        nombre_de_points : out STD_LOGIC_VECTOR(13 downto 0) );
end jeuv2;

architecture Behavioral of jeuv2 is
component State_machine_lvl 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           tps : in STD_LOGIC_VECTOR(5 downto 0);
           sum : out STD_LOGIC;
           --nombre_correct : inout STD_LOGIC_VECTOR(3 downto 0);
           bouton : in STD_LOGIC_VECTOR(3 downto 0);
           start : in STD_LOGIC;
           ledd : out STD_LOGIC;
           ledc : out STD_LOGIC;
           ledb : out STD_lOGIC;
           leda : out STD_LOGIC;
           anode_gg : out STD_LOGIC_VECTOR(1 downto 0);
           anode_gd : out STD_LOGIC_VECTOR(1 downto 0);
           anode_dg : out STD_LOGIC_VECTOR(1 downto 0);
           anode_dd : out STD_LOGIC_VECTOR(1 downto 0));
end component;

--signal nombre_correct : STD_LOGIC_VECTOR(3 downto 0);
signal sum : STD_LOGIC;

component cpt_tps 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           ce : in STD_LOGIC;
           cpt_tps : out STD_LOGIC_VECTOR (5 downto 0));
end component;

signal tps : STD_LOGIC_VECTOR(5 downto 0);

--component gestion_points 
--    Port ( clock : in STD_LOGIC;
--           reset : in STD_LOGIC;
--           start : in STD_LOGIC;
--           tps : in STD_LOGIC_VECTOR (5 downto 0);
--           bouton : in STD_LOGIC_VECTOR (3 downto 0);
--           score : out STD_LOGIC_VECTOR (13 downto 0));
--end component;

component gestion_points_v2 
    Port ( tps : in STD_LOGIC_VECTOR (5 downto 0);
           score : out STD_LOGIC_VECTOR (13 downto 0);
           code : in STD_LOGIC_VECTOR (3 downto 0));
end component;

signal score : STD_LOGIC_VECTOR(13 downto 0);

component case_score 
    Port ( score_in : in STD_LOGIC_VECTOR (13 downto 0);
           score_out : out STD_LOGIC_VECTOR (13 downto 0));
end component;

--component gestion_points_v3 
--    Port ( nombre_correct : in STD_LOGIC_VECTOR (3 downto 0);
--           score : out STD_LOGIC_VECTOR (13 downto 0));
--end component;

component compteur_points_v4 
    Port ( clock : in STD_LOGIC;
           ce : in STD_LOGIC;
           sum : in STD_LOGIC;
           start : in STD_LOGIC;
           score : out STD_LOGIC_VECTOR (13 downto 0);
           reset : in STD_LOGIC);
end component;

begin
    inst1 : cpt_tps PORT MAP
        ( clock => clock,
          reset => reset,
          start => start,
          ce => ce_lent,
          cpt_tps => tps);
    inst2 : State_machine_lvl PORT MAP
        ( clock => clock,
          reset => reset, 
          tps => tps,
          start => start,
          sum => sum,
          anode_gg => anode_gg,
          anode_gd => anode_gd,
          anode_dg => anode_dg,
          anode_dd => anode_dd,
          bouton => bouton);
--          nombre_correct => nombre_correct);
--   inst3 : gestion_points_v3 PORT MAP
--        ( nombre_correct => nombre_correct,
--          score => nombre_de_points);
     inst3 : compteur_points_v4 PORT MAP
        ( clock => clock,
          reset => reset,
          ce => ce_lent,
          start => start,
          sum => sum,
          score => nombre_de_points);

end Behavioral;
