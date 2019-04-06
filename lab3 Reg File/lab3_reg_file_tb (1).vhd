-- Vhdl test bench created from schematic /home/asobti/Xilinx_projects/lab3_reg_file/lab3_reg_file.sch - Fri Jul 21 15:05:17 2017
--
-- Notes:
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
library std;
use std.textio.all;

ENTITY lab3_reg_file_tb IS
END lab3_reg_file_tb;
ARCHITECTURE behavioral OF lab3_reg_file_tb IS

  COMPONENT lab3_reg_file
    port ( clock		: 	in std_logic;
           write_enable 	: 	in std_logic;
           mode 			: 	in std_logic;
           wr_addr		: 	in std_logic_vector(2 downto 0);
           rd_addr1		: 	in std_logic_vector(2 downto 0);
           rd_addr2		: 	in std_logic_vector(2 downto 0);
           wr_data		: 	in std_logic_vector(3 downto 0);
           rd_data1		: 	out std_logic_vector(3 downto 0);
           rd_data2		:	out std_logic_vector(3 downto 0);
           rd_data1_xor_data2:	out std_logic_vector(3 downto 0)
           );
   END COMPONENT;

	SIGNAL   clock		    : 	std_logic;
	SIGNAL   write_enable 	: 	std_logic;
	SIGNAL   mode 			: 	std_logic;
	SIGNAL   wr_addr		: 	std_logic_vector(2 downto 0);
	SIGNAL   rd_addr1		: 	std_logic_vector(2 downto 0);
	SIGNAL   rd_addr2		: 	std_logic_vector(2 downto 0);
	SIGNAL   wr_data		: 	std_logic_vector(3 downto 0);
	SIGNAL   rd_data1		: 	std_logic_vector(3 downto 0);
	SIGNAL   rd_data2		:	std_logic_vector(3 downto 0);
	SIGNAL   rd_data1_xor_data2 : std_logic_vector(3 downto 0);

    signal err_cnt_signal : integer;

BEGIN

  UUT: lab3_reg_file PORT MAP(
    clock => clock,
    write_enable => write_enable,
    mode => mode,
    wr_addr => wr_addr,
    rd_addr1 => rd_addr1,
    rd_addr2 => rd_addr2,
    wr_data => wr_data,
    rd_data1 => rd_data1,
    rd_data2 => rd_data2,
    rd_data1_xor_data2 => rd_data1_xor_data2
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
	variable err_cnt : integer := 0;
        variable s : line;
	constant GND : STD_LOGIC := '0';
	constant SUPPLY : STD_LOGIC := '1';
	constant reg0 : STD_LOGIC_VECTOR(2 downto 0) := "000";
    constant reg1 : STD_LOGIC_VECTOR(2 downto 0) := "001";
    constant reg2 : STD_LOGIC_VECTOR(2 downto 0) := "010";
    constant reg3 : STD_LOGIC_VECTOR(2 downto 0) := "011";
    constant reg4 : STD_LOGIC_VECTOR(2 downto 0) := "100";
    constant reg5 : STD_LOGIC_VECTOR(2 downto 0) := "101";
    constant reg6 : STD_LOGIC_VECTOR(2 downto 0) := "110";
    constant reg7 : STD_LOGIC_VECTOR(2 downto 0) := "111";
	 
	 variable test_addr : INTEGER := 0;

   BEGIN

		
		
		-- pre-case 0 (Write 5 to r0)
		wait for 10 ns;
        mode <= GND;
        wr_addr <= reg0;
        rd_addr1 <= reg0;
        rd_addr2 <= reg0;
        wr_data <= "0101";
        write_enable <= SUPPLY;
        
        clock <= GND;
        wait for 5 ns;
        clock <= SUPPLY;
        wait for 5 ns;
        clock <= GND;
        wait for 5 ns;
        
		-- case 0 (Read r0 to both read ports)
		write_enable <= GND;
        rd_addr1 <= reg0;
        rd_addr2 <= reg0;
        
		wait for 1 ns;
		assert (rd_data1 = "0101") report "Error : Can't read 0b0101 from reg0 on port0";
        assert (rd_data2 = "0101") report "Error : Can't read 0b0101 from reg0 on port1";
        assert (rd_data1_xor_data2 = "0000") report "Error : Incorrect XOR output on rd_data1_xor_data2";
		
		if (rd_data1/="0101" or rd_data2/="0101" or rd_data1_xor_data2/="0000") then
			 err_cnt := err_cnt + 1;
		end if;
		
		-- pre-case 1 (Write 5 to r0)
		wait for 10 ns;
        mode <= GND;
        wr_addr <= reg5;
        rd_addr1 <= reg0;
        rd_addr2 <= reg0;
        wr_data <= "0001";
        write_enable <= SUPPLY;
        
        clock <= GND;
        wait for 5 ns;
        clock <= SUPPLY;
        wait for 5 ns;
        clock <= GND;
        wait for 5 ns;

        
		-- case 1 (Read r0 -> port1, r5 -> port2)
		write_enable <= GND;
        rd_addr1 <= reg0;
        rd_addr2 <= reg5;
        
		wait for 1 ns;
		assert (rd_data1 = "0101") report "Error : Can't read 0b0101 from reg0 on port0";
        assert (rd_data2 = "0001") report "Error : Can't read 0b0001 from reg5 on port1";
        assert (rd_data1_xor_data2 = "0100") report "Error : Incorrect XOR output on rd_data1_xor_data2";
		
		if (rd_data1/="0101" or rd_data2/="0001" or rd_data1_xor_data2/="0100") then
			 err_cnt := err_cnt + 1;
		end if;
		wait for 10 ns;

		-- pre-case 2 (Write 5 to r0)
		wait for 10 ns;
        mode <= SUPPLY;
        wr_addr <= reg3;
        rd_addr1 <= reg0;
        rd_addr2 <= reg5;
        wr_data <= "1111";
        write_enable <= SUPPLY;
        
        clock <= GND;
        wait for 5 ns;
        clock <= SUPPLY;
        wait for 5 ns;
        clock <= GND;
        wait for 5 ns;

        
		-- case 2 (Read r3 -> port1)
		  write_enable <= GND;
        rd_addr1 <= reg3;
        rd_addr2 <= reg5;
        
		wait for 1 ns;
 		  assert (rd_data1 = "0100") report "Error : Can't read 0b0100 from reg3 on port0";
        assert (rd_data2 = "0001") report "Error : Can't read 0b0001 from reg0 on port1";
        assert (rd_data1_xor_data2 = "0101") report "Error : Incorrect XOR output on rd_data1_xor_data2";
		
		if (rd_data1/="0100" or rd_data2/="0001" or rd_data1_xor_data2/="0101") then
			 err_cnt := err_cnt + 1;
		end if;
		wait for 10 ns;

		-- pre-case 3 (Write 0s to all regs)
		  mode <= GND;
        write_enable <= SUPPLY;
        
		for test_addr in 0 to 7 loop
		  wr_data <= std_logic_vector(to_unsigned(test_addr, wr_data'length ));
		  wr_addr <= std_logic_vector(to_unsigned(test_addr, wr_addr'length ));
		  
		  clock <= GND;
        wait for 5 ns;
        clock <= SUPPLY;
        wait for 5 ns;
        clock <= GND;
        wait for 5 ns;
		
		end loop;
		
		--case 3
		for test_addr in 0 to 7 loop
			
		  rd_addr1 <= std_logic_vector(to_unsigned(test_addr, rd_addr1'length ));
		  rd_addr2 <= std_logic_vector(to_unsigned(7-test_addr,rd_addr2'length));
		
		  wait for 1 ns;
 		  
		  assert (rd_data1 = ("0" & rd_addr1)) report "Error : Invalid value in loop read on port1";
        assert (rd_data2 = ("0" & rd_addr2)) report "Error : Invalid value in loop read on port2";
        assert (rd_data1_xor_data2 = ("0" & (rd_addr1 xor rd_addr2))) report "Error : Incorrect XOR output on rd_data1_xor_data2 in case 3";
		
			if (rd_data1/=("0" & rd_addr1) or rd_data2/=("0" & rd_addr2) or rd_data1_xor_data2/= ("0" & (rd_addr1 xor rd_addr2))) then
				 err_cnt := err_cnt + 1;
			end if;
			
			wait for 1 ns;

		end loop;
		
		err_cnt_signal <= err_cnt;
		wait for 10 ns;
        
		-- summary of all the tests
		if (err_cnt=0) then
			 assert false
			 report "Testbench of Lab 3 completed successfully!"
			 severity note;
		else
			 assert false
			 report "Something wrong, try again"
			 severity error;
		end if;

      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***


END;

