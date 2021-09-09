architecture behavior of alu is

	--Functional Unit in/out
	signal add_o, sub_o, mul_o, and_o, or_o, xor_o, not_o, shi_o : std_logic_vector(15 downto 0);
	
	component functional_unit is
		generic (n : integer := 8);
		port (
			A, B : in std_logic_vector(n - 1 downto 0);
			S : out std_logic_vector(15 downto 0)
		);
	end component functional_unit;

	component multiplexer is
		port (
			input : in std_logic_vector(15 downto 0);
			input1 : in std_logic_vector(15 downto 0);
			input2 : in std_logic_vector(15 downto 0);
			input3 : in std_logic_vector(15 downto 0);
			input4 : in std_logic_vector(15 downto 0);
			input5 : in std_logic_vector(15 downto 0);
			input6 : in std_logic_vector(15 downto 0);
			input7 : in std_logic_vector(15 downto 0);
			s : in std_logic_vector(2 downto 0);
			y : out std_logic_vector(15 downto 0)
		);
	end component multiplexer;

begin
	
	add : functional_unit
	port map(A, B, add_o);
	sub : functional_unit
	port map(A, B, sub_o);
	mult : functional_unit
	port map(A, B, mul_o);
	andd : functional_unit
	port map(A, B, and_o);
	orr : functional_unit
	port map(A, B, or_o);
	xorr : functional_unit
	port map(A, B, xor_o);
	nott : functional_unit
	port map(A, B, not_o);
	shift : functional_unit
	port map(A, B, shi_o);
 
	plex : multiplexer
	port map(add_o, sub_o, mul_o, and_o, or_o, xor_o, not_o, shi_o, CB, C);
	
 
end architecture behavior;