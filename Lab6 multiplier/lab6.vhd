----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:52:42 04/01/2019 
-- Design Name: 
-- Module Name:    lab6 - Behavioral 
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
-------------------------------------------------------------------------------
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
		binary <= b(3 downto 0);
	when "01" =>
		anode <= "1011";
		binary <= b(7 downto 4);
	when "10" =>
		anode <= "1101";
		binary <= b(11 downto 8);
	when "11" =>
		anode <= "1110";
		binary <= b(15 downto 12);
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
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-------------------------------------------------------
entity full_adder is
port (
a:in std_logic;
b: in std_logic;
cin:in std_logic;
sum:out std_logic;
cout:out std_logic
); 											--------------@SHREYANSHU KUMAR IIT JAMMU
end full_adder;

architecture Behavioral of full_adder is

begin

sum<=(a xor b) xor cin;
cout<= ((a xor b) and cin) or (a and b);
end Behavioral;
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity bitadder8 is 
port(
a:in std_logic_vector(7 downto 0);
b:in std_logic_vector(7 downto 0);
cin:in std_logic;
sum:out std_logic_vector(7 downto 0);
carry:out std_logic
);
end bitadder8;
architecture Behavioral of bitadder8 is
signal s0,s1,s2,s3,s4,s5,s6,s7,c0,c1,c2,c3,c4,c5,c6,c7:std_logic;

begin
bit0 : ENTITY WORK.full_adder
	port map (a => a(0),b =>b(0),cin => cin,sum => sum(0), cout=> c0);
	
bit1 : ENTITY WORK.full_adder
	port map (a => a(1),b =>b(1),cin => c0,sum => sum(1), cout=> c1);

bit2 : ENTITY WORK.full_adder
	port map (a => a(2),b =>b(2),cin => c1,sum => sum(2), cout=> c2);

bit3 : ENTITY WORK.full_adder
	port map (a => a(3),b =>b(3),cin => c2,sum => sum(3), cout=> c3);

bit4 : ENTITY WORK.full_adder
	port map (a => a(4),b =>b(4),cin => c3,sum => sum(4), cout=> c4);

bit5 : ENTITY WORK.full_adder
	port map (a => a(5),b =>b(5),cin => c4,sum => sum(5), cout=> c5);

bit6 : ENTITY WORK.full_adder
	port map (a => a(6),b =>b(6),cin => c5,sum => sum(6), cout=> c6);
	
bit7 : ENTITY WORK.full_adder
	port map (a => a(7),b =>b(7),cin => c6,sum => sum(7), cout=> carry);


end Behavioral;
------------------------------------------------------Making CArry look ahead adder @SHREYANSHU KUMAR
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--entity bitadder8_carrylookahead is 
--port(
--a:in std_logic_vector(7 downto 0);
--b:in std_logic_vector(7 downto 0);
--cin:in std_logic;
--sum:out std_logic_vector(7 downto 0);
--carry:out std_logic
--);
--end bitadder8_carrylookahead;
--architecture Behavioral of bitadder8_carrylookahead is
----signal s0,s1,s2,s3,s4,s5,s6,s7,c0,c1,c2,c3,c4,c5,c6,c7:std_logic;
--signal c1,c2,c3,c4,c5,c6,c7:std_logic;
--signal P,G:std_logic(7 downto 0);
--begin
--bit0 : ENTITY WORK.full_adder
--	port map (a => a(0),b =>b(0),cin => cin,sum => sum(0), cout=> c0);
--	
--bit1 : ENTITY WORK.full_adder
--	port map (a => a(1),b =>b(1),cin => c0,sum => sum(1), cout=> c1);
--
--bit2 : ENTITY WORK.full_adder
--	port map (a => a(2),b =>b(2),cin => c1,sum => sum(2), cout=> c2);
--
--bit3 : ENTITY WORK.full_adder
--	port map (a => a(3),b =>b(3),cin => c2,sum => sum(3), cout=> c3);
--
--bit4 : ENTITY WORK.full_adder
--	port map (a => a(4),b =>b(4),cin => c3,sum => sum(4), cout=> c4);
--
--bit5 : ENTITY WORK.full_adder
--	port map (a => a(5),b =>b(5),cin => c4,sum => sum(5), cout=> c5);
--
--bit6 : ENTITY WORK.full_adder
--	port map (a => a(6),b =>b(6),cin => c5,sum => sum(6), cout=> c6);
--	
--bit7 : ENTITY WORK.full_adder
--	port map (a => a(7),b =>b(7),cin => c6,sum => sum(7), cout=> carry);
--
--
--end Behavioral;
--------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity multiplier1 is 
port(
a:in std_logic_vector(7 downto 0);
b:in std_logic_vector(7 downto 0);
mult:out std_logic_vector(15 downto 0)
);
end multiplier1;
architecture Behavioral of multiplier1 is
signal s00,s01,s02,s03,s04,s05,s06,s07,b00,b01,b02,b03,b04,b05,b06,b07,s10,s11,s12,s13,s14,s15,s16,s17:std_logic_vector(7 downto 0);
signal c00:std_logic_vector(7 downto 0);
begin
---stage1_0 : ENTITY WORK.full_adder
	--port map (a => a(0),b =>'0',cin => '0',sum => s00, cout=> c00);
	
---stage1_0 : ENTITY WORK.full_adder
	--port map (a => a(0),b =>'0',cin => '0',sum => s00, cout=> c00);
	
	----and operations
s00(0)<=a(0) and b(0);
s00(1)<=a(1) and b(0);
s00(2)<=a(2) and b(0);
s00(3)<=a(3) and b(0);
s00(4)<=a(4) and b(0);
s00(5)<=a(5) and b(0);
s00(6)<=a(6) and b(0);
s00(7)<=a(7) and b(0);
b00(6 downto 0)<=s00(7 downto 1);
b00(7)<='0';
---shift1
s01(0)<=a(0) and b(1);
s01(1)<=a(1) and b(1);
s01(2)<=a(2) and b(1);
s01(3)<=a(3) and b(1);
s01(4)<=a(4) and b(1);
s01(5)<=a(5) and b(1);
s01(6)<=a(6) and b(1);
s01(7)<=a(7) and b(1);
----shift2
s02(0)<=a(0) and b(2);
s02(1)<=a(1) and b(2);
s02(2)<=a(2) and b(2);
s02(3)<=a(3) and b(2);
s02(4)<=a(4) and b(2);
s02(5)<=a(5) and b(2);
s02(6)<=a(6) and b(2);
s02(7)<=a(7) and b(2);
----shift3
s03(0)<=a(0) and b(3);
s03(1)<=a(1) and b(3);
s03(2)<=a(2) and b(3);
s03(3)<=a(3) and b(3);
s03(4)<=a(4) and b(3);
s03(5)<=a(5) and b(3);
s03(6)<=a(6) and b(3);
s03(7)<=a(7) and b(3);
----shift4
s04(0)<=a(0) and b(4);
s04(1)<=a(1) and b(4);
s04(2)<=a(2) and b(4);
s04(3)<=a(3) and b(4);
s04(4)<=a(4) and b(4);
s04(5)<=a(5) and b(4);
s04(6)<=a(6) and b(4);
s04(7)<=a(7) and b(4);
----shift5
s05(0)<=a(0) and b(5);
s05(1)<=a(1) and b(5);
s05(2)<=a(2) and b(5);
s05(3)<=a(3) and b(5);
s05(4)<=a(4) and b(5);
s05(5)<=a(5) and b(5);
s05(6)<=a(6) and b(5);
s05(7)<=a(7) and b(5);
----shift6
s06(0)<=a(0) and b(6);
s06(1)<=a(1) and b(6);
s06(2)<=a(2) and b(6);
s06(3)<=a(3) and b(6);
s06(4)<=a(4) and b(6);
s06(5)<=a(5) and b(6);
s06(6)<=a(6) and b(6);
s06(7)<=a(7) and b(6);
----shift7
s07(0)<=a(0) and b(7);
s07(1)<=a(1) and b(7);
s07(2)<=a(2) and b(7);
s07(3)<=a(3) and b(7);
s07(4)<=a(4) and b(7);
s07(5)<=a(5) and b(7);
s07(6)<=a(6) and b(7);
s07(7)<=a(7) and b(7);
--shift ends
-------addition begins stage 1   @SHREYANSHU KUMAR IIT JAMMU
stage0 : ENTITY WORK.bitadder8
	port map (a => s01,b =>b00,cin => '0',sum =>s10 , carry=> c00(0));
	mult(0)<=s00(0);
	mult(1)<=s10(0);
	b01(6 downto 0)<=s10(7 downto 1);
	b01(7)<=c00(0);
	-----stage2
	stage2 : ENTITY WORK.bitadder8
	port map (a => s02,b =>b01,cin => '0',sum =>s11 , carry=> c00(1));
	
	mult(2)<=s11(0);
	b02(6 downto 0)<=s11(7 downto 1);
	b02(7)<=c00(1);
	-----stage3
	stage3 : ENTITY WORK.bitadder8
	port map (a => s03,b =>b02,cin => '0',sum =>s12 , carry=> c00(2));
	
	mult(3)<=s12(0);
	b03(6 downto 0)<=s12(7 downto 1);
	b03(7)<=c00(2);
	---------stage4
	stage4 : ENTITY WORK.bitadder8
	port map (a => s04,b =>b03,cin => '0',sum =>s13 , carry=> c00(3));
	
	mult(4)<=s13(0);
	b04(6 downto 0)<=s13(7 downto 1);
	b04(7)<=c00(3);
	---------stage5
	stage5 : ENTITY WORK.bitadder8
	port map (a => s05,b =>b04,cin => '0',sum =>s14 , carry=> c00(4));
	
	mult(5)<=s14(0);
	b05(6 downto 0)<=s14(7 downto 1);
	b05(7)<=c00(4);
	--------stage6
	stage6 : ENTITY WORK.bitadder8
	port map (a => s06,b =>b05,cin => '0',sum =>s15 , carry=> c00(5));
	
	mult(6)<=s15(0);
	b06(6 downto 0)<=s15(7 downto 1);
	b06(7)<=c00(5);
	----------stage 7
	stage7 : ENTITY WORK.bitadder8
	port map (a => s07,b =>b06,cin => '0',sum =>s16 , carry=> c00(6));
	
	mult(14 downto 7)<=s16(7 downto 0);
	mult(15)<=c00(6);
	--b07(6 downto 0)<=s16(7 downto 1);
	--b07(7)<=c00(6);



end Behavioral;
----------------------------------------------------multiplier2
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wallacetree is
port(
ai:in std_logic_vector(7 downto 0);
bi:in std_logic_vector(7 downto 0);
ci:out std_logic_vector(15 downto 0)

);
end wallacetree;

architecture Behavioral of wallacetree is
signal p0,p1,p2,p3,p4,p5,p6,p7,c1,c2,s3,c3,c4,c5:std_logic_vector(7 downto 0);
signal s1,s2,s5,c6:std_logic_vector(9 downto 0);
signal s4:std_logic_vector(12 downto 0);
signal s6,s7:std_logic_vector(14 downto 0);
signal c7:std_logic_vector(10 downto 0);
signal anew,bnew:std_logic_vector(15 downto 0);
signal cn1,cn2:std_logic;
begin
process(ai,bi)
begin
for i in 0 to 7 loop
p0(i)<=ai(i) and bi(0);
p1(i)<=ai(i) and bi(1);
p2(i)<=ai(i) and bi(2);
p3(i)<=ai(i) and bi(3);
p4(i)<=ai(i) and bi(4);
p5(i)<=ai(i) and bi(5);
p6(i)<=ai(i) and bi(6);
p7(i)<=ai(i) and bi(7);
end loop;
end process;
-----------p0,p1,p2 sum and carry calculation
process(p0,p1,p2)
begin 
s1(0)<=p0(0);
s1(1)<=p0(1) xor p1(0);
c1(0)<=p0(1) and  p1(0);

for i in 2 to 7 loop
s1(i)<=(p0(i) XOR p1(i-1)) XOR p2(i-2);
c1(i-1)<=(p0(i) AND p1(i-1)) OR (p2(i-2)and (p0(i) XOR p1(i-1)));
end loop;
s1(8)<=p1(7) xor p2(6);
s1(9)<= p2(7);
c1(7)<=p1(7) and  p2(6);
end process;
---------------p3,p4,p5 sum and carry calculation
process(p3,p4,p5)
begin 
s2(0)<=p3(0);
s2(1)<=p3(1) xor p4(0);
c2(0)<=p3(1) and  p4(0);

for i in 2 to 7 loop
s2(i)<=(p3(i) XOR p4(i-1)) XOR p5(i-2);
c2(i-1)<=(p3(i) AND p4(i-1)) OR (p5(i-2)and (p3(i) XOR p4(i-1)));
end loop;
s2(8)<=p4(7) xor p5(6);
s2(9)<= p5(7);
c2(7)<=p4(7) and  p5(6);
end process;
----------------------------s3 and c3 same as p6 and p7 respectively
process(p6,p7)
begin 
s3<=p6;
c3<=p7;
end process;
----------------------calculating s4 and c4
process(s1,c1,s2)
begin
s4(1 downto 0)<= s1(1 downto 0);
s4(2)<=s1(2) xor c1(0);
c4(0)<=s1(2) and c1(0);
for i in 3 to 9 loop
s4(i)<=(s1(i) XOR c1(i-2)) XOR s2(i-3);
c4(i-2)<=(s1(i) AND c1(i-2)) OR (s2(i-3)and (s1(i) XOR c1(i-2)));
end loop;
s4(12 downto 10)<=s2(9 downto 7);
end process;
------------------------calculating s5 and c5
process(c2,s3,c3)
begin 
s5(0)<=c2(0);
s5(1)<=c2(1) xor s3(0);
c5(0)<=c2(1) and  s3(0);

for i in 2 to 7 loop
s5(i)<=(c2(i) XOR s3(i-1)) XOR c3(i-2);
c5(i-1)<=(c2(i) AND s3(i-1)) OR (c3(i-2)and (c2(i) XOR s3(i-1)));
end loop;
s5(8)<=s3(7) xor c3(6);
s5(9)<= c3(7);
c5(7)<=s3(7) and  c3(6);
end process;
----------------------------------- now calculating s6 and c6
process(s4,c4,s5)
begin
s6(2 downto 0)<= s4(2 downto 0);
s6(3)<=s4(3) xor c4(0);
c6(0)<=s4(3) and c4(0);
s6(4)<=s4(4) xor c4(1);
c6(1)<=s4(4) and c4(1);
for i in 5 to 10 loop
s6(i)<=(s4(i) XOR c4(i-3)) XOR s5(i-5);
c6(i-3)<=(s4(i) AND c4(i-3)) OR (s5(i-5)and (s4(i) XOR c4(i-3)));
end loop;
s6(11)<=s4(11) xor s5(6);
c6(8)<=s4(11) and  s5(6);
s6(12)<=s4(12) xor s5(7);
c6(9)<=s4(12) and  s5(7);
s6(14 downto 13)<= s5(9 downto 8);
end process;
-----------calculating s7 and c7
process(s6,c6,c5)
begin
s7(3 downto 0)<= s6(3 downto 0);
for i in 4 to 6 loop
s7(i)<=s6(i) xor c6(i-4);
c7(i-4)<=s6(i) and c6(i-4);
end loop;
for i in 7 to 13 loop
s7(i)<=(s6(i) XOR c6(i-4)) XOR c5(i-7);
c7(i-4)<=(s6(i) AND c6(i-4)) OR (c5(i-7)and (s6(i) XOR c6(i-4)));
end loop;
s7(14)<=s6(14) xor c5(7);
c7(10)<=s6(14) and c5(7);
end process;
anew(14 downto 0)<=s7(14 downto 0);
anew(15)<='0';
bnew(4 downto 0)<="00000";
bnew(15 downto 5)<=c7(10 downto 0);
bit0to7 : ENTITY WORK.bitadder8
	port map (a => anew(7 downto 0),b =>bnew(7 downto 0),cin => '0',sum => ci(7 downto 0), carry=> cn1);
bit8to15 : ENTITY WORK.bitadder8
	port map (a => anew(15 downto 8),b =>bnew(15 downto 8),cin => cn1,sum => ci(15 downto 8), carry=> cn2);
end Behavioral;
----------------------------------------------------------------------------------------multiplier3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Partial_Full_Adder is
Port ( A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
S : out STD_LOGIC;
P : out STD_LOGIC;
G : out STD_LOGIC);
end Partial_Full_Adder;

architecture Behavioral of Partial_Full_Adder is

begin

S <= A xor B xor Cin;
P <= A xor B;
G <= A and B;

end Behavioral;
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Look_Ahead is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
B : in STD_LOGIC_VECTOR (3 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (3 downto 0);
Cout : out STD_LOGIC);
end Carry_Look_Ahead;

architecture Behavioral of Carry_Look_Ahead is

component Partial_Full_Adder
Port ( A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
S : out STD_LOGIC;
P : out STD_LOGIC;
G : out STD_LOGIC);
end component;

signal c1,c2,c3: STD_LOGIC;
signal P,G: STD_LOGIC_VECTOR(3 downto 0);
begin

PFA1: Partial_Full_Adder port map( A(0), B(0), Cin, S(0), P(0), G(0));
PFA2: Partial_Full_Adder port map( A(1), B(1), c1, S(1), P(1), G(1));
PFA3: Partial_Full_Adder port map( A(2), B(2), c2, S(2), P(2), G(2));
PFA4: Partial_Full_Adder port map( A(3), B(3), c3, S(3), P(3), G(3));

c1 <= G(0) OR (P(0) AND Cin);
c2 <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
c3 <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin);
Cout <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND Cin);

end Behavioral;
-------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier3 is
port(
ai:in std_logic_vector(7 downto 0);
bi:in std_logic_vector(7 downto 0);
ci:out std_logic_vector(15 downto 0)

);
end multiplier3;

architecture Behavioral of multiplier3 is
signal p0,p1,p2,p3,p4,p5,p6,p7,c1,c2,s3,c3,c4,c5:std_logic_vector(7 downto 0);
signal s1,s2,s5,c6:std_logic_vector(9 downto 0);
signal s4:std_logic_vector(12 downto 0);
signal s6,s7:std_logic_vector(14 downto 0);
signal c7:std_logic_vector(10 downto 0);
signal anew,bnew:std_logic_vector(15 downto 0);
signal cn1,cn2,cn3,cn4:std_logic;
begin
process(ai,bi)
begin
for i in 0 to 7 loop
p0(i)<=ai(i) and bi(0);
p1(i)<=ai(i) and bi(1);
p2(i)<=ai(i) and bi(2);
p3(i)<=ai(i) and bi(3);
p4(i)<=ai(i) and bi(4);
p5(i)<=ai(i) and bi(5);
p6(i)<=ai(i) and bi(6);
p7(i)<=ai(i) and bi(7);
end loop;
end process;
-----------p0,p1,p2 sum and carry calculation
process(p0,p1,p2)
begin 
s1(0)<=p0(0);
s1(1)<=p0(1) xor p1(0);
c1(0)<=p0(1) and  p1(0);

for i in 2 to 7 loop
s1(i)<=(p0(i) XOR p1(i-1)) XOR p2(i-2);
c1(i-1)<=(p0(i) AND p1(i-1)) OR (p2(i-2)and (p0(i) XOR p1(i-1)));
end loop;
s1(8)<=p1(7) xor p2(6);
s1(9)<= p2(7);
c1(7)<=p1(7) and  p2(6);
end process;
---------------p3,p4,p5 sum and carry calculation
process(p3,p4,p5)
begin 
s2(0)<=p3(0);
s2(1)<=p3(1) xor p4(0);
c2(0)<=p3(1) and  p4(0);

for i in 2 to 7 loop
s2(i)<=(p3(i) XOR p4(i-1)) XOR p5(i-2);
c2(i-1)<=(p3(i) AND p4(i-1)) OR (p5(i-2)and (p3(i) XOR p4(i-1)));
end loop;
s2(8)<=p4(7) xor p5(6);
s2(9)<= p5(7);
c2(7)<=p4(7) and  p5(6);
end process;
----------------------------s3 and c3 same as p6 and p7 respectively
process(p6,p7)
begin 
s3<=p6;
c3<=p7;
end process;
----------------------calculating s4 and c4
process(s1,c1,s2)
begin
s4(1 downto 0)<= s1(1 downto 0);
s4(2)<=s1(2) xor c1(0);
c4(0)<=s1(2) and c1(0);
for i in 3 to 9 loop
s4(i)<=(s1(i) XOR c1(i-2)) XOR s2(i-3);
c4(i-2)<=(s1(i) AND c1(i-2)) OR (s2(i-3)and (s1(i) XOR c1(i-2)));
end loop;
s4(12 downto 10)<=s2(9 downto 7);
end process;
------------------------calculating s5 and c5
process(c2,s3,c3)
begin 
s5(0)<=c2(0);
s5(1)<=c2(1) xor s3(0);
c5(0)<=c2(1) and  s3(0);

for i in 2 to 7 loop
s5(i)<=(c2(i) XOR s3(i-1)) XOR c3(i-2);
c5(i-1)<=(c2(i) AND s3(i-1)) OR (c3(i-2)and (c2(i) XOR s3(i-1)));
end loop;
s5(8)<=s3(7) xor c3(6);
s5(9)<= c3(7);
c5(7)<=s3(7) and  c3(6);
end process;
----------------------------------- now calculating s6 and c6
process(s4,c4,s5)
begin
s6(2 downto 0)<= s4(2 downto 0);
s6(3)<=s4(3) xor c4(0);
c6(0)<=s4(3) and c4(0);
s6(4)<=s4(4) xor c4(1);
c6(1)<=s4(4) and c4(1);
for i in 5 to 10 loop
s6(i)<=(s4(i) XOR c4(i-3)) XOR s5(i-5);
c6(i-3)<=(s4(i) AND c4(i-3)) OR (s5(i-5)and (s4(i) XOR c4(i-3)));
end loop;
s6(11)<=s4(11) xor s5(6);
c6(8)<=s4(11) and  s5(6);
s6(12)<=s4(12) xor s5(7);
c6(9)<=s4(12) and  s5(7);
s6(14 downto 13)<= s5(9 downto 8);
end process;
-----------calculating s7 and c7
process(s6,c6,c5)
begin
s7(3 downto 0)<= s6(3 downto 0);
for i in 4 to 6 loop
s7(i)<=s6(i) xor c6(i-4);
c7(i-4)<=s6(i) and c6(i-4);
end loop;
for i in 7 to 13 loop
s7(i)<=(s6(i) XOR c6(i-4)) XOR c5(i-7);
c7(i-4)<=(s6(i) AND c6(i-4)) OR (c5(i-7)and (s6(i) XOR c6(i-4)));
end loop;
s7(14)<=s6(14) xor c5(7);
c7(10)<=s6(14) and c5(7);
end process;
anew(14 downto 0)<=s7(14 downto 0);
anew(15)<='0';
bnew(4 downto 0)<="00000";
bnew(15 downto 5)<=c7(10 downto 0);

bit0to3 : ENTITY WORK.Carry_Look_Ahead
	port map (A => anew(3 downto 0),B =>bnew(3 downto 0),Cin => '0',S => ci(3 downto 0), Cout=> cn1);
bit4to7 : ENTITY WORK.Carry_Look_Ahead
	port map (A => anew(7 downto 4),B =>bnew(7 downto 4),Cin => cn1,S => ci(7 downto 4), Cout=> cn2);

bit8to11 : ENTITY WORK.Carry_Look_Ahead
	port map (A => anew(11 downto 8),B =>bnew(11 downto 8),Cin => cn2,S => ci(11 downto 8), Cout=> cn3);
	
bit12to15 : ENTITY WORK.Carry_Look_Ahead
	port map (A => anew(15 downto 12),B =>bnew(15 downto 12),cin => cn3,S => ci(15 downto 12), Cout=> cn4);


--bit0to7 : ENTITY WORK.bitadder8
--	port map (a => anew(7 downto 0),b =>bnew(7 downto 0),cin => '0',sum => ci(7 downto 0), carry=> cn1);
--bit8to15 : ENTITY WORK.bitadder8
--	port map (a => anew(15 downto 8),b =>bnew(15 downto 8),cin => cn1,sum => ci(15 downto 8), carry=> cn2);
end Behavioral;
------------------------------------------------------------------making top level module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab6_multiplier is
port(
in1:in std_logic_vector(7 downto 0);
in2:in std_logic_vector(7 downto 0);
clk,display_button: in std_logic;
multiplier_select: in std_logic_vector(1 downto 0);
anode:out std_logic_vector(3 downto 0);
cathode:out std_logic_vector(6 downto 0);
product:out std_logic_vector(15 downto 0)

);
end lab6_multiplier;
architecture abc of lab6_multiplier is

signal prod1,prod2,prod3,prod:std_logic_vector(15 downto 0);
begin
segment : ENTITY WORK.lab4_seven_segment
	port map (b => prod,clk =>clk,pushbutton=>display_button,cathode=>cathode,anode=>anode);
mult1 : ENTITY WORK.multiplier1
	port map (a => in1,b =>in2,mult=>prod1);
mult2 : ENTITY WORK.wallacetree
	port map (ai => in1,bi =>in2,ci=>prod2);
mult3 : ENTITY WORK.multiplier3
	port map (ai => in1,bi =>in2,ci=>prod3);
process(multiplier_select,prod1,prod2,prod3)
begin
case multiplier_select is
when "00"=>
prod<=prod1;
when "01"=>
prod<=prod2;
when "10"=>
prod<=prod3;
when others =>
prod<=x"0000";
end case;
end process;
product<=prod;
end abc;

