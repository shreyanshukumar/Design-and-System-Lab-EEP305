--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab2_port_switch.vhf
-- /___/   /\     Timestamp : 02/20/2019 19:09:14
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl G:/courses/vhdl/lab2_port_switch/lab2_port_switch.vhf -w G:/courses/vhdl/lab2_port_switch/lab2_port_switch.sch
--Design Name: lab2_port_switch
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity encod1_MUSER_lab2_port_switch is
   port ( req0 : in    std_logic; 
          req1 : in    std_logic; 
          req2 : in    std_logic; 
          src0 : out   std_logic; 
          src1 : out   std_logic);
end encod1_MUSER_lab2_port_switch;

architecture BEHAVIORAL of encod1_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   signal XLXN_4  : std_logic;
   signal XLXN_5  : std_logic;
   signal XLXN_6  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
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
   
begin
   XLXI_1 : AND3
      port map (I0=>XLXN_6,
                I1=>XLXN_5,
                I2=>XLXN_4,
                O=>XLXN_11);
   
   XLXI_3 : INV
      port map (I=>req0,
                O=>XLXN_4);
   
   XLXI_4 : INV
      port map (I=>req1,
                O=>XLXN_5);
   
   XLXI_5 : INV
      port map (I=>req2,
                O=>XLXN_6);
   
   XLXI_6 : AND2
      port map (I0=>XLXN_7,
                I1=>req1,
                O=>XLXN_12);
   
   XLXI_7 : INV
      port map (I=>req2,
                O=>XLXN_7);
   
   XLXI_9 : OR2
      port map (I0=>XLXN_12,
                I1=>XLXN_11,
                O=>src0);
   
   XLXI_10 : OR2
      port map (I0=>req2,
                I1=>XLXN_11,
                O=>src1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity decod2_MUSER_lab2_port_switch is
   port ( req0 : in    std_logic; 
          src0 : in    std_logic; 
          src1 : in    std_logic; 
          ack0 : out   std_logic; 
          ack1 : out   std_logic; 
          ack2 : out   std_logic);
end decod2_MUSER_lab2_port_switch;

architecture BEHAVIORAL of decod2_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   signal XLXN_1 : std_logic;
   signal XLXN_2 : std_logic;
   signal XLXN_3 : std_logic;
   signal XLXN_7 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>XLXN_3,
                I1=>src1,
                O=>ack2);
   
   XLXI_2 : AND2
      port map (I0=>src0,
                I1=>XLXN_7,
                O=>ack1);
   
   XLXI_3 : INV
      port map (I=>src0,
                O=>XLXN_1);
   
   XLXI_4 : INV
      port map (I=>src1,
                O=>XLXN_2);
   
   XLXI_5 : INV
      port map (I=>src0,
                O=>XLXN_3);
   
   XLXI_8 : INV
      port map (I=>src1,
                O=>XLXN_7);
   
   XLXI_9 : AND3
      port map (I0=>req0,
                I1=>XLXN_2,
                I2=>XLXN_1,
                O=>ack0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity multi_MUSER_lab2_port_switch is
   port ( din0 : in    std_logic; 
          din1 : in    std_logic; 
          din2 : in    std_logic; 
          e    : in    std_logic; 
          src0 : in    std_logic; 
          src1 : in    std_logic; 
          dout : out   std_logic);
end multi_MUSER_lab2_port_switch;

architecture BEHAVIORAL of multi_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   signal XLXN_21 : std_logic;
   signal XLXN_25 : std_logic;
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
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
begin
   XLXI_1 : INV
      port map (I=>src1,
                O=>XLXN_12);
   
   XLXI_2 : AND4
      port map (I0=>e,
                I1=>XLXN_12,
                I2=>XLXN_21,
                I3=>din0,
                O=>XLXN_18);
   
   XLXI_3 : AND4
      port map (I0=>e,
                I1=>XLXN_13,
                I2=>src0,
                I3=>din1,
                O=>XLXN_19);
   
   XLXI_4 : AND4
      port map (I0=>src1,
                I1=>XLXN_25,
                I2=>e,
                I3=>din2,
                O=>XLXN_20);
   
   XLXI_5 : INV
      port map (I=>src1,
                O=>XLXN_13);
   
   XLXI_7 : OR3
      port map (I0=>XLXN_20,
                I1=>XLXN_19,
                I2=>XLXN_18,
                O=>dout);
   
   XLXI_9 : INV
      port map (I=>src0,
                O=>XLXN_21);
   
   XLXI_10 : INV
      port map (I=>src0,
                O=>XLXN_25);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity decoder_MUSER_lab2_port_switch is
   port ( src0 : in    std_logic; 
          src1 : in    std_logic; 
          ack0 : out   std_logic; 
          ack1 : out   std_logic; 
          ack2 : out   std_logic);
end decoder_MUSER_lab2_port_switch;

architecture BEHAVIORAL of decoder_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   signal XLXN_1 : std_logic;
   signal XLXN_2 : std_logic;
   signal XLXN_3 : std_logic;
   signal XLXN_7 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_2 : AND2
      port map (I0=>XLXN_2,
                I1=>XLXN_1,
                O=>ack0);
   
   XLXI_3 : AND2
      port map (I0=>XLXN_3,
                I1=>src1,
                O=>ack2);
   
   XLXI_4 : AND2
      port map (I0=>src0,
                I1=>XLXN_7,
                O=>ack1);
   
   XLXI_5 : INV
      port map (I=>src0,
                O=>XLXN_1);
   
   XLXI_6 : INV
      port map (I=>src1,
                O=>XLXN_2);
   
   XLXI_7 : INV
      port map (I=>src0,
                O=>XLXN_3);
   
   XLXI_8 : INV
      port map (I=>src1,
                O=>XLXN_7);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab2_port_switch is
   port ( dest0 : in    std_logic_vector (1 downto 0); 
          dest1 : in    std_logic_vector (1 downto 0); 
          dest2 : in    std_logic_vector (1 downto 0); 
          din0  : in    std_logic; 
          din1  : in    std_logic; 
          din2  : in    std_logic; 
          req0  : in    std_logic; 
          req1  : in    std_logic; 
          req2  : in    std_logic; 
          ack0  : out   std_logic; 
          ack1  : out   std_logic; 
          ack2  : out   std_logic; 
          dout0 : out   std_logic; 
          dout1 : out   std_logic; 
          dout2 : out   std_logic; 
          src   : out   std_logic_vector (1 downto 0));
end lab2_port_switch;

architecture BEHAVIORAL of lab2_port_switch is
   attribute BOX_TYPE   : string ;
   signal XLXN_10    : std_logic;
   signal XLXN_16    : std_logic;
   signal XLXN_17    : std_logic;
   signal XLXN_18    : std_logic;
   signal XLXN_29    : std_logic;
   signal XLXN_30    : std_logic;
   signal XLXN_31    : std_logic;
   signal XLXN_32    : std_logic;
   signal XLXN_33    : std_logic;
   signal XLXN_37    : std_logic;
   signal XLXN_38    : std_logic;
   signal XLXN_39    : std_logic;
   signal XLXN_40    : std_logic;
   signal XLXN_41    : std_logic;
   signal XLXN_42    : std_logic;
   signal XLXN_43    : std_logic;
   signal XLXN_44    : std_logic;
   signal XLXN_45    : std_logic;
   signal XLXN_46    : std_logic;
   signal XLXN_47    : std_logic;
   signal XLXN_48    : std_logic;
   signal src_DUMMY  : std_logic_vector (1 downto 0);
   signal ack0_DUMMY : std_logic;
   signal ack1_DUMMY : std_logic;
   signal ack2_DUMMY : std_logic;
   component decoder_MUSER_lab2_port_switch
      port ( ack0 : out   std_logic; 
             ack1 : out   std_logic; 
             ack2 : out   std_logic; 
             src0 : in    std_logic; 
             src1 : in    std_logic);
   end component;
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component multi_MUSER_lab2_port_switch
      port ( din0 : in    std_logic; 
             din1 : in    std_logic; 
             din2 : in    std_logic; 
             dout : out   std_logic; 
             e    : in    std_logic; 
             src0 : in    std_logic; 
             src1 : in    std_logic);
   end component;
   
   component decod2_MUSER_lab2_port_switch
      port ( ack0 : out   std_logic; 
             ack1 : out   std_logic; 
             ack2 : out   std_logic; 
             req0 : in    std_logic; 
             src0 : in    std_logic; 
             src1 : in    std_logic);
   end component;
   
   component encod1_MUSER_lab2_port_switch
      port ( req0 : in    std_logic; 
             req1 : in    std_logic; 
             req2 : in    std_logic; 
             src0 : out   std_logic; 
             src1 : out   std_logic);
   end component;
   
begin
   ack0 <= ack0_DUMMY;
   ack1 <= ack1_DUMMY;
   ack2 <= ack2_DUMMY;
   src(1 downto 0) <= src_DUMMY(1 downto 0);
   XLXI_3 : decoder_MUSER_lab2_port_switch
      port map (src0=>dest0(0),
                src1=>dest0(1),
                ack0=>XLXN_29,
                ack1=>XLXN_10,
                ack2=>XLXN_30);
   
   XLXI_4 : decoder_MUSER_lab2_port_switch
      port map (src0=>dest1(0),
                src1=>dest1(1),
                ack0=>XLXN_31,
                ack1=>XLXN_32,
                ack2=>XLXN_33);
   
   XLXI_5 : decoder_MUSER_lab2_port_switch
      port map (src0=>dest2(0),
                src1=>dest2(1),
                ack0=>XLXN_16,
                ack1=>XLXN_17,
                ack2=>XLXN_18);
   
   XLXI_6 : AND2
      port map (I0=>XLXN_29,
                I1=>ack0_DUMMY,
                O=>XLXN_37);
   
   XLXI_7 : AND2
      port map (I0=>XLXN_10,
                I1=>ack0_DUMMY,
                O=>XLXN_40);
   
   XLXI_8 : AND2
      port map (I0=>XLXN_30,
                I1=>ack0_DUMMY,
                O=>XLXN_43);
   
   XLXI_9 : AND2
      port map (I0=>XLXN_31,
                I1=>ack1_DUMMY,
                O=>XLXN_38);
   
   XLXI_10 : AND2
      port map (I0=>XLXN_32,
                I1=>ack1_DUMMY,
                O=>XLXN_41);
   
   XLXI_11 : AND2
      port map (I0=>XLXN_33,
                I1=>ack1_DUMMY,
                O=>XLXN_44);
   
   XLXI_12 : AND2
      port map (I0=>XLXN_16,
                I1=>ack2_DUMMY,
                O=>XLXN_39);
   
   XLXI_13 : AND2
      port map (I0=>XLXN_17,
                I1=>ack2_DUMMY,
                O=>XLXN_42);
   
   XLXI_14 : AND2
      port map (I0=>XLXN_18,
                I1=>ack2_DUMMY,
                O=>XLXN_45);
   
   XLXI_15 : OR3
      port map (I0=>XLXN_39,
                I1=>XLXN_38,
                I2=>XLXN_37,
                O=>XLXN_46);
   
   XLXI_16 : OR3
      port map (I0=>XLXN_42,
                I1=>XLXN_41,
                I2=>XLXN_40,
                O=>XLXN_47);
   
   XLXI_17 : OR3
      port map (I0=>XLXN_45,
                I1=>XLXN_44,
                I2=>XLXN_43,
                O=>XLXN_48);
   
   XLXI_18 : multi_MUSER_lab2_port_switch
      port map (din0=>din0,
                din1=>din1,
                din2=>din2,
                e=>XLXN_46,
                src0=>src_DUMMY(0),
                src1=>src_DUMMY(1),
                dout=>dout0);
   
   XLXI_19 : multi_MUSER_lab2_port_switch
      port map (din0=>din0,
                din1=>din1,
                din2=>din2,
                e=>XLXN_47,
                src0=>src_DUMMY(0),
                src1=>src_DUMMY(1),
                dout=>dout1);
   
   XLXI_20 : multi_MUSER_lab2_port_switch
      port map (din0=>din0,
                din1=>din1,
                din2=>din2,
                e=>XLXN_48,
                src0=>src_DUMMY(0),
                src1=>src_DUMMY(1),
                dout=>dout2);
   
   XLXI_25 : decod2_MUSER_lab2_port_switch
      port map (req0=>req0,
                src0=>src_DUMMY(0),
                src1=>src_DUMMY(1),
                ack0=>ack0_DUMMY,
                ack1=>ack1_DUMMY,
                ack2=>ack2_DUMMY);
   
   XLXI_26 : encod1_MUSER_lab2_port_switch
      port map (req0=>req0,
                req1=>req1,
                req2=>req2,
                src0=>src_DUMMY(0),
                src1=>src_DUMMY(1));
   
end BEHAVIORAL;


