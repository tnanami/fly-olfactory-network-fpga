----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/11/15 15:18:08
-- Design Name: 
-- Module Name: clk1k_generator - Behavioral
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
use ieee.std_logic_signed.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk1_generator is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clk1_generator;

architecture Behavioral of clk1_generator is

--signal counter_max : std_logic_vector(9 downto 0) := "1111101000";
signal counter_max : std_logic_vector(27 downto 0) := "0101111101011110000100000000";
signal counter : std_logic_vector(27 downto 0) := (OTHERS => '0');

begin

process(clk_in)
       begin
 	      if(rising_edge(CLK_in)) then
            if counter =counter_max then
                clk_out <= '1';
                counter <= (OTHERS => '0');
            else
                clk_out <= '0';
                counter <= counter + 1;
            end if;
       end if;
end process;

end Behavioral;
