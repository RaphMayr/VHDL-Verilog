library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StateMachine
port (
    clk : in std_logic;
    rstn : in std_logic;

    data_in : in std_logic_vector(3 downto 0);
    data_out : out std_logic_vector(3 downto 0)
);
end entity;

architecture rtl of StateMachine is

    type t_statemachine_state is (IDLE, FIRST, SECOND, THIRD);
    signal statemachine_state : t_statemachine_state := IDLE;

begin
    process(clk) is
        begin 
            if rising_edge(clk) then
                
                if rst = '1' then
                    data_out <= (others => '0');
                else
                    case statemachine_state is
                        when IDLE =>
                            data_out <= (others => '0');
                        when FIRST =>
                            data_out <= '1' & data_in(2 downto 0);
                        when SECOND =>
                            data_out <= data_in(2 downto 0) & '1';
                        when THIRD =>
                            data_out <= data_in(1 downto 0) & data_in(3 downto 2);
                        when others =>
                            statemachine_state <= IDLE;
                    end case;
                end if;
            end if;
    end process;
end architecture rtl;