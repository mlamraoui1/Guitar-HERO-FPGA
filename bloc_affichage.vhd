----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2017 18:45:33
-- Design Name: 
-- Module Name: bloc_affichage - Behavioral
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

entity bloc_affichage is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           ce_anode : in STD_LOGIC;
           anode_gg : in STD_LOGIC_VECTOR(1 downto 0);
           anode_gd : in STD_LOGIC_VECTOR(1 downto 0);
           anode_dg : in STD_LOGIC_VECTOR(1 downto 0);
           anode_dd : in STD_LOGIC_VECTOR(1 downto 0);
           nombre_de_points : in STD_LOGIC_VECTOR(13 downto 0);
           segments : out STD_LOGIC_VECTOR (6 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end bloc_affichage;

architecture Behavioral of bloc_affichage is
    
    component mod8 
    Port ( clock : in STD_LOGIC;
           ce_anode : in STD_LOGIC;
           reset : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           commande_AN : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    signal commande_AN : STD_LOGIC_VECTOR(2 downto 0);
    
    component transcodeur 
        Port ( nombre_de_points : in STD_LOGIC_VECTOR(13 downto 0);
               anode_gg : in STD_LOGIC_VECTOR(1 downto 0);
               anode_gd : in STD_LOGIC_VECTOR(1 downto 0);
               anode_dg : in STD_LOGIC_VECTOR(1 downto 0);
               anode_dd : in STD_LOGIC_VECTOR(1 downto 0);
               out_anode_gg : out STD_LOGIC_VECTOR(6 downto 0);
               out_anode_gd : out STD_LOGIC_VECTOR(6 downto 0);
               out_anode_dg : out STD_LOGIC_VECTOR(6 downto 0);
               out_anode_dd : out STD_LOGIC_VECTOR(6 downto 0);
               nb_millier : out STD_LOGIC_VECTOR (6 downto 0);
               nb_centaine : out STD_LOGIC_VECTOR (6 downto 0);
               nb_dizaine : out STD_LOGIC_VECTOR (6 downto 0);
               nb_unite : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal nb_millier : STD_LOGIC_VECTOR(6 downto 0);
    signal nb_centaine : STD_LOGIC_VECTOR(6 downto 0);
    signal nb_dizaine : STD_LOGIC_VECTOR(6 downto 0);
    signal nb_unite : STD_LOGIC_VECTOR(6 downto 0);
    signal out_anode_gg : STD_LOGIC_VECTOR(6 downto 0);
    signal out_anode_gd : STD_LOGIC_VECTOR(6 downto 0);
    signal out_anode_dg : STD_LOGIC_VECTOR(6 downto 0);
    signal out_anode_dd : STD_LOGIC_VECTOR(6 downto 0);
    
    component mux8 
        Port ( commande_AN : in STD_LOGIC_VECTOR (2 downto 0);
               nb_millier : in STD_LOGIC_VECTOR (6 downto 0);
               nb_centaine : in STD_LOGIC_VECTOR (6 downto 0);
               nb_dizaine : in STD_LOGIC_VECTOR (6 downto 0);
               nb_unite : in STD_LOGIC_VECTOR (6 downto 0);
               out_anode_gg : in STD_LOGIC_VECTOR (6 downto 0);
               out_anode_gd : in STD_LOGIC_VECTOR (6 downto 0);
               out_anode_dg : in STD_LOGIC_VECTOR (6 downto 0);
               out_anode_dd : in STD_LOGIC_VECTOR (6 downto 0);
               segments : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
begin
    inst1 : mod8 PORT MAP
    (clock => clock,
     ce_anode => ce_anode,
     reset => reset,
     AN => AN,
     commande_AN => commande_AN);
    inst2 : transcodeur PORT MAP
    (nombre_de_points => nombre_de_points,
     anode_gg => anode_gg,
     anode_gd => anode_gd,
     anode_dg => anode_dg,
     anode_dd => anode_dd,
     nb_millier => nb_millier,
     nb_centaine => nb_centaine,
     nb_dizaine => nb_dizaine,
     nb_unite => nb_unite,
     out_anode_gg => out_anode_gg,
     out_anode_gd => out_anode_gd,
     out_anode_dg => out_anode_dg,
     out_anode_dd => out_anode_dd);
    inst3 : mux8 PORT MAP
    (commande_AN => commande_AN,
     nb_millier => nb_millier,
     nb_centaine => nb_centaine,
     nb_dizaine => nb_dizaine,
     nb_unite => nb_unite,
     out_anode_gg => out_anode_gg,
     out_anode_gd => out_anode_gd,
     out_anode_dg => out_anode_dg,
     out_anode_dd => out_anode_dd,
     segments => segments);
end Behavioral;
