--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab_4_seven_segment_display.vhf
-- /___/   /\     Timestamp : 03/10/2019 20:15:49
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl D:/temporary/lab4_7_segment/lab_4_seven_segment_display.vhf -w D:/temporary/lab4_7_segment/lab_4_seven_segment_display.sch
--Design Name: lab_4_seven_segment_display
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL FTP_HXILINX_lab_4_seven_segment_display -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTP_HXILINX_lab_4_seven_segment_display is
generic(
    INIT : bit := '1'
    );

  port (
    Q   : out STD_LOGIC := '1';
    C   : in STD_LOGIC;
    PRE : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTP_HXILINX_lab_4_seven_segment_display;

architecture Behavioral of FTP_HXILINX_lab_4_seven_segment_display is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, PRE)
begin
  if (PRE='1') then
    q_tmp <= '1';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;

----- CELL M4_1E_HXILINX_lab_4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_lab_4_seven_segment_display is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_lab_4_seven_segment_display;

architecture M4_1E_HXILINX_lab_4_seven_segment_display_V of M4_1E_HXILINX_lab_4_seven_segment_display is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process; 
end M4_1E_HXILINX_lab_4_seven_segment_display_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab_4_MUSER_lab_4_seven_segment_display is
   port ( b0 : in    std_logic; 
          b1 : in    std_logic; 
          b2 : in    std_logic; 
          b3 : in    std_logic; 
          A  : out   std_logic; 
          B  : out   std_logic; 
          C  : out   std_logic; 
          D  : out   std_logic; 
          E  : out   std_logic; 
          F  : out   std_logic; 
          G  : out   std_logic);
end lab_4_MUSER_lab_4_seven_segment_display;

architecture BEHAVIORAL of lab_4_MUSER_lab_4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_9   : std_logic;
   signal XLXN_16  : std_logic;
   signal XLXN_17  : std_logic;
   signal XLXN_18  : std_logic;
   signal XLXN_19  : std_logic;
   signal XLXN_22  : std_logic;
   signal XLXN_27  : std_logic;
   signal XLXN_34  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_36  : std_logic;
   signal XLXN_55  : std_logic;
   signal XLXN_56  : std_logic;
   signal XLXN_57  : std_logic;
   signal XLXN_58  : std_logic;
   signal XLXN_65  : std_logic;
   signal XLXN_66  : std_logic;
   signal XLXN_67  : std_logic;
   signal XLXN_83  : std_logic;
   signal XLXN_84  : std_logic;
   signal XLXN_85  : std_logic;
   signal XLXN_93  : std_logic;
   signal XLXN_104 : std_logic;
   signal XLXN_107 : std_logic;
   signal XLXN_117 : std_logic;
   signal XLXN_119 : std_logic;
   signal XLXN_123 : std_logic;
   signal XLXN_124 : std_logic;
   signal XLXN_126 : std_logic;
   signal XLXN_127 : std_logic;
   signal XLXN_132 : std_logic;
   signal XLXN_133 : std_logic;
   signal XLXN_138 : std_logic;
   signal XLXN_139 : std_logic;
   signal XLXN_141 : std_logic;
   signal XLXN_142 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
begin
   XLXI_2 : INV
      port map (I=>b2,
                O=>XLXN_55);
   
   XLXI_3 : INV
      port map (I=>b0,
                O=>XLXN_127);
   
   XLXI_5 : AND2
      port map (I0=>XLXN_117,
                I1=>XLXN_104,
                O=>XLXN_119);
   
   XLXI_6 : OR2
      port map (I0=>XLXN_19,
                I1=>XLXN_18,
                O=>A);
   
   XLXI_7 : XOR2
      port map (I0=>b0,
                I1=>b2,
                O=>XLXN_9);
   
   XLXI_8 : AND2
      port map (I0=>XLXN_119,
                I1=>XLXN_9,
                O=>XLXN_18);
   
   XLXI_9 : AND2
      port map (I0=>b0,
                I1=>b3,
                O=>XLXN_17);
   
   XLXI_10 : XOR2
      port map (I0=>b1,
                I1=>b2,
                O=>XLXN_16);
   
   XLXI_11 : AND2
      port map (I0=>XLXN_17,
                I1=>XLXN_16,
                O=>XLXN_19);
   
   XLXI_12 : OR2
      port map (I0=>b0,
                I1=>b2,
                O=>XLXN_22);
   
   XLXI_13 : AND3
      port map (I0=>b1,
                I1=>XLXN_22,
                I2=>b3,
                O=>XLXN_36);
   
   XLXI_14 : AND3
      port map (I0=>XLXN_127,
                I1=>b1,
                I2=>b2,
                O=>XLXN_35);
   
   XLXI_15 : XOR2
      port map (I0=>b0,
                I1=>b3,
                O=>XLXN_27);
   
   XLXI_16 : AND3
      port map (I0=>XLXN_117,
                I1=>b2,
                I2=>XLXN_27,
                O=>XLXN_34);
   
   XLXI_17 : OR3
      port map (I0=>XLXN_34,
                I1=>XLXN_36,
                I2=>XLXN_35,
                O=>B);
   
   XLXI_18 : AND3
      port map (I0=>b1,
                I1=>b2,
                I2=>b3,
                O=>XLXN_132);
   
   XLXI_21 : OR2
      port map (I0=>XLXN_124,
                I1=>XLXN_123,
                O=>XLXN_126);
   
   XLXI_22 : AND3
      port map (I0=>XLXN_117,
                I1=>XLXN_104,
                I2=>XLXN_9,
                O=>XLXN_58);
   
   XLXI_23 : AND3
      port map (I0=>b2,
                I1=>b0,
                I2=>b1,
                O=>XLXN_57);
   
   XLXI_24 : AND4
      port map (I0=>XLXN_55,
                I1=>XLXN_127,
                I2=>b3,
                I3=>b1,
                O=>XLXN_56);
   
   XLXI_25 : OR3
      port map (I0=>XLXN_56,
                I1=>XLXN_57,
                I2=>XLXN_58,
                O=>D);
   
   XLXI_26 : AND3
      port map (I0=>XLXN_104,
                I1=>XLXN_117,
                I2=>b2,
                O=>XLXN_66);
   
   XLXI_27 : AND2
      port map (I0=>XLXN_104,
                I1=>b0,
                O=>XLXN_67);
   
   XLXI_28 : AND4
      port map (I0=>XLXN_117,
                I1=>XLXN_55,
                I2=>b3,
                I3=>b0,
                O=>XLXN_65);
   
   XLXI_29 : OR3
      port map (I0=>XLXN_66,
                I1=>XLXN_65,
                I2=>XLXN_67,
                O=>E);
   
   XLXI_30 : OR2
      port map (I0=>b1,
                I1=>b0,
                O=>XLXN_107);
   
   XLXI_31 : AND3
      port map (I0=>XLXN_55,
                I1=>XLXN_107,
                I2=>XLXN_104,
                O=>XLXN_83);
   
   XLXI_32 : AND3
      port map (I0=>b1,
                I1=>XLXN_104,
                I2=>b0,
                O=>XLXN_84);
   
   XLXI_33 : AND4
      port map (I0=>XLXN_117,
                I1=>b2,
                I2=>b3,
                I3=>b0,
                O=>XLXN_85);
   
   XLXI_34 : OR3
      port map (I0=>XLXN_83,
                I1=>XLXN_84,
                I2=>XLXN_85,
                O=>F);
   
   XLXI_35 : AND3
      port map (I0=>XLXN_117,
                I1=>XLXN_55,
                I2=>XLXN_104,
                O=>XLXN_93);
   
   XLXI_39 : OR2
      port map (I0=>XLXN_93,
                I1=>XLXN_142,
                O=>G);
   
   XLXI_41 : INV
      port map (I=>b3,
                O=>XLXN_104);
   
   XLXI_42 : INV
      port map (I=>b1,
                O=>XLXN_117);
   
   XLXI_46 : AND3
      port map (I0=>XLXN_117,
                I1=>b2,
                I2=>b3,
                O=>XLXN_124);
   
   XLXI_47 : AND3
      port map (I0=>b1,
                I1=>XLXN_55,
                I2=>XLXN_104,
                O=>XLXN_123);
   
   XLXI_48 : AND2
      port map (I0=>XLXN_127,
                I1=>XLXN_126,
                O=>XLXN_133);
   
   XLXI_49 : OR2
      port map (I0=>XLXN_132,
                I1=>XLXN_133,
                O=>C);
   
   XLXI_50 : AND3
      port map (I0=>b0,
                I1=>b1,
                I2=>XLXN_104,
                O=>XLXN_139);
   
   XLXI_51 : AND3
      port map (I0=>b3,
                I1=>XLXN_127,
                I2=>XLXN_117,
                O=>XLXN_138);
   
   XLXI_52 : OR2
      port map (I0=>XLXN_139,
                I1=>XLXN_138,
                O=>XLXN_141);
   
   XLXI_53 : AND2
      port map (I0=>XLXN_141,
                I1=>b2,
                O=>XLXN_142);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity main_counter_MUSER_lab_4_seven_segment_display is
   port ( clck : in    std_logic; 
          q0   : out   std_logic; 
          q1   : out   std_logic; 
          q2   : out   std_logic; 
          q3   : out   std_logic; 
          q4   : out   std_logic; 
          q5   : out   std_logic; 
          q6   : out   std_logic; 
          q7   : out   std_logic; 
          q8   : out   std_logic; 
          q9   : out   std_logic; 
          q10  : out   std_logic; 
          q11  : out   std_logic; 
          q12  : out   std_logic; 
          q13  : out   std_logic; 
          q14  : out   std_logic; 
          q15  : out   std_logic);
end main_counter_MUSER_lab_4_seven_segment_display;

architecture BEHAVIORAL of main_counter_MUSER_lab_4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal T                       : std_logic;
   signal t_out                   : std_logic;
   signal XLXN_20                 : std_logic;
   signal XLXN_27                 : std_logic;
   signal XLXN_189                : std_logic;
   signal XLXN_196                : std_logic;
   signal XLXN_198                : std_logic;
   signal XLXN_204                : std_logic;
   signal XLXN_211                : std_logic;
   signal XLXN_213                : std_logic;
   signal XLXN_219                : std_logic;
   signal XLXN_221                : std_logic;
   signal XLXN_227                : std_logic;
   signal XLXN_231                : std_logic;
   signal XLXN_232                : std_logic;
   signal q10_DUMMY               : std_logic;
   signal q11_DUMMY               : std_logic;
   signal q12_DUMMY               : std_logic;
   signal q13_DUMMY               : std_logic;
   signal q14_DUMMY               : std_logic;
   signal q15_DUMMY               : std_logic;
   signal q0_DUMMY                : std_logic;
   signal q1_DUMMY                : std_logic;
   signal q2_DUMMY                : std_logic;
   signal q3_DUMMY                : std_logic;
   signal q4_DUMMY                : std_logic;
   signal q5_DUMMY                : std_logic;
   signal q6_DUMMY                : std_logic;
   signal q7_DUMMY                : std_logic;
   signal q8_DUMMY                : std_logic;
   signal q9_DUMMY                : std_logic;
   signal XLXI_2_PRE_openSignal   : std_logic;
   signal XLXI_3_PRE_openSignal   : std_logic;
   signal XLXI_4_PRE_openSignal   : std_logic;
   signal XLXI_5_PRE_openSignal   : std_logic;
   signal XLXI_84_PRE_openSignal  : std_logic;
   signal XLXI_85_PRE_openSignal  : std_logic;
   signal XLXI_86_PRE_openSignal  : std_logic;
   signal XLXI_87_PRE_openSignal  : std_logic;
   signal XLXI_91_PRE_openSignal  : std_logic;
   signal XLXI_92_PRE_openSignal  : std_logic;
   signal XLXI_93_PRE_openSignal  : std_logic;
   signal XLXI_94_PRE_openSignal  : std_logic;
   signal XLXI_98_PRE_openSignal  : std_logic;
   signal XLXI_99_PRE_openSignal  : std_logic;
   signal XLXI_100_PRE_openSignal : std_logic;
   signal XLXI_101_PRE_openSignal : std_logic;
   component FTP_HXILINX_lab_4_seven_segment_display
      generic( INIT : bit :=  '1');
      port ( C   : in    std_logic; 
             PRE : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_27";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_26";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_25";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_24";
   attribute HU_SET of XLXI_84 : label is "XLXI_84_28";
   attribute HU_SET of XLXI_85 : label is "XLXI_85_29";
   attribute HU_SET of XLXI_86 : label is "XLXI_86_30";
   attribute HU_SET of XLXI_87 : label is "XLXI_87_31";
   attribute HU_SET of XLXI_91 : label is "XLXI_91_32";
   attribute HU_SET of XLXI_92 : label is "XLXI_92_33";
   attribute HU_SET of XLXI_93 : label is "XLXI_93_34";
   attribute HU_SET of XLXI_94 : label is "XLXI_94_35";
   attribute HU_SET of XLXI_98 : label is "XLXI_98_36";
   attribute HU_SET of XLXI_99 : label is "XLXI_99_37";
   attribute HU_SET of XLXI_100 : label is "XLXI_100_38";
   attribute HU_SET of XLXI_101 : label is "XLXI_101_39";
begin
   q0 <= q0_DUMMY;
   q1 <= q1_DUMMY;
   q2 <= q2_DUMMY;
   q3 <= q3_DUMMY;
   q4 <= q4_DUMMY;
   q5 <= q5_DUMMY;
   q6 <= q6_DUMMY;
   q7 <= q7_DUMMY;
   q8 <= q8_DUMMY;
   q9 <= q9_DUMMY;
   q10 <= q10_DUMMY;
   q11 <= q11_DUMMY;
   q12 <= q12_DUMMY;
   q13 <= q13_DUMMY;
   q14 <= q14_DUMMY;
   q15 <= q15_DUMMY;
   XLXI_2 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_2_PRE_openSignal,
                T=>T,
                Q=>q0_DUMMY);
   
   XLXI_3 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_3_PRE_openSignal,
                T=>q0_DUMMY,
                Q=>q1_DUMMY);
   
   XLXI_4 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_4_PRE_openSignal,
                T=>XLXN_20,
                Q=>q2_DUMMY);
   
   XLXI_5 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_5_PRE_openSignal,
                T=>XLXN_27,
                Q=>q3_DUMMY);
   
   XLXI_6 : AND2
      port map (I0=>q1_DUMMY,
                I1=>q0_DUMMY,
                O=>XLXN_20);
   
   XLXI_7 : AND2
      port map (I0=>q2_DUMMY,
                I1=>XLXN_20,
                O=>XLXN_27);
   
   XLXI_9 : AND2
      port map (I0=>q3_DUMMY,
                I1=>XLXN_27,
                O=>t_out);
   
   XLXI_84 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_84_PRE_openSignal,
                T=>XLXN_232,
                Q=>q7_DUMMY);
   
   XLXI_85 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_85_PRE_openSignal,
                T=>XLXN_221,
                Q=>q6_DUMMY);
   
   XLXI_86 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_86_PRE_openSignal,
                T=>XLXN_219,
                Q=>q5_DUMMY);
   
   XLXI_87 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_87_PRE_openSignal,
                T=>t_out,
                Q=>q4_DUMMY);
   
   XLXI_88 : AND2
      port map (I0=>t_out,
                I1=>q4_DUMMY,
                O=>XLXN_219);
   
   XLXI_89 : AND2
      port map (I0=>q5_DUMMY,
                I1=>XLXN_219,
                O=>XLXN_221);
   
   XLXI_90 : AND2
      port map (I0=>q7_DUMMY,
                I1=>XLXN_232,
                O=>XLXN_189);
   
   XLXI_91 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_91_PRE_openSignal,
                T=>XLXN_198,
                Q=>q11_DUMMY);
   
   XLXI_92 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_92_PRE_openSignal,
                T=>XLXN_196,
                Q=>q10_DUMMY);
   
   XLXI_93 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_93_PRE_openSignal,
                T=>XLXN_227,
                Q=>q9_DUMMY);
   
   XLXI_94 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_94_PRE_openSignal,
                T=>XLXN_189,
                Q=>q8_DUMMY);
   
   XLXI_95 : AND2
      port map (I0=>q9_DUMMY,
                I1=>XLXN_227,
                O=>XLXN_196);
   
   XLXI_96 : AND2
      port map (I0=>q10_DUMMY,
                I1=>XLXN_196,
                O=>XLXN_198);
   
   XLXI_97 : AND2
      port map (I0=>q11_DUMMY,
                I1=>XLXN_198,
                O=>XLXN_204);
   
   XLXI_98 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_98_PRE_openSignal,
                T=>XLXN_213,
                Q=>q15_DUMMY);
   
   XLXI_99 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_99_PRE_openSignal,
                T=>XLXN_211,
                Q=>q14_DUMMY);
   
   XLXI_100 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_100_PRE_openSignal,
                T=>XLXN_231,
                Q=>q13_DUMMY);
   
   XLXI_101 : FTP_HXILINX_lab_4_seven_segment_display
      port map (C=>clck,
                PRE=>XLXI_101_PRE_openSignal,
                T=>XLXN_204,
                Q=>q12_DUMMY);
   
   XLXI_102 : AND2
      port map (I0=>q13_DUMMY,
                I1=>XLXN_231,
                O=>XLXN_211);
   
   XLXI_103 : AND2
      port map (I0=>q14_DUMMY,
                I1=>XLXN_211,
                O=>XLXN_213);
   
   XLXI_104 : AND2
      port map (I0=>q15_DUMMY,
                I1=>XLXN_213,
                O=>open);
   
   XLXI_105 : VCC
      port map (P=>T);
   
   XLXI_106 : AND2
      port map (I0=>q6_DUMMY,
                I1=>XLXN_221,
                O=>XLXN_232);
   
   XLXI_107 : AND2
      port map (I0=>q8_DUMMY,
                I1=>XLXN_189,
                O=>XLXN_227);
   
   XLXI_108 : AND2
      port map (I0=>q12_DUMMY,
                I1=>XLXN_204,
                O=>XLXN_231);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clock_circuit_MUSER_lab_4_seven_segment_display is
   port ( clk   : in    std_logic; 
          push  : in    std_logic; 
          anode : out   std_logic_vector (3 downto 0));
end clock_circuit_MUSER_lab_4_seven_segment_display;

architecture BEHAVIORAL of clock_circuit_MUSER_lab_4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal rnable  : std_logic;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_7  : std_logic_vector (3 downto 0);
   signal XLXN_8  : std_logic_vector (3 downto 0);
   signal XLXN_10 : std_logic_vector (3 downto 0);
   signal XLXN_15 : std_logic_vector (3 downto 0);
   signal XLXN_16 : std_logic_vector (3 downto 0);
   signal XLXN_19 : std_logic_vector (3 downto 0);
   component main_counter_MUSER_lab_4_seven_segment_display
      port ( clck : in    std_logic; 
             q0   : out   std_logic; 
             q1   : out   std_logic; 
             q10  : out   std_logic; 
             q11  : out   std_logic; 
             q12  : out   std_logic; 
             q13  : out   std_logic; 
             q14  : out   std_logic; 
             q15  : out   std_logic; 
             q2   : out   std_logic; 
             q3   : out   std_logic; 
             q4   : out   std_logic; 
             q5   : out   std_logic; 
             q6   : out   std_logic; 
             q7   : out   std_logic; 
             q8   : out   std_logic; 
             q9   : out   std_logic);
   end component;
   
   component M4_1E_HXILINX_lab_4_seven_segment_display
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_2_0 : label is "XLXI_2_0_43";
   attribute HU_SET of XLXI_2_1 : label is "XLXI_2_1_42";
   attribute HU_SET of XLXI_2_2 : label is "XLXI_2_2_41";
   attribute HU_SET of XLXI_2_3 : label is "XLXI_2_3_40";
   attribute HU_SET of XLXI_3_0 : label is "XLXI_3_0_47";
   attribute HU_SET of XLXI_3_1 : label is "XLXI_3_1_46";
   attribute HU_SET of XLXI_3_2 : label is "XLXI_3_2_45";
   attribute HU_SET of XLXI_3_3 : label is "XLXI_3_3_44";
begin
   XLXN_7(3 downto 0) <= x"E";
   XLXN_8(3 downto 0) <= x"D";
   XLXN_10(3 downto 0) <= x"7";
   XLXN_19(3 downto 0) <= x"B";
   XLXI_1 : main_counter_MUSER_lab_4_seven_segment_display
      port map (clck=>clk,
                q0=>XLXN_1,
                q1=>XLXN_2,
                q2=>open,
                q3=>open,
                q4=>open,
                q5=>open,
                q6=>open,
                q7=>open,
                q8=>open,
                q9=>open,
                q10=>open,
                q11=>open,
                q12=>open,
                q13=>open,
                q14=>XLXN_4,
                q15=>XLXN_3);
   
   XLXI_2_0 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>XLXN_7(0),
                D1=>XLXN_8(0),
                D2=>XLXN_19(0),
                D3=>XLXN_10(0),
                E=>push,
                S0=>XLXN_1,
                S1=>XLXN_2,
                O=>XLXN_15(0));
   
   XLXI_2_1 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>XLXN_7(1),
                D1=>XLXN_8(1),
                D2=>XLXN_19(1),
                D3=>XLXN_10(1),
                E=>push,
                S0=>XLXN_1,
                S1=>XLXN_2,
                O=>XLXN_15(1));
   
   XLXI_2_2 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>XLXN_7(2),
                D1=>XLXN_8(2),
                D2=>XLXN_19(2),
                D3=>XLXN_10(2),
                E=>push,
                S0=>XLXN_1,
                S1=>XLXN_2,
                O=>XLXN_15(2));
   
   XLXI_2_3 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>XLXN_7(3),
                D1=>XLXN_8(3),
                D2=>XLXN_19(3),
                D3=>XLXN_10(3),
                E=>push,
                S0=>XLXN_1,
                S1=>XLXN_2,
                O=>XLXN_15(3));
   
   XLXI_3_0 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>XLXN_7(0),
                D1=>XLXN_8(0),
                D2=>XLXN_19(0),
                D3=>XLXN_10(0),
                E=>rnable,
                S0=>XLXN_4,
                S1=>XLXN_3,
                O=>XLXN_16(0));
   
   XLXI_3_1 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>XLXN_7(1),
                D1=>XLXN_8(1),
                D2=>XLXN_19(1),
                D3=>XLXN_10(1),
                E=>rnable,
                S0=>XLXN_4,
                S1=>XLXN_3,
                O=>XLXN_16(1));
   
   XLXI_3_2 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>XLXN_7(2),
                D1=>XLXN_8(2),
                D2=>XLXN_19(2),
                D3=>XLXN_10(2),
                E=>rnable,
                S0=>XLXN_4,
                S1=>XLXN_3,
                O=>XLXN_16(2));
   
   XLXI_3_3 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>XLXN_7(3),
                D1=>XLXN_8(3),
                D2=>XLXN_19(3),
                D3=>XLXN_10(3),
                E=>rnable,
                S0=>XLXN_4,
                S1=>XLXN_3,
                O=>XLXN_16(3));
   
   XLXI_4 : INV
      port map (I=>push,
                O=>rnable);
   
   XLXI_9_0 : OR2
      port map (I0=>XLXN_16(0),
                I1=>XLXN_15(0),
                O=>anode(0));
   
   XLXI_9_1 : OR2
      port map (I0=>XLXN_16(1),
                I1=>XLXN_15(1),
                O=>anode(1));
   
   XLXI_9_2 : OR2
      port map (I0=>XLXN_16(2),
                I1=>XLXN_15(2),
                O=>anode(2));
   
   XLXI_9_3 : OR2
      port map (I0=>XLXN_16(3),
                I1=>XLXN_15(3),
                O=>anode(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity encoder_MUSER_lab_4_seven_segment_display is
   port ( anode : in    std_logic_vector (3 downto 0); 
          s0    : out   std_logic; 
          s1    : out   std_logic);
end encoder_MUSER_lab_4_seven_segment_display;

architecture BEHAVIORAL of encoder_MUSER_lab_4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal an      : std_logic;
   signal an2     : std_logic;
   signal an3     : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_35 : std_logic;
   signal XLXN_39 : std_logic;
   signal XLXN_41 : std_logic;
   signal XLXN_44 : std_logic;
   signal XLXN_45 : std_logic;
   signal XLXN_46 : std_logic;
   signal XLXN_47 : std_logic;
   signal XLXN_52 : std_logic;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>XLXN_52,
                O=>XLXN_35);
   
   XLXI_2 : INV
      port map (I=>an,
                O=>XLXN_39);
   
   XLXI_3 : INV
      port map (I=>an2,
                O=>XLXN_5);
   
   XLXI_4 : INV
      port map (I=>an3,
                O=>XLXN_41);
   
   XLXI_5 : AND4
      port map (I0=>an3,
                I1=>XLXN_5,
                I2=>XLXN_39,
                I3=>XLXN_35,
                O=>XLXN_45);
   
   XLXI_6 : AND4
      port map (I0=>an3,
                I1=>XLXN_5,
                I2=>XLXN_39,
                I3=>XLXN_35,
                O=>XLXN_47);
   
   XLXI_7 : AND4
      port map (I0=>XLXN_41,
                I1=>XLXN_5,
                I2=>an,
                I3=>XLXN_35,
                O=>XLXN_44);
   
   XLXI_8 : AND4
      port map (I0=>XLXN_41,
                I1=>an2,
                I2=>XLXN_39,
                I3=>XLXN_35,
                O=>XLXN_46);
   
   XLXI_9 : OR2
      port map (I0=>XLXN_45,
                I1=>XLXN_44,
                O=>s0);
   
   XLXI_10 : OR2
      port map (I0=>XLXN_47,
                I1=>XLXN_46,
                O=>s1);
   
   XLXI_11 : INV
      port map (I=>anode(0),
                O=>XLXN_52);
   
   XLXI_15 : INV
      port map (I=>anode(1),
                O=>an);
   
   XLXI_16 : INV
      port map (I=>anode(2),
                O=>an2);
   
   XLXI_17 : INV
      port map (I=>anode(3),
                O=>an3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab_4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab_4_seven_segment_display;

architecture BEHAVIORAL of lab_4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal ip          : std_logic_vector (3 downto 0);
   signal XLXN_1      : std_logic;
   signal XLXN_2      : std_logic;
   signal XLXN_15     : std_logic;
   signal anode_DUMMY : std_logic_vector (3 downto 0);
   component encoder_MUSER_lab_4_seven_segment_display
      port ( anode : in    std_logic_vector (3 downto 0); 
             s0    : out   std_logic; 
             s1    : out   std_logic);
   end component;
   
   component M4_1E_HXILINX_lab_4_seven_segment_display
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component clock_circuit_MUSER_lab_4_seven_segment_display
      port ( anode : out   std_logic_vector (3 downto 0); 
             clk   : in    std_logic; 
             push  : in    std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component lab_4_MUSER_lab_4_seven_segment_display
      port ( A  : out   std_logic; 
             B  : out   std_logic; 
             b0 : in    std_logic; 
             b1 : in    std_logic; 
             b2 : in    std_logic; 
             b3 : in    std_logic; 
             C  : out   std_logic; 
             D  : out   std_logic; 
             E  : out   std_logic; 
             F  : out   std_logic; 
             G  : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_2_0 : label is "XLXI_2_0_51";
   attribute HU_SET of XLXI_2_1 : label is "XLXI_2_1_50";
   attribute HU_SET of XLXI_2_2 : label is "XLXI_2_2_49";
   attribute HU_SET of XLXI_2_3 : label is "XLXI_2_3_48";
begin
   anode(3 downto 0) <= anode_DUMMY(3 downto 0);
   XLXI_1 : encoder_MUSER_lab_4_seven_segment_display
      port map (anode(3 downto 0)=>anode_DUMMY(3 downto 0),
                s0=>XLXN_1,
                s1=>XLXN_2);
   
   XLXI_2_0 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>b(0),
                D1=>b(4),
                D2=>b(8),
                D3=>b(12),
                E=>XLXN_15,
                S0=>XLXN_1,
                S1=>XLXN_2,
                O=>ip(0));
   
   XLXI_2_1 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>b(1),
                D1=>b(5),
                D2=>b(9),
                D3=>b(13),
                E=>XLXN_15,
                S0=>XLXN_1,
                S1=>XLXN_2,
                O=>ip(1));
   
   XLXI_2_2 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>b(2),
                D1=>b(6),
                D2=>b(10),
                D3=>b(14),
                E=>XLXN_15,
                S0=>XLXN_1,
                S1=>XLXN_2,
                O=>ip(2));
   
   XLXI_2_3 : M4_1E_HXILINX_lab_4_seven_segment_display
      port map (D0=>b(3),
                D1=>b(7),
                D2=>b(11),
                D3=>b(15),
                E=>XLXN_15,
                S0=>XLXN_1,
                S1=>XLXN_2,
                O=>ip(3));
   
   XLXI_3 : clock_circuit_MUSER_lab_4_seven_segment_display
      port map (clk=>clk,
                push=>pushbutton,
                anode(3 downto 0)=>anode_DUMMY(3 downto 0));
   
   XLXI_4 : VCC
      port map (P=>XLXN_15);
   
   XLXI_5 : lab_4_MUSER_lab_4_seven_segment_display
      port map (b0=>ip(0),
                b1=>ip(1),
                b2=>ip(2),
                b3=>ip(3),
                A=>cathode(0),
                B=>cathode(1),
                C=>cathode(2),
                D=>cathode(3),
                E=>cathode(4),
                F=>cathode(5),
                G=>cathode(6));
   
end BEHAVIORAL;


