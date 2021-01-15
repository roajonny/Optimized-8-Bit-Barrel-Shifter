library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Barrel_Shifter_TB is
--  Port ( );
end Barrel_Shifter_TB;

architecture Behavioral of Barrel_Shifter_TB is

component Barrel_Shifter is
    Generic (WIDTH : integer := 8);
    Port    (clk : in STD_LOGIC;
               d : in STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
             amt : in STD_LOGIC_VECTOR (2 DOWNTO 0);
               q : out STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0));
end component;

constant WIDTH_CPY : integer := 8;

--100 MHz freq
constant cp : time := 10ns;

-- test signals
signal clk_tst : STD_LOGIC;
signal amt_tst : STD_LOGIC_VECTOR (2 DOWNTO 0);
signal d_tst, q_tst : STD_LOGIC_VECTOR (WIDTH_CPY-1 DOWNTO 0);

begin
UUT : Barrel_Shifter 
      GENERIC MAP (WIDTH => 8)
      PORT MAP (clk => clk_tst, d => d_tst, q => q_tst, amt => amt_tst);

STIM : process
begin
    d_tst <= "10000001";
        wait;
end process STIM;

-- Vary the 3-bit shift vector
SHIFT_AMT : process
begin
    amt_tst <= "101";
    wait;
end process SHIFT_AMT;

end Behavioral;
