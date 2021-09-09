library ieee;  
use ieee.std_logic_1164.all; 

library functional_unit_lib;
use functional_unit_lib.all;

library mux_lib;	   
use mux_lib.all;

entity alu is
	port (
	A : in std_logic_vector(8 downto 1);
	B : in std_logic_vector(8 downto 1);
	CB : in std_logic_vector(3 downto 1);
	C : out std_logic_vector(16 downto 1)
	);
end entity alu;