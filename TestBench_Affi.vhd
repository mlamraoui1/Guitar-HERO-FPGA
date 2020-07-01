----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2018 18:51:55
-- Design Name: 
-- Module Name: TestBench_Affi - Behavioral
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

entity TestBench_Affi is
--  Port ( );
end TestBench_Affi;

architecture Behavioral of TestBench_Affi is

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

signal clock : STD_LOGIC;
signal reset : STD_LOGIC;
signal ce_anode : STD_LOGIC;
signal ce_memoire : STD_LOGIC;
signal ce_retard : STD_LOGIC;
signal ce_rapide : STD_LOGIC;
signal ce_normal : STD_LOGIC;
signal ce_lent : STD_LOGIC;

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

signal  nombre_de_points : STD_LOGIC_VECTOR(13 downto 0);
signal anode_gg : STD_LOGIC_VECTOR(1 downto 0);
signal anode_gd : STD_LOGIC_VECTOR(1 downto 0);
signal anode_dg : STD_LOGIC_VECTOR(1 downto 0);
signal anode_dd : STD_LOGIC_VECTOR(1 downto 0);
signal out_anode_gg : STD_LOGIC_VECTOR(6 downto 0);
signal out_anode_gd : STD_LOGIC_VECTOR(6 downto 0);
signal out_anode_dg : STD_LOGIC_VECTOR(6 downto 0);
signal out_anode_dd : STD_LOGIC_VECTOR(6 downto 0);
signal nb_millier : STD_LOGIC_VECTOR(6 downto 0);
signal nb_centaine : STD_LOGIC_VECTOR(6 downto 0);
signal nb_dizaine : STD_LOGIC_VECTOR(6 downto 0);
signal nb_unite : STD_LOGIC_VECTOR(6 downto 0);

begin
    process
        begin
            clock <= '0';
            wait for 5 ns;
            clock <= '1';
            wait for 5 ns;
    end process;
    
    process
        begin
            reset <= '0';
            wait for 10 ns;
            reset <= '1';
            wait for 10 ns;
            reset <= '0';
            nombre_de_points <= STD_LOGIC_VECTOR(to_unsigned(9876,14));
            wait for 1 ms;
            nombre_de_points <= STD_LOGIC_VECTOR(to_unsigned(5432,14));
            wait for 1 ms;
            nombre_de_points <= STD_LOGIC_VECTOR(to_unsigned(10,14));
            wait;
    end process;

    uut1 : gestion_frequences PORT MAP
    (clock => clock,
     reset => reset,
     ce_anode => ce_anode,
     ce_memoire => ce_memoire,
     ce_retard => ce_retard,
     ce_rapide => ce_rapide,
     ce_normal => ce_normal,
     ce_lent => ce_lent);
     
     uut2 : transcodeur PORT MAP
     (nombre_de_points => nombre_de_points,
      anode_gg => anode_gg,
      anode_gd => anode_gd,
      anode_dg => anode_dg,
      anode_dd => anode_dd,
      out_anode_gg => out_anode_gg,
      out_anode_gd => out_anode_gd,
      out_anode_dg => out_anode_dg,
      out_anode_dd => out_anode_dd,
      nb_millier => nb_millier,
      nb_centaine => nb_centaine,
      nb_dizaine => nb_dizaine,
      nb_unite => nb_unite);
end Behavioral;
