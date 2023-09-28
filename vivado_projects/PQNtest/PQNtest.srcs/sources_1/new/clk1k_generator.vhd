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

entity clk1k_generator is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clk1k_generator;

architecture Behavioral of clk1k_generator is

signal counter_max : std_logic_vector(16 downto 0) := "11000011010100000";
signal counter : std_logic_vector(16 downto 0) := "00000000000000000";

begin

process(clk_in)
       begin
 	      if(rising_edge(CLK_in)) then
            counter <= counter + 1;
            if counter =counter_max then
                clk_out <= '1';
                    counter <="00000000000000000";
            else
                clk_out <= '0';
            end if;
       end if;
end process;

end Behavioral;
