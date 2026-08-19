/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sun Sep 28 21:41:57 2025
/////////////////////////////////////////////////////////////


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module RST_SYNC_NUM_STAGES2_test_0 ( clk, rst, SYNC_RST, test_si, test_se );
  input clk, rst, test_si, test_se;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  SDFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .SI(\sync_reg[0] ), .SE(
        test_se), .CK(clk), .RN(rst), .Q(SYNC_RST) );
  SDFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(\sync_reg[0] ) );
endmodule


module RST_SYNC_NUM_STAGES2_test_1 ( clk, rst, SYNC_RST, test_si, test_se );
  input clk, rst, test_si, test_se;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  SDFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .SI(\sync_reg[0] ), .SE(
        test_se), .CK(clk), .RN(rst), .Q(SYNC_RST) );
  SDFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(\sync_reg[0] ) );
endmodule


module DATA_SYNC_NUM_STAGES2_DATA_WIDTH8_test_1 ( CLK, RST, bus_enable, 
        Unsync_bus, sync_bus, enable_pulse, test_si, test_se );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable, test_si, test_se;
  output enable_pulse;
  wire   pulse_gen_reg, n1, n4, n6, n8, n10, n12, n14, n16, n18, n22;
  wire   [1:0] bit_sync_reg;

  SDFFRQX2M pulse_gen_reg_reg ( .D(bit_sync_reg[1]), .SI(enable_pulse), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(pulse_gen_reg) );
  SDFFRQX2M \bit_sync_reg_reg[1]  ( .D(bit_sync_reg[0]), .SI(bit_sync_reg[0]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(bit_sync_reg[1]) );
  SDFFRQX2M \sync_bus_reg[7]  ( .D(n4), .SI(sync_bus[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[4]  ( .D(n10), .SI(sync_bus[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[4]) );
  SDFFRQX2M \sync_bus_reg[6]  ( .D(n6), .SI(sync_bus[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[6]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(n8), .SI(sync_bus[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n12), .SI(sync_bus[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n18), .SI(pulse_gen_reg), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(n14), .SI(sync_bus[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[2]) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(n16), .SI(sync_bus[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[1]) );
  SDFFRQX2M \bit_sync_reg_reg[0]  ( .D(bus_enable), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(bit_sync_reg[0]) );
  SDFFRQX2M enable_pulse_reg ( .D(n22), .SI(bit_sync_reg[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(enable_pulse) );
  INVX2M U3 ( .A(n1), .Y(n22) );
  NAND2BX2M U4 ( .AN(pulse_gen_reg), .B(bit_sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_bus[7]), .A1(n22), .B0(sync_bus[7]), .B1(n1), .Y(n4)
         );
  AO22X1M U6 ( .A0(Unsync_bus[6]), .A1(n22), .B0(sync_bus[6]), .B1(n1), .Y(n6)
         );
  AO22X1M U7 ( .A0(Unsync_bus[5]), .A1(n22), .B0(sync_bus[5]), .B1(n1), .Y(n8)
         );
  AO22X1M U8 ( .A0(Unsync_bus[4]), .A1(n22), .B0(sync_bus[4]), .B1(n1), .Y(n10) );
  AO22X1M U9 ( .A0(Unsync_bus[3]), .A1(n22), .B0(sync_bus[3]), .B1(n1), .Y(n12) );
  AO22X1M U10 ( .A0(Unsync_bus[2]), .A1(n22), .B0(sync_bus[2]), .B1(n1), .Y(
        n14) );
  AO22X1M U11 ( .A0(Unsync_bus[1]), .A1(n22), .B0(sync_bus[1]), .B1(n1), .Y(
        n16) );
  AO22X1M U12 ( .A0(Unsync_bus[0]), .A1(n22), .B0(sync_bus[0]), .B1(n1), .Y(
        n18) );
endmodule


module FIFO_WR_ADDRES_WIDTH4_test_1 ( W_CLK, W_RST, W_INC, GRAY_R_ADD, FULL, 
        W_ADD, GRAY_W_ADD, test_si, test_se );
  input [3:0] GRAY_R_ADD;
  output [2:0] W_ADD;
  output [3:0] GRAY_W_ADD;
  input W_CLK, W_RST, W_INC, test_si, test_se;
  output FULL;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [3:0] COMP_GRAY_W_ADD;

  SDFFRQX2M \ADD_COUNTER_reg[3]  ( .D(n19), .SI(W_ADD[2]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(COMP_GRAY_W_ADD[3]) );
  SDFFRQX2M \ADD_COUNTER_reg[2]  ( .D(n20), .SI(W_ADD[1]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_ADD[2]) );
  SDFFRQX2M \GRAY_W_ADD_reg[3]  ( .D(COMP_GRAY_W_ADD[3]), .SI(GRAY_W_ADD[2]), 
        .SE(test_se), .CK(W_CLK), .RN(W_RST), .Q(GRAY_W_ADD[3]) );
  SDFFRQX2M \GRAY_W_ADD_reg[2]  ( .D(COMP_GRAY_W_ADD[2]), .SI(GRAY_W_ADD[1]), 
        .SE(test_se), .CK(W_CLK), .RN(W_RST), .Q(GRAY_W_ADD[2]) );
  SDFFRQX2M \GRAY_W_ADD_reg[1]  ( .D(COMP_GRAY_W_ADD[1]), .SI(GRAY_W_ADD[0]), 
        .SE(test_se), .CK(W_CLK), .RN(W_RST), .Q(GRAY_W_ADD[1]) );
  SDFFRQX2M \GRAY_W_ADD_reg[0]  ( .D(COMP_GRAY_W_ADD[0]), .SI(
        COMP_GRAY_W_ADD[3]), .SE(test_se), .CK(W_CLK), .RN(W_RST), .Q(
        GRAY_W_ADD[0]) );
  SDFFRX1M \ADD_COUNTER_reg[0]  ( .D(n22), .SI(test_si), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_ADD[0]), .QN(n9) );
  SDFFRQX2M \ADD_COUNTER_reg[1]  ( .D(n21), .SI(W_ADD[0]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_ADD[1]) );
  INVX2M U11 ( .A(n14), .Y(FULL) );
  NAND2X2M U12 ( .A(W_INC), .B(n14), .Y(n13) );
  XNOR2X2M U13 ( .A(COMP_GRAY_W_ADD[1]), .B(GRAY_R_ADD[1]), .Y(n15) );
  NAND4X2M U14 ( .A(n15), .B(n16), .C(n17), .D(n18), .Y(n14) );
  CLKXOR2X2M U15 ( .A(GRAY_R_ADD[3]), .B(COMP_GRAY_W_ADD[3]), .Y(n18) );
  XNOR2X2M U16 ( .A(COMP_GRAY_W_ADD[0]), .B(GRAY_R_ADD[0]), .Y(n16) );
  CLKXOR2X2M U17 ( .A(GRAY_R_ADD[2]), .B(COMP_GRAY_W_ADD[2]), .Y(n17) );
  CLKXOR2X2M U18 ( .A(COMP_GRAY_W_ADD[3]), .B(W_ADD[2]), .Y(COMP_GRAY_W_ADD[2]) );
  CLKXOR2X2M U19 ( .A(W_ADD[1]), .B(W_ADD[2]), .Y(COMP_GRAY_W_ADD[1]) );
  XNOR2X2M U20 ( .A(n9), .B(W_ADD[1]), .Y(COMP_GRAY_W_ADD[0]) );
  NOR2X2M U21 ( .A(n13), .B(n9), .Y(n12) );
  XNOR2X2M U22 ( .A(W_ADD[2]), .B(n11), .Y(n20) );
  XNOR2X2M U23 ( .A(COMP_GRAY_W_ADD[3]), .B(n10), .Y(n19) );
  NAND2BX2M U24 ( .AN(n11), .B(W_ADD[2]), .Y(n10) );
  NAND2X2M U25 ( .A(n12), .B(W_ADD[1]), .Y(n11) );
  CLKXOR2X2M U26 ( .A(W_ADD[1]), .B(n12), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n9), .B(n13), .Y(n22) );
endmodule


module FIFO_RD_ADDRES_WIDTH4_test_1 ( R_CLK, R_RST, R_INC, GRAY_W_ADD, EMPTY, 
        GRAY_R_ADD, R_ADD, test_si, test_so, test_se );
  input [3:0] GRAY_W_ADD;
  output [3:0] GRAY_R_ADD;
  output [2:0] R_ADD;
  input R_CLK, R_RST, R_INC, test_si, test_se;
  output EMPTY, test_so;
  wire   \R_ADD_COUNTER[3] , n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22;
  wire   [2:0] COMB_GRAY_R_ADD;
  assign test_so = \R_ADD_COUNTER[3] ;

  SDFFRQX2M \R_ADD_COUNTER_reg[3]  ( .D(n19), .SI(R_ADD[2]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(\R_ADD_COUNTER[3] ) );
  SDFFRQX2M \R_ADD_COUNTER_reg[2]  ( .D(n20), .SI(R_ADD[1]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(R_ADD[2]) );
  SDFFRQX2M \GRAY_R_ADD_reg[3]  ( .D(\R_ADD_COUNTER[3] ), .SI(GRAY_R_ADD[2]), 
        .SE(test_se), .CK(R_CLK), .RN(R_RST), .Q(GRAY_R_ADD[3]) );
  SDFFRQX2M \GRAY_R_ADD_reg[2]  ( .D(COMB_GRAY_R_ADD[2]), .SI(GRAY_R_ADD[1]), 
        .SE(test_se), .CK(R_CLK), .RN(R_RST), .Q(GRAY_R_ADD[2]) );
  SDFFRQX2M \GRAY_R_ADD_reg[1]  ( .D(COMB_GRAY_R_ADD[1]), .SI(GRAY_R_ADD[0]), 
        .SE(test_se), .CK(R_CLK), .RN(R_RST), .Q(GRAY_R_ADD[1]) );
  SDFFRQX2M \GRAY_R_ADD_reg[0]  ( .D(COMB_GRAY_R_ADD[0]), .SI(test_si), .SE(
        test_se), .CK(R_CLK), .RN(R_RST), .Q(GRAY_R_ADD[0]) );
  SDFFRQX2M \R_ADD_COUNTER_reg[1]  ( .D(n21), .SI(n9), .SE(test_se), .CK(R_CLK), .RN(R_RST), .Q(R_ADD[1]) );
  SDFFRX1M \R_ADD_COUNTER_reg[0]  ( .D(n22), .SI(GRAY_R_ADD[3]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(R_ADD[0]), .QN(n9) );
  INVX2M U12 ( .A(n14), .Y(EMPTY) );
  XNOR2X2M U13 ( .A(COMB_GRAY_R_ADD[1]), .B(GRAY_W_ADD[1]), .Y(n15) );
  NOR2X2M U14 ( .A(n13), .B(n9), .Y(n12) );
  XNOR2X2M U15 ( .A(\R_ADD_COUNTER[3] ), .B(n10), .Y(n19) );
  NAND2BX2M U16 ( .AN(n11), .B(R_ADD[2]), .Y(n10) );
  NAND4X2M U17 ( .A(n15), .B(n16), .C(n17), .D(n18), .Y(n14) );
  XNOR2X2M U18 ( .A(\R_ADD_COUNTER[3] ), .B(GRAY_W_ADD[3]), .Y(n17) );
  XNOR2X2M U19 ( .A(COMB_GRAY_R_ADD[0]), .B(GRAY_W_ADD[0]), .Y(n16) );
  XNOR2X2M U20 ( .A(COMB_GRAY_R_ADD[2]), .B(GRAY_W_ADD[2]), .Y(n18) );
  NAND2X2M U21 ( .A(n12), .B(R_ADD[1]), .Y(n11) );
  NAND2X2M U22 ( .A(R_INC), .B(n14), .Y(n13) );
  CLKXOR2X2M U23 ( .A(R_ADD[1]), .B(R_ADD[2]), .Y(COMB_GRAY_R_ADD[1]) );
  XNOR2X2M U24 ( .A(n9), .B(R_ADD[1]), .Y(COMB_GRAY_R_ADD[0]) );
  XNOR2X2M U25 ( .A(R_ADD[2]), .B(n11), .Y(n20) );
  CLKXOR2X2M U26 ( .A(\R_ADD_COUNTER[3] ), .B(R_ADD[2]), .Y(COMB_GRAY_R_ADD[2]) );
  CLKXOR2X2M U27 ( .A(R_ADD[1]), .B(n12), .Y(n21) );
  CLKXOR2X2M U28 ( .A(n9), .B(n13), .Y(n22) );
endmodule


module FIFO_MEM_CNTRL_ADDRES_WIDTH4_DATA_WIDTH8_FIFO_DEPTH8_test_1 ( W_CLK, 
        W_RST, W_INC, FULL, WR_DATA, R_ADD, W_ADD, RD_DATA, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [7:0] WR_DATA;
  input [2:0] R_ADD;
  input [2:0] W_ADD;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, FULL, test_si2, test_si1, test_se;
  output test_so2, test_so1;
  wire   N9, N10, N11, \MEMORY[7][7] , \MEMORY[7][6] , \MEMORY[7][5] ,
         \MEMORY[7][4] , \MEMORY[7][3] , \MEMORY[7][2] , \MEMORY[7][1] ,
         \MEMORY[7][0] , \MEMORY[6][7] , \MEMORY[6][6] , \MEMORY[6][5] ,
         \MEMORY[6][4] , \MEMORY[6][3] , \MEMORY[6][2] , \MEMORY[6][1] ,
         \MEMORY[6][0] , \MEMORY[5][7] , \MEMORY[5][6] , \MEMORY[5][5] ,
         \MEMORY[5][4] , \MEMORY[5][3] , \MEMORY[5][2] , \MEMORY[5][1] ,
         \MEMORY[5][0] , \MEMORY[4][7] , \MEMORY[4][6] , \MEMORY[4][5] ,
         \MEMORY[4][4] , \MEMORY[4][3] , \MEMORY[4][2] , \MEMORY[4][1] ,
         \MEMORY[4][0] , \MEMORY[3][7] , \MEMORY[3][6] , \MEMORY[3][5] ,
         \MEMORY[3][4] , \MEMORY[3][3] , \MEMORY[3][2] , \MEMORY[3][1] ,
         \MEMORY[3][0] , \MEMORY[2][7] , \MEMORY[2][6] , \MEMORY[2][5] ,
         \MEMORY[2][4] , \MEMORY[2][3] , \MEMORY[2][2] , \MEMORY[2][1] ,
         \MEMORY[2][0] , \MEMORY[1][7] , \MEMORY[1][6] , \MEMORY[1][5] ,
         \MEMORY[1][4] , \MEMORY[1][3] , \MEMORY[1][2] , \MEMORY[1][1] ,
         \MEMORY[1][0] , \MEMORY[0][7] , \MEMORY[0][6] , \MEMORY[0][5] ,
         \MEMORY[0][4] , \MEMORY[0][3] , \MEMORY[0][2] , \MEMORY[0][1] ,
         \MEMORY[0][0] , n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n184, n185, n186, n187, n188;
  assign N9 = R_ADD[0];
  assign N10 = R_ADD[1];
  assign N11 = R_ADD[2];
  assign test_so2 = \MEMORY[7][7] ;
  assign test_so1 = \MEMORY[7][4] ;

  SDFFRQX2M \MEMORY_reg[5][3]  ( .D(n129), .SI(\MEMORY[5][2] ), .SE(n188), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[5][3] ) );
  SDFFRQX2M \MEMORY_reg[5][2]  ( .D(n128), .SI(\MEMORY[5][1] ), .SE(n187), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[5][2] ) );
  SDFFRQX2M \MEMORY_reg[5][1]  ( .D(n127), .SI(\MEMORY[5][0] ), .SE(n186), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[5][1] ) );
  SDFFRQX2M \MEMORY_reg[5][0]  ( .D(n126), .SI(\MEMORY[4][7] ), .SE(n185), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[5][0] ) );
  SDFFRQX2M \MEMORY_reg[1][3]  ( .D(n97), .SI(\MEMORY[1][2] ), .SE(n188), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[1][3] ) );
  SDFFRQX2M \MEMORY_reg[1][2]  ( .D(n96), .SI(\MEMORY[1][1] ), .SE(n187), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[1][2] ) );
  SDFFRQX2M \MEMORY_reg[1][1]  ( .D(n95), .SI(\MEMORY[1][0] ), .SE(n186), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[1][1] ) );
  SDFFRQX2M \MEMORY_reg[1][0]  ( .D(n94), .SI(\MEMORY[0][7] ), .SE(n185), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[1][0] ) );
  SDFFRQX2M \MEMORY_reg[7][3]  ( .D(n145), .SI(\MEMORY[7][2] ), .SE(n188), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[7][3] ) );
  SDFFRQX2M \MEMORY_reg[7][2]  ( .D(n144), .SI(\MEMORY[7][1] ), .SE(n187), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[7][2] ) );
  SDFFRQX2M \MEMORY_reg[7][1]  ( .D(n143), .SI(\MEMORY[7][0] ), .SE(n186), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[7][1] ) );
  SDFFRQX2M \MEMORY_reg[7][0]  ( .D(n142), .SI(\MEMORY[6][7] ), .SE(n185), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[7][0] ) );
  SDFFRQX2M \MEMORY_reg[3][3]  ( .D(n113), .SI(\MEMORY[3][2] ), .SE(n188), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[3][3] ) );
  SDFFRQX2M \MEMORY_reg[3][2]  ( .D(n112), .SI(\MEMORY[3][1] ), .SE(n187), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[3][2] ) );
  SDFFRQX2M \MEMORY_reg[3][1]  ( .D(n111), .SI(\MEMORY[3][0] ), .SE(n186), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[3][1] ) );
  SDFFRQX2M \MEMORY_reg[3][0]  ( .D(n110), .SI(\MEMORY[2][7] ), .SE(n185), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[3][0] ) );
  SDFFRQX2M \MEMORY_reg[6][3]  ( .D(n137), .SI(\MEMORY[6][2] ), .SE(n188), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[6][3] ) );
  SDFFRQX2M \MEMORY_reg[6][2]  ( .D(n136), .SI(\MEMORY[6][1] ), .SE(n187), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[6][2] ) );
  SDFFRQX2M \MEMORY_reg[6][1]  ( .D(n135), .SI(\MEMORY[6][0] ), .SE(n186), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[6][1] ) );
  SDFFRQX2M \MEMORY_reg[6][0]  ( .D(n134), .SI(\MEMORY[5][7] ), .SE(n185), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[6][0] ) );
  SDFFRQX2M \MEMORY_reg[2][3]  ( .D(n105), .SI(\MEMORY[2][2] ), .SE(n188), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[2][3] ) );
  SDFFRQX2M \MEMORY_reg[2][2]  ( .D(n104), .SI(\MEMORY[2][1] ), .SE(n187), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[2][2] ) );
  SDFFRQX2M \MEMORY_reg[2][1]  ( .D(n103), .SI(\MEMORY[2][0] ), .SE(n186), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[2][1] ) );
  SDFFRQX2M \MEMORY_reg[2][0]  ( .D(n102), .SI(\MEMORY[1][7] ), .SE(n185), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[2][0] ) );
  SDFFRQX2M \MEMORY_reg[4][3]  ( .D(n121), .SI(\MEMORY[4][2] ), .SE(n188), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[4][3] ) );
  SDFFRQX2M \MEMORY_reg[4][2]  ( .D(n120), .SI(\MEMORY[4][1] ), .SE(n187), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[4][2] ) );
  SDFFRQX2M \MEMORY_reg[4][1]  ( .D(n119), .SI(\MEMORY[4][0] ), .SE(n186), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[4][1] ) );
  SDFFRQX2M \MEMORY_reg[4][0]  ( .D(n118), .SI(\MEMORY[3][7] ), .SE(n185), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[4][0] ) );
  SDFFRQX2M \MEMORY_reg[0][3]  ( .D(n89), .SI(\MEMORY[0][2] ), .SE(n188), .CK(
        W_CLK), .RN(n170), .Q(\MEMORY[0][3] ) );
  SDFFRQX2M \MEMORY_reg[0][2]  ( .D(n88), .SI(\MEMORY[0][1] ), .SE(n187), .CK(
        W_CLK), .RN(n170), .Q(\MEMORY[0][2] ) );
  SDFFRQX2M \MEMORY_reg[0][1]  ( .D(n87), .SI(\MEMORY[0][0] ), .SE(n186), .CK(
        W_CLK), .RN(n170), .Q(\MEMORY[0][1] ) );
  SDFFRQX2M \MEMORY_reg[0][0]  ( .D(n86), .SI(test_si1), .SE(n185), .CK(W_CLK), 
        .RN(n170), .Q(\MEMORY[0][0] ) );
  SDFFRQX2M \MEMORY_reg[5][7]  ( .D(n133), .SI(\MEMORY[5][6] ), .SE(n188), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[5][7] ) );
  SDFFRQX2M \MEMORY_reg[5][6]  ( .D(n132), .SI(\MEMORY[5][5] ), .SE(n187), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[5][6] ) );
  SDFFRQX2M \MEMORY_reg[5][5]  ( .D(n131), .SI(\MEMORY[5][4] ), .SE(n186), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[5][5] ) );
  SDFFRQX2M \MEMORY_reg[5][4]  ( .D(n130), .SI(\MEMORY[5][3] ), .SE(n185), 
        .CK(W_CLK), .RN(n166), .Q(\MEMORY[5][4] ) );
  SDFFRQX2M \MEMORY_reg[1][7]  ( .D(n101), .SI(\MEMORY[1][6] ), .SE(n188), 
        .CK(W_CLK), .RN(n169), .Q(\MEMORY[1][7] ) );
  SDFFRQX2M \MEMORY_reg[1][6]  ( .D(n100), .SI(\MEMORY[1][5] ), .SE(n187), 
        .CK(W_CLK), .RN(n169), .Q(\MEMORY[1][6] ) );
  SDFFRQX2M \MEMORY_reg[1][5]  ( .D(n99), .SI(\MEMORY[1][4] ), .SE(n186), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[1][5] ) );
  SDFFRQX2M \MEMORY_reg[1][4]  ( .D(n98), .SI(\MEMORY[1][3] ), .SE(n185), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[1][4] ) );
  SDFFRQX2M \MEMORY_reg[7][7]  ( .D(n149), .SI(\MEMORY[7][6] ), .SE(n188), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[7][7] ) );
  SDFFRQX2M \MEMORY_reg[7][6]  ( .D(n148), .SI(\MEMORY[7][5] ), .SE(n187), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[7][6] ) );
  SDFFRQX2M \MEMORY_reg[7][5]  ( .D(n147), .SI(test_si2), .SE(n186), .CK(W_CLK), .RN(n165), .Q(\MEMORY[7][5] ) );
  SDFFRQX2M \MEMORY_reg[7][4]  ( .D(n146), .SI(\MEMORY[7][3] ), .SE(n185), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[7][4] ) );
  SDFFRQX2M \MEMORY_reg[3][7]  ( .D(n117), .SI(\MEMORY[3][6] ), .SE(n188), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[3][7] ) );
  SDFFRQX2M \MEMORY_reg[3][6]  ( .D(n116), .SI(\MEMORY[3][5] ), .SE(n187), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[3][6] ) );
  SDFFRQX2M \MEMORY_reg[3][5]  ( .D(n115), .SI(\MEMORY[3][4] ), .SE(n186), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[3][5] ) );
  SDFFRQX2M \MEMORY_reg[3][4]  ( .D(n114), .SI(\MEMORY[3][3] ), .SE(n185), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[3][4] ) );
  SDFFRQX2M \MEMORY_reg[6][7]  ( .D(n141), .SI(\MEMORY[6][6] ), .SE(n188), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[6][7] ) );
  SDFFRQX2M \MEMORY_reg[6][6]  ( .D(n140), .SI(\MEMORY[6][5] ), .SE(n187), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[6][6] ) );
  SDFFRQX2M \MEMORY_reg[6][5]  ( .D(n139), .SI(\MEMORY[6][4] ), .SE(n186), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[6][5] ) );
  SDFFRQX2M \MEMORY_reg[6][4]  ( .D(n138), .SI(\MEMORY[6][3] ), .SE(n185), 
        .CK(W_CLK), .RN(n165), .Q(\MEMORY[6][4] ) );
  SDFFRQX2M \MEMORY_reg[2][7]  ( .D(n109), .SI(\MEMORY[2][6] ), .SE(n188), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[2][7] ) );
  SDFFRQX2M \MEMORY_reg[2][6]  ( .D(n108), .SI(\MEMORY[2][5] ), .SE(n187), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[2][6] ) );
  SDFFRQX2M \MEMORY_reg[2][5]  ( .D(n107), .SI(\MEMORY[2][4] ), .SE(n186), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[2][5] ) );
  SDFFRQX2M \MEMORY_reg[2][4]  ( .D(n106), .SI(\MEMORY[2][3] ), .SE(n185), 
        .CK(W_CLK), .RN(n168), .Q(\MEMORY[2][4] ) );
  SDFFRQX2M \MEMORY_reg[4][7]  ( .D(n125), .SI(\MEMORY[4][6] ), .SE(n188), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[4][7] ) );
  SDFFRQX2M \MEMORY_reg[4][6]  ( .D(n124), .SI(\MEMORY[4][5] ), .SE(n187), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[4][6] ) );
  SDFFRQX2M \MEMORY_reg[4][5]  ( .D(n123), .SI(\MEMORY[4][4] ), .SE(n186), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[4][5] ) );
  SDFFRQX2M \MEMORY_reg[4][4]  ( .D(n122), .SI(\MEMORY[4][3] ), .SE(n185), 
        .CK(W_CLK), .RN(n167), .Q(\MEMORY[4][4] ) );
  SDFFRQX2M \MEMORY_reg[0][7]  ( .D(n93), .SI(\MEMORY[0][6] ), .SE(n188), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[0][7] ) );
  SDFFRQX2M \MEMORY_reg[0][6]  ( .D(n92), .SI(\MEMORY[0][5] ), .SE(n187), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[0][6] ) );
  SDFFRQX2M \MEMORY_reg[0][5]  ( .D(n91), .SI(\MEMORY[0][4] ), .SE(n186), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[0][5] ) );
  SDFFRQX2M \MEMORY_reg[0][4]  ( .D(n90), .SI(\MEMORY[0][3] ), .SE(n185), .CK(
        W_CLK), .RN(n169), .Q(\MEMORY[0][4] ) );
  BUFX2M U66 ( .A(n83), .Y(n159) );
  BUFX2M U67 ( .A(n84), .Y(n158) );
  BUFX2M U68 ( .A(n85), .Y(n157) );
  BUFX2M U69 ( .A(n77), .Y(n162) );
  BUFX2M U70 ( .A(n78), .Y(n161) );
  BUFX2M U71 ( .A(n164), .Y(n169) );
  BUFX2M U72 ( .A(n164), .Y(n168) );
  BUFX2M U73 ( .A(n163), .Y(n167) );
  BUFX2M U74 ( .A(n163), .Y(n166) );
  BUFX2M U75 ( .A(n163), .Y(n165) );
  BUFX2M U76 ( .A(n164), .Y(n170) );
  NOR2BX2M U77 ( .AN(W_INC), .B(FULL), .Y(n80) );
  BUFX2M U78 ( .A(W_RST), .Y(n164) );
  BUFX2M U79 ( .A(W_RST), .Y(n163) );
  NAND3X2M U80 ( .A(n179), .B(n180), .C(n76), .Y(n75) );
  NAND3X2M U81 ( .A(n179), .B(n180), .C(n82), .Y(n81) );
  NOR2BX2M U82 ( .AN(n80), .B(W_ADD[2]), .Y(n76) );
  OAI2BB2X1M U83 ( .B0(n75), .B1(n171), .A0N(\MEMORY[0][0] ), .A1N(n75), .Y(
        n86) );
  OAI2BB2X1M U84 ( .B0(n75), .B1(n172), .A0N(\MEMORY[0][1] ), .A1N(n75), .Y(
        n87) );
  OAI2BB2X1M U85 ( .B0(n75), .B1(n173), .A0N(\MEMORY[0][2] ), .A1N(n75), .Y(
        n88) );
  OAI2BB2X1M U86 ( .B0(n75), .B1(n174), .A0N(\MEMORY[0][3] ), .A1N(n75), .Y(
        n89) );
  OAI2BB2X1M U87 ( .B0(n75), .B1(n175), .A0N(\MEMORY[0][4] ), .A1N(n75), .Y(
        n90) );
  OAI2BB2X1M U88 ( .B0(n75), .B1(n176), .A0N(\MEMORY[0][5] ), .A1N(n75), .Y(
        n91) );
  OAI2BB2X1M U89 ( .B0(n75), .B1(n177), .A0N(\MEMORY[0][6] ), .A1N(n75), .Y(
        n92) );
  OAI2BB2X1M U90 ( .B0(n75), .B1(n178), .A0N(\MEMORY[0][7] ), .A1N(n75), .Y(
        n93) );
  OAI2BB2X1M U91 ( .B0(n171), .B1(n81), .A0N(\MEMORY[4][0] ), .A1N(n81), .Y(
        n118) );
  OAI2BB2X1M U92 ( .B0(n172), .B1(n81), .A0N(\MEMORY[4][1] ), .A1N(n81), .Y(
        n119) );
  OAI2BB2X1M U93 ( .B0(n173), .B1(n81), .A0N(\MEMORY[4][2] ), .A1N(n81), .Y(
        n120) );
  OAI2BB2X1M U94 ( .B0(n174), .B1(n81), .A0N(\MEMORY[4][3] ), .A1N(n81), .Y(
        n121) );
  OAI2BB2X1M U95 ( .B0(n175), .B1(n81), .A0N(\MEMORY[4][4] ), .A1N(n81), .Y(
        n122) );
  OAI2BB2X1M U96 ( .B0(n176), .B1(n81), .A0N(\MEMORY[4][5] ), .A1N(n81), .Y(
        n123) );
  OAI2BB2X1M U97 ( .B0(n177), .B1(n81), .A0N(\MEMORY[4][6] ), .A1N(n81), .Y(
        n124) );
  OAI2BB2X1M U98 ( .B0(n178), .B1(n81), .A0N(\MEMORY[4][7] ), .A1N(n81), .Y(
        n125) );
  BUFX4M U99 ( .A(N9), .Y(n156) );
  MX2X2M U100 ( .A(n155), .B(n154), .S0(N11), .Y(RD_DATA[7]) );
  MX4X1M U101 ( .A(\MEMORY[0][7] ), .B(\MEMORY[1][7] ), .C(\MEMORY[2][7] ), 
        .D(\MEMORY[3][7] ), .S0(n156), .S1(N10), .Y(n155) );
  MX4X1M U102 ( .A(\MEMORY[4][7] ), .B(\MEMORY[5][7] ), .C(\MEMORY[6][7] ), 
        .D(\MEMORY[7][7] ), .S0(n156), .S1(N10), .Y(n154) );
  INVX2M U103 ( .A(WR_DATA[0]), .Y(n171) );
  INVX2M U104 ( .A(WR_DATA[1]), .Y(n172) );
  INVX2M U105 ( .A(WR_DATA[2]), .Y(n173) );
  INVX2M U106 ( .A(WR_DATA[3]), .Y(n174) );
  INVX2M U107 ( .A(WR_DATA[4]), .Y(n175) );
  INVX2M U108 ( .A(WR_DATA[5]), .Y(n176) );
  INVX2M U109 ( .A(WR_DATA[6]), .Y(n177) );
  INVX2M U110 ( .A(WR_DATA[7]), .Y(n178) );
  BUFX2M U111 ( .A(n79), .Y(n160) );
  NAND3X2M U112 ( .A(W_ADD[0]), .B(n76), .C(W_ADD[1]), .Y(n79) );
  OAI2BB2X1M U113 ( .B0(n171), .B1(n162), .A0N(\MEMORY[1][0] ), .A1N(n162), 
        .Y(n94) );
  OAI2BB2X1M U114 ( .B0(n172), .B1(n162), .A0N(\MEMORY[1][1] ), .A1N(n162), 
        .Y(n95) );
  OAI2BB2X1M U115 ( .B0(n173), .B1(n162), .A0N(\MEMORY[1][2] ), .A1N(n162), 
        .Y(n96) );
  OAI2BB2X1M U116 ( .B0(n174), .B1(n162), .A0N(\MEMORY[1][3] ), .A1N(n162), 
        .Y(n97) );
  OAI2BB2X1M U117 ( .B0(n175), .B1(n162), .A0N(\MEMORY[1][4] ), .A1N(n162), 
        .Y(n98) );
  OAI2BB2X1M U118 ( .B0(n176), .B1(n162), .A0N(\MEMORY[1][5] ), .A1N(n162), 
        .Y(n99) );
  OAI2BB2X1M U119 ( .B0(n177), .B1(n162), .A0N(\MEMORY[1][6] ), .A1N(n162), 
        .Y(n100) );
  OAI2BB2X1M U120 ( .B0(n178), .B1(n162), .A0N(\MEMORY[1][7] ), .A1N(n162), 
        .Y(n101) );
  OAI2BB2X1M U121 ( .B0(n171), .B1(n161), .A0N(\MEMORY[2][0] ), .A1N(n161), 
        .Y(n102) );
  OAI2BB2X1M U122 ( .B0(n172), .B1(n161), .A0N(\MEMORY[2][1] ), .A1N(n161), 
        .Y(n103) );
  OAI2BB2X1M U123 ( .B0(n173), .B1(n161), .A0N(\MEMORY[2][2] ), .A1N(n161), 
        .Y(n104) );
  OAI2BB2X1M U124 ( .B0(n174), .B1(n161), .A0N(\MEMORY[2][3] ), .A1N(n161), 
        .Y(n105) );
  OAI2BB2X1M U125 ( .B0(n175), .B1(n161), .A0N(\MEMORY[2][4] ), .A1N(n161), 
        .Y(n106) );
  OAI2BB2X1M U126 ( .B0(n176), .B1(n161), .A0N(\MEMORY[2][5] ), .A1N(n161), 
        .Y(n107) );
  OAI2BB2X1M U127 ( .B0(n177), .B1(n161), .A0N(\MEMORY[2][6] ), .A1N(n161), 
        .Y(n108) );
  OAI2BB2X1M U128 ( .B0(n178), .B1(n161), .A0N(\MEMORY[2][7] ), .A1N(n161), 
        .Y(n109) );
  OAI2BB2X1M U129 ( .B0(n171), .B1(n160), .A0N(\MEMORY[3][0] ), .A1N(n160), 
        .Y(n110) );
  OAI2BB2X1M U130 ( .B0(n172), .B1(n160), .A0N(\MEMORY[3][1] ), .A1N(n160), 
        .Y(n111) );
  OAI2BB2X1M U131 ( .B0(n173), .B1(n160), .A0N(\MEMORY[3][2] ), .A1N(n160), 
        .Y(n112) );
  OAI2BB2X1M U132 ( .B0(n174), .B1(n160), .A0N(\MEMORY[3][3] ), .A1N(n160), 
        .Y(n113) );
  OAI2BB2X1M U133 ( .B0(n175), .B1(n160), .A0N(\MEMORY[3][4] ), .A1N(n160), 
        .Y(n114) );
  OAI2BB2X1M U134 ( .B0(n176), .B1(n160), .A0N(\MEMORY[3][5] ), .A1N(n160), 
        .Y(n115) );
  OAI2BB2X1M U135 ( .B0(n177), .B1(n160), .A0N(\MEMORY[3][6] ), .A1N(n160), 
        .Y(n116) );
  OAI2BB2X1M U136 ( .B0(n178), .B1(n160), .A0N(\MEMORY[3][7] ), .A1N(n160), 
        .Y(n117) );
  OAI2BB2X1M U137 ( .B0(n171), .B1(n159), .A0N(\MEMORY[5][0] ), .A1N(n159), 
        .Y(n126) );
  OAI2BB2X1M U138 ( .B0(n172), .B1(n159), .A0N(\MEMORY[5][1] ), .A1N(n159), 
        .Y(n127) );
  OAI2BB2X1M U139 ( .B0(n173), .B1(n159), .A0N(\MEMORY[5][2] ), .A1N(n159), 
        .Y(n128) );
  OAI2BB2X1M U140 ( .B0(n174), .B1(n159), .A0N(\MEMORY[5][3] ), .A1N(n159), 
        .Y(n129) );
  OAI2BB2X1M U141 ( .B0(n175), .B1(n159), .A0N(\MEMORY[5][4] ), .A1N(n159), 
        .Y(n130) );
  OAI2BB2X1M U142 ( .B0(n176), .B1(n159), .A0N(\MEMORY[5][5] ), .A1N(n159), 
        .Y(n131) );
  OAI2BB2X1M U143 ( .B0(n177), .B1(n159), .A0N(\MEMORY[5][6] ), .A1N(n159), 
        .Y(n132) );
  OAI2BB2X1M U144 ( .B0(n178), .B1(n159), .A0N(\MEMORY[5][7] ), .A1N(n159), 
        .Y(n133) );
  OAI2BB2X1M U145 ( .B0(n171), .B1(n158), .A0N(\MEMORY[6][0] ), .A1N(n158), 
        .Y(n134) );
  OAI2BB2X1M U146 ( .B0(n172), .B1(n158), .A0N(\MEMORY[6][1] ), .A1N(n158), 
        .Y(n135) );
  OAI2BB2X1M U147 ( .B0(n173), .B1(n158), .A0N(\MEMORY[6][2] ), .A1N(n158), 
        .Y(n136) );
  OAI2BB2X1M U148 ( .B0(n174), .B1(n158), .A0N(\MEMORY[6][3] ), .A1N(n158), 
        .Y(n137) );
  OAI2BB2X1M U149 ( .B0(n175), .B1(n158), .A0N(\MEMORY[6][4] ), .A1N(n158), 
        .Y(n138) );
  OAI2BB2X1M U150 ( .B0(n176), .B1(n158), .A0N(\MEMORY[6][5] ), .A1N(n158), 
        .Y(n139) );
  OAI2BB2X1M U151 ( .B0(n177), .B1(n158), .A0N(\MEMORY[6][6] ), .A1N(n158), 
        .Y(n140) );
  OAI2BB2X1M U152 ( .B0(n178), .B1(n158), .A0N(\MEMORY[6][7] ), .A1N(n158), 
        .Y(n141) );
  OAI2BB2X1M U153 ( .B0(n171), .B1(n157), .A0N(\MEMORY[7][0] ), .A1N(n157), 
        .Y(n142) );
  OAI2BB2X1M U154 ( .B0(n172), .B1(n157), .A0N(\MEMORY[7][1] ), .A1N(n157), 
        .Y(n143) );
  OAI2BB2X1M U155 ( .B0(n173), .B1(n157), .A0N(\MEMORY[7][2] ), .A1N(n157), 
        .Y(n144) );
  OAI2BB2X1M U156 ( .B0(n174), .B1(n157), .A0N(\MEMORY[7][3] ), .A1N(n157), 
        .Y(n145) );
  OAI2BB2X1M U157 ( .B0(n175), .B1(n157), .A0N(\MEMORY[7][4] ), .A1N(n157), 
        .Y(n146) );
  OAI2BB2X1M U158 ( .B0(n176), .B1(n157), .A0N(\MEMORY[7][5] ), .A1N(n157), 
        .Y(n147) );
  OAI2BB2X1M U159 ( .B0(n177), .B1(n157), .A0N(\MEMORY[7][6] ), .A1N(n157), 
        .Y(n148) );
  OAI2BB2X1M U160 ( .B0(n178), .B1(n157), .A0N(\MEMORY[7][7] ), .A1N(n157), 
        .Y(n149) );
  AND2X2M U161 ( .A(W_ADD[2]), .B(n80), .Y(n82) );
  MX2X2M U162 ( .A(n153), .B(n152), .S0(N11), .Y(RD_DATA[6]) );
  MX4X1M U163 ( .A(\MEMORY[0][6] ), .B(\MEMORY[1][6] ), .C(\MEMORY[2][6] ), 
        .D(\MEMORY[3][6] ), .S0(n156), .S1(N10), .Y(n153) );
  MX4X1M U164 ( .A(\MEMORY[4][6] ), .B(\MEMORY[5][6] ), .C(\MEMORY[6][6] ), 
        .D(\MEMORY[7][6] ), .S0(n156), .S1(N10), .Y(n152) );
  NAND3X2M U165 ( .A(W_ADD[1]), .B(W_ADD[0]), .C(n82), .Y(n85) );
  NAND3X2M U166 ( .A(W_ADD[0]), .B(n180), .C(n82), .Y(n83) );
  NAND3X2M U167 ( .A(W_ADD[1]), .B(n179), .C(n82), .Y(n84) );
  MX2X2M U168 ( .A(n70), .B(n69), .S0(N11), .Y(RD_DATA[2]) );
  MX4X1M U169 ( .A(\MEMORY[0][2] ), .B(\MEMORY[1][2] ), .C(\MEMORY[2][2] ), 
        .D(\MEMORY[3][2] ), .S0(n156), .S1(N10), .Y(n70) );
  MX4X1M U170 ( .A(\MEMORY[4][2] ), .B(\MEMORY[5][2] ), .C(\MEMORY[6][2] ), 
        .D(\MEMORY[7][2] ), .S0(n156), .S1(N10), .Y(n69) );
  NAND3X2M U171 ( .A(n76), .B(n180), .C(W_ADD[0]), .Y(n77) );
  MX2X2M U172 ( .A(n72), .B(n71), .S0(N11), .Y(RD_DATA[3]) );
  MX4X1M U173 ( .A(\MEMORY[0][3] ), .B(\MEMORY[1][3] ), .C(\MEMORY[2][3] ), 
        .D(\MEMORY[3][3] ), .S0(n156), .S1(N10), .Y(n72) );
  MX4X1M U174 ( .A(\MEMORY[4][3] ), .B(\MEMORY[5][3] ), .C(\MEMORY[6][3] ), 
        .D(\MEMORY[7][3] ), .S0(n156), .S1(N10), .Y(n71) );
  NAND3X2M U175 ( .A(n76), .B(n179), .C(W_ADD[1]), .Y(n78) );
  MX2X2M U176 ( .A(n74), .B(n73), .S0(N11), .Y(RD_DATA[4]) );
  MX4X1M U177 ( .A(\MEMORY[0][4] ), .B(\MEMORY[1][4] ), .C(\MEMORY[2][4] ), 
        .D(\MEMORY[3][4] ), .S0(n156), .S1(N10), .Y(n74) );
  MX4X1M U178 ( .A(\MEMORY[4][4] ), .B(\MEMORY[5][4] ), .C(\MEMORY[6][4] ), 
        .D(\MEMORY[7][4] ), .S0(n156), .S1(N10), .Y(n73) );
  MX2X2M U179 ( .A(n66), .B(n65), .S0(N11), .Y(RD_DATA[0]) );
  MX4X1M U180 ( .A(\MEMORY[0][0] ), .B(\MEMORY[1][0] ), .C(\MEMORY[2][0] ), 
        .D(\MEMORY[3][0] ), .S0(n156), .S1(N10), .Y(n66) );
  MX4X1M U181 ( .A(\MEMORY[4][0] ), .B(\MEMORY[5][0] ), .C(\MEMORY[6][0] ), 
        .D(\MEMORY[7][0] ), .S0(n156), .S1(N10), .Y(n65) );
  MX2X2M U182 ( .A(n151), .B(n150), .S0(N11), .Y(RD_DATA[5]) );
  MX4X1M U183 ( .A(\MEMORY[0][5] ), .B(\MEMORY[1][5] ), .C(\MEMORY[2][5] ), 
        .D(\MEMORY[3][5] ), .S0(n156), .S1(N10), .Y(n151) );
  MX4X1M U184 ( .A(\MEMORY[4][5] ), .B(\MEMORY[5][5] ), .C(\MEMORY[6][5] ), 
        .D(\MEMORY[7][5] ), .S0(n156), .S1(N10), .Y(n150) );
  MX2X2M U185 ( .A(n68), .B(n67), .S0(N11), .Y(RD_DATA[1]) );
  MX4X1M U186 ( .A(\MEMORY[0][1] ), .B(\MEMORY[1][1] ), .C(\MEMORY[2][1] ), 
        .D(\MEMORY[3][1] ), .S0(n156), .S1(N10), .Y(n68) );
  MX4X1M U187 ( .A(\MEMORY[4][1] ), .B(\MEMORY[5][1] ), .C(\MEMORY[6][1] ), 
        .D(\MEMORY[7][1] ), .S0(n156), .S1(N10), .Y(n67) );
  INVX2M U188 ( .A(W_ADD[0]), .Y(n179) );
  INVX2M U189 ( .A(W_ADD[1]), .Y(n180) );
  INVXLM U190 ( .A(test_se), .Y(n184) );
  INVXLM U191 ( .A(n184), .Y(n185) );
  INVXLM U192 ( .A(n184), .Y(n186) );
  INVXLM U193 ( .A(n184), .Y(n187) );
  INVXLM U194 ( .A(n184), .Y(n188) );
endmodule


module BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_test_0 ( CLK, RST, ASYNC, SYNC, test_si, 
        test_se );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST, test_si, test_se;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] ;

  SDFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .SI(\sync_reg[1][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[1]) );
  SDFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .SI(\sync_reg[0][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[0]) );
  SDFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .SI(\sync_reg[2][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[2]) );
  SDFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .SI(SYNC[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\sync_reg[3][0] ) );
  SDFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .SI(SYNC[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\sync_reg[2][0] ) );
  SDFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .SI(SYNC[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\sync_reg[1][0] ) );
  SDFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\sync_reg[0][0] ) );
  SDFFRQX1M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .SI(\sync_reg[3][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[3]) );
endmodule


module BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_test_1 ( CLK, RST, ASYNC, SYNC, test_si, 
        test_se );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST, test_si, test_se;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] ;

  SDFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .SI(\sync_reg[2][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[2]) );
  SDFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .SI(\sync_reg[1][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[1]) );
  SDFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .SI(\sync_reg[0][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[0]) );
  SDFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .SI(SYNC[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\sync_reg[3][0] ) );
  SDFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .SI(SYNC[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\sync_reg[2][0] ) );
  SDFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .SI(SYNC[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\sync_reg[1][0] ) );
  SDFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\sync_reg[0][0] ) );
  SDFFRQX1M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .SI(\sync_reg[3][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[3]) );
endmodule


module ASYNC_FIFO_ADDRES_WIDTH4_DATA_WIDTH8_FIFO_DEPTH8_test_1 ( W_CLK, W_RST, 
        W_INC, R_CLK, R_RST, R_INC, WR_DATA, FULL, EMPTY, RD_DATA, test_si2, 
        test_si1, test_so2, test_so1, test_se );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, test_si2, test_si1, test_se;
  output FULL, EMPTY, test_so2, test_so1;
  wire   n1, n2, n3, n4, n5, n6;
  wire   [3:0] WQ2_R_PTR;
  wire   [2:0] WRITE_ADDRES;
  wire   [3:0] W_PTR;
  wire   [3:0] WQ2_W_PTR;
  wire   [2:0] READ_ADDRES;
  wire   [3:0] R_PTR;
  assign test_so2 = W_PTR[3];

  INVX2M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(W_RST), .Y(n4) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(R_RST), .Y(n2) );
  FIFO_WR_ADDRES_WIDTH4_test_1 WRITE_MODULE ( .W_CLK(W_CLK), .W_RST(n3), 
        .W_INC(W_INC), .GRAY_R_ADD(WQ2_R_PTR), .FULL(FULL), .W_ADD(
        WRITE_ADDRES), .GRAY_W_ADD(W_PTR), .test_si(n5), .test_se(test_se) );
  FIFO_RD_ADDRES_WIDTH4_test_1 READ_MODULE ( .R_CLK(R_CLK), .R_RST(n1), 
        .R_INC(R_INC), .GRAY_W_ADD(WQ2_W_PTR), .EMPTY(EMPTY), .GRAY_R_ADD(
        R_PTR), .R_ADD(READ_ADDRES), .test_si(n6), .test_so(n5), .test_se(
        test_se) );
  FIFO_MEM_CNTRL_ADDRES_WIDTH4_DATA_WIDTH8_FIFO_DEPTH8_test_1 MEMORY_MODULE ( 
        .W_CLK(W_CLK), .W_RST(n3), .W_INC(W_INC), .FULL(FULL), .WR_DATA(
        WR_DATA), .R_ADD(READ_ADDRES), .W_ADD(WRITE_ADDRES), .RD_DATA(RD_DATA), 
        .test_si2(test_si2), .test_si1(WQ2_W_PTR[3]), .test_so2(n6), 
        .test_so1(test_so1), .test_se(test_se) );
  BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_test_0 BIT_SYNC_R_TO_W ( .CLK(W_CLK), .RST(
        n3), .ASYNC(R_PTR), .SYNC(WQ2_R_PTR), .test_si(test_si1), .test_se(
        test_se) );
  BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_test_1 BIT_SYNC_W_TO_R ( .CLK(R_CLK), .RST(
        n1), .ASYNC(W_PTR), .SYNC(WQ2_W_PTR), .test_si(WQ2_R_PTR[3]), 
        .test_se(test_se) );
endmodule


module PULSE_GEN_test_1 ( CLK, RST, lvl_sig, pulse_sig, test_si, test_so, 
        test_se );
  input CLK, RST, lvl_sig, test_si, test_se;
  output pulse_sig, test_so;
  wire   pulse_flop, rcv_flop;
  assign test_so = rcv_flop;

  SDFFRQX2M rcv_flop_reg ( .D(lvl_sig), .SI(pulse_flop), .SE(test_se), .CK(CLK), .RN(RST), .Q(rcv_flop) );
  SDFFRQX2M pulse_flop_reg ( .D(rcv_flop), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(pulse_flop) );
  NOR2BX2M U5 ( .AN(rcv_flop), .B(pulse_flop), .Y(pulse_sig) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_test_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n1, n2, n3, n4, n5, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  SDFFRQX2M div_clk_reg ( .D(n27), .SI(count[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst), .Q(div_clk) );
  SDFFSQX2M odd_edge_tog_reg ( .D(n26), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst), .Q(odd_edge_tog) );
  SDFFRQX2M \count_reg[6]  ( .D(n28), .SI(count[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[6]) );
  SDFFRQX2M \count_reg[0]  ( .D(n34), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n29), .SI(count[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n30), .SI(count[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n31), .SI(count[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n32), .SI(count[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n33), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[1]) );
  OR2X2M U5 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U6 ( .AN(n50), .B(i_clk_en), .Y(n16) );
  INVX2M U11 ( .A(i_div_ratio[5]), .Y(n15) );
  MX2X2M U15 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  CLKINVX1M U16 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U17 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U18 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U19 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U20 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U21 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U22 ( .A(n3), .B(n15), .Y(n4) );
  OAI21X1M U23 ( .A0(n3), .A1(n15), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U24 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U25 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U26 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U27 ( .A0(n16), .A1(count[0]), .B0(N16), .B1(n17), .Y(n34) );
  AO22X1M U28 ( .A0(n16), .A1(count[1]), .B0(N17), .B1(n17), .Y(n33) );
  AO22X1M U29 ( .A0(n16), .A1(count[2]), .B0(N18), .B1(n17), .Y(n32) );
  AO22X1M U30 ( .A0(n16), .A1(count[3]), .B0(N19), .B1(n17), .Y(n31) );
  AO22X1M U31 ( .A0(n16), .A1(count[4]), .B0(N20), .B1(n17), .Y(n30) );
  AO22X1M U32 ( .A0(n16), .A1(count[5]), .B0(N21), .B1(n17), .Y(n29) );
  AO22X1M U33 ( .A0(n16), .A1(count[6]), .B0(N22), .B1(n17), .Y(n28) );
  AND3X1M U34 ( .A(n18), .B(n19), .C(N2), .Y(n17) );
  CLKXOR2X2M U35 ( .A(div_clk), .B(n20), .Y(n27) );
  AOI21X1M U36 ( .A0(n19), .A1(n18), .B0(n16), .Y(n20) );
  OR2X1M U37 ( .A(n21), .B(i_div_ratio[0]), .Y(n18) );
  XNOR2X1M U38 ( .A(odd_edge_tog), .B(n22), .Y(n26) );
  OR2X1M U39 ( .A(n19), .B(n16), .Y(n22) );
  CLKNAND2X2M U40 ( .A(n23), .B(i_div_ratio[0]), .Y(n19) );
  MXI2X1M U41 ( .A(n24), .B(n21), .S0(odd_edge_tog), .Y(n23) );
  NAND4X1M U42 ( .A(n25), .B(n35), .C(n36), .D(n37), .Y(n21) );
  NOR4X1M U43 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n37) );
  CLKXOR2X2M U44 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n41) );
  CLKXOR2X2M U45 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n40) );
  CLKXOR2X2M U46 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n39) );
  CLKXOR2X2M U47 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n38) );
  XNOR2X1M U48 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n36) );
  XNOR2X1M U49 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n35) );
  XNOR2X1M U50 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n25) );
  NAND4X1M U51 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n24) );
  NOR4X1M U52 ( .A(n46), .B(n47), .C(n48), .D(n49), .Y(n45) );
  CLKXOR2X2M U53 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n49) );
  CLKXOR2X2M U54 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n48) );
  CLKXOR2X2M U55 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n47) );
  CLKXOR2X2M U56 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n46) );
  XNOR2X1M U57 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n44) );
  XNOR2X1M U58 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n43) );
  XNOR2X1M U59 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n42) );
  CLKINVX1M U60 ( .A(n16), .Y(N2) );
  NOR4BX1M U61 ( .AN(n51), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n50) );
  NOR4X1M U62 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n51) );
  ClkDiv_0_DW01_inc_0 add_50 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n1, n2, n3, n4;

  AND2X2M U11 ( .A(n2), .B(n4), .Y(OUT[1]) );
  AND2X2M U12 ( .A(n1), .B(n2), .Y(OUT[3]) );
  AND2X2M U13 ( .A(n2), .B(n3), .Y(OUT[2]) );
  OAI31X1M U14 ( .A0(n4), .A1(n1), .A2(n3), .B0(n2), .Y(OUT[0]) );
  NOR4BX1M U15 ( .AN(IN[3]), .B(IN[2]), .C(IN[4]), .D(IN[5]), .Y(n3) );
  NOR4BX1M U16 ( .AN(IN[4]), .B(IN[2]), .C(IN[3]), .D(IN[5]), .Y(n4) );
  NOR4BX1M U17 ( .AN(IN[2]), .B(IN[3]), .C(IN[4]), .D(IN[5]), .Y(n1) );
  NOR2X2M U18 ( .A(IN[1]), .B(IN[0]), .Y(n2) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_test_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n2, n3,
         n4, n5, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  assign test_so = odd_edge_tog;

  SDFFRQX2M div_clk_reg ( .D(n60), .SI(count[6]), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst), .Q(div_clk) );
  SDFFRQX2M \count_reg[6]  ( .D(n59), .SI(count[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[6]) );
  SDFFRQX2M \count_reg[0]  ( .D(n53), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[0]) );
  SDFFRQX2M \count_reg[5]  ( .D(n58), .SI(count[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[5]) );
  SDFFRQX2M \count_reg[4]  ( .D(n57), .SI(count[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[4]) );
  SDFFRQX2M \count_reg[3]  ( .D(n56), .SI(count[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[3]) );
  SDFFRQX2M \count_reg[2]  ( .D(n55), .SI(count[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[2]) );
  SDFFRQX2M \count_reg[1]  ( .D(n54), .SI(count[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst), .Q(count[1]) );
  SDFFSQX1M odd_edge_tog_reg ( .D(n61), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst), .Q(odd_edge_tog) );
  OR2X2M U6 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n2) );
  NAND2BX2M U11 ( .AN(n51), .B(i_clk_en), .Y(n17) );
  INVX2M U15 ( .A(i_div_ratio[5]), .Y(n16) );
  MX2X2M U16 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  CLKINVX1M U17 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U18 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n2), .Y(
        edge_flip_half[1]) );
  OR2X1M U19 ( .A(n2), .B(i_div_ratio[3]), .Y(n3) );
  OAI2BB1X1M U20 ( .A0N(n2), .A1N(i_div_ratio[3]), .B0(n3), .Y(
        edge_flip_half[2]) );
  NOR2X1M U21 ( .A(n3), .B(i_div_ratio[4]), .Y(n4) );
  AO21XLM U22 ( .A0(n3), .A1(i_div_ratio[4]), .B0(n4), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U23 ( .A(n4), .B(n16), .Y(n5) );
  OAI21X1M U24 ( .A0(n4), .A1(n16), .B0(n5), .Y(edge_flip_half[4]) );
  XNOR2X1M U25 ( .A(i_div_ratio[6]), .B(n5), .Y(edge_flip_half[5]) );
  NOR2X1M U26 ( .A(i_div_ratio[6]), .B(n5), .Y(n15) );
  CLKXOR2X2M U27 ( .A(i_div_ratio[7]), .B(n15), .Y(edge_flip_half[6]) );
  AO22X1M U28 ( .A0(n17), .A1(count[0]), .B0(N16), .B1(n18), .Y(n53) );
  AO22X1M U29 ( .A0(n17), .A1(count[1]), .B0(N17), .B1(n18), .Y(n54) );
  AO22X1M U30 ( .A0(n17), .A1(count[2]), .B0(N18), .B1(n18), .Y(n55) );
  AO22X1M U31 ( .A0(n17), .A1(count[3]), .B0(N19), .B1(n18), .Y(n56) );
  AO22X1M U32 ( .A0(n17), .A1(count[4]), .B0(N20), .B1(n18), .Y(n57) );
  AO22X1M U33 ( .A0(n17), .A1(count[5]), .B0(N21), .B1(n18), .Y(n58) );
  AO22X1M U34 ( .A0(n17), .A1(count[6]), .B0(N22), .B1(n18), .Y(n59) );
  AND3X1M U35 ( .A(n19), .B(n20), .C(N2), .Y(n18) );
  CLKXOR2X2M U36 ( .A(div_clk), .B(n21), .Y(n60) );
  AOI21X1M U37 ( .A0(n20), .A1(n19), .B0(n17), .Y(n21) );
  OR2X1M U38 ( .A(n22), .B(i_div_ratio[0]), .Y(n19) );
  XNOR2X1M U39 ( .A(odd_edge_tog), .B(n23), .Y(n61) );
  OR2X1M U40 ( .A(n20), .B(n17), .Y(n23) );
  CLKNAND2X2M U41 ( .A(n24), .B(i_div_ratio[0]), .Y(n20) );
  MXI2X1M U42 ( .A(n25), .B(n22), .S0(odd_edge_tog), .Y(n24) );
  NAND4X1M U43 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n22) );
  NOR4X1M U44 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  CLKXOR2X2M U45 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n42) );
  CLKXOR2X2M U46 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n41) );
  CLKXOR2X2M U47 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n40) );
  CLKXOR2X2M U48 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n39) );
  XNOR2X1M U49 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n37) );
  XNOR2X1M U50 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n36) );
  XNOR2X1M U51 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n35) );
  NAND4X1M U52 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n25) );
  NOR4X1M U53 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n46) );
  CLKXOR2X2M U54 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n50) );
  CLKXOR2X2M U55 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n49) );
  CLKXOR2X2M U56 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n48) );
  CLKXOR2X2M U57 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n47) );
  XNOR2X1M U58 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n45) );
  XNOR2X1M U59 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n44) );
  XNOR2X1M U60 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n43) );
  CLKINVX1M U61 ( .A(n17), .Y(N2) );
  NOR4BX1M U62 ( .AN(n52), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n51) );
  NOR4X1M U63 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n52) );
  ClkDiv_1_DW01_inc_0 add_50 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
endmodule


module SERIALIZER_DATA_WIDTH8_COUNT3_test_1 ( IN_DATA, SER_EN, CLK, RST, BUSY, 
        SER_DONE, ser_data, test_si, test_se );
  input [7:0] IN_DATA;
  input SER_EN, CLK, RST, BUSY, test_si, test_se;
  output SER_DONE, ser_data;
  wire   N22, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n13, n14,
         n15, n16, n17, n18, n44, n47, n48;
  wire   [7:0] register;
  wire   [2:0] counter;

  SDFFRQX2M \register_reg[6]  ( .D(n38), .SI(register[5]), .SE(n48), .CK(CLK), 
        .RN(RST), .Q(register[6]) );
  SDFFRQX2M \register_reg[5]  ( .D(n39), .SI(register[4]), .SE(n48), .CK(CLK), 
        .RN(RST), .Q(register[5]) );
  SDFFRQX2M \register_reg[4]  ( .D(n40), .SI(register[3]), .SE(n48), .CK(CLK), 
        .RN(RST), .Q(register[4]) );
  SDFFRQX2M \register_reg[3]  ( .D(n41), .SI(register[2]), .SE(n48), .CK(CLK), 
        .RN(RST), .Q(register[3]) );
  SDFFRQX2M \register_reg[2]  ( .D(n42), .SI(register[1]), .SE(n48), .CK(CLK), 
        .RN(RST), .Q(register[2]) );
  SDFFRQX2M \register_reg[1]  ( .D(n43), .SI(register[0]), .SE(n48), .CK(CLK), 
        .RN(RST), .Q(register[1]) );
  SDFFRQX2M \register_reg[0]  ( .D(n37), .SI(counter[2]), .SE(n48), .CK(CLK), 
        .RN(RST), .Q(register[0]) );
  SDFFRQX2M ser_data_reg ( .D(n34), .SI(register[6]), .SE(n48), .CK(CLK), .RN(
        RST), .Q(ser_data) );
  SDFFRQX2M \counter_reg[2]  ( .D(n35), .SI(counter[1]), .SE(n48), .CK(CLK), 
        .RN(RST), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n36), .SI(n17), .SE(n48), .CK(CLK), .RN(RST), 
        .Q(counter[1]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n14), .SI(SER_DONE), .SE(n48), .CK(CLK), 
        .RN(RST), .Q(counter[0]) );
  SDFFRQX2M SER_DONE_reg ( .D(N22), .SI(test_si), .SE(n48), .CK(CLK), .RN(RST), 
        .Q(SER_DONE) );
  NOR2X2M U15 ( .A(n15), .B(n13), .Y(n21) );
  NOR2X2M U16 ( .A(n13), .B(n21), .Y(n19) );
  NOR2X2M U17 ( .A(n18), .B(n17), .Y(n24) );
  NAND2X2M U18 ( .A(n24), .B(n13), .Y(n22) );
  INVX2M U19 ( .A(SER_EN), .Y(n15) );
  NOR2X2M U20 ( .A(n44), .B(n22), .Y(N22) );
  INVX2M U21 ( .A(n13), .Y(n16) );
  OAI32X1M U22 ( .A0(n17), .A1(counter[1]), .A2(n16), .B0(n25), .B1(n18), .Y(
        n36) );
  AOI21X2M U23 ( .A0(n13), .A1(n17), .B0(n19), .Y(n25) );
  OAI22X1M U24 ( .A0(counter[2]), .A1(n22), .B0(n23), .B1(n44), .Y(n35) );
  AOI2BB2XLM U25 ( .B0(n16), .B1(n15), .A0N(n24), .A1N(n21), .Y(n23) );
  BUFX2M U26 ( .A(BUSY), .Y(n13) );
  INVX2M U27 ( .A(n26), .Y(n14) );
  AOI221XLM U28 ( .A0(n17), .A1(n13), .B0(n19), .B1(counter[0]), .C0(n21), .Y(
        n26) );
  INVX2M U29 ( .A(counter[0]), .Y(n17) );
  OAI2BB1X2M U30 ( .A0N(ser_data), .A1N(n19), .B0(n20), .Y(n34) );
  AOI22X1M U31 ( .A0(IN_DATA[0]), .A1(n21), .B0(register[0]), .B1(n13), .Y(n20) );
  OAI2BB1X2M U32 ( .A0N(n19), .A1N(register[0]), .B0(n27), .Y(n37) );
  AOI22X1M U33 ( .A0(IN_DATA[1]), .A1(n21), .B0(register[1]), .B1(n13), .Y(n27) );
  OAI2BB1X2M U34 ( .A0N(n19), .A1N(register[1]), .B0(n33), .Y(n43) );
  AOI22X1M U35 ( .A0(IN_DATA[2]), .A1(n21), .B0(register[2]), .B1(n13), .Y(n33) );
  OAI2BB1X2M U36 ( .A0N(n19), .A1N(register[2]), .B0(n32), .Y(n42) );
  AOI22X1M U37 ( .A0(IN_DATA[3]), .A1(n21), .B0(register[3]), .B1(n13), .Y(n32) );
  OAI2BB1X2M U38 ( .A0N(n19), .A1N(register[3]), .B0(n31), .Y(n41) );
  AOI22X1M U39 ( .A0(IN_DATA[4]), .A1(n21), .B0(register[4]), .B1(n13), .Y(n31) );
  OAI2BB1X2M U40 ( .A0N(n19), .A1N(register[4]), .B0(n30), .Y(n40) );
  AOI22X1M U41 ( .A0(IN_DATA[5]), .A1(n21), .B0(register[5]), .B1(n13), .Y(n30) );
  OAI2BB1X2M U42 ( .A0N(n19), .A1N(register[5]), .B0(n29), .Y(n39) );
  AOI22X1M U43 ( .A0(IN_DATA[6]), .A1(n21), .B0(register[6]), .B1(n13), .Y(n29) );
  OAI2BB1X2M U44 ( .A0N(n19), .A1N(register[6]), .B0(n28), .Y(n38) );
  NAND2X2M U45 ( .A(IN_DATA[7]), .B(n21), .Y(n28) );
  INVX2M U46 ( .A(counter[1]), .Y(n18) );
  INVX2M U47 ( .A(counter[2]), .Y(n44) );
  INVXLM U48 ( .A(test_se), .Y(n47) );
  INVXLM U49 ( .A(n47), .Y(n48) );
endmodule


module FSM_tx_MUX_WIDTH2_test_1 ( DATA_VALID, PAR_EN, SER_DONE, CLK, RST, BUSY, 
        SER_EN, mux_sel, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input DATA_VALID, PAR_EN, SER_DONE, CLK, RST, test_si, test_se;
  output BUSY, SER_EN, test_so;
  wire   BUSY_C, n8, n9, n5, n6, n7;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  SDFFRQX2M BUSY_reg ( .D(BUSY_C), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(BUSY) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n5), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n7), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(BUSY), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  INVX2M U7 ( .A(mux_sel[1]), .Y(n6) );
  AOI21X2M U8 ( .A0(current_state[1]), .A1(SER_DONE), .B0(mux_sel[0]), .Y(
        SER_EN) );
  NOR2X2M U9 ( .A(n7), .B(current_state[2]), .Y(mux_sel[1]) );
  NAND2BX2M U10 ( .AN(current_state[2]), .B(current_state[0]), .Y(mux_sel[0])
         );
  NOR2X2M U11 ( .A(n8), .B(n6), .Y(next_state[2]) );
  AOI2B1X1M U12 ( .A1N(PAR_EN), .A0(SER_DONE), .B0(n5), .Y(n8) );
  INVX2M U13 ( .A(current_state[1]), .Y(n7) );
  NAND2BX2M U14 ( .AN(SER_EN), .B(n9), .Y(next_state[0]) );
  NAND3BX2M U15 ( .AN(current_state[2]), .B(n7), .C(DATA_VALID), .Y(n9) );
  OAI21X2M U16 ( .A0(current_state[0]), .A1(n7), .B0(mux_sel[0]), .Y(BUSY_C)
         );
  OAI21X2M U17 ( .A0(current_state[2]), .A1(n5), .B0(n6), .Y(next_state[1]) );
  INVX2M U18 ( .A(current_state[0]), .Y(n5) );
endmodule


module PARITY_CALC_DATA_WIDTH8_test_1 ( IN_DATA, DATA_VALID, PAR_TYP, CLK, RST, 
        BUSY, par_bit, test_si, test_se );
  input [7:0] IN_DATA;
  input DATA_VALID, PAR_TYP, CLK, RST, BUSY, test_si, test_se;
  output par_bit;
  wire   n1, n2, n3, n4, n5, n6, n8;

  SDFFRQX2M par_bit_reg ( .D(n8), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(par_bit) );
  XNOR2X2M U2 ( .A(IN_DATA[3]), .B(IN_DATA[2]), .Y(n5) );
  XOR3XLM U3 ( .A(IN_DATA[5]), .B(IN_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(IN_DATA[7]), .B(IN_DATA[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n8) );
  NAND2BX2M U6 ( .AN(BUSY), .B(DATA_VALID), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(IN_DATA[1]), .B(IN_DATA[0]), .C(n5), .Y(n4) );
endmodule


module MUX_MUX_WIDTH2_test_1 ( mux_sel, start_bit, stop_bit, ser_data, par_bit, 
        CLK, RST, TX_OUT, test_si, test_se );
  input [1:0] mux_sel;
  input start_bit, stop_bit, ser_data, par_bit, CLK, RST, test_si, test_se;
  output TX_OUT;
  wire   N13, n3, n4, n5;

  OAI2B2X1M U5 ( .A1N(mux_sel[1]), .A0(n3), .B0(mux_sel[1]), .B1(n4), .Y(N13)
         );
  AOI22X1M U6 ( .A0(ser_data), .A1(n5), .B0(par_bit), .B1(mux_sel[0]), .Y(n3)
         );
  AOI22X1M U7 ( .A0(start_bit), .A1(n5), .B0(stop_bit), .B1(mux_sel[0]), .Y(n4) );
  INVX2M U8 ( .A(mux_sel[0]), .Y(n5) );
  SDFFSQX2M TX_OUT_reg ( .D(N13), .SI(test_si), .SE(test_se), .CK(CLK), .SN(
        RST), .Q(TX_OUT) );
endmodule


module UART_TX_DATA_WIDTH8_test_1 ( IN_DATA, DATA_VALID, PAR_EN, PAR_TYP, CLK, 
        RST, TX_OUT, BUSY, test_si2, test_si1, test_so1, test_se );
  input [7:0] IN_DATA;
  input DATA_VALID, PAR_EN, PAR_TYP, CLK, RST, test_si2, test_si1, test_se;
  output TX_OUT, BUSY, test_so1;
  wire   SER_EN, SER_DONE, ser_data, par_bit, n1, n2, n3;
  wire   [1:0] mux_sel;
  assign test_so1 = par_bit;

  INVX2M U7 ( .A(n2), .Y(n1) );
  INVX2M U8 ( .A(RST), .Y(n2) );
  SERIALIZER_DATA_WIDTH8_COUNT3_test_1 U1 ( .IN_DATA(IN_DATA), .SER_EN(SER_EN), 
        .CLK(CLK), .RST(n1), .BUSY(BUSY), .SER_DONE(SER_DONE), .ser_data(
        ser_data), .test_si(test_si1), .test_se(test_se) );
  FSM_tx_MUX_WIDTH2_test_1 U2 ( .DATA_VALID(DATA_VALID), .PAR_EN(PAR_EN), 
        .SER_DONE(SER_DONE), .CLK(CLK), .RST(n1), .BUSY(BUSY), .SER_EN(SER_EN), 
        .mux_sel(mux_sel), .test_si(ser_data), .test_so(n3), .test_se(test_se)
         );
  PARITY_CALC_DATA_WIDTH8_test_1 U3 ( .IN_DATA(IN_DATA), .DATA_VALID(
        DATA_VALID), .PAR_TYP(PAR_TYP), .CLK(CLK), .RST(n1), .BUSY(BUSY), 
        .par_bit(par_bit), .test_si(n3), .test_se(test_se) );
  MUX_MUX_WIDTH2_test_1 U4 ( .mux_sel(mux_sel), .start_bit(1'b0), .stop_bit(
        1'b1), .ser_data(ser_data), .par_bit(par_bit), .CLK(CLK), .RST(n1), 
        .TX_OUT(TX_OUT), .test_si(test_si2), .test_se(test_se) );
endmodule


module EDGE_BIT_COUNTER_test_1 ( count_enable, prescale, CLK, RST, edge_cnt, 
        bit_cnt, test_si, test_se );
  input [5:0] prescale;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input count_enable, CLK, RST, test_si, test_se;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N21, N22, N23, N24, N37, N38,
         N39, N40, N41, N42, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         \add_28/carry[5] , \add_28/carry[4] , \add_28/carry[3] ,
         \add_28/carry[2] , n1, n2, n3, n4, n15, n16, n17, n18, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n41, n42;

  SDFFRQX2M \bit_cnt_reg[2]  ( .D(n25), .SI(n38), .SE(n42), .CK(CLK), .RN(RST), 
        .Q(bit_cnt[2]) );
  SDFFRQX2M \bit_cnt_reg[1]  ( .D(n26), .SI(n37), .SE(n42), .CK(CLK), .RN(RST), 
        .Q(bit_cnt[1]) );
  SDFFRQX2M \bit_cnt_reg[0]  ( .D(n27), .SI(test_si), .SE(n42), .CK(CLK), .RN(
        RST), .Q(bit_cnt[0]) );
  SDFFRQX2M \bit_cnt_reg[3]  ( .D(n28), .SI(bit_cnt[2]), .SE(n42), .CK(CLK), 
        .RN(RST), .Q(bit_cnt[3]) );
  SDFFRQX2M \edge_cnt_reg[5]  ( .D(N42), .SI(edge_cnt[4]), .SE(n42), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[5]) );
  SDFFRQX2M \edge_cnt_reg[0]  ( .D(N37), .SI(bit_cnt[3]), .SE(n42), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[0]) );
  SDFFRQX2M \edge_cnt_reg[3]  ( .D(N40), .SI(edge_cnt[2]), .SE(n42), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[3]) );
  SDFFRQX2M \edge_cnt_reg[2]  ( .D(N39), .SI(edge_cnt[1]), .SE(n42), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[2]) );
  SDFFRQX2M \edge_cnt_reg[4]  ( .D(N41), .SI(edge_cnt[3]), .SE(n42), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[4]) );
  SDFFRQX2M \edge_cnt_reg[1]  ( .D(N38), .SI(edge_cnt[0]), .SE(n42), .CK(CLK), 
        .RN(RST), .Q(edge_cnt[1]) );
  INVX2M U7 ( .A(count_enable), .Y(n36) );
  INVX2M U8 ( .A(n22), .Y(n35) );
  NOR2X2M U15 ( .A(n36), .B(N14), .Y(n22) );
  NOR2BX2M U16 ( .AN(N21), .B(n35), .Y(N38) );
  NOR2BX2M U17 ( .AN(N22), .B(n35), .Y(N39) );
  NOR2BX2M U18 ( .AN(N23), .B(n35), .Y(N40) );
  NOR2BX2M U19 ( .AN(N24), .B(n35), .Y(N41) );
  OAI32X1M U20 ( .A0(n36), .A1(bit_cnt[0]), .A2(n22), .B0(n37), .B1(n35), .Y(
        n27) );
  NOR2X2M U21 ( .A(n19), .B(n36), .Y(n25) );
  XNOR2X2M U22 ( .A(n20), .B(bit_cnt[2]), .Y(n19) );
  OAI22X1M U23 ( .A0(n38), .A1(n35), .B0(n21), .B1(n36), .Y(n26) );
  AOI32X1M U24 ( .A0(n35), .A1(n38), .A2(bit_cnt[0]), .B0(bit_cnt[1]), .B1(n37), .Y(n21) );
  INVX2M U25 ( .A(bit_cnt[1]), .Y(n38) );
  AND3X2M U26 ( .A(N14), .B(bit_cnt[1]), .C(bit_cnt[0]), .Y(n20) );
  OR2X2M U27 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  NOR2X2M U28 ( .A(edge_cnt[0]), .B(n35), .Y(N37) );
  NOR2X2M U29 ( .A(n1), .B(n35), .Y(N42) );
  XNOR2X2M U30 ( .A(\add_28/carry[5] ), .B(edge_cnt[5]), .Y(n1) );
  NOR2X2M U31 ( .A(n23), .B(n36), .Y(n28) );
  CLKXOR2X2M U32 ( .A(n24), .B(bit_cnt[3]), .Y(n23) );
  NAND2X2M U33 ( .A(n20), .B(bit_cnt[2]), .Y(n24) );
  INVX2M U34 ( .A(bit_cnt[0]), .Y(n37) );
  ADDHX1M U35 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_28/carry[2] ), .S(
        N21) );
  ADDHX1M U36 ( .A(edge_cnt[2]), .B(\add_28/carry[2] ), .CO(\add_28/carry[3] ), 
        .S(N22) );
  ADDHX1M U37 ( .A(edge_cnt[3]), .B(\add_28/carry[3] ), .CO(\add_28/carry[4] ), 
        .S(N23) );
  ADDHX1M U38 ( .A(edge_cnt[4]), .B(\add_28/carry[4] ), .CO(\add_28/carry[5] ), 
        .S(N24) );
  CLKINVX1M U39 ( .A(prescale[0]), .Y(N7) );
  OAI2BB1X1M U40 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(N8) );
  OR2X1M U41 ( .A(n2), .B(prescale[2]), .Y(n3) );
  OAI2BB1X1M U42 ( .A0N(n2), .A1N(prescale[2]), .B0(n3), .Y(N9) );
  OR2X1M U43 ( .A(n3), .B(prescale[3]), .Y(n4) );
  OAI2BB1X1M U44 ( .A0N(n3), .A1N(prescale[3]), .B0(n4), .Y(N10) );
  OR2X1M U45 ( .A(n4), .B(prescale[4]), .Y(n15) );
  OAI2BB1X1M U46 ( .A0N(n4), .A1N(prescale[4]), .B0(n15), .Y(N11) );
  NOR2X1M U47 ( .A(n15), .B(prescale[5]), .Y(N13) );
  AO21XLM U48 ( .A0(n15), .A1(prescale[5]), .B0(N13), .Y(N12) );
  NOR2BX1M U49 ( .AN(N7), .B(edge_cnt[0]), .Y(n16) );
  OAI2B2X1M U50 ( .A1N(edge_cnt[1]), .A0(n16), .B0(N8), .B1(n16), .Y(n30) );
  XNOR2X1M U51 ( .A(N12), .B(edge_cnt[5]), .Y(n29) );
  NOR2BX1M U52 ( .AN(edge_cnt[0]), .B(N7), .Y(n17) );
  OAI2B2X1M U53 ( .A1N(N8), .A0(n17), .B0(edge_cnt[1]), .B1(n17), .Y(n18) );
  NAND4BX1M U54 ( .AN(N13), .B(n30), .C(n29), .D(n18), .Y(n34) );
  CLKXOR2X2M U55 ( .A(N11), .B(edge_cnt[4]), .Y(n33) );
  CLKXOR2X2M U56 ( .A(N9), .B(edge_cnt[2]), .Y(n32) );
  CLKXOR2X2M U57 ( .A(N10), .B(edge_cnt[3]), .Y(n31) );
  NOR4X1M U58 ( .A(n34), .B(n33), .C(n32), .D(n31), .Y(N14) );
  INVXLM U59 ( .A(test_se), .Y(n41) );
  INVXLM U60 ( .A(n41), .Y(n42) );
endmodule


module DESERIALIZER_DATA_WIDTH8_test_1 ( sampled_bit, deser_en, 
        sampled_bit_valid, CLK, RST, P_DATA, test_si, test_so, test_se );
  output [7:0] P_DATA;
  input sampled_bit, deser_en, sampled_bit_valid, CLK, RST, test_si, test_se;
  output test_so;
  wire   n1, n11, n13, n15, n17, n19, n21, n23, n25, n2, n3, n4, n5, n6, n7,
         n8, n9;
  assign test_so = n3;

  SDFFRQX2M \P_DATA_reg[0]  ( .D(n11), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[0]) );
  SDFFRQX2M \P_DATA_reg[5]  ( .D(n21), .SI(n6), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[5]) );
  SDFFRQX2M \P_DATA_reg[1]  ( .D(n13), .SI(P_DATA[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[1]) );
  SDFFRQX2M \P_DATA_reg[4]  ( .D(n19), .SI(n7), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[4]) );
  SDFFRQX2M \P_DATA_reg[7]  ( .D(n25), .SI(n4), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[7]) );
  SDFFRQX2M \P_DATA_reg[3]  ( .D(n17), .SI(n8), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[3]) );
  SDFFRQX2M \P_DATA_reg[6]  ( .D(n23), .SI(n5), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[6]) );
  SDFFRQX2M \P_DATA_reg[2]  ( .D(n15), .SI(n9), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(P_DATA[2]) );
  OAI22X1M U2 ( .A0(n2), .A1(n9), .B0(n1), .B1(n8), .Y(n13) );
  OAI22X1M U3 ( .A0(n2), .A1(n8), .B0(n1), .B1(n7), .Y(n15) );
  OAI22X1M U4 ( .A0(n2), .A1(n7), .B0(n1), .B1(n6), .Y(n17) );
  OAI22X1M U5 ( .A0(n2), .A1(n6), .B0(n1), .B1(n5), .Y(n19) );
  OAI22X1M U6 ( .A0(n2), .A1(n5), .B0(n1), .B1(n4), .Y(n21) );
  OAI22X1M U7 ( .A0(n2), .A1(n4), .B0(n1), .B1(n3), .Y(n23) );
  INVX2M U8 ( .A(n1), .Y(n2) );
  NAND2X2M U9 ( .A(sampled_bit_valid), .B(deser_en), .Y(n1) );
  OAI2BB2X1M U10 ( .B0(n1), .B1(n9), .A0N(P_DATA[0]), .A1N(n1), .Y(n11) );
  OAI2BB2X1M U11 ( .B0(n2), .B1(n3), .A0N(sampled_bit), .A1N(n2), .Y(n25) );
  INVX2M U12 ( .A(P_DATA[2]), .Y(n8) );
  INVX2M U13 ( .A(P_DATA[6]), .Y(n4) );
  INVX2M U14 ( .A(P_DATA[7]), .Y(n3) );
  INVX2M U15 ( .A(P_DATA[3]), .Y(n7) );
  INVX2M U16 ( .A(P_DATA[1]), .Y(n9) );
  INVX2M U17 ( .A(P_DATA[4]), .Y(n6) );
  INVX2M U18 ( .A(P_DATA[5]), .Y(n5) );
endmodule


module START_CHECK_test_1 ( start_chk_en, sampled_bit_valid, sampled_bit, CLK, 
        RST, start_glitch, test_si, test_se );
  input start_chk_en, sampled_bit_valid, sampled_bit, CLK, RST, test_si,
         test_se;
  output start_glitch;
  wire   n3, n4, n2;

  SDFFRQX2M start_glitch_reg ( .D(n4), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(start_glitch) );
  NOR2BX2M U4 ( .AN(start_chk_en), .B(n3), .Y(n4) );
  AOI22X1M U5 ( .A0(sampled_bit_valid), .A1(sampled_bit), .B0(start_glitch), 
        .B1(n2), .Y(n3) );
  INVX2M U6 ( .A(sampled_bit_valid), .Y(n2) );
endmodule


module STOP_CHECK_test_1 ( stop_chk_en, sampled_bit_valid, sampled_bit, CLK, 
        RST, stop_err, test_si, test_se );
  input stop_chk_en, sampled_bit_valid, sampled_bit, CLK, RST, test_si,
         test_se;
  output stop_err;
  wire   n3, n4, n2;

  SDFFRQX2M stop_err_reg ( .D(n4), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(stop_err) );
  NOR2BX2M U4 ( .AN(stop_chk_en), .B(n3), .Y(n4) );
  AOI2BB2XLM U5 ( .B0(stop_err), .B1(n2), .A0N(sampled_bit), .A1N(n2), .Y(n3)
         );
  INVX2M U6 ( .A(sampled_bit_valid), .Y(n2) );
endmodule


module PAR_CHECK_DATA_WIDTH8_test_1 ( par_chk_en, PAR_TYP, sampled_bit_valid, 
        sampled_bit, P_DATA, CLK, RST, par_err, test_si, test_se );
  input [7:0] P_DATA;
  input par_chk_en, PAR_TYP, sampled_bit_valid, sampled_bit, CLK, RST, test_si,
         test_se;
  output par_err;
  wire   n1, n2, n3, n4, n5, n6, n7, n9;

  SDFFRQX2M par_err_reg ( .D(n9), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(par_err) );
  XNOR2X2M U2 ( .A(sampled_bit), .B(PAR_TYP), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U5 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U6 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  OAI2BB2X1M U7 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n9) );
  NAND2X2M U8 ( .A(sampled_bit_valid), .B(par_chk_en), .Y(n2) );
  XOR3XLM U9 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
endmodule


module DATA_SAMPLING_test_1 ( edge_cnt, data_sampl_en, RX_IN, prescale, CLK, 
        RST, sampled_bit, sampled_bit_valid, test_si, test_se );
  input [5:0] edge_cnt;
  input [5:0] prescale;
  input data_sampl_en, RX_IN, CLK, RST, test_si, test_se;
  output sampled_bit, sampled_bit_valid;
  wire   sample_1, sample_2, sample_3, N6, N7, N8, N9, N10, N12, N13, N14, N15,
         N16, N17, N18, N19, N22, N23, N24, N25, N26, N37, n34, n35, n36,
         \add_48/carry[4] , \add_48/carry[3] , \add_48/carry[2] ,
         \sub_33/carry[4] , \sub_33/carry[3] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57;
  assign N6 = prescale[1];

  SDFFRQX2M sample_3_reg ( .D(n35), .SI(sample_2), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sample_3) );
  SDFFRQX2M sample_1_reg ( .D(n34), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(sample_1) );
  SDFFRQX2M sample_2_reg ( .D(n36), .SI(sample_1), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sample_2) );
  SDFFRQX2M sampled_bit_reg ( .D(n57), .SI(sample_3), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sampled_bit) );
  SDFFRQX2M sampled_bit_valid_reg ( .D(N37), .SI(n26), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sampled_bit_valid) );
  NOR2X2M U4 ( .A(prescale[5]), .B(\sub_33/carry[4] ), .Y(n1) );
  OR2X2M U5 ( .A(prescale[2]), .B(N6), .Y(n2) );
  INVX2M U6 ( .A(prescale[2]), .Y(N7) );
  ADDHX1M U7 ( .A(prescale[2]), .B(N6), .CO(\add_48/carry[2] ), .S(N22) );
  ADDHX1M U8 ( .A(prescale[4]), .B(\add_48/carry[3] ), .CO(\add_48/carry[4] ), 
        .S(N24) );
  ADDHX1M U9 ( .A(prescale[3]), .B(\add_48/carry[2] ), .CO(\add_48/carry[3] ), 
        .S(N23) );
  ADDHX1M U10 ( .A(prescale[5]), .B(\add_48/carry[4] ), .CO(N26), .S(N25) );
  XNOR2X1M U15 ( .A(\sub_33/carry[4] ), .B(prescale[5]), .Y(N10) );
  OR2X1M U16 ( .A(prescale[4]), .B(\sub_33/carry[3] ), .Y(\sub_33/carry[4] )
         );
  XNOR2X1M U17 ( .A(\sub_33/carry[3] ), .B(prescale[4]), .Y(N9) );
  OR2X1M U18 ( .A(prescale[3]), .B(prescale[2]), .Y(\sub_33/carry[3] ) );
  XNOR2X1M U19 ( .A(prescale[2]), .B(prescale[3]), .Y(N8) );
  CLKINVX1M U20 ( .A(N6), .Y(N13) );
  OAI2BB1X1M U21 ( .A0N(N6), .A1N(prescale[2]), .B0(n2), .Y(N14) );
  OR2X1M U22 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U23 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N15) );
  XNOR2X1M U24 ( .A(prescale[4]), .B(n3), .Y(N16) );
  NOR3X1M U25 ( .A(prescale[4]), .B(prescale[5]), .C(n3), .Y(N18) );
  OAI21X1M U26 ( .A0(prescale[4]), .A1(n3), .B0(prescale[5]), .Y(n4) );
  NAND2BX1M U27 ( .AN(N18), .B(n4), .Y(N17) );
  NOR2BX1M U28 ( .AN(edge_cnt[0]), .B(N6), .Y(n5) );
  OAI2B2X1M U29 ( .A1N(N7), .A0(n5), .B0(edge_cnt[1]), .B1(n5), .Y(n8) );
  NOR2BX1M U30 ( .AN(N6), .B(edge_cnt[0]), .Y(n6) );
  OAI2B2X1M U31 ( .A1N(edge_cnt[1]), .A0(n6), .B0(N7), .B1(n6), .Y(n7) );
  NAND4BBX1M U32 ( .AN(n1), .BN(edge_cnt[5]), .C(n8), .D(n7), .Y(n12) );
  CLKXOR2X2M U33 ( .A(N10), .B(edge_cnt[4]), .Y(n11) );
  CLKXOR2X2M U34 ( .A(N8), .B(edge_cnt[2]), .Y(n10) );
  CLKXOR2X2M U35 ( .A(N9), .B(edge_cnt[3]), .Y(n9) );
  NOR4X1M U36 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(N12) );
  NOR2BX1M U37 ( .AN(edge_cnt[0]), .B(N13), .Y(n13) );
  OAI2B2X1M U38 ( .A1N(N14), .A0(n13), .B0(edge_cnt[1]), .B1(n13), .Y(n21) );
  NOR2BX1M U39 ( .AN(N13), .B(edge_cnt[0]), .Y(n14) );
  OAI2B2X1M U40 ( .A1N(edge_cnt[1]), .A0(n14), .B0(N14), .B1(n14), .Y(n20) );
  NAND4BBX1M U41 ( .AN(N18), .BN(edge_cnt[5]), .C(n21), .D(n20), .Y(n25) );
  CLKXOR2X2M U42 ( .A(N17), .B(edge_cnt[4]), .Y(n24) );
  CLKXOR2X2M U43 ( .A(N15), .B(edge_cnt[2]), .Y(n23) );
  CLKXOR2X2M U44 ( .A(N16), .B(edge_cnt[3]), .Y(n22) );
  NOR4X1M U45 ( .A(n25), .B(n24), .C(n23), .D(n22), .Y(N19) );
  OAI32X1M U46 ( .A0(n26), .A1(n27), .A2(n28), .B0(n29), .B1(n30), .Y(n57) );
  AOI21X1M U47 ( .A0(sample_2), .A1(sample_1), .B0(n31), .Y(n29) );
  AOI2BB1X1M U48 ( .A0N(sample_2), .A1N(sample_1), .B0(n32), .Y(n31) );
  CLKINVX1M U49 ( .A(sampled_bit), .Y(n26) );
  MXI2X1M U50 ( .A(n33), .B(n37), .S0(n38), .Y(n36) );
  NOR2BX1M U51 ( .AN(N19), .B(N12), .Y(n38) );
  CLKNAND2X2M U52 ( .A(sample_2), .B(data_sampl_en), .Y(n33) );
  MXI2X1M U53 ( .A(n37), .B(n32), .S0(n39), .Y(n35) );
  AOI21X1M U54 ( .A0(n40), .A1(n41), .B0(n28), .Y(n39) );
  CLKINVX1M U55 ( .A(data_sampl_en), .Y(n28) );
  CLKINVX1M U56 ( .A(sample_3), .Y(n32) );
  MXI2X1M U57 ( .A(n42), .B(n37), .S0(N12), .Y(n34) );
  CLKNAND2X2M U58 ( .A(RX_IN), .B(data_sampl_en), .Y(n37) );
  CLKNAND2X2M U59 ( .A(sample_1), .B(data_sampl_en), .Y(n42) );
  CLKINVX1M U60 ( .A(n30), .Y(N37) );
  CLKNAND2X2M U61 ( .A(n27), .B(data_sampl_en), .Y(n30) );
  AND2X1M U62 ( .A(n43), .B(n44), .Y(n27) );
  NOR4BX1M U63 ( .AN(n41), .B(n40), .C(n45), .D(n46), .Y(n44) );
  CLKXOR2X2M U64 ( .A(edge_cnt[1]), .B(N22), .Y(n46) );
  CLKXOR2X2M U65 ( .A(edge_cnt[0]), .B(N13), .Y(n45) );
  AND4X1M U66 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n40) );
  NOR3X1M U67 ( .A(n51), .B(edge_cnt[5]), .C(n52), .Y(n50) );
  CLKXOR2X2M U68 ( .A(N6), .B(edge_cnt[0]), .Y(n52) );
  CLKXOR2X2M U69 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n51) );
  XNOR2X1M U70 ( .A(edge_cnt[2]), .B(prescale[3]), .Y(n49) );
  XNOR2X1M U71 ( .A(edge_cnt[3]), .B(prescale[4]), .Y(n48) );
  XNOR2X1M U72 ( .A(edge_cnt[1]), .B(prescale[2]), .Y(n47) );
  NOR2X1M U73 ( .A(N19), .B(N12), .Y(n41) );
  NOR4X1M U74 ( .A(n53), .B(n54), .C(n55), .D(n56), .Y(n43) );
  CLKXOR2X2M U75 ( .A(edge_cnt[5]), .B(N26), .Y(n56) );
  CLKXOR2X2M U76 ( .A(edge_cnt[4]), .B(N25), .Y(n55) );
  CLKXOR2X2M U77 ( .A(edge_cnt[3]), .B(N24), .Y(n54) );
  CLKXOR2X2M U78 ( .A(edge_cnt[2]), .B(N23), .Y(n53) );
endmodule


module FSM_test_1 ( PAR_EN, RX_IN, edge_cnt, bit_cnt, prescale, start_glitch, 
        stop_err, par_err, CLK, RST, DATA_VALID, count_enable, deser_en, 
        stop_chk_en, start_chk_en, par_chk_en, data_sampl_en, test_si, test_so, 
        test_se );
  input [5:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] prescale;
  input PAR_EN, RX_IN, start_glitch, stop_err, par_err, CLK, RST, test_si,
         test_se;
  output DATA_VALID, count_enable, deser_en, stop_chk_en, start_chk_en,
         par_chk_en, data_sampl_en, test_so;
  wire   N40, N41, N42, N43, N44, N45, N46, N47, N76, N77, N78, N79, N80, N81,
         N83, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, \r77/carry[5] , \r77/carry[4] , \r77/carry[3] , n1, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign N76 = prescale[0];
  assign test_so = n47;

  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n45), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n48), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[2]) );
  NOR2X2M U4 ( .A(prescale[5]), .B(\r77/carry[5] ), .Y(n1) );
  NOR2X2M U5 ( .A(n44), .B(n48), .Y(deser_en) );
  NOR3X2M U6 ( .A(n47), .B(n48), .C(n45), .Y(n42) );
  NOR2X2M U7 ( .A(n47), .B(n46), .Y(stop_chk_en) );
  INVX2M U10 ( .A(n31), .Y(n46) );
  INVX2M U11 ( .A(n34), .Y(n44) );
  NOR3BX2M U12 ( .AN(N47), .B(bit_cnt[1]), .C(bit_cnt[2]), .Y(n30) );
  OAI31X1M U13 ( .A0(n43), .A1(PAR_EN), .A2(n28), .B0(n29), .Y(next_state[2])
         );
  INVX2M U14 ( .A(deser_en), .Y(n43) );
  AOI31X2M U15 ( .A0(n30), .A1(n31), .A2(n32), .B0(stop_chk_en), .Y(n29) );
  NOR2X2M U16 ( .A(n49), .B(n51), .Y(n32) );
  NAND4X2M U17 ( .A(start_glitch), .B(n30), .C(n49), .D(n51), .Y(n39) );
  NAND3X2M U18 ( .A(n30), .B(n49), .C(bit_cnt[3]), .Y(n28) );
  OAI211X2M U19 ( .A0(RX_IN), .A1(n36), .B0(n37), .C0(n38), .Y(next_state[0])
         );
  AOI31X2M U20 ( .A0(n48), .A1(n47), .A2(n45), .B0(n42), .Y(n36) );
  NAND4X2M U21 ( .A(N83), .B(stop_chk_en), .C(n40), .D(bit_cnt[3]), .Y(n37) );
  AOI22X1M U22 ( .A0(deser_en), .A1(n28), .B0(start_chk_en), .B1(n39), .Y(n38)
         );
  OAI211X2M U23 ( .A0(current_state[2]), .A1(n48), .B0(n33), .C0(n46), .Y(
        next_state[1]) );
  NAND3X2M U24 ( .A(n30), .B(n34), .C(n35), .Y(n33) );
  NOR3X2M U25 ( .A(bit_cnt[0]), .B(start_glitch), .C(bit_cnt[3]), .Y(n35) );
  OR2X2M U26 ( .A(prescale[1]), .B(N76), .Y(n3) );
  INVX2M U27 ( .A(prescale[1]), .Y(N77) );
  NOR2X2M U28 ( .A(n45), .B(current_state[2]), .Y(n34) );
  NOR3BX2M U29 ( .AN(n42), .B(stop_err), .C(par_err), .Y(DATA_VALID) );
  NOR2X2M U30 ( .A(n48), .B(current_state[0]), .Y(n31) );
  NOR2X2M U31 ( .A(bit_cnt[2]), .B(n41), .Y(n40) );
  AOI33X2M U32 ( .A0(n52), .A1(n50), .A2(bit_cnt[0]), .B0(PAR_EN), .B1(n49), 
        .B2(bit_cnt[1]), .Y(n41) );
  INVX2M U33 ( .A(PAR_EN), .Y(n52) );
  INVX2M U34 ( .A(bit_cnt[1]), .Y(n50) );
  NOR2X2M U35 ( .A(current_state[2]), .B(n46), .Y(par_chk_en) );
  NOR2X2M U36 ( .A(n44), .B(current_state[1]), .Y(start_chk_en) );
  INVX2M U37 ( .A(bit_cnt[0]), .Y(n49) );
  INVX2M U38 ( .A(current_state[1]), .Y(n48) );
  INVX2M U39 ( .A(bit_cnt[3]), .Y(n51) );
  INVX2M U40 ( .A(current_state[2]), .Y(n47) );
  INVX2M U41 ( .A(current_state[0]), .Y(n45) );
  BUFX2M U42 ( .A(count_enable), .Y(data_sampl_en) );
  NAND2X2M U43 ( .A(n46), .B(n44), .Y(count_enable) );
  XNOR2X1M U44 ( .A(\r77/carry[5] ), .B(prescale[5]), .Y(N81) );
  OR2X1M U45 ( .A(prescale[4]), .B(\r77/carry[4] ), .Y(\r77/carry[5] ) );
  XNOR2X1M U46 ( .A(\r77/carry[4] ), .B(prescale[4]), .Y(N80) );
  OR2X1M U47 ( .A(prescale[3]), .B(\r77/carry[3] ), .Y(\r77/carry[4] ) );
  XNOR2X1M U48 ( .A(\r77/carry[3] ), .B(prescale[3]), .Y(N79) );
  OR2X1M U49 ( .A(prescale[2]), .B(prescale[1]), .Y(\r77/carry[3] ) );
  XNOR2X1M U50 ( .A(prescale[1]), .B(prescale[2]), .Y(N78) );
  CLKINVX1M U51 ( .A(N76), .Y(N40) );
  OAI2BB1X1M U52 ( .A0N(N76), .A1N(prescale[1]), .B0(n3), .Y(N41) );
  OR2X1M U53 ( .A(n3), .B(prescale[2]), .Y(n4) );
  OAI2BB1X1M U54 ( .A0N(n3), .A1N(prescale[2]), .B0(n4), .Y(N42) );
  OR2X1M U55 ( .A(n4), .B(prescale[3]), .Y(n5) );
  OAI2BB1X1M U56 ( .A0N(n4), .A1N(prescale[3]), .B0(n5), .Y(N43) );
  OR2X1M U57 ( .A(n5), .B(prescale[4]), .Y(n6) );
  OAI2BB1X1M U58 ( .A0N(n5), .A1N(prescale[4]), .B0(n6), .Y(N44) );
  NOR2X1M U59 ( .A(n6), .B(prescale[5]), .Y(N46) );
  AO21XLM U60 ( .A0(n6), .A1(prescale[5]), .B0(N46), .Y(N45) );
  NOR2BX1M U61 ( .AN(N40), .B(edge_cnt[0]), .Y(n7) );
  OAI2B2X1M U62 ( .A1N(edge_cnt[1]), .A0(n7), .B0(N41), .B1(n7), .Y(n11) );
  XNOR2X1M U63 ( .A(N45), .B(edge_cnt[5]), .Y(n10) );
  NOR2BX1M U64 ( .AN(edge_cnt[0]), .B(N40), .Y(n8) );
  OAI2B2X1M U65 ( .A1N(N41), .A0(n8), .B0(edge_cnt[1]), .B1(n8), .Y(n9) );
  NAND4BX1M U66 ( .AN(N46), .B(n11), .C(n10), .D(n9), .Y(n18) );
  CLKXOR2X2M U67 ( .A(N44), .B(edge_cnt[4]), .Y(n14) );
  CLKXOR2X2M U68 ( .A(N42), .B(edge_cnt[2]), .Y(n13) );
  CLKXOR2X2M U69 ( .A(N43), .B(edge_cnt[3]), .Y(n12) );
  NOR4X1M U70 ( .A(n18), .B(n14), .C(n13), .D(n12), .Y(N47) );
  NOR2BX1M U71 ( .AN(N76), .B(edge_cnt[0]), .Y(n19) );
  OAI2B2X1M U72 ( .A1N(edge_cnt[1]), .A0(n19), .B0(N77), .B1(n19), .Y(n23) );
  XNOR2X1M U73 ( .A(N81), .B(edge_cnt[5]), .Y(n22) );
  NOR2BX1M U74 ( .AN(edge_cnt[0]), .B(N76), .Y(n20) );
  OAI2B2X1M U75 ( .A1N(N77), .A0(n20), .B0(edge_cnt[1]), .B1(n20), .Y(n21) );
  NAND4BX1M U76 ( .AN(n1), .B(n23), .C(n22), .D(n21), .Y(n27) );
  CLKXOR2X2M U77 ( .A(N80), .B(edge_cnt[4]), .Y(n26) );
  CLKXOR2X2M U78 ( .A(N78), .B(edge_cnt[2]), .Y(n25) );
  CLKXOR2X2M U79 ( .A(N79), .B(edge_cnt[3]), .Y(n24) );
  NOR4X1M U80 ( .A(n27), .B(n26), .C(n25), .D(n24), .Y(N83) );
endmodule


module UART_RX_DATA_WIDTH8_test_1 ( RX_IN, PAR_EN, PAR_TYP, prescale, CLK, RST, 
        DATA_VALID, par_err, stop_err, P_DATA, test_si, test_so, test_se );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYP, CLK, RST, test_si, test_se;
  output DATA_VALID, par_err, stop_err, test_so;
  wire   count_enable, sampled_bit, deser_en, sampled_bit_valid, start_chk_en,
         start_glitch, stop_chk_en, par_chk_en, data_sampl_en, n1, n2, n4;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;

  INVX2M U8 ( .A(n2), .Y(n1) );
  INVX2M U9 ( .A(RST), .Y(n2) );
  EDGE_BIT_COUNTER_test_1 U1 ( .count_enable(count_enable), .prescale(prescale), .CLK(CLK), .RST(n1), .edge_cnt(edge_cnt), .bit_cnt(bit_cnt), .test_si(
        test_si), .test_se(test_se) );
  DESERIALIZER_DATA_WIDTH8_test_1 U2 ( .sampled_bit(sampled_bit), .deser_en(
        deser_en), .sampled_bit_valid(sampled_bit_valid), .CLK(CLK), .RST(n1), 
        .P_DATA(P_DATA), .test_si(edge_cnt[5]), .test_so(n4), .test_se(test_se) );
  START_CHECK_test_1 U3 ( .start_chk_en(start_chk_en), .sampled_bit_valid(
        sampled_bit_valid), .sampled_bit(sampled_bit), .CLK(CLK), .RST(n1), 
        .start_glitch(start_glitch), .test_si(n4), .test_se(test_se) );
  STOP_CHECK_test_1 U4 ( .stop_chk_en(stop_chk_en), .sampled_bit_valid(
        sampled_bit_valid), .sampled_bit(sampled_bit), .CLK(CLK), .RST(n1), 
        .stop_err(stop_err), .test_si(start_glitch), .test_se(test_se) );
  PAR_CHECK_DATA_WIDTH8_test_1 U5 ( .par_chk_en(par_chk_en), .PAR_TYP(PAR_TYP), 
        .sampled_bit_valid(sampled_bit_valid), .sampled_bit(sampled_bit), 
        .P_DATA(P_DATA), .CLK(CLK), .RST(n1), .par_err(par_err), .test_si(
        stop_err), .test_se(test_se) );
  DATA_SAMPLING_test_1 U6 ( .edge_cnt(edge_cnt), .data_sampl_en(data_sampl_en), 
        .RX_IN(RX_IN), .prescale(prescale), .CLK(CLK), .RST(n1), .sampled_bit(
        sampled_bit), .sampled_bit_valid(sampled_bit_valid), .test_si(par_err), 
        .test_se(test_se) );
  FSM_test_1 U7 ( .PAR_EN(PAR_EN), .RX_IN(RX_IN), .edge_cnt(edge_cnt), 
        .bit_cnt(bit_cnt), .prescale(prescale), .start_glitch(start_glitch), 
        .stop_err(stop_err), .par_err(par_err), .CLK(CLK), .RST(n1), 
        .DATA_VALID(DATA_VALID), .count_enable(count_enable), .deser_en(
        deser_en), .stop_chk_en(stop_chk_en), .start_chk_en(start_chk_en), 
        .par_chk_en(par_chk_en), .data_sampl_en(data_sampl_en), .test_si(
        sampled_bit_valid), .test_so(test_so), .test_se(test_se) );
endmodule


module UART_TOP_test_1 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, 
        TX_IN_P, TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, 
        parity_type, parity_error, framing_error, test_si2, test_si1, test_so1, 
        test_se );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type,
         test_si2, test_si1, test_se;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error, test_so1;
  wire   n1, n2, n4;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_TX_DATA_WIDTH8_test_1 U_UART_TX ( .IN_DATA(TX_IN_P), .DATA_VALID(
        TX_IN_V), .PAR_EN(parity_enable), .PAR_TYP(parity_type), .CLK(TX_CLK), 
        .RST(n1), .TX_OUT(TX_OUT_S), .BUSY(TX_OUT_V), .test_si2(test_si2), 
        .test_si1(n4), .test_so1(test_so1), .test_se(test_se) );
  UART_RX_DATA_WIDTH8_test_1 U_UART_RX ( .RX_IN(RX_IN_S), .PAR_EN(
        parity_enable), .PAR_TYP(parity_type), .prescale(Prescale), .CLK(
        RX_CLK), .RST(n1), .DATA_VALID(RX_OUT_V), .par_err(parity_error), 
        .stop_err(framing_error), .P_DATA(RX_OUT_P), .test_si(test_si1), 
        .test_so(n4), .test_se(test_se) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, ALU_OUT, ALU_OUT_VALID, RF_RdData, 
        RF_RdData_VALID, UART_IN_DATA, UART_IN_VALID, FULL_FLAG, ALU_EN, 
        ALU_FUN, RF_WrEn, RF_RdEn, RF_Addres, RF_WrData, TX_P_DATA, TX_D_VALID, 
        CLK_GATE_EN, CLK_DIV_EN, test_si, test_so, test_se );
  input [15:0] ALU_OUT;
  input [7:0] RF_RdData;
  input [7:0] UART_IN_DATA;
  output [3:0] ALU_FUN;
  output [3:0] RF_Addres;
  output [7:0] RF_WrData;
  output [7:0] TX_P_DATA;
  input CLK, RST, ALU_OUT_VALID, RF_RdData_VALID, UART_IN_VALID, FULL_FLAG,
         test_si, test_se;
  output ALU_EN, RF_WrEn, RF_RdEn, TX_D_VALID, CLK_GATE_EN, CLK_DIV_EN,
         test_so;
  wire   n29, n30, n31, n32, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n33, n34, n35, n36, n37, n38, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  wire   [7:0] STORE_2ND_BYTE_OF_ALU_OUT;
  assign test_so = current_state[3];

  SDFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[7]  ( .D(n91), .SI(
        STORE_2ND_BYTE_OF_ALU_OUT[6]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        STORE_2ND_BYTE_OF_ALU_OUT[7]) );
  SDFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[6]  ( .D(n90), .SI(
        STORE_2ND_BYTE_OF_ALU_OUT[5]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        STORE_2ND_BYTE_OF_ALU_OUT[6]) );
  SDFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[5]  ( .D(n89), .SI(
        STORE_2ND_BYTE_OF_ALU_OUT[4]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        STORE_2ND_BYTE_OF_ALU_OUT[5]) );
  SDFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[4]  ( .D(n88), .SI(
        STORE_2ND_BYTE_OF_ALU_OUT[3]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        STORE_2ND_BYTE_OF_ALU_OUT[4]) );
  SDFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[3]  ( .D(n87), .SI(
        STORE_2ND_BYTE_OF_ALU_OUT[2]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        STORE_2ND_BYTE_OF_ALU_OUT[3]) );
  SDFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[2]  ( .D(n86), .SI(
        STORE_2ND_BYTE_OF_ALU_OUT[1]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        STORE_2ND_BYTE_OF_ALU_OUT[2]) );
  SDFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[1]  ( .D(n85), .SI(
        STORE_2ND_BYTE_OF_ALU_OUT[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        STORE_2ND_BYTE_OF_ALU_OUT[1]) );
  SDFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[0]  ( .D(n84), .SI(test_si), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(STORE_2ND_BYTE_OF_ALU_OUT[0]) );
  SDFFRX1M \STORE_ADDRESS_DATA_reg[2]  ( .D(n94), .SI(n104), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(n103), .QN(n30) );
  SDFFRX1M \STORE_ADDRESS_DATA_reg[0]  ( .D(n92), .SI(
        STORE_2ND_BYTE_OF_ALU_OUT[7]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        n105), .QN(n32) );
  SDFFRX1M \STORE_ADDRESS_DATA_reg[1]  ( .D(n93), .SI(n105), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(n104), .QN(n31) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(n102), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n37), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n21), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .SI(n34), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[3]) );
  SDFFRX1M \STORE_ADDRESS_DATA_reg[3]  ( .D(n95), .SI(n103), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(n102), .QN(n29) );
  NOR2X2M U22 ( .A(n83), .B(n76), .Y(ALU_FUN[2]) );
  NOR2X2M U23 ( .A(n83), .B(n78), .Y(ALU_FUN[0]) );
  OAI22X2M U24 ( .A0(n44), .A1(n76), .B0(n30), .B1(n81), .Y(RF_Addres[2]) );
  INVX2M U25 ( .A(RF_WrEn), .Y(n24) );
  INVX2M U26 ( .A(n43), .Y(n26) );
  NOR3BX2M U27 ( .AN(n79), .B(n80), .C(n55), .Y(n75) );
  NOR2X2M U28 ( .A(n38), .B(n21), .Y(n82) );
  NOR3X2M U29 ( .A(n25), .B(n20), .C(n36), .Y(n80) );
  NOR2X2M U30 ( .A(n101), .B(n75), .Y(RF_WrEn) );
  NOR3X2M U31 ( .A(n21), .B(n20), .C(n36), .Y(n55) );
  INVX2M U32 ( .A(n20), .Y(n34) );
  INVX2M U33 ( .A(n21), .Y(n25) );
  INVX2M U34 ( .A(n72), .Y(n36) );
  OR3X2M U35 ( .A(n64), .B(n22), .C(n63), .Y(TX_D_VALID) );
  NOR2X2M U36 ( .A(n74), .B(FULL_FLAG), .Y(n64) );
  NOR2X2M U37 ( .A(n75), .B(n78), .Y(RF_WrData[0]) );
  NOR2X2M U38 ( .A(n75), .B(n77), .Y(RF_WrData[1]) );
  NOR2X2M U39 ( .A(n75), .B(n76), .Y(RF_WrData[2]) );
  NOR2XLM U40 ( .A(n75), .B(n59), .Y(RF_WrData[3]) );
  NAND4X2M U41 ( .A(n20), .B(n25), .C(n37), .D(n38), .Y(n44) );
  NOR2X2M U42 ( .A(n44), .B(n101), .Y(RF_RdEn) );
  NAND3X2M U43 ( .A(n82), .B(n37), .C(n20), .Y(n43) );
  NOR2X2M U44 ( .A(n98), .B(n24), .Y(RF_WrData[4]) );
  NOR2X2M U45 ( .A(n99), .B(n24), .Y(RF_WrData[6]) );
  NOR2X2M U46 ( .A(n100), .B(n24), .Y(RF_WrData[7]) );
  INVX2M U47 ( .A(n22), .Y(n23) );
  INVX2M U48 ( .A(n41), .Y(n33) );
  INVX2M U49 ( .A(n48), .Y(n28) );
  NAND3X2M U50 ( .A(n37), .B(n34), .C(n82), .Y(n83) );
  NOR2X2M U51 ( .A(n83), .B(n101), .Y(ALU_EN) );
  OAI21X2M U52 ( .A0(n101), .A1(n37), .B0(n38), .Y(n42) );
  INVX2M U53 ( .A(n49), .Y(n27) );
  NOR2X2M U54 ( .A(n83), .B(n77), .Y(ALU_FUN[1]) );
  NOR2X2M U55 ( .A(n59), .B(n83), .Y(ALU_FUN[3]) );
  NAND3X2M U56 ( .A(n83), .B(n43), .C(n74), .Y(CLK_GATE_EN) );
  OAI22X4M U57 ( .A0(n59), .A1(n44), .B0(n29), .B1(n81), .Y(RF_Addres[3]) );
  NOR2X2M U58 ( .A(n37), .B(current_state[3]), .Y(n72) );
  NAND2X2M U59 ( .A(n80), .B(UART_IN_VALID), .Y(n81) );
  INVX2M U60 ( .A(current_state[1]), .Y(n37) );
  AND3X2M U61 ( .A(n72), .B(RF_RdData_VALID), .C(n73), .Y(n63) );
  NOR3X2M U62 ( .A(n34), .B(n21), .C(FULL_FLAG), .Y(n73) );
  INVX2M U63 ( .A(current_state[3]), .Y(n38) );
  BUFX2M U64 ( .A(current_state[2]), .Y(n20) );
  BUFX2M U65 ( .A(current_state[0]), .Y(n21) );
  NAND3X2M U66 ( .A(n82), .B(n34), .C(current_state[1]), .Y(n79) );
  BUFX2M U67 ( .A(n60), .Y(n22) );
  NOR3BX2M U68 ( .AN(ALU_OUT_VALID), .B(FULL_FLAG), .C(n43), .Y(n60) );
  OAI222X1M U69 ( .A0(n101), .A1(n79), .B0(n32), .B1(n81), .C0(n44), .C1(n78), 
        .Y(RF_Addres[0]) );
  OAI22X1M U70 ( .A0(n44), .A1(n77), .B0(n31), .B1(n81), .Y(RF_Addres[1]) );
  NOR4BX1M U71 ( .AN(n58), .B(n20), .C(current_state[3]), .D(current_state[1]), 
        .Y(n56) );
  NOR3X2M U72 ( .A(n100), .B(n21), .C(n59), .Y(n58) );
  OAI33X2M U73 ( .A0(n42), .A1(n20), .A2(n25), .B0(n57), .B1(UART_IN_DATA[0]), 
        .B2(n48), .Y(next_state[0]) );
  NAND3X2M U74 ( .A(n98), .B(n99), .C(n97), .Y(n57) );
  NOR2BX2M U75 ( .AN(UART_IN_DATA[5]), .B(n24), .Y(RF_WrData[5]) );
  NAND2X2M U76 ( .A(UART_IN_VALID), .B(UART_IN_DATA[3]), .Y(n59) );
  OAI31X1M U77 ( .A0(n35), .A1(n20), .A2(n21), .B0(n39), .Y(next_state[3]) );
  INVX2M U78 ( .A(n42), .Y(n35) );
  AOI31X2M U79 ( .A0(UART_IN_DATA[4]), .A1(UART_IN_DATA[0]), .A2(n40), .B0(n26), .Y(n39) );
  NOR3X2M U80 ( .A(n41), .B(UART_IN_DATA[5]), .C(UART_IN_DATA[1]), .Y(n40) );
  NAND3X2M U81 ( .A(UART_IN_DATA[2]), .B(n56), .C(UART_IN_DATA[6]), .Y(n41) );
  NAND2X2M U82 ( .A(UART_IN_DATA[1]), .B(UART_IN_VALID), .Y(n77) );
  NAND2X2M U83 ( .A(UART_IN_DATA[2]), .B(UART_IN_VALID), .Y(n76) );
  INVX2M U84 ( .A(UART_IN_VALID), .Y(n101) );
  NAND2X2M U85 ( .A(UART_IN_DATA[0]), .B(UART_IN_VALID), .Y(n78) );
  NAND3X2M U86 ( .A(UART_IN_DATA[1]), .B(n56), .C(UART_IN_DATA[5]), .Y(n48) );
  OAI2BB1X2M U87 ( .A0N(ALU_OUT[0]), .A1N(n22), .B0(n71), .Y(TX_P_DATA[0]) );
  AOI22X1M U88 ( .A0(RF_RdData[0]), .A1(n63), .B0(n64), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[0]), .Y(n71) );
  OAI2BB1X2M U89 ( .A0N(ALU_OUT[1]), .A1N(n22), .B0(n70), .Y(TX_P_DATA[1]) );
  AOI22X1M U90 ( .A0(RF_RdData[1]), .A1(n63), .B0(n64), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[1]), .Y(n70) );
  OAI2BB1X2M U91 ( .A0N(ALU_OUT[2]), .A1N(n22), .B0(n69), .Y(TX_P_DATA[2]) );
  AOI22X1M U92 ( .A0(RF_RdData[2]), .A1(n63), .B0(n64), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[2]), .Y(n69) );
  OAI2BB1X2M U93 ( .A0N(ALU_OUT[3]), .A1N(n22), .B0(n68), .Y(TX_P_DATA[3]) );
  AOI22X1M U94 ( .A0(RF_RdData[3]), .A1(n63), .B0(n64), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[3]), .Y(n68) );
  OAI2BB1X2M U95 ( .A0N(ALU_OUT[4]), .A1N(n22), .B0(n67), .Y(TX_P_DATA[4]) );
  AOI22X1M U96 ( .A0(RF_RdData[4]), .A1(n63), .B0(n64), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[4]), .Y(n67) );
  OAI2BB1X2M U97 ( .A0N(ALU_OUT[5]), .A1N(n22), .B0(n66), .Y(TX_P_DATA[5]) );
  AOI22X1M U98 ( .A0(RF_RdData[5]), .A1(n63), .B0(n64), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[5]), .Y(n66) );
  OAI2BB1X2M U99 ( .A0N(ALU_OUT[6]), .A1N(n22), .B0(n65), .Y(TX_P_DATA[6]) );
  AOI22X1M U100 ( .A0(RF_RdData[6]), .A1(n63), .B0(n64), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[6]), .Y(n65) );
  OAI2BB1X2M U101 ( .A0N(ALU_OUT[7]), .A1N(n22), .B0(n62), .Y(TX_P_DATA[7]) );
  AOI22X1M U102 ( .A0(RF_RdData[7]), .A1(n63), .B0(n64), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[7]), .Y(n62) );
  NAND3X2M U103 ( .A(n20), .B(n82), .C(current_state[1]), .Y(n74) );
  NAND4BX1M U104 ( .AN(ALU_EN), .B(n43), .C(n44), .D(n45), .Y(next_state[2])
         );
  AOI31X2M U105 ( .A0(n28), .A1(UART_IN_DATA[4]), .A2(n46), .B0(n47), .Y(n45)
         );
  NOR3X2M U106 ( .A(n96), .B(UART_IN_DATA[6]), .C(UART_IN_DATA[2]), .Y(n46) );
  NOR4X1M U107 ( .A(current_state[3]), .B(n21), .C(RF_RdData_VALID), .D(n34), 
        .Y(n47) );
  NAND4BX1M U108 ( .AN(RF_RdEn), .B(n49), .C(n50), .D(n51), .Y(next_state[1])
         );
  AOI21X2M U109 ( .A0(ALU_OUT_VALID), .A1(n26), .B0(n52), .Y(n51) );
  AOI31X2M U110 ( .A0(n33), .A1(n96), .A2(n54), .B0(n55), .Y(n50) );
  OAI33X2M U111 ( .A0(n36), .A1(n21), .A2(RF_RdData_VALID), .B0(n53), .B1(n20), 
        .B2(UART_IN_VALID), .Y(n52) );
  AO22X1M U112 ( .A0(n23), .A1(STORE_2ND_BYTE_OF_ALU_OUT[0]), .B0(ALU_OUT[8]), 
        .B1(n22), .Y(n84) );
  AO22X1M U113 ( .A0(n23), .A1(STORE_2ND_BYTE_OF_ALU_OUT[1]), .B0(ALU_OUT[9]), 
        .B1(n22), .Y(n85) );
  AO22X1M U114 ( .A0(n23), .A1(STORE_2ND_BYTE_OF_ALU_OUT[2]), .B0(ALU_OUT[10]), 
        .B1(n22), .Y(n86) );
  AO22X1M U115 ( .A0(n23), .A1(STORE_2ND_BYTE_OF_ALU_OUT[3]), .B0(ALU_OUT[11]), 
        .B1(n22), .Y(n87) );
  AO22X1M U116 ( .A0(n23), .A1(STORE_2ND_BYTE_OF_ALU_OUT[4]), .B0(ALU_OUT[12]), 
        .B1(n22), .Y(n88) );
  AO22X1M U117 ( .A0(n23), .A1(STORE_2ND_BYTE_OF_ALU_OUT[5]), .B0(ALU_OUT[13]), 
        .B1(n22), .Y(n89) );
  AO22X1M U118 ( .A0(n23), .A1(STORE_2ND_BYTE_OF_ALU_OUT[6]), .B0(ALU_OUT[14]), 
        .B1(n22), .Y(n90) );
  AO22X1M U119 ( .A0(n23), .A1(STORE_2ND_BYTE_OF_ALU_OUT[7]), .B0(ALU_OUT[15]), 
        .B1(n22), .Y(n91) );
  NAND4X2M U120 ( .A(n21), .B(UART_IN_VALID), .C(n61), .D(n37), .Y(n49) );
  NOR2X2M U121 ( .A(current_state[3]), .B(n20), .Y(n61) );
  OAI22X1M U122 ( .A0(n96), .A1(n49), .B0(n27), .B1(n32), .Y(n92) );
  OAI22X1M U123 ( .A0(n97), .A1(n49), .B0(n27), .B1(n30), .Y(n94) );
  NOR3X2M U124 ( .A(UART_IN_DATA[1]), .B(UART_IN_DATA[5]), .C(UART_IN_DATA[4]), 
        .Y(n54) );
  OAI21X2M U125 ( .A0(n38), .A1(n25), .B0(current_state[1]), .Y(n53) );
  OAI2BB2X1M U126 ( .B0(n27), .B1(n31), .A0N(UART_IN_DATA[1]), .A1N(n27), .Y(
        n93) );
  OAI2BB2X1M U127 ( .B0(n27), .B1(n29), .A0N(UART_IN_DATA[3]), .A1N(n27), .Y(
        n95) );
  INVX2M U128 ( .A(UART_IN_DATA[2]), .Y(n97) );
  INVX2M U129 ( .A(UART_IN_DATA[6]), .Y(n99) );
  INVX2M U130 ( .A(UART_IN_DATA[0]), .Y(n96) );
  INVX2M U131 ( .A(UART_IN_DATA[4]), .Y(n98) );
  INVX2M U132 ( .A(UART_IN_DATA[7]), .Y(n100) );
  INVX2M U3 ( .A(1'b0), .Y(CLK_DIV_EN) );
endmodule


module RegFile_test_1 ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, 
        RdData_VLD, OP_A, OP_B, UART_CONFIG, DIV_RATIO, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] OP_A;
  output [7:0] OP_B;
  output [7:0] UART_CONFIG;
  output [7:0] DIV_RATIO;
  input CLK, RST, WrEn, RdEn, test_si2, test_si1, test_se;
  output RdData_VLD, test_so2, test_so1;
  wire   N11, N12, N13, N14, \regArr[15][7] , \regArr[15][6] , \regArr[15][5] ,
         \regArr[15][4] , \regArr[15][3] , \regArr[15][2] , \regArr[15][1] ,
         \regArr[15][0] , \regArr[14][7] , \regArr[14][6] , \regArr[14][5] ,
         \regArr[14][4] , \regArr[14][3] , \regArr[14][2] , \regArr[14][1] ,
         \regArr[14][0] , \regArr[13][7] , \regArr[13][6] , \regArr[13][5] ,
         \regArr[13][4] , \regArr[13][3] , \regArr[13][2] , \regArr[13][1] ,
         \regArr[13][0] , \regArr[12][7] , \regArr[12][6] , \regArr[12][5] ,
         \regArr[12][4] , \regArr[12][3] , \regArr[12][2] , \regArr[12][1] ,
         \regArr[12][0] , \regArr[11][7] , \regArr[11][6] , \regArr[11][5] ,
         \regArr[11][4] , \regArr[11][3] , \regArr[11][2] , \regArr[11][1] ,
         \regArr[11][0] , \regArr[10][7] , \regArr[10][6] , \regArr[10][5] ,
         \regArr[10][4] , \regArr[10][3] , \regArr[10][2] , \regArr[10][1] ,
         \regArr[10][0] , \regArr[9][7] , \regArr[9][6] , \regArr[9][5] ,
         \regArr[9][4] , \regArr[9][3] , \regArr[9][2] , \regArr[9][1] ,
         \regArr[9][0] , \regArr[8][7] , \regArr[8][6] , \regArr[8][5] ,
         \regArr[8][4] , \regArr[8][3] , \regArr[8][2] , \regArr[8][1] ,
         \regArr[8][0] , \regArr[7][7] , \regArr[7][6] , \regArr[7][5] ,
         \regArr[7][4] , \regArr[7][3] , \regArr[7][2] , \regArr[7][1] ,
         \regArr[7][0] , \regArr[6][7] , \regArr[6][6] , \regArr[6][5] ,
         \regArr[6][4] , \regArr[6][3] , \regArr[6][2] , \regArr[6][1] ,
         \regArr[6][0] , \regArr[5][7] , \regArr[5][6] , \regArr[5][5] ,
         \regArr[5][4] , \regArr[5][3] , \regArr[5][2] , \regArr[5][1] ,
         \regArr[5][0] , \regArr[4][7] , \regArr[4][6] , \regArr[4][5] ,
         \regArr[4][4] , \regArr[4][3] , \regArr[4][2] , \regArr[4][1] ,
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n369, n370, n371, n372;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so2 = \regArr[15][7] ;
  assign test_so1 = \regArr[7][0] ;

  SDFFRQX2M \regArr_reg[13][7]  ( .D(n297), .SI(\regArr[13][6] ), .SE(n371), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][7] ) );
  SDFFRQX2M \regArr_reg[13][6]  ( .D(n296), .SI(\regArr[13][5] ), .SE(n370), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][6] ) );
  SDFFRQX2M \regArr_reg[13][5]  ( .D(n295), .SI(\regArr[13][4] ), .SE(n369), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][5] ) );
  SDFFRQX2M \regArr_reg[13][4]  ( .D(n294), .SI(\regArr[13][3] ), .SE(n372), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][4] ) );
  SDFFRQX2M \regArr_reg[13][3]  ( .D(n293), .SI(\regArr[13][2] ), .SE(n371), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][3] ) );
  SDFFRQX2M \regArr_reg[13][2]  ( .D(n292), .SI(\regArr[13][1] ), .SE(n370), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][2] ) );
  SDFFRQX2M \regArr_reg[13][1]  ( .D(n291), .SI(\regArr[13][0] ), .SE(n369), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][1] ) );
  SDFFRQX2M \regArr_reg[13][0]  ( .D(n290), .SI(\regArr[12][7] ), .SE(n372), 
        .CK(CLK), .RN(n350), .Q(\regArr[13][0] ) );
  SDFFRQX2M \regArr_reg[9][7]  ( .D(n265), .SI(\regArr[9][6] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][7] ) );
  SDFFRQX2M \regArr_reg[9][6]  ( .D(n264), .SI(\regArr[9][5] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][6] ) );
  SDFFRQX2M \regArr_reg[9][5]  ( .D(n263), .SI(\regArr[9][4] ), .SE(n369), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][5] ) );
  SDFFRQX2M \regArr_reg[9][4]  ( .D(n262), .SI(\regArr[9][3] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][4] ) );
  SDFFRQX2M \regArr_reg[9][3]  ( .D(n261), .SI(\regArr[9][2] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][3] ) );
  SDFFRQX2M \regArr_reg[9][2]  ( .D(n260), .SI(\regArr[9][1] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][2] ) );
  SDFFRQX2M \regArr_reg[9][1]  ( .D(n259), .SI(\regArr[9][0] ), .SE(n369), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][1] ) );
  SDFFRQX2M \regArr_reg[9][0]  ( .D(n258), .SI(\regArr[8][7] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\regArr[9][0] ) );
  SDFFRQX2M \regArr_reg[5][7]  ( .D(n233), .SI(\regArr[5][6] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][7] ) );
  SDFFRQX2M \regArr_reg[5][6]  ( .D(n232), .SI(\regArr[5][5] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][6] ) );
  SDFFRQX2M \regArr_reg[5][5]  ( .D(n231), .SI(\regArr[5][4] ), .SE(n369), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][5] ) );
  SDFFRQX2M \regArr_reg[5][4]  ( .D(n230), .SI(\regArr[5][3] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][4] ) );
  SDFFRQX2M \regArr_reg[5][3]  ( .D(n229), .SI(\regArr[5][2] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][3] ) );
  SDFFRQX2M \regArr_reg[5][2]  ( .D(n228), .SI(\regArr[5][1] ), .SE(n370), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][2] ) );
  SDFFRQX2M \regArr_reg[5][1]  ( .D(n227), .SI(\regArr[5][0] ), .SE(n369), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][1] ) );
  SDFFRQX2M \regArr_reg[5][0]  ( .D(n226), .SI(\regArr[4][7] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\regArr[5][0] ) );
  SDFFRQX2M \regArr_reg[15][7]  ( .D(n313), .SI(\regArr[15][6] ), .SE(n371), 
        .CK(CLK), .RN(n342), .Q(\regArr[15][7] ) );
  SDFFRQX2M \regArr_reg[15][6]  ( .D(n312), .SI(\regArr[15][5] ), .SE(n370), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][6] ) );
  SDFFRQX2M \regArr_reg[15][5]  ( .D(n311), .SI(\regArr[15][4] ), .SE(n369), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][5] ) );
  SDFFRQX2M \regArr_reg[15][4]  ( .D(n310), .SI(\regArr[15][3] ), .SE(n372), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][4] ) );
  SDFFRQX2M \regArr_reg[15][3]  ( .D(n309), .SI(\regArr[15][2] ), .SE(n371), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][3] ) );
  SDFFRQX2M \regArr_reg[15][2]  ( .D(n308), .SI(\regArr[15][1] ), .SE(n370), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][2] ) );
  SDFFRQX2M \regArr_reg[15][1]  ( .D(n307), .SI(\regArr[15][0] ), .SE(n369), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][1] ) );
  SDFFRQX2M \regArr_reg[15][0]  ( .D(n306), .SI(\regArr[14][7] ), .SE(n372), 
        .CK(CLK), .RN(n351), .Q(\regArr[15][0] ) );
  SDFFRQX2M \regArr_reg[11][7]  ( .D(n281), .SI(\regArr[11][6] ), .SE(n371), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][7] ) );
  SDFFRQX2M \regArr_reg[11][6]  ( .D(n280), .SI(\regArr[11][5] ), .SE(n370), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][6] ) );
  SDFFRQX2M \regArr_reg[11][5]  ( .D(n279), .SI(\regArr[11][4] ), .SE(n369), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][5] ) );
  SDFFRQX2M \regArr_reg[11][4]  ( .D(n278), .SI(\regArr[11][3] ), .SE(n372), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][4] ) );
  SDFFRQX2M \regArr_reg[11][3]  ( .D(n277), .SI(\regArr[11][2] ), .SE(n371), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][3] ) );
  SDFFRQX2M \regArr_reg[11][2]  ( .D(n276), .SI(\regArr[11][1] ), .SE(n370), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][2] ) );
  SDFFRQX2M \regArr_reg[11][1]  ( .D(n275), .SI(\regArr[11][0] ), .SE(n369), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][1] ) );
  SDFFRQX2M \regArr_reg[11][0]  ( .D(n274), .SI(\regArr[10][7] ), .SE(n372), 
        .CK(CLK), .RN(n349), .Q(\regArr[11][0] ) );
  SDFFRQX2M \regArr_reg[7][7]  ( .D(n249), .SI(\regArr[7][6] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][7] ) );
  SDFFRQX2M \regArr_reg[7][6]  ( .D(n248), .SI(\regArr[7][5] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][6] ) );
  SDFFRQX2M \regArr_reg[7][5]  ( .D(n247), .SI(\regArr[7][4] ), .SE(n369), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][5] ) );
  SDFFRQX2M \regArr_reg[7][4]  ( .D(n246), .SI(\regArr[7][3] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][4] ) );
  SDFFRQX2M \regArr_reg[7][3]  ( .D(n245), .SI(\regArr[7][2] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][3] ) );
  SDFFRQX2M \regArr_reg[7][2]  ( .D(n244), .SI(\regArr[7][1] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\regArr[7][2] ) );
  SDFFRQX2M \regArr_reg[7][1]  ( .D(n243), .SI(test_si2), .SE(n369), .CK(CLK), 
        .RN(n346), .Q(\regArr[7][1] ) );
  SDFFRQX2M \regArr_reg[7][0]  ( .D(n242), .SI(\regArr[6][7] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\regArr[7][0] ) );
  SDFFRQX2M \regArr_reg[14][7]  ( .D(n305), .SI(\regArr[14][6] ), .SE(n371), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][7] ) );
  SDFFRQX2M \regArr_reg[14][6]  ( .D(n304), .SI(\regArr[14][5] ), .SE(n370), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][6] ) );
  SDFFRQX2M \regArr_reg[14][5]  ( .D(n303), .SI(\regArr[14][4] ), .SE(n369), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][5] ) );
  SDFFRQX2M \regArr_reg[14][4]  ( .D(n302), .SI(\regArr[14][3] ), .SE(n372), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][4] ) );
  SDFFRQX2M \regArr_reg[14][3]  ( .D(n301), .SI(\regArr[14][2] ), .SE(n371), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][3] ) );
  SDFFRQX2M \regArr_reg[14][2]  ( .D(n300), .SI(\regArr[14][1] ), .SE(n370), 
        .CK(CLK), .RN(n350), .Q(\regArr[14][2] ) );
  SDFFRQX2M \regArr_reg[14][1]  ( .D(n299), .SI(\regArr[14][0] ), .SE(n369), 
        .CK(CLK), .RN(n350), .Q(\regArr[14][1] ) );
  SDFFRQX2M \regArr_reg[14][0]  ( .D(n298), .SI(\regArr[13][7] ), .SE(n372), 
        .CK(CLK), .RN(n350), .Q(\regArr[14][0] ) );
  SDFFRQX2M \regArr_reg[10][7]  ( .D(n273), .SI(\regArr[10][6] ), .SE(n371), 
        .CK(CLK), .RN(n349), .Q(\regArr[10][7] ) );
  SDFFRQX2M \regArr_reg[10][6]  ( .D(n272), .SI(\regArr[10][5] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][6] ) );
  SDFFRQX2M \regArr_reg[10][5]  ( .D(n271), .SI(\regArr[10][4] ), .SE(n369), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][5] ) );
  SDFFRQX2M \regArr_reg[10][4]  ( .D(n270), .SI(\regArr[10][3] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][4] ) );
  SDFFRQX2M \regArr_reg[10][3]  ( .D(n269), .SI(\regArr[10][2] ), .SE(n371), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][3] ) );
  SDFFRQX2M \regArr_reg[10][2]  ( .D(n268), .SI(\regArr[10][1] ), .SE(n370), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][2] ) );
  SDFFRQX2M \regArr_reg[10][1]  ( .D(n267), .SI(\regArr[10][0] ), .SE(n369), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][1] ) );
  SDFFRQX2M \regArr_reg[10][0]  ( .D(n266), .SI(\regArr[9][7] ), .SE(n372), 
        .CK(CLK), .RN(n348), .Q(\regArr[10][0] ) );
  SDFFRQX2M \regArr_reg[6][7]  ( .D(n241), .SI(\regArr[6][6] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][7] ) );
  SDFFRQX2M \regArr_reg[6][6]  ( .D(n240), .SI(\regArr[6][5] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][6] ) );
  SDFFRQX2M \regArr_reg[6][5]  ( .D(n239), .SI(\regArr[6][4] ), .SE(n369), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][5] ) );
  SDFFRQX2M \regArr_reg[6][4]  ( .D(n238), .SI(\regArr[6][3] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][4] ) );
  SDFFRQX2M \regArr_reg[6][3]  ( .D(n237), .SI(\regArr[6][2] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][3] ) );
  SDFFRQX2M \regArr_reg[6][2]  ( .D(n236), .SI(\regArr[6][1] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][2] ) );
  SDFFRQX2M \regArr_reg[6][1]  ( .D(n235), .SI(\regArr[6][0] ), .SE(n369), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][1] ) );
  SDFFRQX2M \regArr_reg[6][0]  ( .D(n234), .SI(\regArr[5][7] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\regArr[6][0] ) );
  SDFFRQX2M \regArr_reg[12][7]  ( .D(n289), .SI(\regArr[12][6] ), .SE(n371), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][7] ) );
  SDFFRQX2M \regArr_reg[12][6]  ( .D(n288), .SI(\regArr[12][5] ), .SE(n370), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][6] ) );
  SDFFRQX2M \regArr_reg[12][5]  ( .D(n287), .SI(\regArr[12][4] ), .SE(n369), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][5] ) );
  SDFFRQX2M \regArr_reg[12][4]  ( .D(n286), .SI(\regArr[12][3] ), .SE(n372), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][4] ) );
  SDFFRQX2M \regArr_reg[12][3]  ( .D(n285), .SI(\regArr[12][2] ), .SE(n371), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][3] ) );
  SDFFRQX2M \regArr_reg[12][2]  ( .D(n284), .SI(\regArr[12][1] ), .SE(n370), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][2] ) );
  SDFFRQX2M \regArr_reg[12][1]  ( .D(n283), .SI(\regArr[12][0] ), .SE(n369), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][1] ) );
  SDFFRQX2M \regArr_reg[12][0]  ( .D(n282), .SI(\regArr[11][7] ), .SE(n372), 
        .CK(CLK), .RN(n349), .Q(\regArr[12][0] ) );
  SDFFRQX2M \regArr_reg[8][7]  ( .D(n257), .SI(\regArr[8][6] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][7] ) );
  SDFFRQX2M \regArr_reg[8][6]  ( .D(n256), .SI(\regArr[8][5] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][6] ) );
  SDFFRQX2M \regArr_reg[8][5]  ( .D(n255), .SI(\regArr[8][4] ), .SE(n369), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][5] ) );
  SDFFRQX2M \regArr_reg[8][4]  ( .D(n254), .SI(\regArr[8][3] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][4] ) );
  SDFFRQX2M \regArr_reg[8][3]  ( .D(n253), .SI(\regArr[8][2] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][3] ) );
  SDFFRQX2M \regArr_reg[8][2]  ( .D(n252), .SI(\regArr[8][1] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][2] ) );
  SDFFRQX2M \regArr_reg[8][1]  ( .D(n251), .SI(\regArr[8][0] ), .SE(n369), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][1] ) );
  SDFFRQX2M \regArr_reg[8][0]  ( .D(n250), .SI(\regArr[7][7] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\regArr[8][0] ) );
  SDFFRQX2M \regArr_reg[4][7]  ( .D(n225), .SI(\regArr[4][6] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][7] ) );
  SDFFRQX2M \regArr_reg[4][6]  ( .D(n224), .SI(\regArr[4][5] ), .SE(n370), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][6] ) );
  SDFFRQX2M \regArr_reg[4][5]  ( .D(n223), .SI(\regArr[4][4] ), .SE(n369), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][5] ) );
  SDFFRQX2M \regArr_reg[4][4]  ( .D(n222), .SI(\regArr[4][3] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][4] ) );
  SDFFRQX2M \regArr_reg[4][3]  ( .D(n221), .SI(\regArr[4][2] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][3] ) );
  SDFFRQX2M \regArr_reg[4][2]  ( .D(n220), .SI(\regArr[4][1] ), .SE(n370), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][2] ) );
  SDFFRQX2M \regArr_reg[4][1]  ( .D(n219), .SI(\regArr[4][0] ), .SE(n369), 
        .CK(CLK), .RN(n345), .Q(\regArr[4][1] ) );
  SDFFRQX2M \regArr_reg[4][0]  ( .D(n218), .SI(DIV_RATIO[7]), .SE(n372), .CK(
        CLK), .RN(n345), .Q(\regArr[4][0] ) );
  SDFFRQX2M \RdData_reg[7]  ( .D(n184), .SI(RdData[6]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n183), .SI(RdData[5]), .SE(n370), .CK(CLK), 
        .RN(n342), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n182), .SI(RdData[4]), .SE(n369), .CK(CLK), 
        .RN(n342), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n181), .SI(RdData[3]), .SE(n372), .CK(CLK), 
        .RN(n342), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n180), .SI(RdData[2]), .SE(n371), .CK(CLK), 
        .RN(n342), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n179), .SI(RdData[1]), .SE(n370), .CK(CLK), 
        .RN(n342), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n178), .SI(RdData[0]), .SE(n369), .CK(CLK), 
        .RN(n342), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n177), .SI(RdData_VLD), .SE(n372), .CK(CLK), 
        .RN(n346), .Q(RdData[0]) );
  SDFFRQX2M \regArr_reg[3][0]  ( .D(n210), .SI(UART_CONFIG[7]), .SE(n371), 
        .CK(CLK), .RN(n344), .Q(DIV_RATIO[0]) );
  SDFFRQX2M \regArr_reg[1][7]  ( .D(n201), .SI(OP_B[6]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(OP_B[7]) );
  SDFFRQX2M \regArr_reg[1][6]  ( .D(n200), .SI(OP_B[5]), .SE(n369), .CK(CLK), 
        .RN(n343), .Q(OP_B[6]) );
  SDFFRQX2M \regArr_reg[1][1]  ( .D(n195), .SI(OP_B[0]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(OP_B[1]) );
  SDFFRQX2M \regArr_reg[0][7]  ( .D(n193), .SI(OP_A[6]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(OP_A[7]) );
  SDFFRQX2M \regArr_reg[0][6]  ( .D(n192), .SI(OP_A[5]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(OP_A[6]) );
  SDFFRQX2M \regArr_reg[0][5]  ( .D(n191), .SI(OP_A[4]), .SE(n369), .CK(CLK), 
        .RN(n343), .Q(OP_A[5]) );
  SDFFRQX2M \regArr_reg[0][4]  ( .D(n190), .SI(OP_A[3]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(OP_A[4]) );
  SDFFRQX2M \regArr_reg[0][3]  ( .D(n189), .SI(OP_A[2]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(OP_A[3]) );
  SDFFRQX2M \regArr_reg[0][2]  ( .D(n188), .SI(OP_A[1]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(OP_A[2]) );
  SDFFRQX2M \regArr_reg[0][1]  ( .D(n187), .SI(OP_A[0]), .SE(n369), .CK(CLK), 
        .RN(n342), .Q(OP_A[1]) );
  SDFFRQX2M \regArr_reg[0][0]  ( .D(n186), .SI(RdData[7]), .SE(n372), .CK(CLK), 
        .RN(n342), .Q(OP_A[0]) );
  SDFFRQX2M \regArr_reg[2][1]  ( .D(n203), .SI(UART_CONFIG[0]), .SE(n371), 
        .CK(CLK), .RN(n344), .Q(UART_CONFIG[1]) );
  SDFFSQX2M \regArr_reg[2][0]  ( .D(n202), .SI(OP_B[7]), .SE(test_se), .CK(CLK), .SN(n342), .Q(UART_CONFIG[0]) );
  SDFFRQX2M \regArr_reg[1][4]  ( .D(n198), .SI(OP_B[3]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(OP_B[4]) );
  SDFFRQX2M \regArr_reg[1][5]  ( .D(n199), .SI(OP_B[4]), .SE(n369), .CK(CLK), 
        .RN(n344), .Q(OP_B[5]) );
  SDFFRQX2M \regArr_reg[3][4]  ( .D(n214), .SI(DIV_RATIO[3]), .SE(n372), .CK(
        CLK), .RN(n344), .Q(DIV_RATIO[4]) );
  SDFFRQX2M \regArr_reg[3][6]  ( .D(n216), .SI(DIV_RATIO[5]), .SE(n371), .CK(
        CLK), .RN(n344), .Q(DIV_RATIO[6]) );
  SDFFRQX2M \regArr_reg[3][7]  ( .D(n217), .SI(DIV_RATIO[6]), .SE(n370), .CK(
        CLK), .RN(n344), .Q(DIV_RATIO[7]) );
  SDFFSQX2M \regArr_reg[3][5]  ( .D(n215), .SI(DIV_RATIO[4]), .SE(n369), .CK(
        CLK), .SN(n342), .Q(DIV_RATIO[5]) );
  SDFFRQX2M RdData_VLD_reg ( .D(n185), .SI(test_si1), .SE(n369), .CK(CLK), 
        .RN(n342), .Q(RdData_VLD) );
  SDFFRQX2M \regArr_reg[3][2]  ( .D(n212), .SI(DIV_RATIO[1]), .SE(n372), .CK(
        CLK), .RN(n344), .Q(DIV_RATIO[2]) );
  SDFFRQX2M \regArr_reg[3][3]  ( .D(n213), .SI(DIV_RATIO[2]), .SE(n371), .CK(
        CLK), .RN(n344), .Q(DIV_RATIO[3]) );
  SDFFRQX2M \regArr_reg[3][1]  ( .D(n211), .SI(DIV_RATIO[0]), .SE(n370), .CK(
        CLK), .RN(n344), .Q(DIV_RATIO[1]) );
  SDFFRQX2M \regArr_reg[2][2]  ( .D(n204), .SI(UART_CONFIG[1]), .SE(n369), 
        .CK(CLK), .RN(n344), .Q(UART_CONFIG[2]) );
  SDFFSQX2M \regArr_reg[2][7]  ( .D(n209), .SI(UART_CONFIG[6]), .SE(n372), 
        .CK(CLK), .SN(n342), .Q(UART_CONFIG[7]) );
  SDFFRQX2M \regArr_reg[2][5]  ( .D(n207), .SI(UART_CONFIG[4]), .SE(n372), 
        .CK(CLK), .RN(n344), .Q(UART_CONFIG[5]) );
  SDFFRQX2M \regArr_reg[2][6]  ( .D(n208), .SI(UART_CONFIG[5]), .SE(n371), 
        .CK(CLK), .RN(n344), .Q(UART_CONFIG[6]) );
  SDFFRQX2M \regArr_reg[2][3]  ( .D(n205), .SI(UART_CONFIG[2]), .SE(n370), 
        .CK(CLK), .RN(n344), .Q(UART_CONFIG[3]) );
  SDFFRQX2M \regArr_reg[2][4]  ( .D(n206), .SI(UART_CONFIG[3]), .SE(n369), 
        .CK(CLK), .RN(n344), .Q(UART_CONFIG[4]) );
  SDFFRQX2M \regArr_reg[1][2]  ( .D(n196), .SI(OP_B[1]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(OP_B[2]) );
  SDFFRQX2M \regArr_reg[1][3]  ( .D(n197), .SI(OP_B[2]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(OP_B[3]) );
  SDFFRQX2M \regArr_reg[1][0]  ( .D(n194), .SI(OP_A[7]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(OP_B[0]) );
  NOR2BX2M U140 ( .AN(n175), .B(n340), .Y(n169) );
  NOR2BX2M U141 ( .AN(n164), .B(n340), .Y(n155) );
  NOR2BX2M U142 ( .AN(N13), .B(N12), .Y(n160) );
  NOR2BX2M U143 ( .AN(N13), .B(n341), .Y(n163) );
  NOR2X2M U144 ( .A(n341), .B(N13), .Y(n157) );
  NOR2X2M U145 ( .A(N12), .B(N13), .Y(n152) );
  INVX2M U146 ( .A(WrData[5]), .Y(n364) );
  INVX2M U147 ( .A(n337), .Y(n338) );
  INVX2M U148 ( .A(n335), .Y(n336) );
  INVX2M U149 ( .A(n337), .Y(n339) );
  BUFX2M U150 ( .A(n340), .Y(n337) );
  BUFX2M U151 ( .A(n341), .Y(n335) );
  INVX2M U152 ( .A(n149), .Y(n357) );
  NOR2BX2M U153 ( .AN(n164), .B(N11), .Y(n153) );
  NOR2BX2M U154 ( .AN(n175), .B(N11), .Y(n167) );
  NAND2X2M U155 ( .A(n155), .B(n152), .Y(n154) );
  NAND2X2M U156 ( .A(n167), .B(n152), .Y(n166) );
  NAND2X2M U157 ( .A(n169), .B(n152), .Y(n168) );
  NAND2X2M U158 ( .A(n167), .B(n157), .Y(n170) );
  NAND2X2M U159 ( .A(n169), .B(n157), .Y(n171) );
  NAND2X2M U160 ( .A(n157), .B(n153), .Y(n156) );
  NAND2X2M U161 ( .A(n157), .B(n155), .Y(n158) );
  NAND2X2M U162 ( .A(n160), .B(n153), .Y(n159) );
  NAND2X2M U163 ( .A(n160), .B(n155), .Y(n161) );
  NAND2X2M U164 ( .A(n163), .B(n153), .Y(n162) );
  NAND2X2M U165 ( .A(n163), .B(n155), .Y(n165) );
  NAND2X2M U166 ( .A(n167), .B(n160), .Y(n172) );
  NAND2X2M U167 ( .A(n169), .B(n160), .Y(n173) );
  NAND2X2M U168 ( .A(n167), .B(n163), .Y(n174) );
  NAND2X2M U169 ( .A(n169), .B(n163), .Y(n176) );
  NAND2X2M U170 ( .A(n152), .B(n153), .Y(n151) );
  NOR2BX2M U171 ( .AN(WrEn), .B(RdEn), .Y(n150) );
  NAND2BX2M U172 ( .AN(WrEn), .B(RdEn), .Y(n149) );
  BUFX2M U173 ( .A(n356), .Y(n343) );
  BUFX2M U174 ( .A(n355), .Y(n344) );
  BUFX2M U175 ( .A(n355), .Y(n345) );
  BUFX2M U176 ( .A(n354), .Y(n346) );
  BUFX2M U177 ( .A(n354), .Y(n347) );
  BUFX2M U178 ( .A(n353), .Y(n348) );
  BUFX2M U179 ( .A(n353), .Y(n349) );
  BUFX2M U180 ( .A(n352), .Y(n350) );
  BUFX2M U181 ( .A(n356), .Y(n342) );
  BUFX2M U182 ( .A(n352), .Y(n351) );
  NOR2BX2M U183 ( .AN(n150), .B(N14), .Y(n164) );
  AND2X2M U184 ( .A(N14), .B(n150), .Y(n175) );
  INVX2M U185 ( .A(WrData[0]), .Y(n358) );
  INVX2M U186 ( .A(WrData[1]), .Y(n359) );
  INVX2M U187 ( .A(WrData[2]), .Y(n360) );
  INVX2M U188 ( .A(WrData[3]), .Y(n361) );
  INVX2M U189 ( .A(WrData[4]), .Y(n365) );
  INVX2M U190 ( .A(WrData[6]), .Y(n363) );
  INVX2M U191 ( .A(WrData[7]), .Y(n362) );
  BUFX2M U192 ( .A(RST), .Y(n355) );
  BUFX2M U193 ( .A(RST), .Y(n354) );
  BUFX2M U194 ( .A(RST), .Y(n353) );
  BUFX2M U195 ( .A(RST), .Y(n352) );
  BUFX2M U196 ( .A(RST), .Y(n356) );
  OAI2BB2X1M U197 ( .B0(n151), .B1(n358), .A0N(OP_A[0]), .A1N(n151), .Y(n186)
         );
  OAI2BB2X1M U198 ( .B0(n151), .B1(n359), .A0N(OP_A[1]), .A1N(n151), .Y(n187)
         );
  OAI2BB2X1M U199 ( .B0(n151), .B1(n360), .A0N(OP_A[2]), .A1N(n151), .Y(n188)
         );
  OAI2BB2X1M U200 ( .B0(n151), .B1(n361), .A0N(OP_A[3]), .A1N(n151), .Y(n189)
         );
  OAI2BB2X1M U201 ( .B0(n151), .B1(n365), .A0N(OP_A[4]), .A1N(n151), .Y(n190)
         );
  OAI2BB2X1M U202 ( .B0(n151), .B1(n364), .A0N(OP_A[5]), .A1N(n151), .Y(n191)
         );
  OAI2BB2X1M U203 ( .B0(n151), .B1(n363), .A0N(OP_A[6]), .A1N(n151), .Y(n192)
         );
  OAI2BB2X1M U204 ( .B0(n151), .B1(n362), .A0N(OP_A[7]), .A1N(n151), .Y(n193)
         );
  OAI2BB2X1M U205 ( .B0(n358), .B1(n154), .A0N(OP_B[0]), .A1N(n154), .Y(n194)
         );
  OAI2BB2X1M U206 ( .B0(n359), .B1(n154), .A0N(OP_B[1]), .A1N(n154), .Y(n195)
         );
  OAI2BB2X1M U207 ( .B0(n360), .B1(n154), .A0N(OP_B[2]), .A1N(n154), .Y(n196)
         );
  OAI2BB2X1M U208 ( .B0(n361), .B1(n154), .A0N(OP_B[3]), .A1N(n154), .Y(n197)
         );
  OAI2BB2X1M U209 ( .B0(n365), .B1(n154), .A0N(OP_B[4]), .A1N(n154), .Y(n198)
         );
  OAI2BB2X1M U210 ( .B0(n364), .B1(n154), .A0N(OP_B[5]), .A1N(n154), .Y(n199)
         );
  OAI2BB2X1M U211 ( .B0(n363), .B1(n154), .A0N(OP_B[6]), .A1N(n154), .Y(n200)
         );
  OAI2BB2X1M U212 ( .B0(n362), .B1(n154), .A0N(OP_B[7]), .A1N(n154), .Y(n201)
         );
  OAI2BB2X1M U213 ( .B0(n358), .B1(n159), .A0N(\regArr[4][0] ), .A1N(n159), 
        .Y(n218) );
  OAI2BB2X1M U214 ( .B0(n359), .B1(n159), .A0N(\regArr[4][1] ), .A1N(n159), 
        .Y(n219) );
  OAI2BB2X1M U215 ( .B0(n360), .B1(n159), .A0N(\regArr[4][2] ), .A1N(n159), 
        .Y(n220) );
  OAI2BB2X1M U216 ( .B0(n361), .B1(n159), .A0N(\regArr[4][3] ), .A1N(n159), 
        .Y(n221) );
  OAI2BB2X1M U217 ( .B0(n365), .B1(n159), .A0N(\regArr[4][4] ), .A1N(n159), 
        .Y(n222) );
  OAI2BB2X1M U218 ( .B0(n364), .B1(n159), .A0N(\regArr[4][5] ), .A1N(n159), 
        .Y(n223) );
  OAI2BB2X1M U219 ( .B0(n363), .B1(n159), .A0N(\regArr[4][6] ), .A1N(n159), 
        .Y(n224) );
  OAI2BB2X1M U220 ( .B0(n362), .B1(n159), .A0N(\regArr[4][7] ), .A1N(n159), 
        .Y(n225) );
  OAI2BB2X1M U221 ( .B0(n358), .B1(n161), .A0N(\regArr[5][0] ), .A1N(n161), 
        .Y(n226) );
  OAI2BB2X1M U222 ( .B0(n359), .B1(n161), .A0N(\regArr[5][1] ), .A1N(n161), 
        .Y(n227) );
  OAI2BB2X1M U223 ( .B0(n360), .B1(n161), .A0N(\regArr[5][2] ), .A1N(n161), 
        .Y(n228) );
  OAI2BB2X1M U224 ( .B0(n361), .B1(n161), .A0N(\regArr[5][3] ), .A1N(n161), 
        .Y(n229) );
  OAI2BB2X1M U225 ( .B0(n365), .B1(n161), .A0N(\regArr[5][4] ), .A1N(n161), 
        .Y(n230) );
  OAI2BB2X1M U226 ( .B0(n364), .B1(n161), .A0N(\regArr[5][5] ), .A1N(n161), 
        .Y(n231) );
  OAI2BB2X1M U227 ( .B0(n363), .B1(n161), .A0N(\regArr[5][6] ), .A1N(n161), 
        .Y(n232) );
  OAI2BB2X1M U228 ( .B0(n362), .B1(n161), .A0N(\regArr[5][7] ), .A1N(n161), 
        .Y(n233) );
  OAI2BB2X1M U229 ( .B0(n358), .B1(n162), .A0N(\regArr[6][0] ), .A1N(n162), 
        .Y(n234) );
  OAI2BB2X1M U230 ( .B0(n359), .B1(n162), .A0N(\regArr[6][1] ), .A1N(n162), 
        .Y(n235) );
  OAI2BB2X1M U231 ( .B0(n360), .B1(n162), .A0N(\regArr[6][2] ), .A1N(n162), 
        .Y(n236) );
  OAI2BB2X1M U232 ( .B0(n361), .B1(n162), .A0N(\regArr[6][3] ), .A1N(n162), 
        .Y(n237) );
  OAI2BB2X1M U233 ( .B0(n365), .B1(n162), .A0N(\regArr[6][4] ), .A1N(n162), 
        .Y(n238) );
  OAI2BB2X1M U234 ( .B0(n364), .B1(n162), .A0N(\regArr[6][5] ), .A1N(n162), 
        .Y(n239) );
  OAI2BB2X1M U235 ( .B0(n363), .B1(n162), .A0N(\regArr[6][6] ), .A1N(n162), 
        .Y(n240) );
  OAI2BB2X1M U236 ( .B0(n362), .B1(n162), .A0N(\regArr[6][7] ), .A1N(n162), 
        .Y(n241) );
  OAI2BB2X1M U237 ( .B0(n358), .B1(n165), .A0N(\regArr[7][0] ), .A1N(n165), 
        .Y(n242) );
  OAI2BB2X1M U238 ( .B0(n359), .B1(n165), .A0N(\regArr[7][1] ), .A1N(n165), 
        .Y(n243) );
  OAI2BB2X1M U239 ( .B0(n360), .B1(n165), .A0N(\regArr[7][2] ), .A1N(n165), 
        .Y(n244) );
  OAI2BB2X1M U240 ( .B0(n361), .B1(n165), .A0N(\regArr[7][3] ), .A1N(n165), 
        .Y(n245) );
  OAI2BB2X1M U241 ( .B0(n365), .B1(n165), .A0N(\regArr[7][4] ), .A1N(n165), 
        .Y(n246) );
  OAI2BB2X1M U242 ( .B0(n364), .B1(n165), .A0N(\regArr[7][5] ), .A1N(n165), 
        .Y(n247) );
  OAI2BB2X1M U243 ( .B0(n363), .B1(n165), .A0N(\regArr[7][6] ), .A1N(n165), 
        .Y(n248) );
  OAI2BB2X1M U244 ( .B0(n362), .B1(n165), .A0N(\regArr[7][7] ), .A1N(n165), 
        .Y(n249) );
  OAI2BB2X1M U245 ( .B0(n358), .B1(n166), .A0N(\regArr[8][0] ), .A1N(n166), 
        .Y(n250) );
  OAI2BB2X1M U246 ( .B0(n359), .B1(n166), .A0N(\regArr[8][1] ), .A1N(n166), 
        .Y(n251) );
  OAI2BB2X1M U247 ( .B0(n360), .B1(n166), .A0N(\regArr[8][2] ), .A1N(n166), 
        .Y(n252) );
  OAI2BB2X1M U248 ( .B0(n361), .B1(n166), .A0N(\regArr[8][3] ), .A1N(n166), 
        .Y(n253) );
  OAI2BB2X1M U249 ( .B0(n365), .B1(n166), .A0N(\regArr[8][4] ), .A1N(n166), 
        .Y(n254) );
  OAI2BB2X1M U250 ( .B0(n364), .B1(n166), .A0N(\regArr[8][5] ), .A1N(n166), 
        .Y(n255) );
  OAI2BB2X1M U251 ( .B0(n363), .B1(n166), .A0N(\regArr[8][6] ), .A1N(n166), 
        .Y(n256) );
  OAI2BB2X1M U252 ( .B0(n362), .B1(n166), .A0N(\regArr[8][7] ), .A1N(n166), 
        .Y(n257) );
  OAI2BB2X1M U253 ( .B0(n358), .B1(n168), .A0N(\regArr[9][0] ), .A1N(n168), 
        .Y(n258) );
  OAI2BB2X1M U254 ( .B0(n359), .B1(n168), .A0N(\regArr[9][1] ), .A1N(n168), 
        .Y(n259) );
  OAI2BB2X1M U255 ( .B0(n360), .B1(n168), .A0N(\regArr[9][2] ), .A1N(n168), 
        .Y(n260) );
  OAI2BB2X1M U256 ( .B0(n361), .B1(n168), .A0N(\regArr[9][3] ), .A1N(n168), 
        .Y(n261) );
  OAI2BB2X1M U257 ( .B0(n365), .B1(n168), .A0N(\regArr[9][4] ), .A1N(n168), 
        .Y(n262) );
  OAI2BB2X1M U258 ( .B0(n364), .B1(n168), .A0N(\regArr[9][5] ), .A1N(n168), 
        .Y(n263) );
  OAI2BB2X1M U259 ( .B0(n363), .B1(n168), .A0N(\regArr[9][6] ), .A1N(n168), 
        .Y(n264) );
  OAI2BB2X1M U260 ( .B0(n362), .B1(n168), .A0N(\regArr[9][7] ), .A1N(n168), 
        .Y(n265) );
  OAI2BB2X1M U261 ( .B0(n358), .B1(n170), .A0N(\regArr[10][0] ), .A1N(n170), 
        .Y(n266) );
  OAI2BB2X1M U262 ( .B0(n359), .B1(n170), .A0N(\regArr[10][1] ), .A1N(n170), 
        .Y(n267) );
  OAI2BB2X1M U263 ( .B0(n360), .B1(n170), .A0N(\regArr[10][2] ), .A1N(n170), 
        .Y(n268) );
  OAI2BB2X1M U264 ( .B0(n361), .B1(n170), .A0N(\regArr[10][3] ), .A1N(n170), 
        .Y(n269) );
  OAI2BB2X1M U265 ( .B0(n365), .B1(n170), .A0N(\regArr[10][4] ), .A1N(n170), 
        .Y(n270) );
  OAI2BB2X1M U266 ( .B0(n364), .B1(n170), .A0N(\regArr[10][5] ), .A1N(n170), 
        .Y(n271) );
  OAI2BB2X1M U267 ( .B0(n363), .B1(n170), .A0N(\regArr[10][6] ), .A1N(n170), 
        .Y(n272) );
  OAI2BB2X1M U268 ( .B0(n362), .B1(n170), .A0N(\regArr[10][7] ), .A1N(n170), 
        .Y(n273) );
  OAI2BB2X1M U269 ( .B0(n358), .B1(n171), .A0N(\regArr[11][0] ), .A1N(n171), 
        .Y(n274) );
  OAI2BB2X1M U270 ( .B0(n359), .B1(n171), .A0N(\regArr[11][1] ), .A1N(n171), 
        .Y(n275) );
  OAI2BB2X1M U271 ( .B0(n360), .B1(n171), .A0N(\regArr[11][2] ), .A1N(n171), 
        .Y(n276) );
  OAI2BB2X1M U272 ( .B0(n361), .B1(n171), .A0N(\regArr[11][3] ), .A1N(n171), 
        .Y(n277) );
  OAI2BB2X1M U273 ( .B0(n365), .B1(n171), .A0N(\regArr[11][4] ), .A1N(n171), 
        .Y(n278) );
  OAI2BB2X1M U274 ( .B0(n364), .B1(n171), .A0N(\regArr[11][5] ), .A1N(n171), 
        .Y(n279) );
  OAI2BB2X1M U275 ( .B0(n363), .B1(n171), .A0N(\regArr[11][6] ), .A1N(n171), 
        .Y(n280) );
  OAI2BB2X1M U276 ( .B0(n362), .B1(n171), .A0N(\regArr[11][7] ), .A1N(n171), 
        .Y(n281) );
  OAI2BB2X1M U277 ( .B0(n358), .B1(n172), .A0N(\regArr[12][0] ), .A1N(n172), 
        .Y(n282) );
  OAI2BB2X1M U278 ( .B0(n359), .B1(n172), .A0N(\regArr[12][1] ), .A1N(n172), 
        .Y(n283) );
  OAI2BB2X1M U279 ( .B0(n360), .B1(n172), .A0N(\regArr[12][2] ), .A1N(n172), 
        .Y(n284) );
  OAI2BB2X1M U280 ( .B0(n361), .B1(n172), .A0N(\regArr[12][3] ), .A1N(n172), 
        .Y(n285) );
  OAI2BB2X1M U281 ( .B0(n365), .B1(n172), .A0N(\regArr[12][4] ), .A1N(n172), 
        .Y(n286) );
  OAI2BB2X1M U282 ( .B0(n364), .B1(n172), .A0N(\regArr[12][5] ), .A1N(n172), 
        .Y(n287) );
  OAI2BB2X1M U283 ( .B0(n363), .B1(n172), .A0N(\regArr[12][6] ), .A1N(n172), 
        .Y(n288) );
  OAI2BB2X1M U284 ( .B0(n362), .B1(n172), .A0N(\regArr[12][7] ), .A1N(n172), 
        .Y(n289) );
  OAI2BB2X1M U285 ( .B0(n358), .B1(n173), .A0N(\regArr[13][0] ), .A1N(n173), 
        .Y(n290) );
  OAI2BB2X1M U286 ( .B0(n359), .B1(n173), .A0N(\regArr[13][1] ), .A1N(n173), 
        .Y(n291) );
  OAI2BB2X1M U287 ( .B0(n360), .B1(n173), .A0N(\regArr[13][2] ), .A1N(n173), 
        .Y(n292) );
  OAI2BB2X1M U288 ( .B0(n361), .B1(n173), .A0N(\regArr[13][3] ), .A1N(n173), 
        .Y(n293) );
  OAI2BB2X1M U289 ( .B0(n365), .B1(n173), .A0N(\regArr[13][4] ), .A1N(n173), 
        .Y(n294) );
  OAI2BB2X1M U290 ( .B0(n364), .B1(n173), .A0N(\regArr[13][5] ), .A1N(n173), 
        .Y(n295) );
  OAI2BB2X1M U291 ( .B0(n363), .B1(n173), .A0N(\regArr[13][6] ), .A1N(n173), 
        .Y(n296) );
  OAI2BB2X1M U292 ( .B0(n362), .B1(n173), .A0N(\regArr[13][7] ), .A1N(n173), 
        .Y(n297) );
  OAI2BB2X1M U293 ( .B0(n358), .B1(n174), .A0N(\regArr[14][0] ), .A1N(n174), 
        .Y(n298) );
  OAI2BB2X1M U294 ( .B0(n359), .B1(n174), .A0N(\regArr[14][1] ), .A1N(n174), 
        .Y(n299) );
  OAI2BB2X1M U295 ( .B0(n360), .B1(n174), .A0N(\regArr[14][2] ), .A1N(n174), 
        .Y(n300) );
  OAI2BB2X1M U296 ( .B0(n361), .B1(n174), .A0N(\regArr[14][3] ), .A1N(n174), 
        .Y(n301) );
  OAI2BB2X1M U297 ( .B0(n365), .B1(n174), .A0N(\regArr[14][4] ), .A1N(n174), 
        .Y(n302) );
  OAI2BB2X1M U298 ( .B0(n364), .B1(n174), .A0N(\regArr[14][5] ), .A1N(n174), 
        .Y(n303) );
  OAI2BB2X1M U299 ( .B0(n363), .B1(n174), .A0N(\regArr[14][6] ), .A1N(n174), 
        .Y(n304) );
  OAI2BB2X1M U300 ( .B0(n362), .B1(n174), .A0N(\regArr[14][7] ), .A1N(n174), 
        .Y(n305) );
  OAI2BB2X1M U301 ( .B0(n358), .B1(n176), .A0N(\regArr[15][0] ), .A1N(n176), 
        .Y(n306) );
  OAI2BB2X1M U302 ( .B0(n359), .B1(n176), .A0N(\regArr[15][1] ), .A1N(n176), 
        .Y(n307) );
  OAI2BB2X1M U303 ( .B0(n360), .B1(n176), .A0N(\regArr[15][2] ), .A1N(n176), 
        .Y(n308) );
  OAI2BB2X1M U304 ( .B0(n361), .B1(n176), .A0N(\regArr[15][3] ), .A1N(n176), 
        .Y(n309) );
  OAI2BB2X1M U305 ( .B0(n365), .B1(n176), .A0N(\regArr[15][4] ), .A1N(n176), 
        .Y(n310) );
  OAI2BB2X1M U306 ( .B0(n364), .B1(n176), .A0N(\regArr[15][5] ), .A1N(n176), 
        .Y(n311) );
  OAI2BB2X1M U307 ( .B0(n363), .B1(n176), .A0N(\regArr[15][6] ), .A1N(n176), 
        .Y(n312) );
  OAI2BB2X1M U308 ( .B0(n362), .B1(n176), .A0N(\regArr[15][7] ), .A1N(n176), 
        .Y(n313) );
  OAI2BB2X1M U309 ( .B0(n359), .B1(n156), .A0N(UART_CONFIG[1]), .A1N(n156), 
        .Y(n203) );
  OAI2BB2X1M U310 ( .B0(n360), .B1(n156), .A0N(UART_CONFIG[2]), .A1N(n156), 
        .Y(n204) );
  OAI2BB2X1M U311 ( .B0(n361), .B1(n156), .A0N(UART_CONFIG[3]), .A1N(n156), 
        .Y(n205) );
  OAI2BB2X1M U312 ( .B0(n365), .B1(n156), .A0N(UART_CONFIG[4]), .A1N(n156), 
        .Y(n206) );
  OAI2BB2X1M U313 ( .B0(n364), .B1(n156), .A0N(UART_CONFIG[5]), .A1N(n156), 
        .Y(n207) );
  OAI2BB2X1M U314 ( .B0(n363), .B1(n156), .A0N(UART_CONFIG[6]), .A1N(n156), 
        .Y(n208) );
  OAI2BB2X1M U315 ( .B0(n358), .B1(n158), .A0N(DIV_RATIO[0]), .A1N(n158), .Y(
        n210) );
  OAI2BB2X1M U316 ( .B0(n359), .B1(n158), .A0N(DIV_RATIO[1]), .A1N(n158), .Y(
        n211) );
  OAI2BB2X1M U317 ( .B0(n360), .B1(n158), .A0N(DIV_RATIO[2]), .A1N(n158), .Y(
        n212) );
  OAI2BB2X1M U318 ( .B0(n361), .B1(n158), .A0N(DIV_RATIO[3]), .A1N(n158), .Y(
        n213) );
  OAI2BB2X1M U319 ( .B0(n365), .B1(n158), .A0N(DIV_RATIO[4]), .A1N(n158), .Y(
        n214) );
  OAI2BB2X1M U320 ( .B0(n363), .B1(n158), .A0N(DIV_RATIO[6]), .A1N(n158), .Y(
        n216) );
  OAI2BB2X1M U321 ( .B0(n362), .B1(n158), .A0N(DIV_RATIO[7]), .A1N(n158), .Y(
        n217) );
  OAI2BB2X1M U322 ( .B0(n358), .B1(n156), .A0N(UART_CONFIG[0]), .A1N(n156), 
        .Y(n202) );
  OAI2BB2X1M U323 ( .B0(n362), .B1(n156), .A0N(UART_CONFIG[7]), .A1N(n156), 
        .Y(n209) );
  OAI2BB2X1M U324 ( .B0(n364), .B1(n158), .A0N(DIV_RATIO[5]), .A1N(n158), .Y(
        n215) );
  AO22X1M U325 ( .A0(N43), .A1(n357), .B0(RdData[0]), .B1(n149), .Y(n177) );
  MX4X1M U326 ( .A(n141), .B(n139), .C(n140), .D(n138), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U327 ( .A(OP_A[0]), .B(OP_B[0]), .C(UART_CONFIG[0]), .D(DIV_RATIO[0]), 
        .S0(N11), .S1(N12), .Y(n141) );
  MX4X1M U328 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(N12), .Y(n139) );
  AO22X1M U329 ( .A0(N42), .A1(n357), .B0(RdData[1]), .B1(n149), .Y(n178) );
  MX4X1M U330 ( .A(n145), .B(n143), .C(n144), .D(n142), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U331 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(N12), .Y(n143) );
  MX4X1M U332 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n339), .S1(n336), .Y(n142) );
  AO22X1M U333 ( .A0(N41), .A1(n357), .B0(RdData[2]), .B1(n149), .Y(n179) );
  MX4X1M U334 ( .A(n314), .B(n147), .C(n148), .D(n146), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U335 ( .A(OP_A[2]), .B(OP_B[2]), .C(UART_CONFIG[2]), .D(DIV_RATIO[2]), 
        .S0(n338), .S1(n336), .Y(n314) );
  MX4X1M U336 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n338), .S1(n336), .Y(n147) );
  AO22X1M U337 ( .A0(N40), .A1(n357), .B0(RdData[3]), .B1(n149), .Y(n180) );
  MX4X1M U338 ( .A(n318), .B(n316), .C(n317), .D(n315), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U339 ( .A(OP_A[3]), .B(OP_B[3]), .C(UART_CONFIG[3]), .D(DIV_RATIO[3]), 
        .S0(n338), .S1(n336), .Y(n318) );
  MX4X1M U340 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n338), .S1(n336), .Y(n316) );
  AO22X1M U341 ( .A0(N39), .A1(n357), .B0(RdData[4]), .B1(n149), .Y(n181) );
  MX4X1M U342 ( .A(n322), .B(n320), .C(n321), .D(n319), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U343 ( .A(OP_A[4]), .B(OP_B[4]), .C(UART_CONFIG[4]), .D(DIV_RATIO[4]), 
        .S0(n339), .S1(n336), .Y(n322) );
  MX4X1M U344 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n338), .S1(n336), .Y(n320) );
  AO22X1M U345 ( .A0(N38), .A1(n357), .B0(RdData[5]), .B1(n149), .Y(n182) );
  MX4X1M U346 ( .A(n326), .B(n324), .C(n325), .D(n323), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U347 ( .A(OP_A[5]), .B(OP_B[5]), .C(UART_CONFIG[5]), .D(DIV_RATIO[5]), 
        .S0(n339), .S1(N12), .Y(n326) );
  MX4X1M U348 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n339), .S1(N12), .Y(n324) );
  AO22X1M U349 ( .A0(N37), .A1(n357), .B0(RdData[6]), .B1(n149), .Y(n183) );
  MX4X1M U350 ( .A(n330), .B(n328), .C(n329), .D(n327), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U351 ( .A(OP_A[6]), .B(OP_B[6]), .C(UART_CONFIG[6]), .D(DIV_RATIO[6]), 
        .S0(n339), .S1(N12), .Y(n330) );
  MX4X1M U352 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n339), .S1(N12), .Y(n328) );
  AO22X1M U353 ( .A0(N36), .A1(n357), .B0(RdData[7]), .B1(n149), .Y(n184) );
  MX4X1M U354 ( .A(n334), .B(n332), .C(n333), .D(n331), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U355 ( .A(OP_A[7]), .B(OP_B[7]), .C(UART_CONFIG[7]), .D(DIV_RATIO[7]), 
        .S0(n339), .S1(N12), .Y(n334) );
  MX4X1M U356 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n339), .S1(N12), .Y(n332) );
  MX4X1M U357 ( .A(OP_A[1]), .B(OP_B[1]), .C(UART_CONFIG[1]), .D(DIV_RATIO[1]), 
        .S0(n338), .S1(N12), .Y(n145) );
  MX4X1M U358 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(N11), .S1(N12), .Y(n140) );
  MX4X1M U359 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n338), .S1(N12), .Y(n144) );
  MX4X1M U360 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n338), .S1(n336), .Y(n148) );
  MX4X1M U361 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n338), .S1(n336), .Y(n317) );
  MX4X1M U362 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n338), .S1(n336), .Y(n321) );
  MX4X1M U363 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n339), .S1(N12), .Y(n325) );
  MX4X1M U364 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n339), .S1(N12), .Y(n329) );
  MX4X1M U365 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n339), .S1(N12), .Y(n333) );
  MX4X1M U366 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n338), .S1(n336), .Y(n138) );
  MX4X1M U367 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n338), .S1(n336), .Y(n146) );
  MX4X1M U368 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n338), .S1(n336), .Y(n315) );
  MX4X1M U369 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n338), .S1(n336), .Y(n319) );
  MX4X1M U370 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n339), .S1(N12), .Y(n323) );
  MX4X1M U371 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n339), .S1(N12), .Y(n327) );
  MX4X1M U372 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n339), .S1(N12), .Y(n331) );
  INVX2M U373 ( .A(N11), .Y(n340) );
  INVX2M U374 ( .A(N12), .Y(n341) );
  OAI2BB1X2M U375 ( .A0N(RdData_VLD), .A1N(n150), .B0(n149), .Y(n185) );
  DLY1X1M U376 ( .A(test_se), .Y(n369) );
  DLY1X1M U377 ( .A(test_se), .Y(n370) );
  DLY1X1M U378 ( .A(test_se), .Y(n371) );
  DLY1X1M U379 ( .A(test_se), .Y(n372) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U8 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U9 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  INVX2M U10 ( .A(b[1]), .Y(n17) );
  NAND2X2M U11 ( .A(n2), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U12 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U13 ( .A(a[5]), .Y(n3) );
  INVX2M U14 ( .A(n18), .Y(n2) );
  NAND2X2M U15 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U16 ( .A(a[4]), .Y(n5) );
  INVX2M U17 ( .A(n18), .Y(n4) );
  NAND2X2M U18 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U19 ( .A(a[3]), .Y(n7) );
  INVX2M U20 ( .A(n18), .Y(n6) );
  NAND2X2M U21 ( .A(n6), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U22 ( .A(a[2]), .Y(n8) );
  NAND2X2M U23 ( .A(n4), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U24 ( .A(a[1]), .Y(n9) );
  NAND2X2M U25 ( .A(n2), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U26 ( .A(a[6]), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(a[0]), .Y(n10) );
  INVX2M U29 ( .A(b[7]), .Y(n11) );
  INVX2M U30 ( .A(b[2]), .Y(n16) );
  INVX2M U31 ( .A(b[3]), .Y(n15) );
  INVX2M U32 ( .A(b[4]), .Y(n14) );
  INVX2M U33 ( .A(b[5]), .Y(n13) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  INVX2M U3 ( .A(B[1]), .Y(n8) );
  NAND2X2M U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U5 ( .A(A[0]), .Y(n1) );
  INVX2M U6 ( .A(B[7]), .Y(n2) );
  INVX2M U7 ( .A(B[0]), .Y(n9) );
  INVX2M U8 ( .A(B[2]), .Y(n7) );
  INVX2M U9 ( .A(B[3]), .Y(n6) );
  INVX2M U10 ( .A(B[4]), .Y(n5) );
  INVX2M U11 ( .A(B[5]), .Y(n4) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U5 ( .A(B[7]), .Y(n8) );
  XNOR2X2M U6 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n8), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n7), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n6), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n5), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n4), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n3), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  CLKXOR2X2M U10 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  INVX2M U11 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U12 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U14 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U18 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U19 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U20 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U21 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  XNOR2X2M U23 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U24 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U25 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U26 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U27 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U28 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  AND2X2M U30 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U31 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U32 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U35 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U36 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U37 ( .A(A[6]), .Y(n33) );
  INVX2M U38 ( .A(A[7]), .Y(n32) );
  INVX2M U39 ( .A(A[1]), .Y(n38) );
  INVX2M U40 ( .A(A[0]), .Y(n39) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[3]), .Y(n36) );
  INVX2M U43 ( .A(B[6]), .Y(n25) );
  INVX2M U44 ( .A(A[5]), .Y(n34) );
  INVX2M U45 ( .A(A[4]), .Y(n35) );
  INVX2M U46 ( .A(B[7]), .Y(n24) );
  INVX2M U47 ( .A(B[1]), .Y(n30) );
  INVX2M U48 ( .A(B[0]), .Y(n31) );
  INVX2M U49 ( .A(B[3]), .Y(n28) );
  INVX2M U50 ( .A(B[2]), .Y(n29) );
  INVX2M U51 ( .A(B[5]), .Y(n26) );
  INVX2M U52 ( .A(B[4]), .Y(n27) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n14, n16, n13, n15, n12, n11, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module ALU_test_1 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID, test_si2, 
        test_si1, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST, test_si2, test_si1, test_se;
  output OUT_VALID;
  wire   N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, N115,
         N116, N117, N118, N119, N120, N121, N122, N123, N124, N125, N128,
         N129, N130, N131, N132, N133, N134, N135, N168, N169, N170, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n3, n4, n5, n6, n7, n8, n9, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169;
  wire   [15:0] ALU_OUT_Comb;

  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(test_si2), .SE(test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(test_si1), .SE(test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[8]) );
  SDFFRQX2M OUT_VALID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  BUFX2M U8 ( .A(A[6]), .Y(n31) );
  BUFX2M U23 ( .A(A[1]), .Y(n9) );
  BUFX2M U24 ( .A(A[7]), .Y(n32) );
  BUFX2M U25 ( .A(B[6]), .Y(n6) );
  INVX2M U26 ( .A(n70), .Y(n167) );
  INVX2M U27 ( .A(n114), .Y(n165) );
  INVX2M U28 ( .A(n64), .Y(n164) );
  INVX2M U29 ( .A(n119), .Y(n163) );
  OAI21X2M U30 ( .A0(n3), .A1(n129), .B0(n128), .Y(n69) );
  NOR2X2M U31 ( .A(n118), .B(n3), .Y(n70) );
  NOR2BX2M U32 ( .AN(n130), .B(n3), .Y(n58) );
  OAI2B1X2M U33 ( .A1N(n127), .A0(n118), .B0(n128), .Y(n114) );
  NAND2X2M U34 ( .A(n168), .B(n127), .Y(n64) );
  NOR2BX2M U35 ( .AN(n57), .B(n161), .Y(n52) );
  NAND2X2M U36 ( .A(n130), .B(n127), .Y(n119) );
  INVX2M U37 ( .A(n67), .Y(n162) );
  OAI2BB1X2M U38 ( .A0N(N119), .A1N(n52), .B0(n53), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U39 ( .A0N(N120), .A1N(n52), .B0(n53), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U40 ( .A0N(N121), .A1N(n52), .B0(n53), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U41 ( .A0N(N122), .A1N(n52), .B0(n53), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U42 ( .A0N(N123), .A1N(n52), .B0(n53), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U43 ( .A0N(N124), .A1N(n52), .B0(n53), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U44 ( .A0N(N125), .A1N(n52), .B0(n53), .Y(ALU_OUT_Comb[15]) );
  INVX2M U45 ( .A(n129), .Y(n168) );
  NOR3BX2M U46 ( .AN(n4), .B(n118), .C(ALU_FUN[0]), .Y(n56) );
  NOR3BX2M U47 ( .AN(n4), .B(n166), .C(n129), .Y(n74) );
  NOR3X2M U48 ( .A(n3), .B(ALU_FUN[2]), .C(n169), .Y(n57) );
  OAI2B11X2M U49 ( .A1N(N109), .A0(n119), .B0(n167), .C0(n165), .Y(n59) );
  NOR2X2M U50 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n130) );
  NOR2X2M U51 ( .A(n166), .B(n4), .Y(n127) );
  NOR3X2M U52 ( .A(n169), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n132) );
  NAND3X2M U53 ( .A(n130), .B(n166), .C(n4), .Y(n67) );
  NAND2X2M U54 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n118) );
  NAND2X2M U55 ( .A(ALU_FUN[2]), .B(n169), .Y(n129) );
  NAND2X2M U56 ( .A(EN), .B(n59), .Y(n53) );
  OAI2BB2X1M U57 ( .B0(n154), .B1(n64), .A0N(N117), .A1N(n57), .Y(n63) );
  INVX2M U58 ( .A(ALU_FUN[0]), .Y(n166) );
  INVX2M U59 ( .A(ALU_FUN[1]), .Y(n169) );
  NAND3X2M U60 ( .A(n130), .B(ALU_FUN[0]), .C(n4), .Y(n128) );
  INVX2M U61 ( .A(EN), .Y(n161) );
  OR2X2M U62 ( .A(n4), .B(ALU_FUN[0]), .Y(n3) );
  AND4X2M U63 ( .A(N170), .B(n168), .C(n4), .D(n166), .Y(n117) );
  OAI221X1M U64 ( .A0(n27), .A1(n165), .B0(n67), .B1(n159), .C0(n167), .Y(n106) );
  OAI221X1M U65 ( .A0(n28), .A1(n165), .B0(n67), .B1(n158), .C0(n167), .Y(n99)
         );
  OAI221X1M U66 ( .A0(n29), .A1(n165), .B0(n67), .B1(n157), .C0(n167), .Y(n92)
         );
  OAI221X1M U67 ( .A0(n30), .A1(n165), .B0(n67), .B1(n156), .C0(n167), .Y(n85)
         );
  OAI221X1M U68 ( .A0(n31), .A1(n165), .B0(n67), .B1(n155), .C0(n167), .Y(n78)
         );
  OAI221X1M U69 ( .A0(n32), .A1(n165), .B0(n154), .B1(n67), .C0(n167), .Y(n66)
         );
  INVX2M U70 ( .A(n33), .Y(n145) );
  OAI2B2X1M U71 ( .A1N(n5), .A0(n112), .B0(n5), .B1(n113), .Y(n111) );
  AOI221XLM U72 ( .A0(n162), .A1(n143), .B0(n9), .B1(n69), .C0(n164), .Y(n112)
         );
  AOI221XLM U73 ( .A0(n9), .A1(n162), .B0(n114), .B1(n143), .C0(n70), .Y(n113)
         );
  AOI31X2M U74 ( .A0(n86), .A1(n87), .A2(n88), .B0(n161), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U75 ( .A0(N105), .A1(n163), .B0(N96), .B1(n58), .Y(n86) );
  AOI221XLM U76 ( .A0(n28), .A1(n56), .B0(n74), .B1(n30), .C0(n89), .Y(n88) );
  AOI222X1M U77 ( .A0(N114), .A1(n57), .B0(n70), .B1(n157), .C0(n29), .C1(n164), .Y(n87) );
  AOI31X2M U78 ( .A0(n79), .A1(n80), .A2(n81), .B0(n161), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U79 ( .A0(N106), .A1(n163), .B0(N97), .B1(n58), .Y(n79) );
  AOI221XLM U80 ( .A0(n29), .A1(n56), .B0(n74), .B1(n31), .C0(n82), .Y(n81) );
  AOI222X1M U81 ( .A0(N115), .A1(n57), .B0(n70), .B1(n156), .C0(n30), .C1(n164), .Y(n80) );
  AOI31X2M U82 ( .A0(n71), .A1(n72), .A2(n73), .B0(n161), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U83 ( .A0(N107), .A1(n163), .B0(N98), .B1(n58), .Y(n71) );
  AOI221XLM U84 ( .A0(n30), .A1(n56), .B0(n74), .B1(n32), .C0(n75), .Y(n73) );
  AOI222X1M U85 ( .A0(N116), .A1(n57), .B0(n70), .B1(n155), .C0(n164), .C1(n31), .Y(n72) );
  AOI31X2M U86 ( .A0(n100), .A1(n101), .A2(n102), .B0(n161), .Y(
        ALU_OUT_Comb[2]) );
  AOI22X1M U87 ( .A0(N103), .A1(n163), .B0(N94), .B1(n58), .Y(n100) );
  AOI221XLM U88 ( .A0(n9), .A1(n56), .B0(n28), .B1(n74), .C0(n103), .Y(n102)
         );
  AOI222X1M U89 ( .A0(N112), .A1(n57), .B0(n70), .B1(n159), .C0(n27), .C1(n164), .Y(n101) );
  AOI31X2M U90 ( .A0(n93), .A1(n94), .A2(n95), .B0(n161), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U91 ( .A0(N104), .A1(n163), .B0(N95), .B1(n58), .Y(n93) );
  AOI221XLM U92 ( .A0(n27), .A1(n56), .B0(n29), .B1(n74), .C0(n96), .Y(n95) );
  AOI222X1M U93 ( .A0(N113), .A1(n57), .B0(n70), .B1(n158), .C0(n28), .C1(n164), .Y(n94) );
  AOI31X2M U94 ( .A0(n120), .A1(n121), .A2(n122), .B0(n161), .Y(
        ALU_OUT_Comb[0]) );
  AOI22X1M U95 ( .A0(N101), .A1(n163), .B0(N92), .B1(n58), .Y(n120) );
  AOI211X2M U96 ( .A0(n9), .A1(n74), .B0(n123), .C0(n124), .Y(n122) );
  AOI222X1M U97 ( .A0(N110), .A1(n57), .B0(n70), .B1(n160), .C0(n8), .C1(n164), 
        .Y(n121) );
  AOI31X2M U98 ( .A0(n107), .A1(n108), .A2(n109), .B0(n161), .Y(
        ALU_OUT_Comb[1]) );
  AOI211X2M U99 ( .A0(n8), .A1(n56), .B0(n110), .C0(n111), .Y(n109) );
  AOI222X1M U100 ( .A0(n9), .A1(n164), .B0(n27), .B1(n74), .C0(n70), .C1(n143), 
        .Y(n108) );
  AOI222X1M U101 ( .A0(N93), .A1(n58), .B0(N111), .B1(n57), .C0(N102), .C1(
        n163), .Y(n107) );
  AOI31X2M U102 ( .A0(n60), .A1(n61), .A2(n62), .B0(n161), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U103 ( .A0(n31), .A1(n56), .B0(n70), .B1(n154), .Y(n60) );
  AOI221XLM U104 ( .A0(N108), .A1(n163), .B0(N99), .B1(n58), .C0(n63), .Y(n62)
         );
  AOI222X1M U105 ( .A0(n7), .A1(n153), .B0(N135), .B1(n65), .C0(n66), .C1(n147), .Y(n61) );
  INVX2M U106 ( .A(n44), .Y(n146) );
  OAI21X2M U107 ( .A0(n76), .A1(n148), .B0(n77), .Y(n75) );
  AOI22X1M U108 ( .A0(N134), .A1(n65), .B0(n78), .B1(n148), .Y(n77) );
  AOI221XLM U109 ( .A0(n162), .A1(n155), .B0(n31), .B1(n69), .C0(n164), .Y(n76) );
  INVX2M U110 ( .A(n6), .Y(n148) );
  AOI21X2M U111 ( .A0(n54), .A1(n55), .B0(n161), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U112 ( .A0(N100), .A1(n58), .B0(n59), .Y(n54) );
  AOI22X1M U113 ( .A0(n32), .A1(n56), .B0(N118), .B1(n57), .Y(n55) );
  INVX2M U114 ( .A(n68), .Y(n153) );
  AOI221XLM U115 ( .A0(n69), .A1(n32), .B0(n154), .B1(n162), .C0(n164), .Y(n68) );
  BUFX2M U116 ( .A(ALU_FUN[3]), .Y(n4) );
  OAI2BB1X2M U117 ( .A0N(N128), .A1N(n65), .B0(n131), .Y(n123) );
  AOI31X2M U118 ( .A0(N168), .A1(n4), .A2(n132), .B0(n117), .Y(n131) );
  OAI2BB1X2M U119 ( .A0N(N129), .A1N(n65), .B0(n115), .Y(n110) );
  AOI31X2M U120 ( .A0(N169), .A1(n4), .A2(n116), .B0(n117), .Y(n115) );
  NOR3X2M U121 ( .A(n166), .B(ALU_FUN[2]), .C(n169), .Y(n116) );
  INVX2M U122 ( .A(n32), .Y(n154) );
  INVX2M U123 ( .A(n31), .Y(n155) );
  INVX2M U124 ( .A(n8), .Y(n160) );
  INVX2M U125 ( .A(n27), .Y(n159) );
  INVX2M U126 ( .A(n28), .Y(n158) );
  INVX2M U127 ( .A(n30), .Y(n156) );
  INVX2M U128 ( .A(n29), .Y(n157) );
  INVX2M U129 ( .A(n9), .Y(n143) );
  INVX2M U130 ( .A(n7), .Y(n147) );
  OAI2B2X1M U131 ( .A1N(B[0]), .A0(n125), .B0(B[0]), .B1(n126), .Y(n124) );
  AOI221XLM U132 ( .A0(n162), .A1(n160), .B0(n8), .B1(n69), .C0(n164), .Y(n125) );
  AOI221XLM U133 ( .A0(n8), .A1(n162), .B0(n114), .B1(n160), .C0(n70), .Y(n126) );
  AND3X2M U134 ( .A(n127), .B(ALU_FUN[1]), .C(n133), .Y(n65) );
  AOI21X2M U135 ( .A0(n134), .A1(n135), .B0(ALU_FUN[2]), .Y(n133) );
  NOR4X1M U136 ( .A(n7), .B(n6), .C(B[5]), .D(B[4]), .Y(n135) );
  NOR4X1M U137 ( .A(B[3]), .B(B[2]), .C(n5), .D(B[0]), .Y(n134) );
  OAI21X2M U138 ( .A0(n104), .A1(n152), .B0(n105), .Y(n103) );
  AOI22X1M U139 ( .A0(N130), .A1(n65), .B0(n106), .B1(n152), .Y(n105) );
  AOI221XLM U140 ( .A0(n162), .A1(n159), .B0(n27), .B1(n69), .C0(n164), .Y(
        n104) );
  INVX2M U141 ( .A(B[2]), .Y(n152) );
  OAI21X2M U142 ( .A0(n97), .A1(n151), .B0(n98), .Y(n96) );
  AOI22X1M U143 ( .A0(N131), .A1(n65), .B0(n99), .B1(n151), .Y(n98) );
  AOI221XLM U144 ( .A0(n162), .A1(n158), .B0(n28), .B1(n69), .C0(n164), .Y(n97) );
  INVX2M U145 ( .A(B[3]), .Y(n151) );
  OAI21X2M U146 ( .A0(n90), .A1(n150), .B0(n91), .Y(n89) );
  AOI22X1M U147 ( .A0(N132), .A1(n65), .B0(n92), .B1(n150), .Y(n91) );
  AOI221XLM U148 ( .A0(n162), .A1(n157), .B0(n29), .B1(n69), .C0(n164), .Y(n90) );
  INVX2M U149 ( .A(B[4]), .Y(n150) );
  OAI21X2M U150 ( .A0(n83), .A1(n149), .B0(n84), .Y(n82) );
  AOI22X1M U151 ( .A0(N133), .A1(n65), .B0(n85), .B1(n149), .Y(n84) );
  AOI221XLM U152 ( .A0(n162), .A1(n156), .B0(n30), .B1(n69), .C0(n164), .Y(n83) );
  INVX2M U153 ( .A(B[5]), .Y(n149) );
  BUFX2M U154 ( .A(A[0]), .Y(n8) );
  BUFX2M U155 ( .A(A[2]), .Y(n27) );
  BUFX2M U156 ( .A(A[3]), .Y(n28) );
  BUFX2M U157 ( .A(A[5]), .Y(n30) );
  BUFX2M U158 ( .A(A[4]), .Y(n29) );
  BUFX2M U159 ( .A(B[7]), .Y(n7) );
  BUFX2M U160 ( .A(B[1]), .Y(n5) );
  INVX2M U161 ( .A(B[0]), .Y(n144) );
  NOR2X1M U162 ( .A(n154), .B(n7), .Y(n139) );
  NAND2BX1M U163 ( .AN(B[4]), .B(n29), .Y(n48) );
  NAND2BX1M U164 ( .AN(n29), .B(B[4]), .Y(n37) );
  CLKNAND2X2M U165 ( .A(n48), .B(n37), .Y(n50) );
  NOR2X1M U166 ( .A(n151), .B(n28), .Y(n45) );
  NOR2X1M U167 ( .A(n152), .B(n27), .Y(n36) );
  NOR2X1M U168 ( .A(n144), .B(n8), .Y(n33) );
  CLKNAND2X2M U169 ( .A(n27), .B(n152), .Y(n47) );
  NAND2BX1M U170 ( .AN(n36), .B(n47), .Y(n42) );
  AOI21X1M U171 ( .A0(n33), .A1(n143), .B0(n5), .Y(n34) );
  AOI211X1M U172 ( .A0(n9), .A1(n145), .B0(n42), .C0(n34), .Y(n35) );
  CLKNAND2X2M U173 ( .A(n28), .B(n151), .Y(n46) );
  OAI31X1M U174 ( .A0(n45), .A1(n36), .A2(n35), .B0(n46), .Y(n38) );
  NAND2BX1M U175 ( .AN(n30), .B(B[5]), .Y(n137) );
  OAI211X1M U176 ( .A0(n50), .A1(n38), .B0(n37), .C0(n137), .Y(n39) );
  NAND2BX1M U177 ( .AN(B[5]), .B(n30), .Y(n49) );
  XNOR2X1M U178 ( .A(n31), .B(n6), .Y(n136) );
  AOI32X1M U179 ( .A0(n39), .A1(n49), .A2(n136), .B0(n6), .B1(n155), .Y(n40)
         );
  CLKNAND2X2M U180 ( .A(n7), .B(n154), .Y(n140) );
  OAI21X1M U181 ( .A0(n139), .A1(n40), .B0(n140), .Y(N170) );
  CLKNAND2X2M U182 ( .A(n8), .B(n144), .Y(n43) );
  OA21X1M U183 ( .A0(n43), .A1(n143), .B0(n5), .Y(n41) );
  AOI211X1M U184 ( .A0(n43), .A1(n143), .B0(n42), .C0(n41), .Y(n44) );
  AOI31X1M U185 ( .A0(n146), .A1(n47), .A2(n46), .B0(n45), .Y(n51) );
  OAI2B11X1M U186 ( .A1N(n51), .A0(n50), .B0(n49), .C0(n48), .Y(n138) );
  AOI32X1M U187 ( .A0(n138), .A1(n137), .A2(n136), .B0(n31), .B1(n148), .Y(
        n141) );
  AOI2B1X1M U188 ( .A1N(n141), .A0(n140), .B0(n139), .Y(n142) );
  CLKINVX1M U189 ( .A(n142), .Y(N169) );
  NOR2X1M U190 ( .A(N170), .B(N169), .Y(N168) );
  ALU_DW_div_uns_0 div_54 ( .a({n32, n31, n30, n29, n28, n27, n9, n8}), .b({n7, 
        n6, B[5:2], n5, B[0]}), .quotient({N135, N134, N133, N132, N131, N130, 
        N129, N128}) );
  ALU_DW01_sub_0 sub_48 ( .A({1'b0, n32, n31, n30, n29, n28, n27, n9, n8}), 
        .B({1'b0, n7, n6, B[5:2], n5, B[0]}), .CI(1'b0), .DIFF({N109, N108, 
        N107, N106, N105, N104, N103, N102, N101}) );
  ALU_DW01_add_0 add_45 ( .A({1'b0, n32, n31, n30, n29, n28, n27, n9, n8}), 
        .B({1'b0, n7, n6, B[5:2], n5, B[0]}), .CI(1'b0), .SUM({N100, N99, N98, 
        N97, N96, N95, N94, N93, N92}) );
  ALU_DW02_mult_0 mult_51 ( .A({n32, n31, n30, n29, n28, n27, n9, n8}), .B({n7, 
        n6, B[5:2], n5, B[0]}), .TC(1'b0), .PRODUCT({N125, N124, N123, N122, 
        N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, N110}) );
endmodule


module CLK_GATE ( test_en, CLK_EN, CLK, GATED_CLK );
  input test_en, CLK_EN, CLK;
  output GATED_CLK;
  wire   _0_net_;

  TLATNCAX12M U0_TLATNCAX12M ( .E(_0_net_), .CK(CLK), .ECK(GATED_CLK) );
  OR2X2M U1 ( .A(CLK_EN), .B(test_en), .Y(_0_net_) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, SI, SE, scan_clk, 
        scan_rst, test_mode, SO, UART_TX_O, parity_error, framing_error );
  input [3:0] SI;
  output [3:0] SO;
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN, SE, scan_clk, scan_rst,
         test_mode;
  output UART_TX_O, parity_error, framing_error;
  wire   mux_ref_clk, mux_uart_clk, UART_TX_CLK, mux_uart_tx_clk, UART_RX_CLK,
         mux_uart_rx_clk, mux_ref_rst, SYNC_REF_RST, mux_ref_rst_syn,
         SYNC_UART_RST, mux_uart_rst_syn, UART_RX_V_OUT, UART_RX_V_SYNC,
         UART_TX_VLD, UART_TX_Busy_PULSE, FIFO_FULL, UART_TX_V_SYNC,
         UART_TX_Busy, ALU_OUT_VLD, RF_RdData_VLD, ALU_EN, RF_WrEn, RF_RdEn,
         CLKG_EN, ALU_CLK, n1, n2, n3, n4, n5, n6, n7, n8, n11, n14, n15, n19,
         n20, n21, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] Div_RATIO;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO_RX;
  wire   [15:0] ALU_OUT;
  wire   [7:0] RF_RdData;
  wire   [3:0] ALU_FUN;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX2M U2 ( .A(n6), .Y(n5) );
  INVX2M U3 ( .A(UART_TX_V_SYNC), .Y(n1) );
  BUFX2M U4 ( .A(RF_Address[0]), .Y(n3) );
  BUFX2M U5 ( .A(RF_Address[1]), .Y(n4) );
  INVX4M U6 ( .A(n8), .Y(n7) );
  INVX2M U7 ( .A(mux_ref_rst_syn), .Y(n8) );
  INVX2M U8 ( .A(mux_uart_rst_syn), .Y(n6) );
  BUFX2M U9 ( .A(test_mode), .Y(n2) );
  INVXLM U16 ( .A(n30), .Y(n24) );
  DLY1X1M U17 ( .A(n24), .Y(n25) );
  INVXLM U18 ( .A(n32), .Y(n26) );
  INVXLM U19 ( .A(n26), .Y(n27) );
  INVXLM U20 ( .A(n34), .Y(n28) );
  INVXLM U21 ( .A(n28), .Y(n29) );
  INVXLM U22 ( .A(SE), .Y(n30) );
  INVXLM U23 ( .A(n30), .Y(n31) );
  INVXLM U24 ( .A(n30), .Y(n32) );
  INVXLM U25 ( .A(n30), .Y(n33) );
  INVXLM U26 ( .A(n30), .Y(n34) );
  mux2X1_1 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        mux_ref_clk) );
  mux2X1_4 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        mux_uart_clk) );
  mux2X1_3 U2_mux2X1 ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        mux_uart_tx_clk) );
  mux2X1_2 U3_mux2X1 ( .IN_0(UART_RX_CLK), .IN_1(scan_clk), .SEL(n2), .OUT(
        mux_uart_rx_clk) );
  mux2X1_0 U4_mux2X1 ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(n2), .OUT(
        mux_ref_rst) );
  mux2X1_6 U5_mux2X1 ( .IN_0(SYNC_REF_RST), .IN_1(scan_rst), .SEL(n2), .OUT(
        mux_ref_rst_syn) );
  mux2X1_5 U6_mux2X1 ( .IN_0(SYNC_UART_RST), .IN_1(scan_rst), .SEL(n2), .OUT(
        mux_uart_rst_syn) );
  RST_SYNC_NUM_STAGES2_test_0 REF_RST_SYNC ( .clk(mux_ref_clk), .rst(
        mux_ref_rst), .SYNC_RST(SYNC_REF_RST), .test_si(UART_RX_SYNC[7]), 
        .test_se(n27) );
  RST_SYNC_NUM_STAGES2_test_1 UART_RST_SYNC ( .clk(mux_uart_clk), .rst(
        mux_ref_rst), .SYNC_RST(SYNC_UART_RST), .test_si(n19), .test_se(n27)
         );
  DATA_SYNC_NUM_STAGES2_DATA_WIDTH8_test_1 DATA_sync_ref ( .CLK(mux_ref_clk), 
        .RST(n7), .bus_enable(UART_RX_V_OUT), .Unsync_bus(UART_RX_OUT), 
        .sync_bus(UART_RX_SYNC), .enable_pulse(UART_RX_V_SYNC), .test_si(n20), 
        .test_se(n31) );
  ASYNC_FIFO_ADDRES_WIDTH4_DATA_WIDTH8_FIFO_DEPTH8_test_1 U_FIFO ( .W_CLK(
        mux_ref_clk), .W_RST(n7), .W_INC(UART_TX_VLD), .R_CLK(mux_uart_tx_clk), 
        .R_RST(n5), .R_INC(UART_TX_Busy_PULSE), .WR_DATA(UART_TX_IN), .FULL(
        FIFO_FULL), .EMPTY(UART_TX_V_SYNC), .RD_DATA(UART_TX_SYNC), .test_si2(
        SI[1]), .test_si1(ALU_OUT_VLD), .test_so2(n15), .test_so1(SO[2]), 
        .test_se(SE) );
  PULSE_GEN_test_1 U_PULSE_GEN ( .CLK(mux_uart_tx_clk), .RST(n5), .lvl_sig(
        UART_TX_Busy), .pulse_sig(UART_TX_Busy_PULSE), .test_si(n15), 
        .test_so(n14), .test_se(n32) );
  ClkDiv_test_0 Clk_Div_TX_CONS ( .i_ref_clk(mux_uart_clk), .i_rst(n5), 
        .i_clk_en(1'b1), .i_div_ratio(Div_RATIO), .o_div_clk(UART_TX_CLK), 
        .test_si(n21), .test_so(n20), .test_se(n34) );
  CLKDIV_MUX CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]}) );
  ClkDiv_test_1 Clk_Div_RX_Prescale ( .i_ref_clk(mux_uart_clk), .i_rst(n5), 
        .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        DIV_RATIO_RX[3:0]}), .o_div_clk(UART_RX_CLK), .test_si(SI[3]), 
        .test_so(n21), .test_se(n27) );
  UART_TOP_test_1 UART ( .RST(n5), .TX_CLK(mux_uart_tx_clk), .RX_CLK(
        mux_uart_rx_clk), .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), 
        .RX_OUT_V(UART_RX_V_OUT), .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n1), 
        .TX_OUT_S(SO[3]), .TX_OUT_V(UART_TX_Busy), .Prescale(UART_Config[7:2]), 
        .parity_enable(UART_Config[0]), .parity_type(UART_Config[1]), 
        .parity_error(parity_error), .framing_error(framing_error), .test_si2(
        ALU_OUT[6]), .test_si1(SYNC_REF_RST), .test_so1(n19), .test_se(n25) );
  SYS_CTRL_test_1 U_SYS_CTRL ( .CLK(mux_ref_clk), .RST(n7), .ALU_OUT(ALU_OUT), 
        .ALU_OUT_VALID(ALU_OUT_VLD), .RF_RdData(RF_RdData), .RF_RdData_VALID(
        RF_RdData_VLD), .UART_IN_DATA(UART_RX_SYNC), .UART_IN_VALID(
        UART_RX_V_SYNC), .FULL_FLAG(FIFO_FULL), .ALU_EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .RF_WrEn(RF_WrEn), .RF_RdEn(RF_RdEn), .RF_Addres(RF_Address), 
        .RF_WrData(RF_WrData), .TX_P_DATA(UART_TX_IN), .TX_D_VALID(UART_TX_VLD), .CLK_GATE_EN(CLKG_EN), .test_si(n11), .test_so(SO[0]), .test_se(n33) );
  RegFile_test_1 U_RegFile ( .CLK(mux_ref_clk), .RST(n7), .WrEn(RF_WrEn), 
        .RdEn(RF_RdEn), .Address({RF_Address[3:2], n4, n3}), .WrData(RF_WrData), .RdData(RF_RdData), .RdData_VLD(RF_RdData_VLD), .OP_A(Operand_A), .OP_B(
        Operand_B), .UART_CONFIG(UART_Config), .DIV_RATIO(Div_RATIO), 
        .test_si2(SI[0]), .test_si1(n14), .test_so2(n11), .test_so1(SO[1]), 
        .test_se(SE) );
  ALU_test_1 U_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .CLK(ALU_CLK), .RST(n7), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VLD), .test_si2(SI[2]), .test_si1(SYNC_UART_RST), .test_se(n29) );
  CLK_GATE U_CLK_GATE ( .test_en(n2), .CLK_EN(CLKG_EN), .CLK(mux_ref_clk), 
        .GATED_CLK(ALU_CLK) );
  BUFX2M U15 ( .A(SO[3]), .Y(UART_TX_O) );
endmodule

