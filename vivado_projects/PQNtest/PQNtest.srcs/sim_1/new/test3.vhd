--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:11:30 12/04/2015
-- Design Name:   
-- Module Name:   C:/Users/anonymous/Xilinx/ISE14.7_network16/test.vhd
-- Project Name:  ISE14.7_network16
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: network16
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.all;
use ieee.std_logic_textio.all;  -- ‚±‚ê‚Æ
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test3 IS
END test3;
 
ARCHITECTURE behavior OF test3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    COMPONENT  GPIO_demo 
        Port ( 
               BTN             : in  STD_LOGIC_VECTOR (1 downto 0);
               CLK             : in  STD_LOGIC;
               LED             : out  STD_LOGIC_VECTOR (1 downto 0);
               uart_txd_in     : in  STD_LOGIC;
               RGB0_Red        : out  STD_LOGIC;
               RGB0_Green    : out  STD_LOGIC;
               RGB0_Blue    : out  STD_LOGIC
                  );
    end COMPONENT ;


   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
   signal clk2 : std_logic := '1';
   signal uart_rx : std_logic := '1';
   
   signal I_cst : std_logic_vector(17 downto 0) := "000000000000000000";
   signal I_in : std_logic_vector(17 downto 0) := (others => '0');
   signal count : std_logic_vector(2 downto 0);
   signal count2 : std_logic_vector(1 downto 0);
   signal count_clk2   : std_logic_vector(17 downto 0):="000000000000000000";


   -- Clock period definitions
   constant clk_period : time :=  83.3 ns; --10 ns
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)

   demo:  GPIO_demo PORT MAP(
               BTN   => count2,
               CLK   => clk,
               LED   => count2,
               uart_txd_in   => uart_rx,
               RGB0_Red   => rst,
               RGB0_Green => rst,
               RGB0_Blue  => rst
                  );
        

process(clk)
       begin
       if (clk'event and clk ='1') then
            count_clk2 <= count_clk2 + "000000000000000001";
            clk2 <= '0';
            if count_clk2 = "000000000000000001" then
                clk2 <= '1';
                count_clk2 <= "000000000000000000";
            end if;
            --if clk2 = '1' then
            --    clk2 <= '0';
            --else
            --    clk2 <= '1';
            --end if;     
       end if;
end process;


   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
   wait for 100000 ns ; uart_rx <= '1' ;--3000000ns

-- 20
wait for 250 ns ; uart_rx <= '1' ;--64
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--2750ns
wait for 250 ns ; uart_rx <= '1' ;--148
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--5500ns
-- 120
wait for 250 ns ; uart_rx <= '1' ;--65
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--8250ns
wait for 250 ns ; uart_rx <= '1' ;--184
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--11000ns
-- 1020
wait for 250 ns ; uart_rx <= '1' ;--79
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--13750ns
wait for 250 ns ; uart_rx <= '1' ;--188
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--16500ns
-- 1ms end code
wait for 250 ns ; uart_rx <= '1' ;--10
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--19250ns
wait for 980750 ns ; uart_rx <= '1' ;--1000000ns
-- 20
wait for 250 ns ; uart_rx <= '1' ;--64
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--1002750ns
wait for 250 ns ; uart_rx <= '1' ;--148
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--1005500ns
-- 120
wait for 250 ns ; uart_rx <= '1' ;--65
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--1008250ns
wait for 250 ns ; uart_rx <= '1' ;--184
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--1011000ns
-- 1020
wait for 250 ns ; uart_rx <= '1' ;--79
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--1013750ns
wait for 250 ns ; uart_rx <= '1' ;--188
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--1016500ns
-- 1ms end code
wait for 250 ns ; uart_rx <= '1' ;--10
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--1019250ns
wait for 980750 ns ; uart_rx <= '1' ;--2000000ns
-- 20
wait for 250 ns ; uart_rx <= '1' ;--64
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--2002750ns
wait for 250 ns ; uart_rx <= '1' ;--148
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--2005500ns
-- 120
wait for 250 ns ; uart_rx <= '1' ;--65
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--2008250ns
wait for 250 ns ; uart_rx <= '1' ;--184
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--2011000ns
-- 220
wait for 250 ns ; uart_rx <= '1' ;--67
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--2013750ns
wait for 250 ns ; uart_rx <= '1' ;--156
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--2016500ns
-- 520
wait for 250 ns ; uart_rx <= '1' ;--72
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--2019250ns
wait for 250 ns ; uart_rx <= '1' ;--136
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '1' ;--2022000ns
-- 1ms end code
wait for 250 ns ; uart_rx <= '1' ;--10
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '0' ;
wait for 250 ns ; uart_rx <= '1' ;--2024750ns
wait for 975250 ns ; uart_rx <= '1' ;--3000000ns

   end process;

END;