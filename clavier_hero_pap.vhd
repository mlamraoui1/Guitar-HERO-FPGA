----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 18:35:41
-- Design Name: 
-- Module Name: clavier_hero_pap - Behavioral
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

entity clavier_hero_pap is
  Port (clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        start : in STD_LOGIC;
        JA : inout STD_LOGIC_VECTOR(7 downto 0);
        ledd : out STD_LOGIC;
        ledc : out STD_LOGIC;
        ledb : out STD_lOGIC;
        leda : out STD_LOGIC;
        AN : out STD_LOGIC_VECTOR(7 downto 0);
        odata : out STD_LOGIC;
        segments : out STD_LOGIC_VECTOR(6 downto 0));
end clavier_hero_pap;

architecture Behavioral of clavier_hero_pap is

    component gestion_frequences 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce_anode : out STD_LOGIC;
           ce_memoire : out STD_LOGIC;
           ce_retard : out STD_LOGIC;
           ce_rapide : out STD_LOGIC;
           ce_normal : out STD_LOGIC;
           ce_lent : out STD_LOGIC);
    end component;
    
    signal ce_anode : STD_LOGIC;
    signal ce_memoire : STD_LOGIC;
    signal ce_retard : STD_LOGIC;
    signal ce_rapide : STD_LOGIC;
    signal ce_normal : STD_LOGIC;
    signal ce_lent : STD_LOGIC;
    
    component bloc_affichage 
        Port ( clock : in STD_LOGIC;
               reset : in STD_LOGIC;
               ce_anode : in STD_LOGIC;
               nombre_de_points : in STD_LOGIC_VECTOR(13 downto 0);
               anode_gg : in STD_LOGIC_VECTOR(1 downto 0);
               anode_gd : in STD_LOGIC_VECTOR(1 downto 0);
               anode_dg : in STD_LOGIC_VECTOR(1 downto 0);
               anode_dd : in STD_LOGIC_VECTOR(1 downto 0);
               segments : out STD_LOGIC_VECTOR (6 downto 0);
               AN : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component jeuv2
    Port (clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            ce_retard : in STD_LOGIC;
            ce_rapide : in STD_LOGIC;
            ce_normal : in STD_LOGIC;
            start : in STD_LOGIC;
            appui : in STD_LOGIC;
            ce_lent : in STD_LOGIC;
            ledd : out STD_LOGIC;
            ledc : out STD_LOGIC;
            ledb : out STD_lOGIC;
            leda : out STD_LOGIC;
            bouton : in STD_LOGIC_VECTOR(3 downto 0);
            anode_gg : out STD_LOGIC_VECTOR(1 downto 0);
            anode_gd : out STD_LOGIC_VECTOR(1 downto 0);
            anode_dg : out STD_LOGIC_VECTOR(1 downto 0);
            anode_dd : out STD_LOGIC_VECTOR(1 downto 0);
            nombre_de_points : out STD_LOGIC_VECTOR(13 downto 0) );
    end component;
    
    signal anode_gg : STD_LOGIC_VECTOR(1 downto 0);
    signal anode_gd : STD_LOGIC_VECTOR(1 downto 0);
    signal anode_dg : STD_LOGIC_VECTOR(1 downto 0);
    signal anode_dd : STD_LOGIC_VECTOR(1 downto 0);
    signal nombre_de_points : STD_LOGIC_VECTOR(13 downto 0);
    
    component bouton
        Port ( clock : in STD_LOGIC;
               JA : inout STD_LOGIC_VECTOR (7 downto 0);
               appui : out STD_LOGIC;
               ce : in STD_LOGIC;
               Code : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal boutons : STD_LOGIC_VECTOR(3 downto 0);
    signal appui : STD_LOGIC;
    
    component audio 
        Port ( clock : in STD_LOGIC;
               ce : in STD_LOGIC;
               odata : out STD_LOGIC;
               reset : in STD_LOGIC;
               start : in STD_LOGIC);
    end component;
    
begin
    inst1 : gestion_frequences PORT MAP
        (clock => clock,
         reset => reset,
         ce_anode => ce_anode,
         ce_memoire => ce_memoire,
         ce_retard => ce_retard,
         ce_rapide => ce_rapide,
         ce_normal => ce_normal,
         ce_lent => ce_lent);    
    inst2 : jeuv2 PORT MAP
        (clock => clock,
         start => start,
         reset => reset,
         ce_retard => ce_retard,
         ce_rapide => ce_rapide,
         ce_normal => ce_normal,
         appui => appui,
         bouton => boutons,
         ce_lent => ce_lent,
         ledd => ledd,
         ledc => ledc,
         ledb => ledb,
         leda => leda,
         anode_gg => anode_gg,
         anode_gd => anode_gd,
         anode_dg => anode_dg,
         anode_dd => anode_dd,
         nombre_de_points => nombre_de_points);
    inst3 : bloc_affichage PORT MAP
        (clock => clock,
         reset => reset,
         ce_anode => ce_anode,
         nombre_de_points => nombre_de_points,
         --nombre_de_points => STD_LOGIC_VECTOR(to_unsigned(1100,14)),
         anode_gg => anode_gg,
         anode_gd => anode_gd,
         anode_dg => anode_dg,
         anode_dd => anode_dd,
         segments => segments,
         AN => AN); 
    inst4 : bouton PORT MAP
        (clock => clock,
         JA => JA,
         ce => ce_lent,
         code => boutons);
    inst5 : audio PORT MAP
        (clock => clock,
         reset => reset, 
         odata => odata,
         ce => ce_memoire,
         start => start);
end Behavioral;
