--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab3_reg_file.vhf
-- /___/   /\     Timestamp : 03/02/2019 22:32:33
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl G:/courses/vhdl/lab3_reg_file/lab3_reg_file.vhf -w G:/courses/vhdl/lab3_reg_file/lab3_reg_file.sch
--Design Name: lab3_reg_file
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL M8_1E_HXILINX_lab3_reg_file -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M8_1E_HXILINX_lab3_reg_file is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    D4  : in std_logic;
    D5  : in std_logic;
    D6  : in std_logic;
    D7  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic;
    S2  : in std_logic
  );
end M8_1E_HXILINX_lab3_reg_file;

architecture M8_1E_HXILINX_lab3_reg_file_V of M8_1E_HXILINX_lab3_reg_file is
begin
  process (D0, D1, D2, D3, D4, D5, D6, D7, E, S0, S1, S2)
  variable sel : std_logic_vector(2 downto 0);
  begin
    sel := S2&S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "000" => O <= D0;
      when "001" => O <= D1;
      when "010" => O <= D2;
      when "011" => O <= D3;
      when "100" => O <= D4;
      when "101" => O <= D5;
      when "110" => O <= D6;
      when "111" => O <= D7;
      when others => NULL;
      end case;
    end if;
    end process; 
end M8_1E_HXILINX_lab3_reg_file_V;
----- CELL D3_8E_HXILINX_lab3_reg_file -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D3_8E_HXILINX_lab3_reg_file is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;
    D4  : out std_logic;
    D5  : out std_logic;
    D6  : out std_logic;
    D7  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    E   : in std_logic
  );
end D3_8E_HXILINX_lab3_reg_file;

architecture D3_8E_HXILINX_lab3_reg_file_V of D3_8E_HXILINX_lab3_reg_file is
  signal d_tmp : std_logic_vector(7 downto 0);
begin
  process (A0, A1, A2, E)
  variable sel   : std_logic_vector(2 downto 0);
  begin
    sel := A2&A1&A0;
    if( E = '0') then
    d_tmp <= "00000000";
    else
      case sel is
      when "000" => d_tmp <= "00000001";
      when "001" => d_tmp <= "00000010";
      when "010" => d_tmp <= "00000100";
      when "011" => d_tmp <= "00001000";
      when "100" => d_tmp <= "00010000";
      when "101" => d_tmp <= "00100000";
      when "110" => d_tmp <= "01000000";
      when "111" => d_tmp <= "10000000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D7 <= d_tmp(7);
    D6 <= d_tmp(6);
    D5 <= d_tmp(5);
    D4 <= d_tmp(4);
    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D3_8E_HXILINX_lab3_reg_file_V;
----- CELL M2_1_HXILINX_lab3_reg_file -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_lab3_reg_file is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_lab3_reg_file;

architecture M2_1_HXILINX_lab3_reg_file_V of M2_1_HXILINX_lab3_reg_file is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_lab3_reg_file_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity unit_reg_MUSER_lab3_reg_file is
   port ( clock  : in    std_logic; 
          din    : in    std_logic_vector (3 downto 0); 
          enable : in    std_logic; 
          dout   : out   std_logic_vector (3 downto 0));
end unit_reg_MUSER_lab3_reg_file;

architecture BEHAVIORAL of unit_reg_MUSER_lab3_reg_file is
   attribute BOX_TYPE   : string ;
   component FDE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDE : component is "BLACK_BOX";
   
begin
   XLXI_8 : FDE
      port map (C=>clock,
                CE=>enable,
                D=>din(0),
                Q=>dout(0));
   
   XLXI_9 : FDE
      port map (C=>clock,
                CE=>enable,
                D=>din(1),
                Q=>dout(1));
   
   XLXI_10 : FDE
      port map (C=>clock,
                CE=>enable,
                D=>din(2),
                Q=>dout(2));
   
   XLXI_13 : FDE
      port map (C=>clock,
                CE=>enable,
                D=>din(3),
                Q=>dout(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity reg8_MUSER_lab3_reg_file is
   port ( clock   : in    std_logic; 
          reg0    : in    std_logic; 
          reg1    : in    std_logic; 
          reg2    : in    std_logic; 
          reg3    : in    std_logic; 
          reg4    : in    std_logic; 
          reg5    : in    std_logic; 
          reg6    : in    std_logic; 
          reg8    : in    std_logic; 
          wr_data : in    std_logic_vector (3 downto 0); 
          reg1out : out   std_logic_vector (3 downto 0); 
          reg3out : out   std_logic_vector (3 downto 0); 
          reg4out : out   std_logic_vector (3 downto 0); 
          reg5out : out   std_logic_vector (3 downto 0); 
          reg6out : out   std_logic_vector (3 downto 0); 
          reg7out : out   std_logic_vector (3 downto 0); 
          reg8out : out   std_logic_vector (3 downto 0); 
          reg9out : out   std_logic_vector (3 downto 0));
end reg8_MUSER_lab3_reg_file;

architecture BEHAVIORAL of reg8_MUSER_lab3_reg_file is
   component unit_reg_MUSER_lab3_reg_file
      port ( clock  : in    std_logic; 
             din    : in    std_logic_vector (3 downto 0); 
             dout   : out   std_logic_vector (3 downto 0); 
             enable : in    std_logic);
   end component;
   
begin
   XLXI_1 : unit_reg_MUSER_lab3_reg_file
      port map (clock=>clock,
                din(3 downto 0)=>wr_data(3 downto 0),
                enable=>reg0,
                dout(3 downto 0)=>reg1out(3 downto 0));
   
   XLXI_2 : unit_reg_MUSER_lab3_reg_file
      port map (clock=>clock,
                din(3 downto 0)=>wr_data(3 downto 0),
                enable=>reg1,
                dout(3 downto 0)=>reg3out(3 downto 0));
   
   XLXI_3 : unit_reg_MUSER_lab3_reg_file
      port map (clock=>clock,
                din(3 downto 0)=>wr_data(3 downto 0),
                enable=>reg2,
                dout(3 downto 0)=>reg4out(3 downto 0));
   
   XLXI_4 : unit_reg_MUSER_lab3_reg_file
      port map (clock=>clock,
                din(3 downto 0)=>wr_data(3 downto 0),
                enable=>reg3,
                dout(3 downto 0)=>reg5out(3 downto 0));
   
   XLXI_5 : unit_reg_MUSER_lab3_reg_file
      port map (clock=>clock,
                din(3 downto 0)=>wr_data(3 downto 0),
                enable=>reg4,
                dout(3 downto 0)=>reg6out(3 downto 0));
   
   XLXI_6 : unit_reg_MUSER_lab3_reg_file
      port map (clock=>clock,
                din(3 downto 0)=>wr_data(3 downto 0),
                enable=>reg5,
                dout(3 downto 0)=>reg7out(3 downto 0));
   
   XLXI_7 : unit_reg_MUSER_lab3_reg_file
      port map (clock=>clock,
                din(3 downto 0)=>wr_data(3 downto 0),
                enable=>reg6,
                dout(3 downto 0)=>reg8out(3 downto 0));
   
   XLXI_8 : unit_reg_MUSER_lab3_reg_file
      port map (clock=>clock,
                din(3 downto 0)=>wr_data(3 downto 0),
                enable=>reg8,
                dout(3 downto 0)=>reg9out(3 downto 0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab3_reg_file is
   port ( clock              : in    std_logic; 
          mode               : in    std_logic; 
          rd_addr1           : in    std_logic_vector (2 downto 0); 
          rd_addr2           : in    std_logic_vector (2 downto 0); 
          write_enable       : in    std_logic; 
          wr_addr            : in    std_logic_vector (2 downto 0); 
          wr_data            : in    std_logic_vector (3 downto 0); 
          rd_data1           : out   std_logic_vector (3 downto 0); 
          rd_data1_xor_data2 : out   std_logic_vector (3 downto 0); 
          rd_data2           : out   std_logic_vector (3 downto 0));
end lab3_reg_file;

architecture BEHAVIORAL of lab3_reg_file is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal env                      : std_logic;
   signal XLXN_2                   : std_logic;
   signal XLXN_3                   : std_logic;
   signal XLXN_4                   : std_logic;
   signal XLXN_5                   : std_logic;
   signal XLXN_6                   : std_logic;
   signal XLXN_7                   : std_logic;
   signal XLXN_8                   : std_logic;
   signal XLXN_9                   : std_logic;
   signal XLXN_16                  : std_logic_vector (3 downto 0);
   signal XLXN_27                  : std_logic_vector (3 downto 0);
   signal XLXN_28                  : std_logic_vector (3 downto 0);
   signal XLXN_29                  : std_logic_vector (3 downto 0);
   signal XLXN_30                  : std_logic_vector (3 downto 0);
   signal XLXN_31                  : std_logic_vector (3 downto 0);
   signal XLXN_32                  : std_logic_vector (3 downto 0);
   signal XLXN_33                  : std_logic_vector (3 downto 0);
   signal XLXN_34                  : std_logic_vector (3 downto 0);
   signal rd_data1_DUMMY           : std_logic_vector (3 downto 0);
   signal rd_data2_DUMMY           : std_logic_vector (3 downto 0);
   signal rd_data1_xor_data2_DUMMY : std_logic_vector (3 downto 0);
   component reg8_MUSER_lab3_reg_file
      port ( clock   : in    std_logic; 
             reg0    : in    std_logic; 
             reg1    : in    std_logic; 
             reg1out : out   std_logic_vector (3 downto 0); 
             reg2    : in    std_logic; 
             reg3    : in    std_logic; 
             reg3out : out   std_logic_vector (3 downto 0); 
             reg4    : in    std_logic; 
             reg4out : out   std_logic_vector (3 downto 0); 
             reg5    : in    std_logic; 
             reg5out : out   std_logic_vector (3 downto 0); 
             reg6    : in    std_logic; 
             reg6out : out   std_logic_vector (3 downto 0); 
             reg7out : out   std_logic_vector (3 downto 0); 
             reg8    : in    std_logic; 
             reg8out : out   std_logic_vector (3 downto 0); 
             reg9out : out   std_logic_vector (3 downto 0); 
             wr_data : in    std_logic_vector (3 downto 0));
   end component;
   
   component D3_8E_HXILINX_lab3_reg_file
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic; 
             D4 : out   std_logic; 
             D5 : out   std_logic; 
             D6 : out   std_logic; 
             D7 : out   std_logic);
   end component;
   
   component M8_1E_HXILINX_lab3_reg_file
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             D4 : in    std_logic; 
             D5 : in    std_logic; 
             D6 : in    std_logic; 
             D7 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             S2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component M2_1_HXILINX_lab3_reg_file
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_2 : label is "XLXI_2_0";
   attribute HU_SET of XLXI_3_0 : label is "XLXI_3_0_4";
   attribute HU_SET of XLXI_3_1 : label is "XLXI_3_1_3";
   attribute HU_SET of XLXI_3_2 : label is "XLXI_3_2_2";
   attribute HU_SET of XLXI_3_3 : label is "XLXI_3_3_1";
   attribute HU_SET of XLXI_4_0 : label is "XLXI_4_0_8";
   attribute HU_SET of XLXI_4_1 : label is "XLXI_4_1_7";
   attribute HU_SET of XLXI_4_2 : label is "XLXI_4_2_6";
   attribute HU_SET of XLXI_4_3 : label is "XLXI_4_3_5";
   attribute HU_SET of XLXI_6_0 : label is "XLXI_6_0_12";
   attribute HU_SET of XLXI_6_1 : label is "XLXI_6_1_11";
   attribute HU_SET of XLXI_6_2 : label is "XLXI_6_2_10";
   attribute HU_SET of XLXI_6_3 : label is "XLXI_6_3_9";
begin
   rd_data1(3 downto 0) <= rd_data1_DUMMY(3 downto 0);
   rd_data1_xor_data2(3 downto 0) <= rd_data1_xor_data2_DUMMY(3 downto 0);
   rd_data2(3 downto 0) <= rd_data2_DUMMY(3 downto 0);
   XLXI_1 : reg8_MUSER_lab3_reg_file
      port map (clock=>clock,
                reg0=>XLXN_2,
                reg1=>XLXN_3,
                reg2=>XLXN_4,
                reg3=>XLXN_5,
                reg4=>XLXN_6,
                reg5=>XLXN_7,
                reg6=>XLXN_8,
                reg8=>XLXN_9,
                wr_data(3 downto 0)=>XLXN_16(3 downto 0),
                reg1out(3 downto 0)=>XLXN_27(3 downto 0),
                reg3out(3 downto 0)=>XLXN_28(3 downto 0),
                reg4out(3 downto 0)=>XLXN_29(3 downto 0),
                reg5out(3 downto 0)=>XLXN_30(3 downto 0),
                reg6out(3 downto 0)=>XLXN_31(3 downto 0),
                reg7out(3 downto 0)=>XLXN_32(3 downto 0),
                reg8out(3 downto 0)=>XLXN_33(3 downto 0),
                reg9out(3 downto 0)=>XLXN_34(3 downto 0));
   
   XLXI_2 : D3_8E_HXILINX_lab3_reg_file
      port map (A0=>wr_addr(0),
                A1=>wr_addr(1),
                A2=>wr_addr(2),
                E=>write_enable,
                D0=>XLXN_2,
                D1=>XLXN_3,
                D2=>XLXN_4,
                D3=>XLXN_5,
                D4=>XLXN_6,
                D5=>XLXN_7,
                D6=>XLXN_8,
                D7=>XLXN_9);
   
   XLXI_3_0 : M8_1E_HXILINX_lab3_reg_file
      port map (D0=>XLXN_27(0),
                D1=>XLXN_28(0),
                D2=>XLXN_29(0),
                D3=>XLXN_30(0),
                D4=>XLXN_31(0),
                D5=>XLXN_32(0),
                D6=>XLXN_33(0),
                D7=>XLXN_34(0),
                E=>env,
                S0=>rd_addr1(0),
                S1=>rd_addr1(1),
                S2=>rd_addr1(2),
                O=>rd_data1_DUMMY(0));
   
   XLXI_3_1 : M8_1E_HXILINX_lab3_reg_file
      port map (D0=>XLXN_27(1),
                D1=>XLXN_28(1),
                D2=>XLXN_29(1),
                D3=>XLXN_30(1),
                D4=>XLXN_31(1),
                D5=>XLXN_32(1),
                D6=>XLXN_33(1),
                D7=>XLXN_34(1),
                E=>env,
                S0=>rd_addr1(0),
                S1=>rd_addr1(1),
                S2=>rd_addr1(2),
                O=>rd_data1_DUMMY(1));
   
   XLXI_3_2 : M8_1E_HXILINX_lab3_reg_file
      port map (D0=>XLXN_27(2),
                D1=>XLXN_28(2),
                D2=>XLXN_29(2),
                D3=>XLXN_30(2),
                D4=>XLXN_31(2),
                D5=>XLXN_32(2),
                D6=>XLXN_33(2),
                D7=>XLXN_34(2),
                E=>env,
                S0=>rd_addr1(0),
                S1=>rd_addr1(1),
                S2=>rd_addr1(2),
                O=>rd_data1_DUMMY(2));
   
   XLXI_3_3 : M8_1E_HXILINX_lab3_reg_file
      port map (D0=>XLXN_27(3),
                D1=>XLXN_28(3),
                D2=>XLXN_29(3),
                D3=>XLXN_30(3),
                D4=>XLXN_31(3),
                D5=>XLXN_32(3),
                D6=>XLXN_33(3),
                D7=>XLXN_34(3),
                E=>env,
                S0=>rd_addr1(0),
                S1=>rd_addr1(1),
                S2=>rd_addr1(2),
                O=>rd_data1_DUMMY(3));
   
   XLXI_4_0 : M8_1E_HXILINX_lab3_reg_file
      port map (D0=>XLXN_27(0),
                D1=>XLXN_28(0),
                D2=>XLXN_29(0),
                D3=>XLXN_30(0),
                D4=>XLXN_31(0),
                D5=>XLXN_32(0),
                D6=>XLXN_33(0),
                D7=>XLXN_34(0),
                E=>env,
                S0=>rd_addr2(0),
                S1=>rd_addr2(1),
                S2=>rd_addr2(2),
                O=>rd_data2_DUMMY(0));
   
   XLXI_4_1 : M8_1E_HXILINX_lab3_reg_file
      port map (D0=>XLXN_27(1),
                D1=>XLXN_28(1),
                D2=>XLXN_29(1),
                D3=>XLXN_30(1),
                D4=>XLXN_31(1),
                D5=>XLXN_32(1),
                D6=>XLXN_33(1),
                D7=>XLXN_34(1),
                E=>env,
                S0=>rd_addr2(0),
                S1=>rd_addr2(1),
                S2=>rd_addr2(2),
                O=>rd_data2_DUMMY(1));
   
   XLXI_4_2 : M8_1E_HXILINX_lab3_reg_file
      port map (D0=>XLXN_27(2),
                D1=>XLXN_28(2),
                D2=>XLXN_29(2),
                D3=>XLXN_30(2),
                D4=>XLXN_31(2),
                D5=>XLXN_32(2),
                D6=>XLXN_33(2),
                D7=>XLXN_34(2),
                E=>env,
                S0=>rd_addr2(0),
                S1=>rd_addr2(1),
                S2=>rd_addr2(2),
                O=>rd_data2_DUMMY(2));
   
   XLXI_4_3 : M8_1E_HXILINX_lab3_reg_file
      port map (D0=>XLXN_27(3),
                D1=>XLXN_28(3),
                D2=>XLXN_29(3),
                D3=>XLXN_30(3),
                D4=>XLXN_31(3),
                D5=>XLXN_32(3),
                D6=>XLXN_33(3),
                D7=>XLXN_34(3),
                E=>env,
                S0=>rd_addr2(0),
                S1=>rd_addr2(1),
                S2=>rd_addr2(2),
                O=>rd_data2_DUMMY(3));
   
   XLXI_5_0 : XOR2
      port map (I0=>rd_data2_DUMMY(0),
                I1=>rd_data1_DUMMY(0),
                O=>rd_data1_xor_data2_DUMMY(0));
   
   XLXI_5_1 : XOR2
      port map (I0=>rd_data2_DUMMY(1),
                I1=>rd_data1_DUMMY(1),
                O=>rd_data1_xor_data2_DUMMY(1));
   
   XLXI_5_2 : XOR2
      port map (I0=>rd_data2_DUMMY(2),
                I1=>rd_data1_DUMMY(2),
                O=>rd_data1_xor_data2_DUMMY(2));
   
   XLXI_5_3 : XOR2
      port map (I0=>rd_data2_DUMMY(3),
                I1=>rd_data1_DUMMY(3),
                O=>rd_data1_xor_data2_DUMMY(3));
   
   XLXI_6_0 : M2_1_HXILINX_lab3_reg_file
      port map (D0=>wr_data(0),
                D1=>rd_data1_xor_data2_DUMMY(0),
                S0=>mode,
                O=>XLXN_16(0));
   
   XLXI_6_1 : M2_1_HXILINX_lab3_reg_file
      port map (D0=>wr_data(1),
                D1=>rd_data1_xor_data2_DUMMY(1),
                S0=>mode,
                O=>XLXN_16(1));
   
   XLXI_6_2 : M2_1_HXILINX_lab3_reg_file
      port map (D0=>wr_data(2),
                D1=>rd_data1_xor_data2_DUMMY(2),
                S0=>mode,
                O=>XLXN_16(2));
   
   XLXI_6_3 : M2_1_HXILINX_lab3_reg_file
      port map (D0=>wr_data(3),
                D1=>rd_data1_xor_data2_DUMMY(3),
                S0=>mode,
                O=>XLXN_16(3));
   
   XLXI_7 : VCC
      port map (P=>env);
   
end BEHAVIORAL;


