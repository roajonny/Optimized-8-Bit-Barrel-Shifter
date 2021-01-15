----------------------------------------------------------------------------------
-- Engineer: Jonathan Roa
-- Module Name: Barrel_Shifter - Behavioral
-- Target Devices: Zynq
-- Tool Versions: 
-- Description: Optimized combinational 8-bit barrel shifter utilizing
-- three levels of multiplexers
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Barrel_Shifter is
    Generic (WIDTH : integer := 8);
    Port    (  d : in STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
             amt : in STD_LOGIC_VECTOR (2 DOWNTO 0);
               q : out STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0));
end Barrel_Shifter;

architecture Behavioral of Barrel_Shifter is

-- registered input and output signals
signal d_reg : STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
signal q_reg : STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);

-- rotator output signals
signal mux1_out : STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
signal mux2_out : STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);
signal mux3_out : STD_LOGIC_VECTOR (WIDTH-1 DOWNTO 0);

begin

mux1_out <= d_reg(0) & d_reg(WIDTH-1 DOWNTO 1) when amt(0) = '1' else
            d_reg;

mux2_out <= mux1_out(1 DOWNTO 0) & mux1_out(WIDTH-1 DOWNTO 2) when amt(1) = '1' else
            mux1_out;
            
mux3_out <= mux2_out(3 DOWNTO 0) & mux2_out(WIDTH-1 DOWNTO 4) when amt(2) = '1' else
            mux2_out;

d_reg <= d;
q <= mux3_out;
end Behavioral;
