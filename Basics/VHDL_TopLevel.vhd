----------------------------------------------------------------------------------
-- Company: LIS @ TUM
-- Engineer: Raphael Mayr
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: 
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

entity TopLevel is 
    port (
        clk : in std_logic;
        rst : in std_logic;

        data_in : in std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0)
    );
end TopLevel;

architecture rtl of TopLevel is

    component fifo 
        generic (
            counter_num : integer := 0
        );
        port (
            clk : in std_logic;
            rst : in std_logic;

            data_in : in std_logic_vector(15 downto 0);
            data_out : out std_logic_vector(15 downto 0)
        );
    end component;

    signal intermediate : std_logic_vector(15 downto 0);

begin 
    
    -- with component declaration
    fifo_i : fifo 
    generic map (
        counter => 5
    )
    port map (
        clk => clk,
        rst => rst,
        data_in => data_in,
        data_out => data_out
    )

    -- without component declaration
    fifo_i : entity work.fifo
    generic map(
        counter => 5
    )
    port map(
        clk => clk,
        rst => rst,

        data_in => data_in,
        data_out => data_out
    );

end rtl;