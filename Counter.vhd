
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Counter is
   port (
		VAL_OUT 		: out  STD_LOGIC_VECTOR (7 downto 0);
		CLK 			: 	in  STD_LOGIC;
		LED1			: 	out STD_LOGIC
	);
end Counter;

architecture Behavioral of Counter is
	
	signal VAL : STD_LOGIC_VECTOR (7 downto 0);
	signal ALT : STD_LOGIC := '0';
	signal CLK_DCM : STD_LOGIC;
	signal CLK_COUNT: STD_LOGIC_VECTOR (22 downto 0);
	
	component DCM_BLOCK
		port ( 
			CLK_IN : in std_logic;
			CLK_OUT : out std_logic
		); 
	end component;
	
	begin
		
		VAL_OUT <= VAL;
		LED1 <= ALT;
		
		U1 : DCM_BLOCK port map(
			CLK_IN => CLK,
			CLK_OUT => CLK_DCM
		);
	  
		process(CLK_DCM) begin
			if (rising_edge(CLK_DCM)) then
				CLK_COUNT <= CLK_COUNT + 1;
				if(CLK_COUNT = 5000000) then
					CLK_COUNT <= (others => '0');
					ALT <= NOT(ALT);
					VAL <= VAL + 1;
				end if;
         end if;
		end process;
		
end Behavioral;

