----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:07:32 03/27/2019 
-- Design Name: 
-- Module Name:    lab5 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------sevensegment
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity lab4_seven_segment is
    Port ( b : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
			  pushbutton : in STD_LOGIC;
			  cathode : out  STD_LOGIC_VECTOR (6 downto 0);
			  anode : out  STD_LOGIC_VECTOR (3 downto 0)
          );
end lab4_seven_segment;

architecture Behavioral of lab4_seven_segment is

signal bitn : std_logic_vector (1 downto 0);
signal counter : STD_LOGIC_VECTOR (15 downto 0):=(others=> '0');
signal binary: STD_LOGIC_VECTOR (3 downto 0);
begin	
	
process(clk)
begin
	if (rising_edge(clk))
		then counter <= counter + 1;
			if ( counter = x"FFFF")
			then counter <= x"0000";
			end if;
	end if;
end process;

process(counter,pushbutton)
begin
	if (pushbutton = '0') then
		bitn <= counter(14 downto 13);
	elsif (pushbutton = '1') then
		bitn <= counter(1 downto 0);
	end if;
end process;


process(bitn)
begin
	case bitn is
	when "00" =>
		anode <= "0111";
		binary <= b(15 downto 12);
	when "01" =>
		anode <= "1011";
		binary <= b(11 downto 8);
	when "10" =>
		anode <= "1101";
		binary <= b(7 downto 4);
	when "11" =>
		anode <= "1110";
		binary <= b(3 downto 0);
	when others =>
		anode <= "1111";
	end case;
end process;

process (binary)
		variable Y : STD_LOGIC_VECTOR (6 downto 0);
		begin
			case binary is
			when "0000" => 
				Y := "0000001";
			when "0001" => 
				Y := "1001111";
			when "0010" => 
				Y := "0010010";
			when "0011" => 
				Y := "0000110";
			when "0100" => 
				Y := "1001100";
			when "0101" => 
				Y := "0100100";
			when "0110" => 
				Y := "0100000";
			when "0111" => 
				Y := "0001111";
			when "1000" => 
				Y := "0000000";
			when "1001" => 
				Y := "0000100";
			when "1010" => 
				Y := "0001000";
			when "1011" => 
				Y := "1100000";
			when "1100" => 
				Y := "0110001";
			when "1101" => 
				Y := "1000010";
			when "1110" => 
				Y := "0110000";
			when "1111" => 
				Y := "0111000";
			when others => 
				Y := "1000001";
		end case;
	cathode(0) <= Y(6);
	cathode(1) <= Y(5);
	cathode(2) <= Y(4);
	cathode(3) <= Y(3);
	cathode(4) <= Y(2);
	cathode(5) <= Y(1);
	cathode(6) <= Y(0);
	end process;

end Behavioral;
---------------------------------------------------------------------------------- clock divider
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity Clock_Divider is
port ( clk,reset: in std_logic;
clock_out: out std_logic);
end Clock_Divider;
  
architecture bhv of Clock_Divider is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk,reset)
begin
if(reset='1') then
count<=1;
tmp<='0';
elsif(clk'event and clk='1') then
count <=count+1;
if (count = 100000000) then
tmp <= NOT tmp;
count <= 1;
end if;
end if;
clock_out <= tmp;
end process;
  
end bhv;
---------------------------------------------------------------------------------- GCD GCD
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab5_gcd is
port(
a_i:in std_logic_vector(7 downto 0);
b_i:in std_logic_vector(7 downto 0);
clk,push_i:in std_logic;
--ao: out std_logic_vector(7 downto 0);
pushbutton:in std_logic;
load,sub,op_valid: out std_logic;
	cathode:out std_logic_vector(6 downto 0);
	anode: out std_logic_vector(3 downto 0)
--bo: std_logic_vector(7 downto 0)
);
end lab5_gcd;

architecture Behavioral of lab5_gcd is
signal at0,ai0: std_logic_vector(3 downto 0):=a_i(3 downto 0);
signal at1,ai1: std_logic_vector(3 downto 0):=a_i(7 downto 4);
signal bt1,bi1: std_logic_vector(3 downto 0):=b_i(3 downto 0);
signal bt0,bi0: std_logic_vector(3 downto 0):=b_i(7 downto 4);
signal an0,an1,bn0,bn1: integer range 0 to 15;
signal op: std_logic_vector(15 downto 0);
signal slowclk,clock:std_logic;

--signal count: integer range 0 to 63:=0;

signal opvalid,loadt,subt,temp: std_logic;
constant ten:std_logic_vector(3 downto 0):="1010";
constant zero:std_logic_vector(3 downto 0):="0000";
begin
seven : ENTITY WORK.lab4_seven_segment
	port map (clk => clk,anode =>anode,cathode => cathode,b => op,pushbutton => pushbutton);
halfhzclk: Entity Work.Clock_Divider port map(clk,'0',slowclk);
clock <= (pushbutton and clk) or ((not pushbutton) and slowclk);
at0<= a_i(3 downto 0);
at1<= a_i(7 downto 4);
bt0<= b_i(3 downto 0);
bt1<= b_i(7 downto 4);
opvalid<='1' when (at0<ten and at1<ten and bt0<ten and bt1<ten and (at0>zero or at1>zero) and (bt0>zero or bt1>zero)) else '0';
------------------------------
--process(clk)
--begin
--if(clk'event and clk='1')then
--if( count<63) then
--count<=count+1;
--else count<=0;
--end if;
--end if;
--end process;
----------------------------
process(push_i,opvalid,loadt,subt,clock,an0,an1,bn0,bn1)
---variable count: integer range 0 to 256;

begin

if (push_i='1' and opvalid='1') then
loadt<='1';
subt<='0';
--ax0<=to_integer(unsigned(a_i(7 downto 4)));
--elsif(push_i='0' or opvalid='0') then
--loadt<='0';
--subt<='0';

end if;
	if(clock'event and clock='1') then
	op(15 downto 12) <= std_logic_vector(to_unsigned(bn1,4));
        op(11 downto 8) <= std_logic_vector(to_unsigned(bn0,4));
        op(7 downto 4) <= std_logic_vector(to_unsigned(an1,4));
        op(3 downto 0) <= std_logic_vector(to_unsigned(an0,4));
if loadt='1' then
an0<=to_integer(unsigned(at0));
an1<=to_integer(unsigned(at1));
bn0<=to_integer(unsigned(bt0));
bn1<=to_integer(unsigned(bt1));
loadt<='0';
subt<='1';
end if;

if(subt='1' and loadt='0') then

---if(clk'event and clk='1' and subt='1' and loadt='0') then
--if(count<5) then
if(an0=bn0 and an1=bn1) then
subt<='0';


------------
ELSIF an1 > bn1 or (an1 = bn1 and an0 > bn0) THEN
  --subt<='1';
	IF an0 >= bn0 THEN
	an0 <= an0 - bn0;
	an1 <= an1 - bn1;
			ELSE
			    	an0 <= 10 + an0 - bn0;
			    	an1 <= an1 -bn1-1;
			    END IF;	
		    ELSE
			 --subt<='1';
IF bn0 >= an0 THEN
bn0 <= bn0 - an0;
bn1 <= bn1 - an1;
			    ELSE
			    	bn0 <= 10 + bn0 - an0;
			    	bn1 <= bn1 -an1-1;
					end if;
-----------
end if;
end if;
end if;

end process;
--b<=s;
op_valid <= opvalid;
sub <= subt;
load <= loadt;
end Behavioral;

