----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 23:10:41
-- Design Name: 
-- Module Name: jeu - Behavioral
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

entity jeu is
  Port (clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        ce_retard : in STD_LOGIC;
        ce_rapide : in STD_LOGIC;
        ce_normal : in STD_LOGIC;
        ce_lent : in STD_LOGIC;
        appui : in STD_LOGIC;
        bouton : in STD_LOGIC_VECTOR(3 downto 0);
        anode_gg : out STD_LOGIC_VECTOR(1 downto 0);
        anode_gd : out STD_LOGIC_VECTOR(1 downto 0);
        anode_dg : out STD_LOGIC_VECTOR(1 downto 0);
        anode_dd : out STD_LOGIC_VECTOR(1 downto 0);
        nombre_de_points : out STD_LOGIC_VECTOR(13 downto 0) );
end jeu;

architecture Behavioral of jeu is
    component mod4 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce_lent : in STD_LOGIC;
           commande_jeu : out STD_LOGIC_VECTOR (3 downto 0));
   end component;

    signal commande_jeu : STD_LOGIC_VECTOR(3 downto 0);
    
    component gestion_vitesse 
        Port ( choix : in STD_LOGIC_VECTOR(1 downto 0);
               ce_rapide : in STD_LOGIC;
               ce_normal : in STD_LOGIC;
               ce_lent : in STD_LOGIC;
               ce : out STD_LOGIC);
    end component;
    
    signal ce : STD_LOGIC;
    
    component compteur_lent2 
      Port (clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            ce : in STD_LOGIC;
            goin : in STD_LOGIC;
            goout : out STD_LOGIC;
            cpt : out STD_LOGIC_VECTOR(1 downto 0));
    end component;
    
    signal code : STD_LOGIC_VECTOR(3 downto 0);
    
    component juge 
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               appui : in STD_LOGIC;
               code : in STD_LOGIC_VECTOR(3 downto 0);
               cpt_retard : in STD_LOGIC_VECTOR(3 downto 0);
               bouton : in STD_LOGIC_VECTOR(3 downto 0);
               lance : out STD_LOGIC;
               stop : out STD_LOGIC;
               gain : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    signal stop : STD_LOGIC;
    signal gain : STD_LOGIC_VECTOR(3 downto 0);
    signal lance : STD_LOGIC;
    
    component compteur_retard 
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               goout : in STD_LOGIC;
               stop : in STD_LOGIC;
               ce_retard : in STD_LOGIC;
               cpt_retard : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal cpt_retard : STD_LOGIC_VECTOR(3 downto 0);
    
    component compteur_points_v2
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               nombre_points : out STD_LOGIC_VECTOR (13 downto 0);
               gain : in STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal nombre : STD_LOGIC_VECTOR(13 downto 0);
    
    component Cpt_test 
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               ce : in STD_LOGIC;
               cpt_ce : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal cpt_ce : STD_LOGIC_VECTOR(3 downto 0);
    
    component juge_test 
        Port ( ce : in STD_LOGIC;
               clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               cpt : in STD_LOGIC_VECTOR(3 downto 0);
               gain : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    
begin
    inst1 : mod4 PORT MAP
    (clock => clock,
     reset => reset,
     ce_lent => ce_lent,
     commande_jeu => commande_jeu);
    inst2 : gestion_vitesse PORT MAP
    (choix => "01",
     ce_rapide => ce_rapide,
     ce_normal => ce_normal,
     ce_lent => ce_lent,
     ce => ce); 
    inst3 : compteur_lent2 PORT MAP
    (clock => clock,
     reset => reset,
     ce => ce,
     goin => commande_jeu(0),
     goout => code(0),
     cpt => anode_gg);
    inst4 : compteur_lent2 PORT MAP
    (clock => clock,
     reset => reset,
     ce => ce,
     goin => commande_jeu(1),
     goout => code(1),
     cpt => anode_gd);
    inst5 : compteur_lent2 PORT MAP
    (clock => clock,
     reset => reset,
     ce => ce,
     goin => commande_jeu(2),
     goout => code(2),
     cpt => anode_dg);  
    inst6 : compteur_lent2 PORT MAP
    (clock => clock,
     reset => reset,
     ce => ce,
     goin => commande_jeu(3),
     goout => code(3),
     cpt => anode_dd);
--    inst7 : juge PORT MAP
--    (clock => clock,
--     reset => reset,
--     appui => appui,
--     code => code,
--     cpt_retard => cpt_retard,
--     bouton => bouton,
--     lance => lance,
--     stop => stop,
--     gain => gain);  
    inst8 : compteur_retard PORT MAP
    (clock => clock,
     reset => reset,
     goout => lance,
     stop => stop,
     ce_retard => ce_retard,
     cpt_retard => cpt_retard);  
    inst9 : compteur_points_v2 PORT MAP
    (nombre_points => nombre,
     clock => clock,
     reset => reset,
     gain => gain);
     nombre_de_points <= nombre;
     inst10 : cpt_test PORT MAP
     (clock => clock,
      reset => reset,
      ce => ce,
      cpt_ce => cpt_ce);
     inst11 : juge_test PORT MAP
     (ce => ce,
      clock => clock,
      cpt => cpt_ce,
      reset => reset,
      gain => gain); 
end Behavioral;
