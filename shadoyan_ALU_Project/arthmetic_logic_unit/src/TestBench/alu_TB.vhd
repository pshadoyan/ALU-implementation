library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
		port (
			A : in STD_LOGIC_VECTOR(8 downto 1);
			B : in STD_LOGIC_VECTOR(8 downto 1);
			CB : in STD_LOGIC_VECTOR(3 downto 1);
			C : out STD_LOGIC_VECTOR(16 downto 1) 
		);
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(8 downto 1);
	signal B : STD_LOGIC_VECTOR(8 downto 1);
	signal CB : STD_LOGIC_VECTOR(3 downto 1);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal C : STD_LOGIC_VECTOR(16 downto 1);

	-- Add your code here ...  
		type k is array(0 to 19) of std_logic_vector(7 downto 0);
	constant testA : k := ("10010001", "00000001", "10001100", "00010000",
		"00000011", "00001000", "00000100", "00001000", "01000001", "00000100", "01000000", "01010000","00000010", "01000001",
		"00000101", "00000111", "01100000", "00100000", "00100000", "00000100");
	constant testB : k := ("10011000", "10001000", "00000011", "01000001",
		"00000001", "00001000", "00010000", "00100000", "10010100", "00000110", "00001000", "00001110","00010000", "00000110",
		"00000010", "00000100", "00100000", "00001101", "00000101", "00000001");
	-- First four indexes give required negative/positive values

begin
	-- Unit Under Test port map
	UUT : alu
	port map(
		A => A, 
		B => B, 
		CB => CB, 
		C => C
	);

	-- Add your stimulus here ...

	stim_proc : process
	
	begin
		for j in 0 to 7 loop
			CB <= std_logic_vector(to_signed(j, CB'length));
			for m in 0 to 7 loop
				    A <= testA(m);
 	 				B <= testB(m);
					wait for 10ns;
			end loop;
		end loop;

	end process;

	end TB_ARCHITECTURE;

	configuration TESTBENCH_FOR_alu of alu_tb is
		for TB_ARCHITECTURE
			for UUT : alu
				use entity work.alu(behavior);
				for behavior
					for add : functional_unit
						use entity functional_unit_lib.functional_unit(add_function);
					end for;
					for sub : functional_unit
						use entity functional_unit_lib.functional_unit(sub_function);
					end for;
					for mult : functional_unit
						use entity functional_unit_lib.functional_unit(multi_function);
					end for;
					for andd : functional_unit
						use entity functional_unit_lib.functional_unit(and_function);
					end for;
					for orr : functional_unit
						use entity functional_unit_lib.functional_unit(or_function);
					end for;
					for xorr : functional_unit
						use entity functional_unit_lib.functional_unit(xor_function);
					end for;
					for nott : functional_unit
						use entity functional_unit_lib.functional_unit(not_function);
					end for;
					for shift : functional_unit
						use entity functional_unit_lib.functional_unit(shift_function);
					end for; 

				end for;
			end for;
		end for;
end TESTBENCH_FOR_alu;