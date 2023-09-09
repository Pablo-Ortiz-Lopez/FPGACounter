
library IEEE; 
library unisim; 

use IEEE.std_logic_1164.all; 
use unisim.vcomponents.all; 

entity DCM_BLOCK is 

	port ( 
		CLK_IN : in std_logic; 
		CLK_OUT : out std_logic
	); 

end DCM_BLOCK; 

architecture STRUCT of DCM_BLOCK is 
	
	signal CLK1 : STD_LOGIC;
	begin 
		
		DCM1 : DCM_SP
		generic map (
			CLKFX_MULTIPLY => 2,
			CLKFX_DIVIDE => 10,
			CLKIN_DIVIDE_BY_2 => TRUE
		)
		port map (
			CLKIN => CLK_IN,
			CLKFB => '0',
			RST => '0',
			CLKFX => CLK_OUT
		);

end architecture STRUCT;