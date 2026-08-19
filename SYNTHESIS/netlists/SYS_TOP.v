/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Tue Sep 30 08:46:13 2025
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( clk, rst, SYNC_RST );
  input clk, rst;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(clk), .RN(rst), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(\sync_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( clk, rst, SYNC_RST );
  input clk, rst;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(clk), .RN(rst), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(\sync_reg[0] )
         );
endmodule


module DATA_SYNC_NUM_STAGES2_DATA_WIDTH8 ( CLK, RST, bus_enable, Unsync_bus, 
        sync_bus, enable_pulse );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse;
  wire   pulse_gen_reg, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] bit_sync_reg;

  DFFRQX2M pulse_gen_reg_reg ( .D(bit_sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        pulse_gen_reg) );
  DFFRQX2M \bit_sync_reg_reg[1]  ( .D(bit_sync_reg[0]), .CK(CLK), .RN(RST), 
        .Q(bit_sync_reg[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \bit_sync_reg_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        bit_sync_reg[0]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(pulse_gen_reg), .B(bit_sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(Unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(Unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(Unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(Unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(Unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(Unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(Unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n9) );
endmodule


module FIFO_WR_ADDRES_WIDTH4 ( W_CLK, W_RST, W_INC, GRAY_R_ADD, FULL, W_ADD, 
        GRAY_W_ADD );
  input [3:0] GRAY_R_ADD;
  output [2:0] W_ADD;
  output [3:0] GRAY_W_ADD;
  input W_CLK, W_RST, W_INC;
  output FULL;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [3:0] COMP_GRAY_W_ADD;

  DFFRQX2M \ADD_COUNTER_reg[3]  ( .D(n11), .CK(W_CLK), .RN(W_RST), .Q(
        COMP_GRAY_W_ADD[3]) );
  DFFRQX2M \ADD_COUNTER_reg[2]  ( .D(n12), .CK(W_CLK), .RN(W_RST), .Q(W_ADD[2]) );
  DFFRQX2M \GRAY_W_ADD_reg[2]  ( .D(COMP_GRAY_W_ADD[2]), .CK(W_CLK), .RN(W_RST), .Q(GRAY_W_ADD[2]) );
  DFFRQX2M \GRAY_W_ADD_reg[1]  ( .D(COMP_GRAY_W_ADD[1]), .CK(W_CLK), .RN(W_RST), .Q(GRAY_W_ADD[1]) );
  DFFRQX2M \GRAY_W_ADD_reg[0]  ( .D(COMP_GRAY_W_ADD[0]), .CK(W_CLK), .RN(W_RST), .Q(GRAY_W_ADD[0]) );
  DFFRX1M \ADD_COUNTER_reg[0]  ( .D(n14), .CK(W_CLK), .RN(W_RST), .Q(W_ADD[0]), 
        .QN(n1) );
  DFFRQX2M \ADD_COUNTER_reg[1]  ( .D(n13), .CK(W_CLK), .RN(W_RST), .Q(W_ADD[1]) );
  DFFRQX2M \GRAY_W_ADD_reg[3]  ( .D(COMP_GRAY_W_ADD[3]), .CK(W_CLK), .RN(W_RST), .Q(GRAY_W_ADD[3]) );
  INVX2M U3 ( .A(n6), .Y(FULL) );
  NAND2X2M U4 ( .A(W_INC), .B(n6), .Y(n5) );
  XNOR2X2M U5 ( .A(COMP_GRAY_W_ADD[1]), .B(GRAY_R_ADD[1]), .Y(n7) );
  XNOR2X2M U6 ( .A(n1), .B(W_ADD[1]), .Y(COMP_GRAY_W_ADD[0]) );
  NAND4X2M U7 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  CLKXOR2X2M U8 ( .A(GRAY_R_ADD[3]), .B(COMP_GRAY_W_ADD[3]), .Y(n10) );
  XNOR2X2M U9 ( .A(COMP_GRAY_W_ADD[0]), .B(GRAY_R_ADD[0]), .Y(n8) );
  CLKXOR2X2M U10 ( .A(GRAY_R_ADD[2]), .B(COMP_GRAY_W_ADD[2]), .Y(n9) );
  CLKXOR2X2M U11 ( .A(COMP_GRAY_W_ADD[3]), .B(W_ADD[2]), .Y(COMP_GRAY_W_ADD[2]) );
  CLKXOR2X2M U12 ( .A(W_ADD[1]), .B(W_ADD[2]), .Y(COMP_GRAY_W_ADD[1]) );
  NOR2X2M U13 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U14 ( .A(W_ADD[2]), .B(n3), .Y(n12) );
  XNOR2X2M U15 ( .A(COMP_GRAY_W_ADD[3]), .B(n2), .Y(n11) );
  NAND2BX2M U16 ( .AN(n3), .B(W_ADD[2]), .Y(n2) );
  NAND2X2M U17 ( .A(n4), .B(W_ADD[1]), .Y(n3) );
  CLKXOR2X2M U18 ( .A(W_ADD[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
endmodule


module FIFO_RD_ADDRES_WIDTH4 ( R_CLK, R_RST, R_INC, GRAY_W_ADD, EMPTY, 
        GRAY_R_ADD, R_ADD );
  input [3:0] GRAY_W_ADD;
  output [3:0] GRAY_R_ADD;
  output [2:0] R_ADD;
  input R_CLK, R_RST, R_INC;
  output EMPTY;
  wire   \R_ADD_COUNTER[3] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14;
  wire   [2:0] COMB_GRAY_R_ADD;

  DFFRQX2M \R_ADD_COUNTER_reg[3]  ( .D(n11), .CK(R_CLK), .RN(R_RST), .Q(
        \R_ADD_COUNTER[3] ) );
  DFFRQX2M \R_ADD_COUNTER_reg[2]  ( .D(n12), .CK(R_CLK), .RN(R_RST), .Q(
        R_ADD[2]) );
  DFFRX1M \R_ADD_COUNTER_reg[0]  ( .D(n14), .CK(R_CLK), .RN(R_RST), .Q(
        R_ADD[0]), .QN(n1) );
  DFFRQX2M \GRAY_R_ADD_reg[3]  ( .D(\R_ADD_COUNTER[3] ), .CK(R_CLK), .RN(R_RST), .Q(GRAY_R_ADD[3]) );
  DFFRQX2M \GRAY_R_ADD_reg[2]  ( .D(COMB_GRAY_R_ADD[2]), .CK(R_CLK), .RN(R_RST), .Q(GRAY_R_ADD[2]) );
  DFFRQX2M \GRAY_R_ADD_reg[1]  ( .D(COMB_GRAY_R_ADD[1]), .CK(R_CLK), .RN(R_RST), .Q(GRAY_R_ADD[1]) );
  DFFRQX2M \GRAY_R_ADD_reg[0]  ( .D(COMB_GRAY_R_ADD[0]), .CK(R_CLK), .RN(R_RST), .Q(GRAY_R_ADD[0]) );
  DFFRQX2M \R_ADD_COUNTER_reg[1]  ( .D(n13), .CK(R_CLK), .RN(R_RST), .Q(
        R_ADD[1]) );
  INVX2M U3 ( .A(n6), .Y(EMPTY) );
  XNOR2X2M U4 ( .A(COMB_GRAY_R_ADD[1]), .B(GRAY_W_ADD[1]), .Y(n7) );
  XNOR2X2M U5 ( .A(n1), .B(R_ADD[1]), .Y(COMB_GRAY_R_ADD[0]) );
  NOR2X2M U6 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U7 ( .A(R_ADD[2]), .B(n3), .Y(n12) );
  NAND4X2M U8 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  XNOR2X2M U9 ( .A(\R_ADD_COUNTER[3] ), .B(GRAY_W_ADD[3]), .Y(n9) );
  XNOR2X2M U10 ( .A(COMB_GRAY_R_ADD[2]), .B(GRAY_W_ADD[2]), .Y(n10) );
  XNOR2X2M U11 ( .A(COMB_GRAY_R_ADD[0]), .B(GRAY_W_ADD[0]), .Y(n8) );
  NAND2X2M U12 ( .A(n4), .B(R_ADD[1]), .Y(n3) );
  NAND2X2M U13 ( .A(R_INC), .B(n6), .Y(n5) );
  XNOR2X2M U14 ( .A(\R_ADD_COUNTER[3] ), .B(n2), .Y(n11) );
  NAND2BX2M U15 ( .AN(n3), .B(R_ADD[2]), .Y(n2) );
  CLKXOR2X2M U16 ( .A(R_ADD[1]), .B(R_ADD[2]), .Y(COMB_GRAY_R_ADD[1]) );
  CLKXOR2X2M U17 ( .A(\R_ADD_COUNTER[3] ), .B(R_ADD[2]), .Y(COMB_GRAY_R_ADD[2]) );
  CLKXOR2X2M U18 ( .A(R_ADD[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
endmodule


module FIFO_MEM_CNTRL_ADDRES_WIDTH4_DATA_WIDTH8_FIFO_DEPTH8 ( W_CLK, W_RST, 
        W_INC, FULL, WR_DATA, R_ADD, W_ADD, RD_DATA );
  input [7:0] WR_DATA;
  input [2:0] R_ADD;
  input [2:0] W_ADD;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, FULL;
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
         \MEMORY[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115;
  assign N9 = R_ADD[0];
  assign N10 = R_ADD[1];
  assign N11 = R_ADD[2];

  DFFRQX2M \MEMORY_reg[5][7]  ( .D(n69), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[5][7] ) );
  DFFRQX2M \MEMORY_reg[5][6]  ( .D(n68), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[5][6] ) );
  DFFRQX2M \MEMORY_reg[5][5]  ( .D(n67), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[5][5] ) );
  DFFRQX2M \MEMORY_reg[5][4]  ( .D(n66), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[5][4] ) );
  DFFRQX2M \MEMORY_reg[5][3]  ( .D(n65), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[5][3] ) );
  DFFRQX2M \MEMORY_reg[5][2]  ( .D(n64), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[5][2] ) );
  DFFRQX2M \MEMORY_reg[5][1]  ( .D(n63), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[5][1] ) );
  DFFRQX2M \MEMORY_reg[5][0]  ( .D(n62), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[5][0] ) );
  DFFRQX2M \MEMORY_reg[1][7]  ( .D(n37), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[1][7] ) );
  DFFRQX2M \MEMORY_reg[1][6]  ( .D(n36), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[1][6] ) );
  DFFRQX2M \MEMORY_reg[1][5]  ( .D(n35), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[1][5] ) );
  DFFRQX2M \MEMORY_reg[1][4]  ( .D(n34), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[1][4] ) );
  DFFRQX2M \MEMORY_reg[1][3]  ( .D(n33), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[1][3] ) );
  DFFRQX2M \MEMORY_reg[1][2]  ( .D(n32), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[1][2] ) );
  DFFRQX2M \MEMORY_reg[1][1]  ( .D(n31), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[1][1] ) );
  DFFRQX2M \MEMORY_reg[1][0]  ( .D(n30), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[1][0] ) );
  DFFRQX2M \MEMORY_reg[7][7]  ( .D(n85), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[7][7] ) );
  DFFRQX2M \MEMORY_reg[7][6]  ( .D(n84), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[7][6] ) );
  DFFRQX2M \MEMORY_reg[7][5]  ( .D(n83), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[7][5] ) );
  DFFRQX2M \MEMORY_reg[7][4]  ( .D(n82), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[7][4] ) );
  DFFRQX2M \MEMORY_reg[7][3]  ( .D(n81), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[7][3] ) );
  DFFRQX2M \MEMORY_reg[7][2]  ( .D(n80), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[7][2] ) );
  DFFRQX2M \MEMORY_reg[7][1]  ( .D(n79), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[7][1] ) );
  DFFRQX2M \MEMORY_reg[7][0]  ( .D(n78), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[7][0] ) );
  DFFRQX2M \MEMORY_reg[3][7]  ( .D(n53), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[3][7] ) );
  DFFRQX2M \MEMORY_reg[3][6]  ( .D(n52), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[3][6] ) );
  DFFRQX2M \MEMORY_reg[3][5]  ( .D(n51), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[3][5] ) );
  DFFRQX2M \MEMORY_reg[3][4]  ( .D(n50), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[3][4] ) );
  DFFRQX2M \MEMORY_reg[3][3]  ( .D(n49), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[3][3] ) );
  DFFRQX2M \MEMORY_reg[3][2]  ( .D(n48), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[3][2] ) );
  DFFRQX2M \MEMORY_reg[3][1]  ( .D(n47), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[3][1] ) );
  DFFRQX2M \MEMORY_reg[3][0]  ( .D(n46), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[3][0] ) );
  DFFRQX2M \MEMORY_reg[6][7]  ( .D(n77), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[6][7] ) );
  DFFRQX2M \MEMORY_reg[6][6]  ( .D(n76), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[6][6] ) );
  DFFRQX2M \MEMORY_reg[6][5]  ( .D(n75), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[6][5] ) );
  DFFRQX2M \MEMORY_reg[6][4]  ( .D(n74), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[6][4] ) );
  DFFRQX2M \MEMORY_reg[6][3]  ( .D(n73), .CK(W_CLK), .RN(n101), .Q(
        \MEMORY[6][3] ) );
  DFFRQX2M \MEMORY_reg[6][2]  ( .D(n72), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[6][2] ) );
  DFFRQX2M \MEMORY_reg[6][1]  ( .D(n71), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[6][1] ) );
  DFFRQX2M \MEMORY_reg[6][0]  ( .D(n70), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[6][0] ) );
  DFFRQX2M \MEMORY_reg[2][7]  ( .D(n45), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[2][7] ) );
  DFFRQX2M \MEMORY_reg[2][6]  ( .D(n44), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[2][6] ) );
  DFFRQX2M \MEMORY_reg[2][5]  ( .D(n43), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[2][5] ) );
  DFFRQX2M \MEMORY_reg[2][4]  ( .D(n42), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[2][4] ) );
  DFFRQX2M \MEMORY_reg[2][3]  ( .D(n41), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[2][3] ) );
  DFFRQX2M \MEMORY_reg[2][2]  ( .D(n40), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[2][2] ) );
  DFFRQX2M \MEMORY_reg[2][1]  ( .D(n39), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[2][1] ) );
  DFFRQX2M \MEMORY_reg[2][0]  ( .D(n38), .CK(W_CLK), .RN(n104), .Q(
        \MEMORY[2][0] ) );
  DFFRQX2M \MEMORY_reg[4][7]  ( .D(n61), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[4][7] ) );
  DFFRQX2M \MEMORY_reg[4][6]  ( .D(n60), .CK(W_CLK), .RN(n102), .Q(
        \MEMORY[4][6] ) );
  DFFRQX2M \MEMORY_reg[4][5]  ( .D(n59), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[4][5] ) );
  DFFRQX2M \MEMORY_reg[4][4]  ( .D(n58), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[4][4] ) );
  DFFRQX2M \MEMORY_reg[4][3]  ( .D(n57), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[4][3] ) );
  DFFRQX2M \MEMORY_reg[4][2]  ( .D(n56), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[4][2] ) );
  DFFRQX2M \MEMORY_reg[4][1]  ( .D(n55), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[4][1] ) );
  DFFRQX2M \MEMORY_reg[4][0]  ( .D(n54), .CK(W_CLK), .RN(n103), .Q(
        \MEMORY[4][0] ) );
  DFFRQX2M \MEMORY_reg[0][7]  ( .D(n29), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[0][7] ) );
  DFFRQX2M \MEMORY_reg[0][6]  ( .D(n28), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[0][6] ) );
  DFFRQX2M \MEMORY_reg[0][5]  ( .D(n27), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[0][5] ) );
  DFFRQX2M \MEMORY_reg[0][4]  ( .D(n26), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[0][4] ) );
  DFFRQX2M \MEMORY_reg[0][3]  ( .D(n25), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[0][3] ) );
  DFFRQX2M \MEMORY_reg[0][2]  ( .D(n24), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[0][2] ) );
  DFFRQX2M \MEMORY_reg[0][1]  ( .D(n23), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[0][1] ) );
  DFFRQX2M \MEMORY_reg[0][0]  ( .D(n22), .CK(W_CLK), .RN(n105), .Q(
        \MEMORY[0][0] ) );
  BUFX2M U2 ( .A(n20), .Y(n94) );
  BUFX2M U3 ( .A(n21), .Y(n93) );
  BUFX2M U4 ( .A(n15), .Y(n96) );
  BUFX2M U5 ( .A(n13), .Y(n98) );
  BUFX2M U6 ( .A(n14), .Y(n97) );
  BUFX2M U7 ( .A(n19), .Y(n95) );
  BUFX2M U8 ( .A(n99), .Y(n103) );
  BUFX2M U9 ( .A(n99), .Y(n102) );
  BUFX2M U10 ( .A(n99), .Y(n101) );
  BUFX2M U11 ( .A(n100), .Y(n104) );
  BUFX2M U12 ( .A(n100), .Y(n105) );
  NOR2BX2M U13 ( .AN(W_INC), .B(FULL), .Y(n16) );
  BUFX2M U14 ( .A(W_RST), .Y(n99) );
  BUFX2M U15 ( .A(W_RST), .Y(n100) );
  NAND3X2M U16 ( .A(n114), .B(n115), .C(n18), .Y(n17) );
  NAND3X2M U17 ( .A(n114), .B(n115), .C(n12), .Y(n11) );
  NOR2BX2M U18 ( .AN(n16), .B(W_ADD[2]), .Y(n12) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n106), .A0N(\MEMORY[0][0] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U20 ( .B0(n11), .B1(n107), .A0N(\MEMORY[0][1] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n108), .A0N(\MEMORY[0][2] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n109), .A0N(\MEMORY[0][3] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n110), .A0N(\MEMORY[0][4] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n111), .A0N(\MEMORY[0][5] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n112), .A0N(\MEMORY[0][6] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n113), .A0N(\MEMORY[0][7] ), .A1N(n11), .Y(
        n29) );
  OAI2BB2X1M U27 ( .B0(n106), .B1(n17), .A0N(\MEMORY[4][0] ), .A1N(n17), .Y(
        n54) );
  OAI2BB2X1M U28 ( .B0(n107), .B1(n17), .A0N(\MEMORY[4][1] ), .A1N(n17), .Y(
        n55) );
  OAI2BB2X1M U29 ( .B0(n108), .B1(n17), .A0N(\MEMORY[4][2] ), .A1N(n17), .Y(
        n56) );
  OAI2BB2X1M U30 ( .B0(n109), .B1(n17), .A0N(\MEMORY[4][3] ), .A1N(n17), .Y(
        n57) );
  OAI2BB2X1M U31 ( .B0(n110), .B1(n17), .A0N(\MEMORY[4][4] ), .A1N(n17), .Y(
        n58) );
  OAI2BB2X1M U32 ( .B0(n111), .B1(n17), .A0N(\MEMORY[4][5] ), .A1N(n17), .Y(
        n59) );
  OAI2BB2X1M U33 ( .B0(n112), .B1(n17), .A0N(\MEMORY[4][6] ), .A1N(n17), .Y(
        n60) );
  OAI2BB2X1M U34 ( .B0(n113), .B1(n17), .A0N(\MEMORY[4][7] ), .A1N(n17), .Y(
        n61) );
  OAI2BB2X1M U35 ( .B0(n106), .B1(n98), .A0N(\MEMORY[1][0] ), .A1N(n98), .Y(
        n30) );
  OAI2BB2X1M U36 ( .B0(n107), .B1(n98), .A0N(\MEMORY[1][1] ), .A1N(n98), .Y(
        n31) );
  OAI2BB2X1M U37 ( .B0(n108), .B1(n98), .A0N(\MEMORY[1][2] ), .A1N(n98), .Y(
        n32) );
  OAI2BB2X1M U38 ( .B0(n109), .B1(n98), .A0N(\MEMORY[1][3] ), .A1N(n98), .Y(
        n33) );
  OAI2BB2X1M U39 ( .B0(n110), .B1(n98), .A0N(\MEMORY[1][4] ), .A1N(n98), .Y(
        n34) );
  OAI2BB2X1M U40 ( .B0(n111), .B1(n98), .A0N(\MEMORY[1][5] ), .A1N(n98), .Y(
        n35) );
  OAI2BB2X1M U41 ( .B0(n112), .B1(n98), .A0N(\MEMORY[1][6] ), .A1N(n98), .Y(
        n36) );
  OAI2BB2X1M U42 ( .B0(n113), .B1(n98), .A0N(\MEMORY[1][7] ), .A1N(n98), .Y(
        n37) );
  OAI2BB2X1M U43 ( .B0(n106), .B1(n97), .A0N(\MEMORY[2][0] ), .A1N(n97), .Y(
        n38) );
  OAI2BB2X1M U44 ( .B0(n107), .B1(n97), .A0N(\MEMORY[2][1] ), .A1N(n97), .Y(
        n39) );
  OAI2BB2X1M U45 ( .B0(n108), .B1(n97), .A0N(\MEMORY[2][2] ), .A1N(n97), .Y(
        n40) );
  OAI2BB2X1M U46 ( .B0(n109), .B1(n97), .A0N(\MEMORY[2][3] ), .A1N(n97), .Y(
        n41) );
  OAI2BB2X1M U47 ( .B0(n110), .B1(n97), .A0N(\MEMORY[2][4] ), .A1N(n97), .Y(
        n42) );
  OAI2BB2X1M U48 ( .B0(n111), .B1(n97), .A0N(\MEMORY[2][5] ), .A1N(n97), .Y(
        n43) );
  OAI2BB2X1M U49 ( .B0(n112), .B1(n97), .A0N(\MEMORY[2][6] ), .A1N(n97), .Y(
        n44) );
  OAI2BB2X1M U50 ( .B0(n113), .B1(n97), .A0N(\MEMORY[2][7] ), .A1N(n97), .Y(
        n45) );
  OAI2BB2X1M U51 ( .B0(n106), .B1(n96), .A0N(\MEMORY[3][0] ), .A1N(n96), .Y(
        n46) );
  OAI2BB2X1M U52 ( .B0(n107), .B1(n96), .A0N(\MEMORY[3][1] ), .A1N(n96), .Y(
        n47) );
  OAI2BB2X1M U53 ( .B0(n108), .B1(n96), .A0N(\MEMORY[3][2] ), .A1N(n96), .Y(
        n48) );
  OAI2BB2X1M U54 ( .B0(n109), .B1(n96), .A0N(\MEMORY[3][3] ), .A1N(n96), .Y(
        n49) );
  OAI2BB2X1M U55 ( .B0(n110), .B1(n96), .A0N(\MEMORY[3][4] ), .A1N(n96), .Y(
        n50) );
  OAI2BB2X1M U56 ( .B0(n111), .B1(n96), .A0N(\MEMORY[3][5] ), .A1N(n96), .Y(
        n51) );
  OAI2BB2X1M U57 ( .B0(n112), .B1(n96), .A0N(\MEMORY[3][6] ), .A1N(n96), .Y(
        n52) );
  OAI2BB2X1M U58 ( .B0(n113), .B1(n96), .A0N(\MEMORY[3][7] ), .A1N(n96), .Y(
        n53) );
  AND2X2M U59 ( .A(W_ADD[2]), .B(n16), .Y(n18) );
  NAND3X2M U60 ( .A(n12), .B(n115), .C(W_ADD[0]), .Y(n13) );
  NAND3X2M U61 ( .A(n12), .B(n114), .C(W_ADD[1]), .Y(n14) );
  NAND3X2M U62 ( .A(W_ADD[0]), .B(n12), .C(W_ADD[1]), .Y(n15) );
  INVX2M U63 ( .A(WR_DATA[0]), .Y(n106) );
  INVX2M U64 ( .A(WR_DATA[1]), .Y(n107) );
  INVX2M U65 ( .A(WR_DATA[2]), .Y(n108) );
  INVX2M U66 ( .A(WR_DATA[3]), .Y(n109) );
  INVX2M U67 ( .A(WR_DATA[4]), .Y(n110) );
  INVX2M U68 ( .A(WR_DATA[5]), .Y(n111) );
  INVX2M U69 ( .A(WR_DATA[6]), .Y(n112) );
  INVX2M U70 ( .A(WR_DATA[7]), .Y(n113) );
  OAI2BB2X1M U71 ( .B0(n106), .B1(n95), .A0N(\MEMORY[5][0] ), .A1N(n95), .Y(
        n62) );
  OAI2BB2X1M U72 ( .B0(n107), .B1(n95), .A0N(\MEMORY[5][1] ), .A1N(n95), .Y(
        n63) );
  OAI2BB2X1M U73 ( .B0(n108), .B1(n95), .A0N(\MEMORY[5][2] ), .A1N(n95), .Y(
        n64) );
  OAI2BB2X1M U74 ( .B0(n109), .B1(n95), .A0N(\MEMORY[5][3] ), .A1N(n95), .Y(
        n65) );
  OAI2BB2X1M U75 ( .B0(n110), .B1(n95), .A0N(\MEMORY[5][4] ), .A1N(n95), .Y(
        n66) );
  OAI2BB2X1M U76 ( .B0(n111), .B1(n95), .A0N(\MEMORY[5][5] ), .A1N(n95), .Y(
        n67) );
  OAI2BB2X1M U77 ( .B0(n112), .B1(n95), .A0N(\MEMORY[5][6] ), .A1N(n95), .Y(
        n68) );
  OAI2BB2X1M U78 ( .B0(n113), .B1(n95), .A0N(\MEMORY[5][7] ), .A1N(n95), .Y(
        n69) );
  OAI2BB2X1M U79 ( .B0(n106), .B1(n94), .A0N(\MEMORY[6][0] ), .A1N(n94), .Y(
        n70) );
  OAI2BB2X1M U80 ( .B0(n107), .B1(n94), .A0N(\MEMORY[6][1] ), .A1N(n94), .Y(
        n71) );
  OAI2BB2X1M U81 ( .B0(n108), .B1(n94), .A0N(\MEMORY[6][2] ), .A1N(n94), .Y(
        n72) );
  OAI2BB2X1M U82 ( .B0(n109), .B1(n94), .A0N(\MEMORY[6][3] ), .A1N(n94), .Y(
        n73) );
  OAI2BB2X1M U83 ( .B0(n110), .B1(n94), .A0N(\MEMORY[6][4] ), .A1N(n94), .Y(
        n74) );
  OAI2BB2X1M U84 ( .B0(n111), .B1(n94), .A0N(\MEMORY[6][5] ), .A1N(n94), .Y(
        n75) );
  OAI2BB2X1M U85 ( .B0(n112), .B1(n94), .A0N(\MEMORY[6][6] ), .A1N(n94), .Y(
        n76) );
  OAI2BB2X1M U86 ( .B0(n113), .B1(n94), .A0N(\MEMORY[6][7] ), .A1N(n94), .Y(
        n77) );
  OAI2BB2X1M U87 ( .B0(n106), .B1(n93), .A0N(\MEMORY[7][0] ), .A1N(n93), .Y(
        n78) );
  OAI2BB2X1M U88 ( .B0(n107), .B1(n93), .A0N(\MEMORY[7][1] ), .A1N(n93), .Y(
        n79) );
  OAI2BB2X1M U89 ( .B0(n108), .B1(n93), .A0N(\MEMORY[7][2] ), .A1N(n93), .Y(
        n80) );
  OAI2BB2X1M U90 ( .B0(n109), .B1(n93), .A0N(\MEMORY[7][3] ), .A1N(n93), .Y(
        n81) );
  OAI2BB2X1M U91 ( .B0(n110), .B1(n93), .A0N(\MEMORY[7][4] ), .A1N(n93), .Y(
        n82) );
  OAI2BB2X1M U92 ( .B0(n111), .B1(n93), .A0N(\MEMORY[7][5] ), .A1N(n93), .Y(
        n83) );
  OAI2BB2X1M U93 ( .B0(n112), .B1(n93), .A0N(\MEMORY[7][6] ), .A1N(n93), .Y(
        n84) );
  OAI2BB2X1M U94 ( .B0(n113), .B1(n93), .A0N(\MEMORY[7][7] ), .A1N(n93), .Y(
        n85) );
  NAND3X2M U95 ( .A(W_ADD[1]), .B(W_ADD[0]), .C(n18), .Y(n21) );
  NAND3X2M U96 ( .A(W_ADD[0]), .B(n115), .C(n18), .Y(n19) );
  NAND3X2M U97 ( .A(W_ADD[1]), .B(n114), .C(n18), .Y(n20) );
  INVX2M U98 ( .A(W_ADD[0]), .Y(n114) );
  INVX2M U99 ( .A(W_ADD[1]), .Y(n115) );
  BUFX4M U100 ( .A(N9), .Y(n92) );
  MX2X2M U101 ( .A(n91), .B(n90), .S0(N11), .Y(RD_DATA[7]) );
  MX4X1M U102 ( .A(\MEMORY[4][7] ), .B(\MEMORY[5][7] ), .C(\MEMORY[6][7] ), 
        .D(\MEMORY[7][7] ), .S0(n92), .S1(N10), .Y(n90) );
  MX4X1M U103 ( .A(\MEMORY[0][7] ), .B(\MEMORY[1][7] ), .C(\MEMORY[2][7] ), 
        .D(\MEMORY[3][7] ), .S0(n92), .S1(N10), .Y(n91) );
  MX2X2M U104 ( .A(n89), .B(n88), .S0(N11), .Y(RD_DATA[6]) );
  MX4X1M U105 ( .A(\MEMORY[4][6] ), .B(\MEMORY[5][6] ), .C(\MEMORY[6][6] ), 
        .D(\MEMORY[7][6] ), .S0(n92), .S1(N10), .Y(n88) );
  MX4X1M U106 ( .A(\MEMORY[0][6] ), .B(\MEMORY[1][6] ), .C(\MEMORY[2][6] ), 
        .D(\MEMORY[3][6] ), .S0(n92), .S1(N10), .Y(n89) );
  MX2X2M U107 ( .A(n6), .B(n5), .S0(N11), .Y(RD_DATA[2]) );
  MX4X1M U108 ( .A(\MEMORY[4][2] ), .B(\MEMORY[5][2] ), .C(\MEMORY[6][2] ), 
        .D(\MEMORY[7][2] ), .S0(n92), .S1(N10), .Y(n5) );
  MX4X1M U109 ( .A(\MEMORY[0][2] ), .B(\MEMORY[1][2] ), .C(\MEMORY[2][2] ), 
        .D(\MEMORY[3][2] ), .S0(n92), .S1(N10), .Y(n6) );
  MX2X2M U110 ( .A(n10), .B(n9), .S0(N11), .Y(RD_DATA[4]) );
  MX4X1M U111 ( .A(\MEMORY[4][4] ), .B(\MEMORY[5][4] ), .C(\MEMORY[6][4] ), 
        .D(\MEMORY[7][4] ), .S0(n92), .S1(N10), .Y(n9) );
  MX4X1M U112 ( .A(\MEMORY[0][4] ), .B(\MEMORY[1][4] ), .C(\MEMORY[2][4] ), 
        .D(\MEMORY[3][4] ), .S0(n92), .S1(N10), .Y(n10) );
  MX2X2M U113 ( .A(n2), .B(n1), .S0(N11), .Y(RD_DATA[0]) );
  MX4X1M U114 ( .A(\MEMORY[4][0] ), .B(\MEMORY[5][0] ), .C(\MEMORY[6][0] ), 
        .D(\MEMORY[7][0] ), .S0(n92), .S1(N10), .Y(n1) );
  MX4X1M U115 ( .A(\MEMORY[0][0] ), .B(\MEMORY[1][0] ), .C(\MEMORY[2][0] ), 
        .D(\MEMORY[3][0] ), .S0(n92), .S1(N10), .Y(n2) );
  MX2X2M U116 ( .A(n87), .B(n86), .S0(N11), .Y(RD_DATA[5]) );
  MX4X1M U117 ( .A(\MEMORY[4][5] ), .B(\MEMORY[5][5] ), .C(\MEMORY[6][5] ), 
        .D(\MEMORY[7][5] ), .S0(n92), .S1(N10), .Y(n86) );
  MX4X1M U118 ( .A(\MEMORY[0][5] ), .B(\MEMORY[1][5] ), .C(\MEMORY[2][5] ), 
        .D(\MEMORY[3][5] ), .S0(n92), .S1(N10), .Y(n87) );
  MX2X2M U119 ( .A(n4), .B(n3), .S0(N11), .Y(RD_DATA[1]) );
  MX4X1M U120 ( .A(\MEMORY[4][1] ), .B(\MEMORY[5][1] ), .C(\MEMORY[6][1] ), 
        .D(\MEMORY[7][1] ), .S0(n92), .S1(N10), .Y(n3) );
  MX4X1M U121 ( .A(\MEMORY[0][1] ), .B(\MEMORY[1][1] ), .C(\MEMORY[2][1] ), 
        .D(\MEMORY[3][1] ), .S0(n92), .S1(N10), .Y(n4) );
  MX2X2M U122 ( .A(n8), .B(n7), .S0(N11), .Y(RD_DATA[3]) );
  MX4X1M U123 ( .A(\MEMORY[4][3] ), .B(\MEMORY[5][3] ), .C(\MEMORY[6][3] ), 
        .D(\MEMORY[7][3] ), .S0(n92), .S1(N10), .Y(n7) );
  MX4X1M U124 ( .A(\MEMORY[0][3] ), .B(\MEMORY[1][3] ), .C(\MEMORY[2][3] ), 
        .D(\MEMORY[3][3] ), .S0(n92), .S1(N10), .Y(n8) );
endmodule


module BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_0 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] ;

  DFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[1]) );
  DFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[0]) );
  DFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[3]) );
  DFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[2]) );
  DFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[3][0] ) );
  DFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[2][0] ) );
  DFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[1][0] ) );
  DFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[0][0] ) );
endmodule


module BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_1 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] ;

  DFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[3]) );
  DFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[2]) );
  DFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[1]) );
  DFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[0]) );
  DFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[3][0] ) );
  DFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[2][0] ) );
  DFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[1][0] ) );
  DFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[0][0] ) );
endmodule


module ASYNC_FIFO_ADDRES_WIDTH4_DATA_WIDTH8_FIFO_DEPTH8 ( W_CLK, W_RST, W_INC, 
        R_CLK, R_RST, R_INC, WR_DATA, FULL, EMPTY, RD_DATA );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC;
  output FULL, EMPTY;
  wire   n1, n2;
  wire   [3:0] WQ2_R_PTR;
  wire   [2:0] WRITE_ADDRES;
  wire   [3:0] W_PTR;
  wire   [3:0] WQ2_W_PTR;
  wire   [2:0] READ_ADDRES;
  wire   [3:0] R_PTR;

  FIFO_WR_ADDRES_WIDTH4 WRITE_MODULE ( .W_CLK(W_CLK), .W_RST(n1), .W_INC(W_INC), .GRAY_R_ADD(WQ2_R_PTR), .FULL(FULL), .W_ADD(WRITE_ADDRES), .GRAY_W_ADD(W_PTR) );
  FIFO_RD_ADDRES_WIDTH4 READ_MODULE ( .R_CLK(R_CLK), .R_RST(R_RST), .R_INC(
        R_INC), .GRAY_W_ADD(WQ2_W_PTR), .EMPTY(EMPTY), .GRAY_R_ADD(R_PTR), 
        .R_ADD(READ_ADDRES) );
  FIFO_MEM_CNTRL_ADDRES_WIDTH4_DATA_WIDTH8_FIFO_DEPTH8 MEMORY_MODULE ( .W_CLK(
        W_CLK), .W_RST(n1), .W_INC(W_INC), .FULL(FULL), .WR_DATA(WR_DATA), 
        .R_ADD(READ_ADDRES), .W_ADD(WRITE_ADDRES), .RD_DATA(RD_DATA) );
  BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_0 BIT_SYNC_R_TO_W ( .CLK(W_CLK), .RST(n1), 
        .ASYNC(R_PTR), .SYNC(WQ2_R_PTR) );
  BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_1 BIT_SYNC_W_TO_R ( .CLK(R_CLK), .RST(R_RST), 
        .ASYNC(W_PTR), .SYNC(WQ2_W_PTR) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
endmodule


module PULSE_GEN ( CLK, RST, lvl_sig, pulse_sig );
  input CLK, RST, lvl_sig;
  output pulse_sig;
  wire   pulse_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(CLK), .RN(RST), .Q(rcv_flop) );
  DFFRQX2M pulse_flop_reg ( .D(rcv_flop), .CK(CLK), .RN(RST), .Q(pulse_flop)
         );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pulse_flop), .Y(pulse_sig) );
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


module ClkDiv_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_0_DW01_inc_0 add_50 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[5]  ( .D(n20), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX2M \count_reg[4]  ( .D(n21), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX2M \count_reg[3]  ( .D(n22), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX2M \count_reg[6]  ( .D(n19), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX2M \count_reg[0]  ( .D(n25), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  DFFRQX2M \count_reg[2]  ( .D(n23), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX2M \count_reg[1]  ( .D(n24), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  OR2X2M U4 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U5 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n25) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n24) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n23) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n22) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n21) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n20) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n19) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n18) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n17) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n1, n2, n3, n4;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  OAI31X1M U11 ( .A0(n4), .A1(n1), .A2(n3), .B0(n2), .Y(OUT[0]) );
  AND2X2M U12 ( .A(n2), .B(n4), .Y(OUT[1]) );
  AND2X2M U13 ( .A(n1), .B(n2), .Y(OUT[3]) );
  AND2X2M U14 ( .A(n2), .B(n3), .Y(OUT[2]) );
  NOR4BX1M U15 ( .AN(IN[3]), .B(IN[2]), .C(IN[4]), .D(IN[5]), .Y(n3) );
  NOR4BX1M U16 ( .AN(IN[4]), .B(IN[2]), .C(IN[3]), .D(IN[5]), .Y(n4) );
  NOR4BX1M U17 ( .AN(IN[2]), .B(IN[3]), .C(IN[4]), .D(IN[5]), .Y(n1) );
  NOR2X2M U18 ( .A(IN[1]), .B(IN[0]), .Y(n2) );
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


module ClkDiv_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_1_DW01_inc_0 add_50 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n50), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n51), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[5]  ( .D(n48), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX2M \count_reg[4]  ( .D(n47), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX2M \count_reg[3]  ( .D(n46), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX2M \count_reg[6]  ( .D(n49), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX2M \count_reg[0]  ( .D(n43), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  DFFRQX2M \count_reg[2]  ( .D(n45), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX2M \count_reg[1]  ( .D(n44), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  OR2X2M U3 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  MX2X2M U4 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  NAND2BX2M U5 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n43) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n44) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n45) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n46) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n47) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n48) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n49) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n50) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n51) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module SERIALIZER_DATA_WIDTH8_COUNT3 ( IN_DATA, SER_EN, CLK, RST, BUSY, 
        SER_DONE, ser_data );
  input [7:0] IN_DATA;
  input SER_EN, CLK, RST, BUSY;
  output SER_DONE, ser_data;
  wire   N22, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n1, n2,
         n3, n4, n5, n6, n32;
  wire   [7:0] register;
  wire   [2:0] counter;

  DFFRQX2M \register_reg[6]  ( .D(n26), .CK(CLK), .RN(RST), .Q(register[6]) );
  DFFRQX2M \register_reg[5]  ( .D(n27), .CK(CLK), .RN(RST), .Q(register[5]) );
  DFFRQX2M \register_reg[4]  ( .D(n28), .CK(CLK), .RN(RST), .Q(register[4]) );
  DFFRQX2M \register_reg[3]  ( .D(n29), .CK(CLK), .RN(RST), .Q(register[3]) );
  DFFRQX2M \register_reg[2]  ( .D(n30), .CK(CLK), .RN(RST), .Q(register[2]) );
  DFFRQX2M \register_reg[1]  ( .D(n31), .CK(CLK), .RN(RST), .Q(register[1]) );
  DFFRQX2M \register_reg[0]  ( .D(n25), .CK(CLK), .RN(RST), .Q(register[0]) );
  DFFRQX2M ser_data_reg ( .D(n22), .CK(CLK), .RN(RST), .Q(ser_data) );
  DFFRQX2M \counter_reg[1]  ( .D(n24), .CK(CLK), .RN(RST), .Q(counter[1]) );
  DFFRQX2M \counter_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(counter[0]) );
  DFFRQX2M \counter_reg[2]  ( .D(n23), .CK(CLK), .RN(RST), .Q(counter[2]) );
  DFFRQX2M SER_DONE_reg ( .D(N22), .CK(CLK), .RN(RST), .Q(SER_DONE) );
  NOR2X2M U3 ( .A(n3), .B(n1), .Y(n9) );
  NOR2X2M U4 ( .A(n1), .B(n9), .Y(n7) );
  INVX2M U5 ( .A(SER_EN), .Y(n3) );
  NOR2X2M U6 ( .A(n6), .B(n5), .Y(n12) );
  NAND2X2M U7 ( .A(n12), .B(n1), .Y(n10) );
  NOR2X2M U8 ( .A(n32), .B(n10), .Y(N22) );
  INVX2M U9 ( .A(n1), .Y(n4) );
  INVX2M U10 ( .A(n14), .Y(n2) );
  AOI221XLM U11 ( .A0(n5), .A1(n1), .B0(n7), .B1(counter[0]), .C0(n9), .Y(n14)
         );
  OAI32X1M U12 ( .A0(n5), .A1(counter[1]), .A2(n4), .B0(n13), .B1(n6), .Y(n24)
         );
  AOI21X2M U13 ( .A0(n1), .A1(n5), .B0(n7), .Y(n13) );
  OAI22X1M U14 ( .A0(counter[2]), .A1(n10), .B0(n11), .B1(n32), .Y(n23) );
  AOI2BB2XLM U15 ( .B0(n4), .B1(n3), .A0N(n12), .A1N(n9), .Y(n11) );
  BUFX2M U16 ( .A(BUSY), .Y(n1) );
  OAI2BB1X2M U17 ( .A0N(n7), .A1N(register[6]), .B0(n16), .Y(n26) );
  NAND2X2M U18 ( .A(IN_DATA[7]), .B(n9), .Y(n16) );
  OAI2BB1X2M U19 ( .A0N(ser_data), .A1N(n7), .B0(n8), .Y(n22) );
  AOI22X1M U20 ( .A0(IN_DATA[0]), .A1(n9), .B0(register[0]), .B1(n1), .Y(n8)
         );
  OAI2BB1X2M U21 ( .A0N(n7), .A1N(register[0]), .B0(n15), .Y(n25) );
  AOI22X1M U22 ( .A0(IN_DATA[1]), .A1(n9), .B0(register[1]), .B1(n1), .Y(n15)
         );
  OAI2BB1X2M U23 ( .A0N(n7), .A1N(register[1]), .B0(n21), .Y(n31) );
  AOI22X1M U24 ( .A0(IN_DATA[2]), .A1(n9), .B0(register[2]), .B1(n1), .Y(n21)
         );
  OAI2BB1X2M U25 ( .A0N(n7), .A1N(register[2]), .B0(n20), .Y(n30) );
  AOI22X1M U26 ( .A0(IN_DATA[3]), .A1(n9), .B0(register[3]), .B1(n1), .Y(n20)
         );
  OAI2BB1X2M U27 ( .A0N(n7), .A1N(register[3]), .B0(n19), .Y(n29) );
  AOI22X1M U28 ( .A0(IN_DATA[4]), .A1(n9), .B0(register[4]), .B1(n1), .Y(n19)
         );
  OAI2BB1X2M U29 ( .A0N(n7), .A1N(register[4]), .B0(n18), .Y(n28) );
  AOI22X1M U30 ( .A0(IN_DATA[5]), .A1(n9), .B0(register[5]), .B1(n1), .Y(n18)
         );
  OAI2BB1X2M U31 ( .A0N(n7), .A1N(register[5]), .B0(n17), .Y(n27) );
  AOI22X1M U32 ( .A0(IN_DATA[6]), .A1(n9), .B0(register[6]), .B1(n1), .Y(n17)
         );
  INVX2M U33 ( .A(counter[0]), .Y(n5) );
  INVX2M U34 ( .A(counter[2]), .Y(n32) );
  INVX2M U35 ( .A(counter[1]), .Y(n6) );
endmodule


module FSM_tx_MUX_WIDTH2 ( DATA_VALID, PAR_EN, SER_DONE, CLK, RST, BUSY, 
        SER_EN, mux_sel );
  output [1:0] mux_sel;
  input DATA_VALID, PAR_EN, SER_DONE, CLK, RST;
  output BUSY, SER_EN;
  wire   BUSY_C, n4, n5, n1, n2, n3;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M BUSY_reg ( .D(BUSY_C), .CK(CLK), .RN(RST), .Q(BUSY) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  INVX2M U3 ( .A(mux_sel[1]), .Y(n2) );
  AOI21X2M U4 ( .A0(current_state[1]), .A1(SER_DONE), .B0(mux_sel[0]), .Y(
        SER_EN) );
  NAND2BX2M U5 ( .AN(current_state[2]), .B(current_state[0]), .Y(mux_sel[0])
         );
  NAND2BX2M U6 ( .AN(SER_EN), .B(n5), .Y(next_state[0]) );
  NAND3BX2M U7 ( .AN(current_state[2]), .B(n3), .C(DATA_VALID), .Y(n5) );
  NOR2X2M U8 ( .A(n3), .B(current_state[2]), .Y(mux_sel[1]) );
  OAI21X2M U9 ( .A0(current_state[0]), .A1(n3), .B0(mux_sel[0]), .Y(BUSY_C) );
  OAI21X2M U10 ( .A0(current_state[2]), .A1(n1), .B0(n2), .Y(next_state[1]) );
  NOR2X2M U11 ( .A(n4), .B(n2), .Y(next_state[2]) );
  AOI2B1X1M U12 ( .A1N(PAR_EN), .A0(SER_DONE), .B0(n1), .Y(n4) );
  INVX2M U13 ( .A(current_state[1]), .Y(n3) );
  INVX2M U14 ( .A(current_state[0]), .Y(n1) );
endmodule


module PARITY_CALC_DATA_WIDTH8 ( IN_DATA, DATA_VALID, PAR_TYP, CLK, RST, BUSY, 
        par_bit );
  input [7:0] IN_DATA;
  input DATA_VALID, PAR_TYP, CLK, RST, BUSY;
  output par_bit;
  wire   n1, n2, n3, n4, n5, n6, n7;

  DFFRQX2M par_bit_reg ( .D(n7), .CK(CLK), .RN(RST), .Q(par_bit) );
  XNOR2X2M U2 ( .A(IN_DATA[3]), .B(IN_DATA[2]), .Y(n5) );
  XOR3XLM U3 ( .A(IN_DATA[5]), .B(IN_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(IN_DATA[7]), .B(IN_DATA[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n7) );
  NAND2BX2M U6 ( .AN(BUSY), .B(DATA_VALID), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(IN_DATA[1]), .B(IN_DATA[0]), .C(n5), .Y(n4) );
endmodule


module MUX_MUX_WIDTH2 ( mux_sel, start_bit, stop_bit, ser_data, par_bit, CLK, 
        RST, TX_OUT );
  input [1:0] mux_sel;
  input start_bit, stop_bit, ser_data, par_bit, CLK, RST;
  output TX_OUT;
  wire   N13, n2, n3, n1;

  DFFSQX2M TX_OUT_reg ( .D(N13), .CK(CLK), .SN(RST), .Q(TX_OUT) );
  OAI2B2X1M U3 ( .A1N(mux_sel[1]), .A0(n2), .B0(mux_sel[1]), .B1(n3), .Y(N13)
         );
  AOI22X1M U4 ( .A0(start_bit), .A1(n1), .B0(stop_bit), .B1(mux_sel[0]), .Y(n3) );
  AOI22X1M U5 ( .A0(ser_data), .A1(n1), .B0(par_bit), .B1(mux_sel[0]), .Y(n2)
         );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n1) );
endmodule


module UART_TX_DATA_WIDTH8 ( IN_DATA, DATA_VALID, PAR_EN, PAR_TYP, CLK, RST, 
        TX_OUT, BUSY );
  input [7:0] IN_DATA;
  input DATA_VALID, PAR_EN, PAR_TYP, CLK, RST;
  output TX_OUT, BUSY;
  wire   SER_EN, SER_DONE, ser_data, par_bit, n1, n2;
  wire   [1:0] mux_sel;

  SERIALIZER_DATA_WIDTH8_COUNT3 U1 ( .IN_DATA(IN_DATA), .SER_EN(SER_EN), .CLK(
        CLK), .RST(n1), .BUSY(BUSY), .SER_DONE(SER_DONE), .ser_data(ser_data)
         );
  FSM_tx_MUX_WIDTH2 U2 ( .DATA_VALID(DATA_VALID), .PAR_EN(PAR_EN), .SER_DONE(
        SER_DONE), .CLK(CLK), .RST(n1), .BUSY(BUSY), .SER_EN(SER_EN), 
        .mux_sel(mux_sel) );
  PARITY_CALC_DATA_WIDTH8 U3 ( .IN_DATA(IN_DATA), .DATA_VALID(DATA_VALID), 
        .PAR_TYP(PAR_TYP), .CLK(CLK), .RST(n1), .BUSY(BUSY), .par_bit(par_bit)
         );
  MUX_MUX_WIDTH2 U4 ( .mux_sel(mux_sel), .start_bit(1'b0), .stop_bit(1'b1), 
        .ser_data(ser_data), .par_bit(par_bit), .CLK(CLK), .RST(n1), .TX_OUT(
        TX_OUT) );
  INVX2M U7 ( .A(n2), .Y(n1) );
  INVX2M U8 ( .A(RST), .Y(n2) );
endmodule


module EDGE_BIT_COUNTER ( count_enable, prescale, CLK, RST, edge_cnt, bit_cnt
 );
  input [5:0] prescale;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input count_enable, CLK, RST;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N21, N22, N23, N24, N37, N38,
         N39, N40, N41, N42, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         \add_28/carry[5] , \add_28/carry[4] , \add_28/carry[3] ,
         \add_28/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28;

  DFFRQX2M \bit_cnt_reg[2]  ( .D(n15), .CK(CLK), .RN(RST), .Q(bit_cnt[2]) );
  DFFRQX2M \bit_cnt_reg[1]  ( .D(n16), .CK(CLK), .RN(RST), .Q(bit_cnt[1]) );
  DFFRQX2M \bit_cnt_reg[0]  ( .D(n17), .CK(CLK), .RN(RST), .Q(bit_cnt[0]) );
  DFFRQX2M \bit_cnt_reg[3]  ( .D(n18), .CK(CLK), .RN(RST), .Q(bit_cnt[3]) );
  DFFRQX2M \edge_cnt_reg[5]  ( .D(N42), .CK(CLK), .RN(RST), .Q(edge_cnt[5]) );
  DFFRQX2M \edge_cnt_reg[0]  ( .D(N37), .CK(CLK), .RN(RST), .Q(edge_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[3]  ( .D(N40), .CK(CLK), .RN(RST), .Q(edge_cnt[3]) );
  DFFRQX2M \edge_cnt_reg[2]  ( .D(N39), .CK(CLK), .RN(RST), .Q(edge_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[4]  ( .D(N41), .CK(CLK), .RN(RST), .Q(edge_cnt[4]) );
  DFFRQX2M \edge_cnt_reg[1]  ( .D(N38), .CK(CLK), .RN(RST), .Q(edge_cnt[1]) );
  INVX2M U3 ( .A(count_enable), .Y(n26) );
  INVX2M U4 ( .A(n12), .Y(n25) );
  NOR2X2M U5 ( .A(n26), .B(N14), .Y(n12) );
  NOR2BX2M U6 ( .AN(N21), .B(n25), .Y(N38) );
  NOR2BX2M U7 ( .AN(N22), .B(n25), .Y(N39) );
  NOR2BX2M U8 ( .AN(N23), .B(n25), .Y(N40) );
  NOR2BX2M U9 ( .AN(N24), .B(n25), .Y(N41) );
  OAI32X1M U10 ( .A0(n26), .A1(bit_cnt[0]), .A2(n12), .B0(n27), .B1(n25), .Y(
        n17) );
  OAI22X1M U11 ( .A0(n28), .A1(n25), .B0(n11), .B1(n26), .Y(n16) );
  AOI32X1M U12 ( .A0(n25), .A1(n28), .A2(bit_cnt[0]), .B0(bit_cnt[1]), .B1(n27), .Y(n11) );
  INVX2M U13 ( .A(bit_cnt[1]), .Y(n28) );
  AND3X2M U14 ( .A(N14), .B(bit_cnt[1]), .C(bit_cnt[0]), .Y(n10) );
  NOR2X2M U15 ( .A(edge_cnt[0]), .B(n25), .Y(N37) );
  NOR2X2M U16 ( .A(n1), .B(n25), .Y(N42) );
  XNOR2X2M U17 ( .A(\add_28/carry[5] ), .B(edge_cnt[5]), .Y(n1) );
  NOR2X2M U18 ( .A(n13), .B(n26), .Y(n18) );
  CLKXOR2X2M U19 ( .A(n14), .B(bit_cnt[3]), .Y(n13) );
  NAND2X2M U20 ( .A(n10), .B(bit_cnt[2]), .Y(n14) );
  NOR2X2M U21 ( .A(n9), .B(n26), .Y(n15) );
  XNOR2X2M U22 ( .A(n10), .B(bit_cnt[2]), .Y(n9) );
  ADDHX1M U23 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_28/carry[2] ), .S(
        N21) );
  ADDHX1M U24 ( .A(edge_cnt[2]), .B(\add_28/carry[2] ), .CO(\add_28/carry[3] ), 
        .S(N22) );
  ADDHX1M U25 ( .A(edge_cnt[3]), .B(\add_28/carry[3] ), .CO(\add_28/carry[4] ), 
        .S(N23) );
  ADDHX1M U26 ( .A(edge_cnt[4]), .B(\add_28/carry[4] ), .CO(\add_28/carry[5] ), 
        .S(N24) );
  INVX2M U27 ( .A(bit_cnt[0]), .Y(n27) );
  OR2X2M U28 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  CLKINVX1M U29 ( .A(prescale[0]), .Y(N7) );
  OAI2BB1X1M U30 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(N8) );
  OR2X1M U31 ( .A(n2), .B(prescale[2]), .Y(n3) );
  OAI2BB1X1M U32 ( .A0N(n2), .A1N(prescale[2]), .B0(n3), .Y(N9) );
  OR2X1M U33 ( .A(n3), .B(prescale[3]), .Y(n4) );
  OAI2BB1X1M U34 ( .A0N(n3), .A1N(prescale[3]), .B0(n4), .Y(N10) );
  OR2X1M U35 ( .A(n4), .B(prescale[4]), .Y(n5) );
  OAI2BB1X1M U36 ( .A0N(n4), .A1N(prescale[4]), .B0(n5), .Y(N11) );
  NOR2X1M U37 ( .A(n5), .B(prescale[5]), .Y(N13) );
  AO21XLM U38 ( .A0(n5), .A1(prescale[5]), .B0(N13), .Y(N12) );
  NOR2BX1M U39 ( .AN(N7), .B(edge_cnt[0]), .Y(n6) );
  OAI2B2X1M U40 ( .A1N(edge_cnt[1]), .A0(n6), .B0(N8), .B1(n6), .Y(n20) );
  XNOR2X1M U41 ( .A(N12), .B(edge_cnt[5]), .Y(n19) );
  NOR2BX1M U42 ( .AN(edge_cnt[0]), .B(N7), .Y(n7) );
  OAI2B2X1M U43 ( .A1N(N8), .A0(n7), .B0(edge_cnt[1]), .B1(n7), .Y(n8) );
  NAND4BX1M U44 ( .AN(N13), .B(n20), .C(n19), .D(n8), .Y(n24) );
  CLKXOR2X2M U45 ( .A(N11), .B(edge_cnt[4]), .Y(n23) );
  CLKXOR2X2M U46 ( .A(N9), .B(edge_cnt[2]), .Y(n22) );
  CLKXOR2X2M U47 ( .A(N10), .B(edge_cnt[3]), .Y(n21) );
  NOR4X1M U48 ( .A(n24), .B(n23), .C(n22), .D(n21), .Y(N14) );
endmodule


module DESERIALIZER_DATA_WIDTH8 ( sampled_bit, deser_en, sampled_bit_valid, 
        CLK, RST, P_DATA );
  output [7:0] P_DATA;
  input sampled_bit, deser_en, sampled_bit_valid, CLK, RST;
  wire   n1, n10, n11, n12, n13, n14, n15, n16, n17, n2, n3, n4, n5, n6, n7,
         n8, n9;

  DFFRQX2M \P_DATA_reg[0]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  OAI22X1M U2 ( .A0(n2), .A1(n9), .B0(n1), .B1(n8), .Y(n11) );
  OAI22X1M U3 ( .A0(n2), .A1(n8), .B0(n1), .B1(n7), .Y(n12) );
  OAI22X1M U4 ( .A0(n2), .A1(n7), .B0(n1), .B1(n6), .Y(n13) );
  OAI22X1M U5 ( .A0(n2), .A1(n6), .B0(n1), .B1(n5), .Y(n14) );
  OAI22X1M U6 ( .A0(n2), .A1(n5), .B0(n1), .B1(n4), .Y(n15) );
  OAI22X1M U7 ( .A0(n2), .A1(n4), .B0(n1), .B1(n3), .Y(n16) );
  INVX2M U8 ( .A(n1), .Y(n2) );
  NAND2X2M U9 ( .A(sampled_bit_valid), .B(deser_en), .Y(n1) );
  OAI2BB2X1M U10 ( .B0(n1), .B1(n9), .A0N(P_DATA[0]), .A1N(n1), .Y(n10) );
  OAI2BB2X1M U11 ( .B0(n2), .B1(n3), .A0N(sampled_bit), .A1N(n2), .Y(n17) );
  INVX2M U12 ( .A(P_DATA[2]), .Y(n8) );
  INVX2M U13 ( .A(P_DATA[6]), .Y(n4) );
  INVX2M U14 ( .A(P_DATA[7]), .Y(n3) );
  INVX2M U15 ( .A(P_DATA[3]), .Y(n7) );
  INVX2M U16 ( .A(P_DATA[1]), .Y(n9) );
  INVX2M U17 ( .A(P_DATA[4]), .Y(n6) );
  INVX2M U18 ( .A(P_DATA[5]), .Y(n5) );
endmodule


module START_CHECK ( start_chk_en, sampled_bit_valid, sampled_bit, CLK, RST, 
        start_glitch );
  input start_chk_en, sampled_bit_valid, sampled_bit, CLK, RST;
  output start_glitch;
  wire   n2, n3, n1;

  DFFRQX2M start_glitch_reg ( .D(n3), .CK(CLK), .RN(RST), .Q(start_glitch) );
  NOR2BX2M U3 ( .AN(start_chk_en), .B(n2), .Y(n3) );
  AOI22X1M U4 ( .A0(sampled_bit_valid), .A1(sampled_bit), .B0(start_glitch), 
        .B1(n1), .Y(n2) );
  INVX2M U5 ( .A(sampled_bit_valid), .Y(n1) );
endmodule


module STOP_CHECK ( stop_chk_en, sampled_bit_valid, sampled_bit, CLK, RST, 
        stop_err );
  input stop_chk_en, sampled_bit_valid, sampled_bit, CLK, RST;
  output stop_err;
  wire   n2, n3, n1;

  DFFRQX2M stop_err_reg ( .D(n3), .CK(CLK), .RN(RST), .Q(stop_err) );
  NOR2BX2M U3 ( .AN(stop_chk_en), .B(n2), .Y(n3) );
  AOI2BB2XLM U4 ( .B0(stop_err), .B1(n1), .A0N(sampled_bit), .A1N(n1), .Y(n2)
         );
  INVX2M U5 ( .A(sampled_bit_valid), .Y(n1) );
endmodule


module PAR_CHECK_DATA_WIDTH8 ( par_chk_en, PAR_TYP, sampled_bit_valid, 
        sampled_bit, P_DATA, CLK, RST, par_err );
  input [7:0] P_DATA;
  input par_chk_en, PAR_TYP, sampled_bit_valid, sampled_bit, CLK, RST;
  output par_err;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  DFFRQX2M par_err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_err) );
  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n8) );
  NAND2X2M U3 ( .A(sampled_bit_valid), .B(par_chk_en), .Y(n2) );
  XOR3XLM U4 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  XOR3XLM U5 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U6 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U7 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U8 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  XNOR2X2M U9 ( .A(sampled_bit), .B(PAR_TYP), .Y(n5) );
endmodule


module DATA_SAMPLING ( edge_cnt, data_sampl_en, RX_IN, prescale, CLK, RST, 
        sampled_bit, sampled_bit_valid );
  input [5:0] edge_cnt;
  input [5:0] prescale;
  input data_sampl_en, RX_IN, CLK, RST;
  output sampled_bit, sampled_bit_valid;
  wire   sample_1, sample_2, sample_3, N6, N7, N8, N9, N10, N12, N13, N14, N15,
         N16, N17, N18, N19, N22, N23, N24, N25, N26, N37, n29, n30, n31,
         \add_48/carry[4] , \add_48/carry[3] , \add_48/carry[2] ,
         \sub_33/carry[4] , \sub_33/carry[3] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;
  assign N6 = prescale[1];

  DFFRQX2M sample_3_reg ( .D(n30), .CK(CLK), .RN(RST), .Q(sample_3) );
  DFFRQX2M sample_1_reg ( .D(n29), .CK(CLK), .RN(RST), .Q(sample_1) );
  DFFRQX2M sample_2_reg ( .D(n31), .CK(CLK), .RN(RST), .Q(sample_2) );
  DFFRQX2M sampled_bit_reg ( .D(n52), .CK(CLK), .RN(RST), .Q(sampled_bit) );
  DFFRQX2M sampled_bit_valid_reg ( .D(N37), .CK(CLK), .RN(RST), .Q(
        sampled_bit_valid) );
  NOR2X2M U3 ( .A(prescale[5]), .B(\sub_33/carry[4] ), .Y(n1) );
  OR2X2M U4 ( .A(prescale[2]), .B(N6), .Y(n2) );
  INVX2M U5 ( .A(prescale[2]), .Y(N7) );
  ADDHX1M U6 ( .A(prescale[2]), .B(N6), .CO(\add_48/carry[2] ), .S(N22) );
  ADDHX1M U7 ( .A(prescale[4]), .B(\add_48/carry[3] ), .CO(\add_48/carry[4] ), 
        .S(N24) );
  ADDHX1M U8 ( .A(prescale[3]), .B(\add_48/carry[2] ), .CO(\add_48/carry[3] ), 
        .S(N23) );
  ADDHX1M U9 ( .A(prescale[5]), .B(\add_48/carry[4] ), .CO(N26), .S(N25) );
  XNOR2X1M U10 ( .A(\sub_33/carry[4] ), .B(prescale[5]), .Y(N10) );
  OR2X1M U11 ( .A(prescale[4]), .B(\sub_33/carry[3] ), .Y(\sub_33/carry[4] )
         );
  XNOR2X1M U12 ( .A(\sub_33/carry[3] ), .B(prescale[4]), .Y(N9) );
  OR2X1M U13 ( .A(prescale[3]), .B(prescale[2]), .Y(\sub_33/carry[3] ) );
  XNOR2X1M U14 ( .A(prescale[2]), .B(prescale[3]), .Y(N8) );
  CLKINVX1M U15 ( .A(N6), .Y(N13) );
  OAI2BB1X1M U16 ( .A0N(N6), .A1N(prescale[2]), .B0(n2), .Y(N14) );
  OR2X1M U17 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U18 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N15) );
  XNOR2X1M U19 ( .A(prescale[4]), .B(n3), .Y(N16) );
  NOR3X1M U20 ( .A(prescale[4]), .B(prescale[5]), .C(n3), .Y(N18) );
  OAI21X1M U21 ( .A0(prescale[4]), .A1(n3), .B0(prescale[5]), .Y(n4) );
  NAND2BX1M U22 ( .AN(N18), .B(n4), .Y(N17) );
  NOR2BX1M U23 ( .AN(edge_cnt[0]), .B(N6), .Y(n5) );
  OAI2B2X1M U24 ( .A1N(N7), .A0(n5), .B0(edge_cnt[1]), .B1(n5), .Y(n8) );
  NOR2BX1M U25 ( .AN(N6), .B(edge_cnt[0]), .Y(n6) );
  OAI2B2X1M U26 ( .A1N(edge_cnt[1]), .A0(n6), .B0(N7), .B1(n6), .Y(n7) );
  NAND4BBX1M U27 ( .AN(n1), .BN(edge_cnt[5]), .C(n8), .D(n7), .Y(n12) );
  CLKXOR2X2M U28 ( .A(N10), .B(edge_cnt[4]), .Y(n11) );
  CLKXOR2X2M U29 ( .A(N8), .B(edge_cnt[2]), .Y(n10) );
  CLKXOR2X2M U30 ( .A(N9), .B(edge_cnt[3]), .Y(n9) );
  NOR4X1M U31 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(N12) );
  NOR2BX1M U32 ( .AN(edge_cnt[0]), .B(N13), .Y(n13) );
  OAI2B2X1M U33 ( .A1N(N14), .A0(n13), .B0(edge_cnt[1]), .B1(n13), .Y(n16) );
  NOR2BX1M U34 ( .AN(N13), .B(edge_cnt[0]), .Y(n14) );
  OAI2B2X1M U35 ( .A1N(edge_cnt[1]), .A0(n14), .B0(N14), .B1(n14), .Y(n15) );
  NAND4BBX1M U36 ( .AN(N18), .BN(edge_cnt[5]), .C(n16), .D(n15), .Y(n20) );
  CLKXOR2X2M U37 ( .A(N17), .B(edge_cnt[4]), .Y(n19) );
  CLKXOR2X2M U38 ( .A(N15), .B(edge_cnt[2]), .Y(n18) );
  CLKXOR2X2M U39 ( .A(N16), .B(edge_cnt[3]), .Y(n17) );
  NOR4X1M U40 ( .A(n20), .B(n19), .C(n18), .D(n17), .Y(N19) );
  OAI32X1M U41 ( .A0(n21), .A1(n22), .A2(n23), .B0(n24), .B1(n25), .Y(n52) );
  AOI21X1M U42 ( .A0(sample_2), .A1(sample_1), .B0(n26), .Y(n24) );
  AOI2BB1X1M U43 ( .A0N(sample_2), .A1N(sample_1), .B0(n27), .Y(n26) );
  CLKINVX1M U44 ( .A(sampled_bit), .Y(n21) );
  MXI2X1M U45 ( .A(n28), .B(n32), .S0(n33), .Y(n31) );
  NOR2BX1M U46 ( .AN(N19), .B(N12), .Y(n33) );
  CLKNAND2X2M U47 ( .A(sample_2), .B(data_sampl_en), .Y(n28) );
  MXI2X1M U48 ( .A(n32), .B(n27), .S0(n34), .Y(n30) );
  AOI21X1M U49 ( .A0(n35), .A1(n36), .B0(n23), .Y(n34) );
  CLKINVX1M U50 ( .A(data_sampl_en), .Y(n23) );
  CLKINVX1M U51 ( .A(sample_3), .Y(n27) );
  MXI2X1M U52 ( .A(n37), .B(n32), .S0(N12), .Y(n29) );
  CLKNAND2X2M U53 ( .A(RX_IN), .B(data_sampl_en), .Y(n32) );
  CLKNAND2X2M U54 ( .A(sample_1), .B(data_sampl_en), .Y(n37) );
  CLKINVX1M U55 ( .A(n25), .Y(N37) );
  CLKNAND2X2M U56 ( .A(n22), .B(data_sampl_en), .Y(n25) );
  AND2X1M U57 ( .A(n38), .B(n39), .Y(n22) );
  NOR4BX1M U58 ( .AN(n36), .B(n35), .C(n40), .D(n41), .Y(n39) );
  CLKXOR2X2M U59 ( .A(edge_cnt[1]), .B(N22), .Y(n41) );
  CLKXOR2X2M U60 ( .A(edge_cnt[0]), .B(N13), .Y(n40) );
  AND4X1M U61 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n35) );
  NOR3X1M U62 ( .A(n46), .B(edge_cnt[5]), .C(n47), .Y(n45) );
  CLKXOR2X2M U63 ( .A(N6), .B(edge_cnt[0]), .Y(n47) );
  CLKXOR2X2M U64 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n46) );
  XNOR2X1M U65 ( .A(edge_cnt[2]), .B(prescale[3]), .Y(n44) );
  XNOR2X1M U66 ( .A(edge_cnt[3]), .B(prescale[4]), .Y(n43) );
  XNOR2X1M U67 ( .A(edge_cnt[1]), .B(prescale[2]), .Y(n42) );
  NOR2X1M U68 ( .A(N19), .B(N12), .Y(n36) );
  NOR4X1M U69 ( .A(n48), .B(n49), .C(n50), .D(n51), .Y(n38) );
  CLKXOR2X2M U70 ( .A(edge_cnt[5]), .B(N26), .Y(n51) );
  CLKXOR2X2M U71 ( .A(edge_cnt[4]), .B(N25), .Y(n50) );
  CLKXOR2X2M U72 ( .A(edge_cnt[3]), .B(N24), .Y(n49) );
  CLKXOR2X2M U73 ( .A(edge_cnt[2]), .B(N23), .Y(n48) );
endmodule


module FSM ( PAR_EN, RX_IN, edge_cnt, bit_cnt, prescale, start_glitch, 
        stop_err, par_err, CLK, RST, DATA_VALID, count_enable, deser_en, 
        stop_chk_en, start_chk_en, par_chk_en, data_sampl_en );
  input [5:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] prescale;
  input PAR_EN, RX_IN, start_glitch, stop_err, par_err, CLK, RST;
  output DATA_VALID, count_enable, deser_en, stop_chk_en, start_chk_en,
         par_chk_en, data_sampl_en;
  wire   N40, N41, N42, N43, N44, N45, N46, N47, N76, N77, N78, N79, N80, N81,
         N83, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, \r77/carry[5] , \r77/carry[4] , \r77/carry[3] , n1, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign N76 = prescale[0];

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]), .QN(n42) );
  NOR2X2M U3 ( .A(prescale[5]), .B(\r77/carry[5] ), .Y(n1) );
  NOR2X2M U4 ( .A(n41), .B(n45), .Y(deser_en) );
  NOR3X2M U5 ( .A(n44), .B(n45), .C(n42), .Y(n39) );
  NOR2X2M U6 ( .A(n44), .B(n43), .Y(stop_chk_en) );
  INVX2M U7 ( .A(n28), .Y(n43) );
  INVX2M U8 ( .A(n31), .Y(n41) );
  OAI211X2M U9 ( .A0(RX_IN), .A1(n33), .B0(n34), .C0(n35), .Y(next_state[0])
         );
  AOI31X2M U10 ( .A0(n45), .A1(n44), .A2(n42), .B0(n39), .Y(n33) );
  NAND4X2M U11 ( .A(N83), .B(stop_chk_en), .C(n37), .D(bit_cnt[3]), .Y(n34) );
  AOI22X1M U12 ( .A0(deser_en), .A1(n25), .B0(start_chk_en), .B1(n36), .Y(n35)
         );
  NOR3BX2M U13 ( .AN(N47), .B(bit_cnt[1]), .C(bit_cnt[2]), .Y(n27) );
  OAI31X1M U14 ( .A0(n40), .A1(PAR_EN), .A2(n25), .B0(n26), .Y(next_state[2])
         );
  INVX2M U15 ( .A(deser_en), .Y(n40) );
  AOI31X2M U16 ( .A0(n27), .A1(n28), .A2(n29), .B0(stop_chk_en), .Y(n26) );
  NOR2X2M U17 ( .A(n46), .B(n48), .Y(n29) );
  NAND4X2M U18 ( .A(start_glitch), .B(n27), .C(n46), .D(n48), .Y(n36) );
  NAND3X2M U19 ( .A(n27), .B(n46), .C(bit_cnt[3]), .Y(n25) );
  OAI211X2M U20 ( .A0(current_state[2]), .A1(n45), .B0(n30), .C0(n43), .Y(
        next_state[1]) );
  NAND3X2M U21 ( .A(n27), .B(n31), .C(n32), .Y(n30) );
  NOR3X2M U22 ( .A(bit_cnt[0]), .B(start_glitch), .C(bit_cnt[3]), .Y(n32) );
  NOR2X2M U23 ( .A(n42), .B(current_state[2]), .Y(n31) );
  NOR2X2M U24 ( .A(current_state[2]), .B(n43), .Y(par_chk_en) );
  NOR2X2M U25 ( .A(n45), .B(current_state[0]), .Y(n28) );
  NOR2X2M U26 ( .A(bit_cnt[2]), .B(n38), .Y(n37) );
  AOI33X2M U27 ( .A0(n49), .A1(n47), .A2(bit_cnt[0]), .B0(PAR_EN), .B1(n46), 
        .B2(bit_cnt[1]), .Y(n38) );
  INVX2M U28 ( .A(PAR_EN), .Y(n49) );
  INVX2M U29 ( .A(bit_cnt[1]), .Y(n47) );
  NOR2X2M U30 ( .A(n41), .B(current_state[1]), .Y(start_chk_en) );
  INVX2M U31 ( .A(bit_cnt[0]), .Y(n46) );
  INVX2M U32 ( .A(current_state[1]), .Y(n45) );
  INVX2M U33 ( .A(bit_cnt[3]), .Y(n48) );
  INVX2M U34 ( .A(current_state[2]), .Y(n44) );
  NOR3BX2M U35 ( .AN(n39), .B(stop_err), .C(par_err), .Y(DATA_VALID) );
  OR2X2M U36 ( .A(prescale[1]), .B(N76), .Y(n3) );
  INVX2M U37 ( .A(prescale[1]), .Y(N77) );
  BUFX2M U38 ( .A(count_enable), .Y(data_sampl_en) );
  NAND2X2M U39 ( .A(n43), .B(n41), .Y(count_enable) );
  XNOR2X1M U40 ( .A(\r77/carry[5] ), .B(prescale[5]), .Y(N81) );
  OR2X1M U41 ( .A(prescale[4]), .B(\r77/carry[4] ), .Y(\r77/carry[5] ) );
  XNOR2X1M U42 ( .A(\r77/carry[4] ), .B(prescale[4]), .Y(N80) );
  OR2X1M U43 ( .A(prescale[3]), .B(\r77/carry[3] ), .Y(\r77/carry[4] ) );
  XNOR2X1M U44 ( .A(\r77/carry[3] ), .B(prescale[3]), .Y(N79) );
  OR2X1M U45 ( .A(prescale[2]), .B(prescale[1]), .Y(\r77/carry[3] ) );
  XNOR2X1M U46 ( .A(prescale[1]), .B(prescale[2]), .Y(N78) );
  CLKINVX1M U47 ( .A(N76), .Y(N40) );
  OAI2BB1X1M U48 ( .A0N(N76), .A1N(prescale[1]), .B0(n3), .Y(N41) );
  OR2X1M U49 ( .A(n3), .B(prescale[2]), .Y(n4) );
  OAI2BB1X1M U50 ( .A0N(n3), .A1N(prescale[2]), .B0(n4), .Y(N42) );
  OR2X1M U51 ( .A(n4), .B(prescale[3]), .Y(n5) );
  OAI2BB1X1M U52 ( .A0N(n4), .A1N(prescale[3]), .B0(n5), .Y(N43) );
  OR2X1M U53 ( .A(n5), .B(prescale[4]), .Y(n6) );
  OAI2BB1X1M U54 ( .A0N(n5), .A1N(prescale[4]), .B0(n6), .Y(N44) );
  NOR2X1M U55 ( .A(n6), .B(prescale[5]), .Y(N46) );
  AO21XLM U56 ( .A0(n6), .A1(prescale[5]), .B0(N46), .Y(N45) );
  NOR2BX1M U57 ( .AN(N40), .B(edge_cnt[0]), .Y(n7) );
  OAI2B2X1M U58 ( .A1N(edge_cnt[1]), .A0(n7), .B0(N41), .B1(n7), .Y(n11) );
  XNOR2X1M U59 ( .A(N45), .B(edge_cnt[5]), .Y(n10) );
  NOR2BX1M U60 ( .AN(edge_cnt[0]), .B(N40), .Y(n8) );
  OAI2B2X1M U61 ( .A1N(N41), .A0(n8), .B0(edge_cnt[1]), .B1(n8), .Y(n9) );
  NAND4BX1M U62 ( .AN(N46), .B(n11), .C(n10), .D(n9), .Y(n15) );
  CLKXOR2X2M U63 ( .A(N44), .B(edge_cnt[4]), .Y(n14) );
  CLKXOR2X2M U64 ( .A(N42), .B(edge_cnt[2]), .Y(n13) );
  CLKXOR2X2M U65 ( .A(N43), .B(edge_cnt[3]), .Y(n12) );
  NOR4X1M U66 ( .A(n15), .B(n14), .C(n13), .D(n12), .Y(N47) );
  NOR2BX1M U67 ( .AN(N76), .B(edge_cnt[0]), .Y(n16) );
  OAI2B2X1M U68 ( .A1N(edge_cnt[1]), .A0(n16), .B0(N77), .B1(n16), .Y(n20) );
  XNOR2X1M U69 ( .A(N81), .B(edge_cnt[5]), .Y(n19) );
  NOR2BX1M U70 ( .AN(edge_cnt[0]), .B(N76), .Y(n17) );
  OAI2B2X1M U71 ( .A1N(N77), .A0(n17), .B0(edge_cnt[1]), .B1(n17), .Y(n18) );
  NAND4BX1M U72 ( .AN(n1), .B(n20), .C(n19), .D(n18), .Y(n24) );
  CLKXOR2X2M U73 ( .A(N80), .B(edge_cnt[4]), .Y(n23) );
  CLKXOR2X2M U74 ( .A(N78), .B(edge_cnt[2]), .Y(n22) );
  CLKXOR2X2M U75 ( .A(N79), .B(edge_cnt[3]), .Y(n21) );
  NOR4X1M U76 ( .A(n24), .B(n23), .C(n22), .D(n21), .Y(N83) );
endmodule


module UART_RX_DATA_WIDTH8 ( RX_IN, PAR_EN, PAR_TYP, prescale, CLK, RST, 
        DATA_VALID, par_err, stop_err, P_DATA );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYP, CLK, RST;
  output DATA_VALID, par_err, stop_err;
  wire   count_enable, sampled_bit, deser_en, sampled_bit_valid, start_chk_en,
         start_glitch, stop_chk_en, par_chk_en, data_sampl_en, n1, n2;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;

  EDGE_BIT_COUNTER U1 ( .count_enable(count_enable), .prescale(prescale), 
        .CLK(CLK), .RST(n1), .edge_cnt(edge_cnt), .bit_cnt(bit_cnt) );
  DESERIALIZER_DATA_WIDTH8 U2 ( .sampled_bit(sampled_bit), .deser_en(deser_en), 
        .sampled_bit_valid(sampled_bit_valid), .CLK(CLK), .RST(n1), .P_DATA(
        P_DATA) );
  START_CHECK U3 ( .start_chk_en(start_chk_en), .sampled_bit_valid(
        sampled_bit_valid), .sampled_bit(sampled_bit), .CLK(CLK), .RST(n1), 
        .start_glitch(start_glitch) );
  STOP_CHECK U4 ( .stop_chk_en(stop_chk_en), .sampled_bit_valid(
        sampled_bit_valid), .sampled_bit(sampled_bit), .CLK(CLK), .RST(n1), 
        .stop_err(stop_err) );
  PAR_CHECK_DATA_WIDTH8 U5 ( .par_chk_en(par_chk_en), .PAR_TYP(PAR_TYP), 
        .sampled_bit_valid(sampled_bit_valid), .sampled_bit(sampled_bit), 
        .P_DATA(P_DATA), .CLK(CLK), .RST(n1), .par_err(par_err) );
  DATA_SAMPLING U6 ( .edge_cnt(edge_cnt), .data_sampl_en(data_sampl_en), 
        .RX_IN(RX_IN), .prescale(prescale), .CLK(CLK), .RST(n1), .sampled_bit(
        sampled_bit), .sampled_bit_valid(sampled_bit_valid) );
  FSM U7 ( .PAR_EN(PAR_EN), .RX_IN(RX_IN), .edge_cnt(edge_cnt), .bit_cnt(
        bit_cnt), .prescale(prescale), .start_glitch(start_glitch), .stop_err(
        stop_err), .par_err(par_err), .CLK(CLK), .RST(n1), .DATA_VALID(
        DATA_VALID), .count_enable(count_enable), .deser_en(deser_en), 
        .stop_chk_en(stop_chk_en), .start_chk_en(start_chk_en), .par_chk_en(
        par_chk_en), .data_sampl_en(data_sampl_en) );
  INVX2M U8 ( .A(n2), .Y(n1) );
  INVX2M U9 ( .A(RST), .Y(n2) );
endmodule


module UART_TOP ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;
  wire   n1, n2;

  UART_TX_DATA_WIDTH8 U_UART_TX ( .IN_DATA(TX_IN_P), .DATA_VALID(TX_IN_V), 
        .PAR_EN(parity_enable), .PAR_TYP(parity_type), .CLK(TX_CLK), .RST(n1), 
        .TX_OUT(TX_OUT_S), .BUSY(TX_OUT_V) );
  UART_RX_DATA_WIDTH8 U_UART_RX ( .RX_IN(RX_IN_S), .PAR_EN(parity_enable), 
        .PAR_TYP(parity_type), .prescale(Prescale), .CLK(RX_CLK), .RST(n1), 
        .DATA_VALID(RX_OUT_V), .par_err(parity_error), .stop_err(framing_error), .P_DATA(RX_OUT_P) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module SYS_CTRL ( CLK, RST, ALU_OUT, ALU_OUT_VALID, RF_RdData, RF_RdData_VALID, 
        UART_IN_DATA, UART_IN_VALID, FULL_FLAG, ALU_EN, ALU_FUN, RF_WrEn, 
        RF_RdEn, RF_Addres, RF_WrData, TX_P_DATA, TX_D_VALID, CLK_GATE_EN, 
        CLK_DIV_EN );
  input [15:0] ALU_OUT;
  input [7:0] RF_RdData;
  input [7:0] UART_IN_DATA;
  output [3:0] ALU_FUN;
  output [3:0] RF_Addres;
  output [7:0] RF_WrData;
  output [7:0] TX_P_DATA;
  input CLK, RST, ALU_OUT_VALID, RF_RdData_VALID, UART_IN_VALID, FULL_FLAG;
  output ALU_EN, RF_WrEn, RF_RdEn, TX_D_VALID, CLK_GATE_EN, CLK_DIV_EN;
  wire   n13, n14, n15, n16, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n17, n18, n19, n20, n21, n22, n80, n81, n82, n83, n84;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  wire   [7:0] STORE_2ND_BYTE_OF_ALU_OUT;

  DFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[7]  ( .D(n75), .CK(CLK), .RN(RST), 
        .Q(STORE_2ND_BYTE_OF_ALU_OUT[7]) );
  DFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[6]  ( .D(n74), .CK(CLK), .RN(RST), 
        .Q(STORE_2ND_BYTE_OF_ALU_OUT[6]) );
  DFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[5]  ( .D(n73), .CK(CLK), .RN(RST), 
        .Q(STORE_2ND_BYTE_OF_ALU_OUT[5]) );
  DFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[4]  ( .D(n72), .CK(CLK), .RN(RST), 
        .Q(STORE_2ND_BYTE_OF_ALU_OUT[4]) );
  DFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[3]  ( .D(n71), .CK(CLK), .RN(RST), 
        .Q(STORE_2ND_BYTE_OF_ALU_OUT[3]) );
  DFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[2]  ( .D(n70), .CK(CLK), .RN(RST), 
        .Q(STORE_2ND_BYTE_OF_ALU_OUT[2]) );
  DFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[1]  ( .D(n69), .CK(CLK), .RN(RST), 
        .Q(STORE_2ND_BYTE_OF_ALU_OUT[1]) );
  DFFRQX2M \STORE_2ND_BYTE_OF_ALU_OUT_reg[0]  ( .D(n68), .CK(CLK), .RN(RST), 
        .Q(STORE_2ND_BYTE_OF_ALU_OUT[0]) );
  DFFRX1M \STORE_ADDRESS_DATA_reg[0]  ( .D(n76), .CK(CLK), .RN(RST), .QN(n16)
         );
  DFFRX1M \STORE_ADDRESS_DATA_reg[2]  ( .D(n78), .CK(CLK), .RN(RST), .QN(n14)
         );
  DFFRX1M \STORE_ADDRESS_DATA_reg[3]  ( .D(n79), .CK(CLK), .RN(RST), .QN(n13)
         );
  DFFRX1M \STORE_ADDRESS_DATA_reg[1]  ( .D(n77), .CK(CLK), .RN(RST), .QN(n15)
         );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(RST), .Q(
        current_state[3]) );
  INVX2M U3 ( .A(1'b0), .Y(CLK_DIV_EN) );
  NOR2X2M U5 ( .A(n67), .B(n60), .Y(ALU_FUN[2]) );
  NOR2X2M U6 ( .A(n67), .B(n62), .Y(ALU_FUN[0]) );
  OAI22X2M U7 ( .A0(n28), .A1(n60), .B0(n14), .B1(n65), .Y(RF_Addres[2]) );
  INVX2M U8 ( .A(RF_WrEn), .Y(n7) );
  INVX2M U9 ( .A(n27), .Y(n9) );
  NOR3BX2M U10 ( .AN(n63), .B(n64), .C(n39), .Y(n59) );
  NOR2X2M U11 ( .A(n21), .B(n4), .Y(n66) );
  NOR3X2M U12 ( .A(n8), .B(n3), .C(n19), .Y(n64) );
  NOR2X2M U13 ( .A(n67), .B(n61), .Y(ALU_FUN[1]) );
  NOR2X2M U14 ( .A(n84), .B(n59), .Y(RF_WrEn) );
  NAND3X2M U15 ( .A(n20), .B(n17), .C(n66), .Y(n67) );
  NOR3X2M U16 ( .A(n4), .B(n3), .C(n19), .Y(n39) );
  INVX2M U17 ( .A(n3), .Y(n17) );
  INVX2M U18 ( .A(n4), .Y(n8) );
  INVX2M U19 ( .A(n56), .Y(n19) );
  OR3X2M U20 ( .A(n48), .B(n5), .C(n47), .Y(TX_D_VALID) );
  NOR2X2M U21 ( .A(n58), .B(FULL_FLAG), .Y(n48) );
  NOR2X2M U22 ( .A(n59), .B(n62), .Y(RF_WrData[0]) );
  NOR2X2M U23 ( .A(n59), .B(n61), .Y(RF_WrData[1]) );
  NOR2X2M U24 ( .A(n59), .B(n60), .Y(RF_WrData[2]) );
  NOR2XLM U25 ( .A(n59), .B(n43), .Y(RF_WrData[3]) );
  NOR2X2M U26 ( .A(n81), .B(n7), .Y(RF_WrData[4]) );
  NOR2X2M U27 ( .A(n82), .B(n7), .Y(RF_WrData[6]) );
  NOR2X2M U28 ( .A(n83), .B(n7), .Y(RF_WrData[7]) );
  NOR2X2M U29 ( .A(n67), .B(n84), .Y(ALU_EN) );
  NAND4X2M U30 ( .A(n3), .B(n8), .C(n20), .D(n21), .Y(n28) );
  NOR2X2M U31 ( .A(n28), .B(n84), .Y(RF_RdEn) );
  NAND3X2M U32 ( .A(n66), .B(n20), .C(n3), .Y(n27) );
  NOR2X2M U33 ( .A(n43), .B(n67), .Y(ALU_FUN[3]) );
  INVX2M U34 ( .A(n5), .Y(n6) );
  INVX2M U35 ( .A(n25), .Y(n12) );
  INVX2M U36 ( .A(n32), .Y(n11) );
  OAI21X2M U37 ( .A0(n84), .A1(n20), .B0(n21), .Y(n26) );
  INVX2M U38 ( .A(n33), .Y(n10) );
  NAND3X2M U39 ( .A(n67), .B(n27), .C(n58), .Y(CLK_GATE_EN) );
  OAI22X4M U40 ( .A0(n43), .A1(n28), .B0(n13), .B1(n65), .Y(RF_Addres[3]) );
  OAI22X1M U41 ( .A0(n28), .A1(n61), .B0(n15), .B1(n65), .Y(RF_Addres[1]) );
  NOR2X2M U42 ( .A(n20), .B(current_state[3]), .Y(n56) );
  NAND2X2M U43 ( .A(n64), .B(UART_IN_VALID), .Y(n65) );
  INVX2M U44 ( .A(current_state[1]), .Y(n20) );
  AND3X2M U45 ( .A(n56), .B(RF_RdData_VALID), .C(n57), .Y(n47) );
  NOR3X2M U46 ( .A(n17), .B(n4), .C(FULL_FLAG), .Y(n57) );
  INVX2M U47 ( .A(current_state[3]), .Y(n21) );
  BUFX2M U48 ( .A(current_state[2]), .Y(n3) );
  BUFX2M U49 ( .A(current_state[0]), .Y(n4) );
  NAND3X2M U50 ( .A(n66), .B(n17), .C(current_state[1]), .Y(n63) );
  BUFX2M U51 ( .A(n44), .Y(n5) );
  NOR3BX2M U52 ( .AN(ALU_OUT_VALID), .B(FULL_FLAG), .C(n27), .Y(n44) );
  OAI222X1M U53 ( .A0(n84), .A1(n63), .B0(n16), .B1(n65), .C0(n28), .C1(n62), 
        .Y(RF_Addres[0]) );
  NOR4BX1M U54 ( .AN(n42), .B(n3), .C(current_state[3]), .D(current_state[1]), 
        .Y(n40) );
  NOR3X2M U55 ( .A(n83), .B(n4), .C(n43), .Y(n42) );
  OAI33X2M U56 ( .A0(n26), .A1(n3), .A2(n8), .B0(n41), .B1(UART_IN_DATA[0]), 
        .B2(n32), .Y(next_state[0]) );
  NAND3X2M U57 ( .A(n81), .B(n82), .C(n80), .Y(n41) );
  OAI31X1M U58 ( .A0(n18), .A1(n3), .A2(n4), .B0(n23), .Y(next_state[3]) );
  INVX2M U59 ( .A(n26), .Y(n18) );
  AOI31X2M U60 ( .A0(UART_IN_DATA[4]), .A1(UART_IN_DATA[0]), .A2(n24), .B0(n9), 
        .Y(n23) );
  NOR3X2M U61 ( .A(n25), .B(UART_IN_DATA[5]), .C(UART_IN_DATA[1]), .Y(n24) );
  NOR2BX2M U62 ( .AN(UART_IN_DATA[5]), .B(n7), .Y(RF_WrData[5]) );
  NAND2X2M U63 ( .A(UART_IN_VALID), .B(UART_IN_DATA[3]), .Y(n43) );
  NAND3X2M U64 ( .A(UART_IN_DATA[2]), .B(n40), .C(UART_IN_DATA[6]), .Y(n25) );
  NAND2X2M U65 ( .A(UART_IN_DATA[1]), .B(UART_IN_VALID), .Y(n61) );
  NAND2X2M U66 ( .A(UART_IN_DATA[2]), .B(UART_IN_VALID), .Y(n60) );
  INVX2M U67 ( .A(UART_IN_VALID), .Y(n84) );
  NAND2X2M U68 ( .A(UART_IN_DATA[0]), .B(UART_IN_VALID), .Y(n62) );
  NAND3X2M U69 ( .A(UART_IN_DATA[1]), .B(n40), .C(UART_IN_DATA[5]), .Y(n32) );
  OAI2BB1X2M U70 ( .A0N(ALU_OUT[0]), .A1N(n5), .B0(n55), .Y(TX_P_DATA[0]) );
  AOI22X1M U71 ( .A0(RF_RdData[0]), .A1(n47), .B0(n48), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[0]), .Y(n55) );
  OAI2BB1X2M U72 ( .A0N(ALU_OUT[1]), .A1N(n5), .B0(n54), .Y(TX_P_DATA[1]) );
  AOI22X1M U73 ( .A0(RF_RdData[1]), .A1(n47), .B0(n48), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[1]), .Y(n54) );
  OAI2BB1X2M U74 ( .A0N(ALU_OUT[2]), .A1N(n5), .B0(n53), .Y(TX_P_DATA[2]) );
  AOI22X1M U75 ( .A0(RF_RdData[2]), .A1(n47), .B0(n48), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[2]), .Y(n53) );
  OAI2BB1X2M U76 ( .A0N(ALU_OUT[3]), .A1N(n5), .B0(n52), .Y(TX_P_DATA[3]) );
  AOI22X1M U77 ( .A0(RF_RdData[3]), .A1(n47), .B0(n48), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[3]), .Y(n52) );
  OAI2BB1X2M U78 ( .A0N(ALU_OUT[4]), .A1N(n5), .B0(n51), .Y(TX_P_DATA[4]) );
  AOI22X1M U79 ( .A0(RF_RdData[4]), .A1(n47), .B0(n48), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[4]), .Y(n51) );
  OAI2BB1X2M U80 ( .A0N(ALU_OUT[5]), .A1N(n5), .B0(n50), .Y(TX_P_DATA[5]) );
  AOI22X1M U81 ( .A0(RF_RdData[5]), .A1(n47), .B0(n48), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[5]), .Y(n50) );
  OAI2BB1X2M U82 ( .A0N(ALU_OUT[6]), .A1N(n5), .B0(n49), .Y(TX_P_DATA[6]) );
  AOI22X1M U83 ( .A0(RF_RdData[6]), .A1(n47), .B0(n48), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[6]), .Y(n49) );
  OAI2BB1X2M U84 ( .A0N(ALU_OUT[7]), .A1N(n5), .B0(n46), .Y(TX_P_DATA[7]) );
  AOI22X1M U85 ( .A0(RF_RdData[7]), .A1(n47), .B0(n48), .B1(
        STORE_2ND_BYTE_OF_ALU_OUT[7]), .Y(n46) );
  NAND3X2M U86 ( .A(n3), .B(n66), .C(current_state[1]), .Y(n58) );
  NAND4BX1M U87 ( .AN(ALU_EN), .B(n27), .C(n28), .D(n29), .Y(next_state[2]) );
  AOI31X2M U88 ( .A0(n11), .A1(UART_IN_DATA[4]), .A2(n30), .B0(n31), .Y(n29)
         );
  NOR3X2M U89 ( .A(n22), .B(UART_IN_DATA[6]), .C(UART_IN_DATA[2]), .Y(n30) );
  NOR4X1M U90 ( .A(current_state[3]), .B(n4), .C(RF_RdData_VALID), .D(n17), 
        .Y(n31) );
  NAND4BX1M U91 ( .AN(RF_RdEn), .B(n33), .C(n34), .D(n35), .Y(next_state[1])
         );
  AOI21X2M U92 ( .A0(ALU_OUT_VALID), .A1(n9), .B0(n36), .Y(n35) );
  AOI31X2M U93 ( .A0(n12), .A1(n22), .A2(n38), .B0(n39), .Y(n34) );
  OAI33X2M U94 ( .A0(n19), .A1(n4), .A2(RF_RdData_VALID), .B0(n37), .B1(n3), 
        .B2(UART_IN_VALID), .Y(n36) );
  AO22X1M U95 ( .A0(n6), .A1(STORE_2ND_BYTE_OF_ALU_OUT[0]), .B0(ALU_OUT[8]), 
        .B1(n5), .Y(n68) );
  AO22X1M U96 ( .A0(n6), .A1(STORE_2ND_BYTE_OF_ALU_OUT[1]), .B0(ALU_OUT[9]), 
        .B1(n5), .Y(n69) );
  AO22X1M U97 ( .A0(n6), .A1(STORE_2ND_BYTE_OF_ALU_OUT[2]), .B0(ALU_OUT[10]), 
        .B1(n5), .Y(n70) );
  AO22X1M U98 ( .A0(n6), .A1(STORE_2ND_BYTE_OF_ALU_OUT[3]), .B0(ALU_OUT[11]), 
        .B1(n5), .Y(n71) );
  AO22X1M U99 ( .A0(n6), .A1(STORE_2ND_BYTE_OF_ALU_OUT[4]), .B0(ALU_OUT[12]), 
        .B1(n5), .Y(n72) );
  AO22X1M U100 ( .A0(n6), .A1(STORE_2ND_BYTE_OF_ALU_OUT[5]), .B0(ALU_OUT[13]), 
        .B1(n5), .Y(n73) );
  AO22X1M U101 ( .A0(n6), .A1(STORE_2ND_BYTE_OF_ALU_OUT[6]), .B0(ALU_OUT[14]), 
        .B1(n5), .Y(n74) );
  AO22X1M U102 ( .A0(n6), .A1(STORE_2ND_BYTE_OF_ALU_OUT[7]), .B0(ALU_OUT[15]), 
        .B1(n5), .Y(n75) );
  NAND4X2M U103 ( .A(n4), .B(UART_IN_VALID), .C(n45), .D(n20), .Y(n33) );
  NOR2X2M U104 ( .A(current_state[3]), .B(n3), .Y(n45) );
  OAI22X1M U105 ( .A0(n22), .A1(n33), .B0(n10), .B1(n16), .Y(n76) );
  OAI22X1M U106 ( .A0(n80), .A1(n33), .B0(n10), .B1(n14), .Y(n78) );
  NOR3X2M U107 ( .A(UART_IN_DATA[1]), .B(UART_IN_DATA[5]), .C(UART_IN_DATA[4]), 
        .Y(n38) );
  OAI21X2M U108 ( .A0(n21), .A1(n8), .B0(current_state[1]), .Y(n37) );
  OAI2BB2X1M U109 ( .B0(n10), .B1(n15), .A0N(UART_IN_DATA[1]), .A1N(n10), .Y(
        n77) );
  OAI2BB2X1M U110 ( .B0(n10), .B1(n13), .A0N(UART_IN_DATA[3]), .A1N(n10), .Y(
        n79) );
  INVX2M U111 ( .A(UART_IN_DATA[2]), .Y(n80) );
  INVX2M U112 ( .A(UART_IN_DATA[6]), .Y(n82) );
  INVX2M U113 ( .A(UART_IN_DATA[0]), .Y(n22) );
  INVX2M U114 ( .A(UART_IN_DATA[4]), .Y(n81) );
  INVX2M U115 ( .A(UART_IN_DATA[7]), .Y(n83) );
endmodule


module RegFile ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, RdData_VLD, 
        OP_A, OP_B, UART_CONFIG, DIV_RATIO );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] OP_A;
  output [7:0] OP_B;
  output [7:0] UART_CONFIG;
  output [7:0] DIV_RATIO;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
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
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M \regArr_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n213), .Q(
        \regArr[13][7] ) );
  DFFRQX2M \regArr_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n213), .Q(
        \regArr[13][6] ) );
  DFFRQX2M \regArr_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n212), .Q(
        \regArr[13][5] ) );
  DFFRQX2M \regArr_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n212), .Q(
        \regArr[13][4] ) );
  DFFRQX2M \regArr_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n212), .Q(
        \regArr[13][3] ) );
  DFFRQX2M \regArr_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n212), .Q(
        \regArr[13][2] ) );
  DFFRQX2M \regArr_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n212), .Q(
        \regArr[13][1] ) );
  DFFRQX2M \regArr_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n212), .Q(
        \regArr[13][0] ) );
  DFFRQX2M \regArr_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n210), .Q(
        \regArr[9][7] ) );
  DFFRQX2M \regArr_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n210), .Q(
        \regArr[9][6] ) );
  DFFRQX2M \regArr_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n210), .Q(
        \regArr[9][5] ) );
  DFFRQX2M \regArr_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n210), .Q(
        \regArr[9][4] ) );
  DFFRQX2M \regArr_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n210), .Q(
        \regArr[9][3] ) );
  DFFRQX2M \regArr_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n210), .Q(
        \regArr[9][2] ) );
  DFFRQX2M \regArr_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n210), .Q(
        \regArr[9][1] ) );
  DFFRQX2M \regArr_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n210), .Q(
        \regArr[9][0] ) );
  DFFRQX2M \regArr_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n208), .Q(
        \regArr[5][7] ) );
  DFFRQX2M \regArr_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n208), .Q(
        \regArr[5][6] ) );
  DFFRQX2M \regArr_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n208), .Q(
        \regArr[5][5] ) );
  DFFRQX2M \regArr_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n208), .Q(
        \regArr[5][4] ) );
  DFFRQX2M \regArr_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n208), .Q(
        \regArr[5][3] ) );
  DFFRQX2M \regArr_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n208), .Q(
        \regArr[5][2] ) );
  DFFRQX2M \regArr_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n208), .Q(
        \regArr[5][1] ) );
  DFFRQX2M \regArr_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n208), .Q(
        \regArr[5][0] ) );
  DFFRQX2M \regArr_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n205), .Q(
        \regArr[15][7] ) );
  DFFRQX2M \regArr_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n214), .Q(
        \regArr[15][6] ) );
  DFFRQX2M \regArr_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n214), .Q(
        \regArr[15][5] ) );
  DFFRQX2M \regArr_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n213), .Q(
        \regArr[15][4] ) );
  DFFRQX2M \regArr_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n213), .Q(
        \regArr[15][3] ) );
  DFFRQX2M \regArr_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n213), .Q(
        \regArr[15][2] ) );
  DFFRQX2M \regArr_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n213), .Q(
        \regArr[15][1] ) );
  DFFRQX2M \regArr_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n213), .Q(
        \regArr[15][0] ) );
  DFFRQX2M \regArr_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n212), .Q(
        \regArr[11][7] ) );
  DFFRQX2M \regArr_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n211), .Q(
        \regArr[11][6] ) );
  DFFRQX2M \regArr_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n211), .Q(
        \regArr[11][5] ) );
  DFFRQX2M \regArr_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n211), .Q(
        \regArr[11][4] ) );
  DFFRQX2M \regArr_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n211), .Q(
        \regArr[11][3] ) );
  DFFRQX2M \regArr_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n211), .Q(
        \regArr[11][2] ) );
  DFFRQX2M \regArr_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n211), .Q(
        \regArr[11][1] ) );
  DFFRQX2M \regArr_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n211), .Q(
        \regArr[11][0] ) );
  DFFRQX2M \regArr_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n209), .Q(
        \regArr[7][7] ) );
  DFFRQX2M \regArr_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n209), .Q(
        \regArr[7][6] ) );
  DFFRQX2M \regArr_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n209), .Q(
        \regArr[7][5] ) );
  DFFRQX2M \regArr_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n209), .Q(
        \regArr[7][4] ) );
  DFFRQX2M \regArr_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n209), .Q(
        \regArr[7][3] ) );
  DFFRQX2M \regArr_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n209), .Q(
        \regArr[7][2] ) );
  DFFRQX2M \regArr_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n209), .Q(
        \regArr[7][1] ) );
  DFFRQX2M \regArr_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n209), .Q(
        \regArr[7][0] ) );
  DFFRQX2M \regArr_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n213), .Q(
        \regArr[14][7] ) );
  DFFRQX2M \regArr_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n213), .Q(
        \regArr[14][6] ) );
  DFFRQX2M \regArr_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n213), .Q(
        \regArr[14][5] ) );
  DFFRQX2M \regArr_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n213), .Q(
        \regArr[14][4] ) );
  DFFRQX2M \regArr_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n213), .Q(
        \regArr[14][3] ) );
  DFFRQX2M \regArr_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n213), .Q(
        \regArr[14][2] ) );
  DFFRQX2M \regArr_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n213), .Q(
        \regArr[14][1] ) );
  DFFRQX2M \regArr_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n213), .Q(
        \regArr[14][0] ) );
  DFFRQX2M \regArr_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n211), .Q(
        \regArr[10][7] ) );
  DFFRQX2M \regArr_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n211), .Q(
        \regArr[10][6] ) );
  DFFRQX2M \regArr_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n211), .Q(
        \regArr[10][5] ) );
  DFFRQX2M \regArr_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n211), .Q(
        \regArr[10][4] ) );
  DFFRQX2M \regArr_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n211), .Q(
        \regArr[10][3] ) );
  DFFRQX2M \regArr_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n211), .Q(
        \regArr[10][2] ) );
  DFFRQX2M \regArr_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n211), .Q(
        \regArr[10][1] ) );
  DFFRQX2M \regArr_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n211), .Q(
        \regArr[10][0] ) );
  DFFRQX2M \regArr_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n209), .Q(
        \regArr[6][7] ) );
  DFFRQX2M \regArr_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n209), .Q(
        \regArr[6][6] ) );
  DFFRQX2M \regArr_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n209), .Q(
        \regArr[6][5] ) );
  DFFRQX2M \regArr_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n209), .Q(
        \regArr[6][4] ) );
  DFFRQX2M \regArr_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n209), .Q(
        \regArr[6][3] ) );
  DFFRQX2M \regArr_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n208), .Q(
        \regArr[6][2] ) );
  DFFRQX2M \regArr_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n208), .Q(
        \regArr[6][1] ) );
  DFFRQX2M \regArr_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n208), .Q(
        \regArr[6][0] ) );
  DFFRQX2M \regArr_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n212), .Q(
        \regArr[12][7] ) );
  DFFRQX2M \regArr_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n212), .Q(
        \regArr[12][6] ) );
  DFFRQX2M \regArr_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n212), .Q(
        \regArr[12][5] ) );
  DFFRQX2M \regArr_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n212), .Q(
        \regArr[12][4] ) );
  DFFRQX2M \regArr_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n212), .Q(
        \regArr[12][3] ) );
  DFFRQX2M \regArr_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n212), .Q(
        \regArr[12][2] ) );
  DFFRQX2M \regArr_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n212), .Q(
        \regArr[12][1] ) );
  DFFRQX2M \regArr_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n212), .Q(
        \regArr[12][0] ) );
  DFFRQX2M \regArr_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n210), .Q(
        \regArr[8][7] ) );
  DFFRQX2M \regArr_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n210), .Q(
        \regArr[8][6] ) );
  DFFRQX2M \regArr_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n210), .Q(
        \regArr[8][5] ) );
  DFFRQX2M \regArr_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n210), .Q(
        \regArr[8][4] ) );
  DFFRQX2M \regArr_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n210), .Q(
        \regArr[8][3] ) );
  DFFRQX2M \regArr_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n210), .Q(
        \regArr[8][2] ) );
  DFFRQX2M \regArr_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n210), .Q(
        \regArr[8][1] ) );
  DFFRQX2M \regArr_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n209), .Q(
        \regArr[8][0] ) );
  DFFRQX2M \regArr_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n208), .Q(
        \regArr[4][7] ) );
  DFFRQX2M \regArr_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n208), .Q(
        \regArr[4][6] ) );
  DFFRQX2M \regArr_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n208), .Q(
        \regArr[4][5] ) );
  DFFRQX2M \regArr_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n208), .Q(
        \regArr[4][4] ) );
  DFFRQX2M \regArr_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n207), .Q(
        \regArr[4][3] ) );
  DFFRQX2M \regArr_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n207), .Q(
        \regArr[4][2] ) );
  DFFRQX2M \regArr_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n207), .Q(
        \regArr[4][1] ) );
  DFFRQX2M \regArr_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n207), .Q(
        \regArr[4][0] ) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n205), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n205), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n205), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n205), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n205), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n205), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n205), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n209), .Q(RdData[0]) );
  DFFRQX2M \regArr_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n207), .Q(DIV_RATIO[0])
         );
  DFFRQX2M \regArr_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n207), .Q(DIV_RATIO[4])
         );
  DFFRQX2M \regArr_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n207), .Q(DIV_RATIO[2])
         );
  DFFRQX2M \regArr_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n207), .Q(DIV_RATIO[3])
         );
  DFFRQX2M \regArr_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n207), .Q(DIV_RATIO[6])
         );
  DFFRQX2M \regArr_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n207), .Q(DIV_RATIO[7])
         );
  DFFSQX2M \regArr_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n205), .Q(DIV_RATIO[5])
         );
  DFFRQX2M \regArr_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n206), .Q(
        UART_CONFIG[1]) );
  DFFSQX2M \regArr_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n205), .Q(
        UART_CONFIG[0]) );
  DFFRQX2M \regArr_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n207), .Q(DIV_RATIO[1])
         );
  DFFRQX2M \regArr_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n207), .Q(
        UART_CONFIG[2]) );
  DFFSQX2M \regArr_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n205), .Q(
        UART_CONFIG[7]) );
  DFFRQX2M \regArr_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n207), .Q(
        UART_CONFIG[5]) );
  DFFRQX2M \regArr_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n207), .Q(
        UART_CONFIG[6]) );
  DFFRQX2M \regArr_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n206), .Q(
        UART_CONFIG[3]) );
  DFFRQX2M \regArr_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n207), .Q(
        UART_CONFIG[4]) );
  DFFRQX2M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n205), .Q(RdData_VLD) );
  DFFRQX2M \regArr_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n205), .Q(OP_A[1]) );
  DFFRQX2M \regArr_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n205), .Q(OP_A[0]) );
  DFFRQX2M \regArr_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n205), .Q(OP_A[2]) );
  DFFRQX2M \regArr_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n206), .Q(OP_A[3]) );
  DFFRQX2M \regArr_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n206), .Q(OP_A[4]) );
  DFFRQX2M \regArr_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n206), .Q(OP_A[5]) );
  DFFRQX2M \regArr_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n206), .Q(OP_A[7]) );
  DFFRQX2M \regArr_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n206), .Q(OP_A[6]) );
  DFFRQX2M \regArr_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n206), .Q(OP_B[7]) );
  DFFRQX2M \regArr_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n206), .Q(OP_B[6]) );
  DFFRQX2M \regArr_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n206), .Q(OP_B[1]) );
  DFFRQX2M \regArr_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n206), .Q(OP_B[4]) );
  DFFRQX2M \regArr_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n206), .Q(OP_B[5]) );
  DFFRQX2M \regArr_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n206), .Q(OP_B[2]) );
  DFFRQX2M \regArr_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n206), .Q(OP_B[3]) );
  DFFRQX2M \regArr_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n206), .Q(OP_B[0]) );
  NOR2BX2M U3 ( .AN(n38), .B(n203), .Y(n32) );
  NOR2BX2M U4 ( .AN(n27), .B(n203), .Y(n18) );
  NOR2BX2M U5 ( .AN(N13), .B(n199), .Y(n23) );
  NOR2BX2M U6 ( .AN(N13), .B(n204), .Y(n26) );
  NOR2X2M U7 ( .A(n204), .B(N13), .Y(n20) );
  NOR2X2M U8 ( .A(n199), .B(N13), .Y(n15) );
  INVX2M U9 ( .A(WrData[5]), .Y(n227) );
  INVX2M U10 ( .A(n200), .Y(n201) );
  INVX2M U11 ( .A(n198), .Y(n199) );
  BUFX2M U12 ( .A(n204), .Y(n198) );
  INVX2M U13 ( .A(n200), .Y(n202) );
  BUFX2M U14 ( .A(n203), .Y(n200) );
  INVX2M U15 ( .A(n12), .Y(n220) );
  NOR2BX2M U16 ( .AN(n27), .B(N11), .Y(n16) );
  NOR2BX2M U17 ( .AN(n38), .B(N11), .Y(n30) );
  NAND2X2M U18 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U19 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U20 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U21 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U22 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U23 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U24 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U25 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U26 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U27 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U28 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U29 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U30 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U31 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U32 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U33 ( .A(n15), .B(n16), .Y(n14) );
  NOR2BX2M U34 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  NAND2BX2M U35 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  BUFX2M U36 ( .A(n219), .Y(n205) );
  BUFX2M U37 ( .A(n219), .Y(n206) );
  BUFX2M U38 ( .A(n218), .Y(n207) );
  BUFX2M U39 ( .A(n218), .Y(n208) );
  BUFX2M U40 ( .A(n217), .Y(n209) );
  BUFX2M U41 ( .A(n217), .Y(n210) );
  BUFX2M U42 ( .A(n216), .Y(n211) );
  BUFX2M U43 ( .A(n216), .Y(n212) );
  BUFX2M U44 ( .A(n215), .Y(n213) );
  BUFX2M U45 ( .A(n215), .Y(n214) );
  NOR2BX2M U46 ( .AN(n13), .B(N14), .Y(n27) );
  AND2X2M U47 ( .A(N14), .B(n13), .Y(n38) );
  INVX2M U48 ( .A(WrData[0]), .Y(n221) );
  INVX2M U49 ( .A(WrData[1]), .Y(n222) );
  INVX2M U50 ( .A(WrData[2]), .Y(n223) );
  INVX2M U51 ( .A(WrData[3]), .Y(n224) );
  INVX2M U52 ( .A(WrData[4]), .Y(n228) );
  INVX2M U53 ( .A(WrData[6]), .Y(n226) );
  INVX2M U54 ( .A(WrData[7]), .Y(n225) );
  BUFX2M U55 ( .A(RST), .Y(n218) );
  BUFX2M U56 ( .A(RST), .Y(n217) );
  BUFX2M U57 ( .A(RST), .Y(n216) );
  BUFX2M U58 ( .A(RST), .Y(n215) );
  BUFX2M U59 ( .A(RST), .Y(n219) );
  INVX2M U60 ( .A(N12), .Y(n204) );
  OAI2BB2X1M U61 ( .B0(n14), .B1(n221), .A0N(OP_A[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U62 ( .B0(n14), .B1(n222), .A0N(OP_A[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U63 ( .B0(n14), .B1(n223), .A0N(OP_A[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U64 ( .B0(n14), .B1(n224), .A0N(OP_A[3]), .A1N(n14), .Y(n52) );
  OAI2BB2X1M U65 ( .B0(n14), .B1(n228), .A0N(OP_A[4]), .A1N(n14), .Y(n53) );
  OAI2BB2X1M U66 ( .B0(n14), .B1(n227), .A0N(OP_A[5]), .A1N(n14), .Y(n54) );
  OAI2BB2X1M U67 ( .B0(n14), .B1(n226), .A0N(OP_A[6]), .A1N(n14), .Y(n55) );
  OAI2BB2X1M U68 ( .B0(n14), .B1(n225), .A0N(OP_A[7]), .A1N(n14), .Y(n56) );
  OAI2BB2X1M U69 ( .B0(n221), .B1(n17), .A0N(OP_B[0]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U70 ( .B0(n222), .B1(n17), .A0N(OP_B[1]), .A1N(n17), .Y(n58) );
  OAI2BB2X1M U71 ( .B0(n223), .B1(n17), .A0N(OP_B[2]), .A1N(n17), .Y(n59) );
  OAI2BB2X1M U72 ( .B0(n224), .B1(n17), .A0N(OP_B[3]), .A1N(n17), .Y(n60) );
  OAI2BB2X1M U73 ( .B0(n228), .B1(n17), .A0N(OP_B[4]), .A1N(n17), .Y(n61) );
  OAI2BB2X1M U74 ( .B0(n227), .B1(n17), .A0N(OP_B[5]), .A1N(n17), .Y(n62) );
  OAI2BB2X1M U75 ( .B0(n226), .B1(n17), .A0N(OP_B[6]), .A1N(n17), .Y(n63) );
  OAI2BB2X1M U76 ( .B0(n225), .B1(n17), .A0N(OP_B[7]), .A1N(n17), .Y(n64) );
  OAI2BB2X1M U77 ( .B0(n221), .B1(n22), .A0N(\regArr[4][0] ), .A1N(n22), .Y(
        n81) );
  OAI2BB2X1M U78 ( .B0(n222), .B1(n22), .A0N(\regArr[4][1] ), .A1N(n22), .Y(
        n82) );
  OAI2BB2X1M U79 ( .B0(n223), .B1(n22), .A0N(\regArr[4][2] ), .A1N(n22), .Y(
        n83) );
  OAI2BB2X1M U80 ( .B0(n224), .B1(n22), .A0N(\regArr[4][3] ), .A1N(n22), .Y(
        n84) );
  OAI2BB2X1M U81 ( .B0(n228), .B1(n22), .A0N(\regArr[4][4] ), .A1N(n22), .Y(
        n85) );
  OAI2BB2X1M U82 ( .B0(n227), .B1(n22), .A0N(\regArr[4][5] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U83 ( .B0(n226), .B1(n22), .A0N(\regArr[4][6] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U84 ( .B0(n225), .B1(n22), .A0N(\regArr[4][7] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U85 ( .B0(n221), .B1(n24), .A0N(\regArr[5][0] ), .A1N(n24), .Y(
        n89) );
  OAI2BB2X1M U86 ( .B0(n222), .B1(n24), .A0N(\regArr[5][1] ), .A1N(n24), .Y(
        n90) );
  OAI2BB2X1M U87 ( .B0(n223), .B1(n24), .A0N(\regArr[5][2] ), .A1N(n24), .Y(
        n91) );
  OAI2BB2X1M U88 ( .B0(n224), .B1(n24), .A0N(\regArr[5][3] ), .A1N(n24), .Y(
        n92) );
  OAI2BB2X1M U89 ( .B0(n228), .B1(n24), .A0N(\regArr[5][4] ), .A1N(n24), .Y(
        n93) );
  OAI2BB2X1M U90 ( .B0(n227), .B1(n24), .A0N(\regArr[5][5] ), .A1N(n24), .Y(
        n94) );
  OAI2BB2X1M U91 ( .B0(n226), .B1(n24), .A0N(\regArr[5][6] ), .A1N(n24), .Y(
        n95) );
  OAI2BB2X1M U92 ( .B0(n225), .B1(n24), .A0N(\regArr[5][7] ), .A1N(n24), .Y(
        n96) );
  OAI2BB2X1M U93 ( .B0(n221), .B1(n25), .A0N(\regArr[6][0] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U94 ( .B0(n222), .B1(n25), .A0N(\regArr[6][1] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U95 ( .B0(n223), .B1(n25), .A0N(\regArr[6][2] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U96 ( .B0(n224), .B1(n25), .A0N(\regArr[6][3] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U97 ( .B0(n228), .B1(n25), .A0N(\regArr[6][4] ), .A1N(n25), .Y(
        n101) );
  OAI2BB2X1M U98 ( .B0(n227), .B1(n25), .A0N(\regArr[6][5] ), .A1N(n25), .Y(
        n102) );
  OAI2BB2X1M U99 ( .B0(n226), .B1(n25), .A0N(\regArr[6][6] ), .A1N(n25), .Y(
        n103) );
  OAI2BB2X1M U100 ( .B0(n225), .B1(n25), .A0N(\regArr[6][7] ), .A1N(n25), .Y(
        n104) );
  OAI2BB2X1M U101 ( .B0(n221), .B1(n28), .A0N(\regArr[7][0] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U102 ( .B0(n222), .B1(n28), .A0N(\regArr[7][1] ), .A1N(n28), .Y(
        n106) );
  OAI2BB2X1M U103 ( .B0(n223), .B1(n28), .A0N(\regArr[7][2] ), .A1N(n28), .Y(
        n107) );
  OAI2BB2X1M U104 ( .B0(n224), .B1(n28), .A0N(\regArr[7][3] ), .A1N(n28), .Y(
        n108) );
  OAI2BB2X1M U105 ( .B0(n228), .B1(n28), .A0N(\regArr[7][4] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U106 ( .B0(n227), .B1(n28), .A0N(\regArr[7][5] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U107 ( .B0(n226), .B1(n28), .A0N(\regArr[7][6] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U108 ( .B0(n225), .B1(n28), .A0N(\regArr[7][7] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U109 ( .B0(n221), .B1(n29), .A0N(\regArr[8][0] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U110 ( .B0(n222), .B1(n29), .A0N(\regArr[8][1] ), .A1N(n29), .Y(
        n114) );
  OAI2BB2X1M U111 ( .B0(n223), .B1(n29), .A0N(\regArr[8][2] ), .A1N(n29), .Y(
        n115) );
  OAI2BB2X1M U112 ( .B0(n224), .B1(n29), .A0N(\regArr[8][3] ), .A1N(n29), .Y(
        n116) );
  OAI2BB2X1M U113 ( .B0(n228), .B1(n29), .A0N(\regArr[8][4] ), .A1N(n29), .Y(
        n117) );
  OAI2BB2X1M U114 ( .B0(n227), .B1(n29), .A0N(\regArr[8][5] ), .A1N(n29), .Y(
        n118) );
  OAI2BB2X1M U115 ( .B0(n226), .B1(n29), .A0N(\regArr[8][6] ), .A1N(n29), .Y(
        n119) );
  OAI2BB2X1M U116 ( .B0(n225), .B1(n29), .A0N(\regArr[8][7] ), .A1N(n29), .Y(
        n120) );
  OAI2BB2X1M U117 ( .B0(n221), .B1(n31), .A0N(\regArr[9][0] ), .A1N(n31), .Y(
        n121) );
  OAI2BB2X1M U118 ( .B0(n222), .B1(n31), .A0N(\regArr[9][1] ), .A1N(n31), .Y(
        n122) );
  OAI2BB2X1M U119 ( .B0(n223), .B1(n31), .A0N(\regArr[9][2] ), .A1N(n31), .Y(
        n123) );
  OAI2BB2X1M U120 ( .B0(n224), .B1(n31), .A0N(\regArr[9][3] ), .A1N(n31), .Y(
        n124) );
  OAI2BB2X1M U121 ( .B0(n228), .B1(n31), .A0N(\regArr[9][4] ), .A1N(n31), .Y(
        n125) );
  OAI2BB2X1M U122 ( .B0(n227), .B1(n31), .A0N(\regArr[9][5] ), .A1N(n31), .Y(
        n126) );
  OAI2BB2X1M U123 ( .B0(n226), .B1(n31), .A0N(\regArr[9][6] ), .A1N(n31), .Y(
        n127) );
  OAI2BB2X1M U124 ( .B0(n225), .B1(n31), .A0N(\regArr[9][7] ), .A1N(n31), .Y(
        n128) );
  OAI2BB2X1M U125 ( .B0(n221), .B1(n33), .A0N(\regArr[10][0] ), .A1N(n33), .Y(
        n129) );
  OAI2BB2X1M U126 ( .B0(n222), .B1(n33), .A0N(\regArr[10][1] ), .A1N(n33), .Y(
        n130) );
  OAI2BB2X1M U127 ( .B0(n223), .B1(n33), .A0N(\regArr[10][2] ), .A1N(n33), .Y(
        n131) );
  OAI2BB2X1M U128 ( .B0(n224), .B1(n33), .A0N(\regArr[10][3] ), .A1N(n33), .Y(
        n132) );
  OAI2BB2X1M U129 ( .B0(n228), .B1(n33), .A0N(\regArr[10][4] ), .A1N(n33), .Y(
        n133) );
  OAI2BB2X1M U130 ( .B0(n227), .B1(n33), .A0N(\regArr[10][5] ), .A1N(n33), .Y(
        n134) );
  OAI2BB2X1M U131 ( .B0(n226), .B1(n33), .A0N(\regArr[10][6] ), .A1N(n33), .Y(
        n135) );
  OAI2BB2X1M U132 ( .B0(n225), .B1(n33), .A0N(\regArr[10][7] ), .A1N(n33), .Y(
        n136) );
  OAI2BB2X1M U133 ( .B0(n221), .B1(n34), .A0N(\regArr[11][0] ), .A1N(n34), .Y(
        n137) );
  OAI2BB2X1M U134 ( .B0(n222), .B1(n34), .A0N(\regArr[11][1] ), .A1N(n34), .Y(
        n138) );
  OAI2BB2X1M U135 ( .B0(n223), .B1(n34), .A0N(\regArr[11][2] ), .A1N(n34), .Y(
        n139) );
  OAI2BB2X1M U136 ( .B0(n224), .B1(n34), .A0N(\regArr[11][3] ), .A1N(n34), .Y(
        n140) );
  OAI2BB2X1M U137 ( .B0(n228), .B1(n34), .A0N(\regArr[11][4] ), .A1N(n34), .Y(
        n141) );
  OAI2BB2X1M U138 ( .B0(n227), .B1(n34), .A0N(\regArr[11][5] ), .A1N(n34), .Y(
        n142) );
  OAI2BB2X1M U139 ( .B0(n226), .B1(n34), .A0N(\regArr[11][6] ), .A1N(n34), .Y(
        n143) );
  OAI2BB2X1M U140 ( .B0(n225), .B1(n34), .A0N(\regArr[11][7] ), .A1N(n34), .Y(
        n144) );
  OAI2BB2X1M U141 ( .B0(n221), .B1(n35), .A0N(\regArr[12][0] ), .A1N(n35), .Y(
        n145) );
  OAI2BB2X1M U142 ( .B0(n222), .B1(n35), .A0N(\regArr[12][1] ), .A1N(n35), .Y(
        n146) );
  OAI2BB2X1M U143 ( .B0(n223), .B1(n35), .A0N(\regArr[12][2] ), .A1N(n35), .Y(
        n147) );
  OAI2BB2X1M U144 ( .B0(n224), .B1(n35), .A0N(\regArr[12][3] ), .A1N(n35), .Y(
        n148) );
  OAI2BB2X1M U145 ( .B0(n228), .B1(n35), .A0N(\regArr[12][4] ), .A1N(n35), .Y(
        n149) );
  OAI2BB2X1M U146 ( .B0(n227), .B1(n35), .A0N(\regArr[12][5] ), .A1N(n35), .Y(
        n150) );
  OAI2BB2X1M U147 ( .B0(n226), .B1(n35), .A0N(\regArr[12][6] ), .A1N(n35), .Y(
        n151) );
  OAI2BB2X1M U148 ( .B0(n225), .B1(n35), .A0N(\regArr[12][7] ), .A1N(n35), .Y(
        n152) );
  OAI2BB2X1M U149 ( .B0(n221), .B1(n36), .A0N(\regArr[13][0] ), .A1N(n36), .Y(
        n153) );
  OAI2BB2X1M U150 ( .B0(n222), .B1(n36), .A0N(\regArr[13][1] ), .A1N(n36), .Y(
        n154) );
  OAI2BB2X1M U151 ( .B0(n223), .B1(n36), .A0N(\regArr[13][2] ), .A1N(n36), .Y(
        n155) );
  OAI2BB2X1M U152 ( .B0(n224), .B1(n36), .A0N(\regArr[13][3] ), .A1N(n36), .Y(
        n156) );
  OAI2BB2X1M U153 ( .B0(n228), .B1(n36), .A0N(\regArr[13][4] ), .A1N(n36), .Y(
        n157) );
  OAI2BB2X1M U154 ( .B0(n227), .B1(n36), .A0N(\regArr[13][5] ), .A1N(n36), .Y(
        n158) );
  OAI2BB2X1M U155 ( .B0(n226), .B1(n36), .A0N(\regArr[13][6] ), .A1N(n36), .Y(
        n159) );
  OAI2BB2X1M U156 ( .B0(n225), .B1(n36), .A0N(\regArr[13][7] ), .A1N(n36), .Y(
        n160) );
  OAI2BB2X1M U157 ( .B0(n221), .B1(n37), .A0N(\regArr[14][0] ), .A1N(n37), .Y(
        n161) );
  OAI2BB2X1M U158 ( .B0(n222), .B1(n37), .A0N(\regArr[14][1] ), .A1N(n37), .Y(
        n162) );
  OAI2BB2X1M U159 ( .B0(n223), .B1(n37), .A0N(\regArr[14][2] ), .A1N(n37), .Y(
        n163) );
  OAI2BB2X1M U160 ( .B0(n224), .B1(n37), .A0N(\regArr[14][3] ), .A1N(n37), .Y(
        n164) );
  OAI2BB2X1M U161 ( .B0(n228), .B1(n37), .A0N(\regArr[14][4] ), .A1N(n37), .Y(
        n165) );
  OAI2BB2X1M U162 ( .B0(n227), .B1(n37), .A0N(\regArr[14][5] ), .A1N(n37), .Y(
        n166) );
  OAI2BB2X1M U163 ( .B0(n226), .B1(n37), .A0N(\regArr[14][6] ), .A1N(n37), .Y(
        n167) );
  OAI2BB2X1M U164 ( .B0(n225), .B1(n37), .A0N(\regArr[14][7] ), .A1N(n37), .Y(
        n168) );
  OAI2BB2X1M U165 ( .B0(n221), .B1(n39), .A0N(\regArr[15][0] ), .A1N(n39), .Y(
        n169) );
  OAI2BB2X1M U166 ( .B0(n222), .B1(n39), .A0N(\regArr[15][1] ), .A1N(n39), .Y(
        n170) );
  OAI2BB2X1M U167 ( .B0(n223), .B1(n39), .A0N(\regArr[15][2] ), .A1N(n39), .Y(
        n171) );
  OAI2BB2X1M U168 ( .B0(n224), .B1(n39), .A0N(\regArr[15][3] ), .A1N(n39), .Y(
        n172) );
  OAI2BB2X1M U169 ( .B0(n228), .B1(n39), .A0N(\regArr[15][4] ), .A1N(n39), .Y(
        n173) );
  OAI2BB2X1M U170 ( .B0(n227), .B1(n39), .A0N(\regArr[15][5] ), .A1N(n39), .Y(
        n174) );
  OAI2BB2X1M U171 ( .B0(n226), .B1(n39), .A0N(\regArr[15][6] ), .A1N(n39), .Y(
        n175) );
  OAI2BB2X1M U172 ( .B0(n225), .B1(n39), .A0N(\regArr[15][7] ), .A1N(n39), .Y(
        n176) );
  OAI2BB2X1M U173 ( .B0(n222), .B1(n19), .A0N(UART_CONFIG[1]), .A1N(n19), .Y(
        n66) );
  OAI2BB2X1M U174 ( .B0(n223), .B1(n19), .A0N(UART_CONFIG[2]), .A1N(n19), .Y(
        n67) );
  OAI2BB2X1M U175 ( .B0(n224), .B1(n19), .A0N(UART_CONFIG[3]), .A1N(n19), .Y(
        n68) );
  OAI2BB2X1M U176 ( .B0(n228), .B1(n19), .A0N(UART_CONFIG[4]), .A1N(n19), .Y(
        n69) );
  OAI2BB2X1M U177 ( .B0(n227), .B1(n19), .A0N(UART_CONFIG[5]), .A1N(n19), .Y(
        n70) );
  OAI2BB2X1M U178 ( .B0(n226), .B1(n19), .A0N(UART_CONFIG[6]), .A1N(n19), .Y(
        n71) );
  OAI2BB2X1M U179 ( .B0(n221), .B1(n21), .A0N(DIV_RATIO[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U180 ( .B0(n222), .B1(n21), .A0N(DIV_RATIO[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U181 ( .B0(n223), .B1(n21), .A0N(DIV_RATIO[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U182 ( .B0(n224), .B1(n21), .A0N(DIV_RATIO[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U183 ( .B0(n228), .B1(n21), .A0N(DIV_RATIO[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U184 ( .B0(n226), .B1(n21), .A0N(DIV_RATIO[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U185 ( .B0(n225), .B1(n21), .A0N(DIV_RATIO[7]), .A1N(n21), .Y(n80) );
  OAI2BB2X1M U186 ( .B0(n221), .B1(n19), .A0N(UART_CONFIG[0]), .A1N(n19), .Y(
        n65) );
  OAI2BB2X1M U187 ( .B0(n225), .B1(n19), .A0N(UART_CONFIG[7]), .A1N(n19), .Y(
        n72) );
  OAI2BB2X1M U188 ( .B0(n227), .B1(n21), .A0N(DIV_RATIO[5]), .A1N(n21), .Y(n78) );
  AO22X1M U189 ( .A0(N43), .A1(n220), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U190 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U191 ( .A(OP_A[0]), .B(OP_B[0]), .C(UART_CONFIG[0]), .D(DIV_RATIO[0]), 
        .S0(N11), .S1(n199), .Y(n4) );
  MX4X1M U192 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(n199), .Y(n2) );
  AO22X1M U193 ( .A0(N42), .A1(n220), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U194 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U195 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(n199), .Y(n6) );
  MX4X1M U196 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n201), .S1(n199), .Y(n5) );
  AO22X1M U197 ( .A0(N41), .A1(n220), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U198 ( .A(n177), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41) );
  MX4X1M U199 ( .A(OP_A[2]), .B(OP_B[2]), .C(UART_CONFIG[2]), .D(DIV_RATIO[2]), 
        .S0(n201), .S1(N12), .Y(n177) );
  MX4X1M U200 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n201), .S1(N12), .Y(n10) );
  AO22X1M U201 ( .A0(N40), .A1(n220), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U202 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U203 ( .A(OP_A[3]), .B(OP_B[3]), .C(UART_CONFIG[3]), .D(DIV_RATIO[3]), 
        .S0(n201), .S1(N12), .Y(n181) );
  MX4X1M U204 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n201), .S1(N12), .Y(n179) );
  AO22X1M U205 ( .A0(N39), .A1(n220), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U206 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U207 ( .A(OP_A[4]), .B(OP_B[4]), .C(UART_CONFIG[4]), .D(DIV_RATIO[4]), 
        .S0(n202), .S1(N12), .Y(n185) );
  MX4X1M U208 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n201), .S1(N12), .Y(n183) );
  AO22X1M U209 ( .A0(N38), .A1(n220), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U210 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U211 ( .A(OP_A[5]), .B(OP_B[5]), .C(UART_CONFIG[5]), .D(DIV_RATIO[5]), 
        .S0(n202), .S1(N12), .Y(n189) );
  MX4X1M U212 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n202), .S1(N12), .Y(n187) );
  AO22X1M U213 ( .A0(N37), .A1(n220), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U214 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U215 ( .A(OP_A[6]), .B(OP_B[6]), .C(UART_CONFIG[6]), .D(DIV_RATIO[6]), 
        .S0(n202), .S1(N12), .Y(n193) );
  MX4X1M U216 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n202), .S1(N12), .Y(n191) );
  AO22X1M U217 ( .A0(N36), .A1(n220), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U218 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U219 ( .A(OP_A[7]), .B(OP_B[7]), .C(UART_CONFIG[7]), .D(DIV_RATIO[7]), 
        .S0(n202), .S1(N12), .Y(n197) );
  MX4X1M U220 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n202), .S1(N12), .Y(n195) );
  MX4X1M U221 ( .A(OP_A[1]), .B(OP_B[1]), .C(UART_CONFIG[1]), .D(DIV_RATIO[1]), 
        .S0(n201), .S1(n199), .Y(n8) );
  MX4X1M U222 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(N11), .S1(n199), .Y(n3) );
  MX4X1M U223 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n201), .S1(n199), .Y(n7) );
  MX4X1M U224 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n201), .S1(N12), .Y(n11) );
  MX4X1M U225 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n201), .S1(N12), .Y(n180) );
  MX4X1M U226 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n201), .S1(N12), .Y(n184) );
  MX4X1M U227 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n202), .S1(N12), .Y(n188) );
  MX4X1M U228 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n202), .S1(N12), .Y(n192) );
  MX4X1M U229 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n202), .S1(N12), .Y(n196) );
  MX4X1M U230 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n202), .S1(n199), .Y(n1) );
  MX4X1M U231 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n201), .S1(n199), .Y(n9) );
  MX4X1M U232 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n201), .S1(n199), .Y(n178) );
  MX4X1M U233 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n201), .S1(N12), .Y(n182) );
  MX4X1M U234 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n202), .S1(n199), .Y(n186) );
  MX4X1M U235 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n202), .S1(n199), .Y(n190) );
  MX4X1M U236 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n202), .S1(n199), .Y(n194) );
  INVX2M U237 ( .A(N11), .Y(n203) );
  OAI2BB1X2M U238 ( .A0N(RdData_VLD), .A1N(n13), .B0(n12), .Y(n48) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
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
  NAND2X2M U11 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U12 ( .A(a[5]), .Y(n4) );
  INVX2M U13 ( .A(n18), .Y(n3) );
  NAND2X2M U14 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U15 ( .A(a[4]), .Y(n6) );
  INVX2M U16 ( .A(n18), .Y(n5) );
  NAND2X2M U17 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U18 ( .A(a[3]), .Y(n7) );
  NAND2X2M U19 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n8) );
  NAND2X2M U21 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n9) );
  NAND2X2M U23 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n18), .Y(n1) );
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
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  INVX2M U2 ( .A(B[1]), .Y(n8) );
  NAND2X2M U3 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U4 ( .A(A[0]), .Y(n1) );
  INVX2M U5 ( .A(B[7]), .Y(n2) );
  XNOR2X2M U6 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
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
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
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

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n6), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n9), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n8), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n3), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n7), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U11 ( .A(\ab[0][7] ), .Y(n23) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U14 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U15 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U16 ( .A(\ab[0][5] ), .Y(n21) );
  XNOR2X2M U17 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  AND2X2M U18 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U19 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U23 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U24 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U26 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U27 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  XNOR2X2M U28 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U29 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U30 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U31 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U32 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U35 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(B[6]), .Y(n25) );
  INVX2M U39 ( .A(B[7]), .Y(n24) );
  XNOR2X2M U40 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[3]), .Y(n36) );
  INVX2M U43 ( .A(A[4]), .Y(n35) );
  INVX2M U44 ( .A(B[1]), .Y(n30) );
  INVX2M U45 ( .A(A[6]), .Y(n33) );
  INVX2M U46 ( .A(A[7]), .Y(n32) );
  INVX2M U47 ( .A(A[5]), .Y(n34) );
  INVX2M U48 ( .A(B[3]), .Y(n28) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[4]), .Y(n27) );
  INVX2M U51 ( .A(B[0]), .Y(n31) );
  INVX2M U52 ( .A(B[2]), .Y(n29) );
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
endmodule


module ALU ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104,
         N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, N115,
         N116, N117, N118, N119, N120, N121, N122, N123, N124, N125, N128,
         N129, N130, N131, N132, N133, N134, N135, N168, N169, N170, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152;
  wire   [15:0] ALU_OUT_Comb;

  ALU_DW_div_uns_0 div_54 ( .a({n15, n14, n13, n12, n11, n10, n9, n8}), .b({n7, 
        n6, B[5:2], n5, B[0]}), .quotient({N135, N134, N133, N132, N131, N130, 
        N129, N128}) );
  ALU_DW01_sub_0 sub_48 ( .A({1'b0, n15, n14, n13, n12, n11, n10, n9, n8}), 
        .B({1'b0, n7, n6, B[5:2], n5, B[0]}), .CI(1'b0), .DIFF({N109, N108, 
        N107, N106, N105, N104, N103, N102, N101}) );
  ALU_DW01_add_0 add_45 ( .A({1'b0, n15, n14, n13, n12, n11, n10, n9, n8}), 
        .B({1'b0, n7, n6, B[5:2], n5, B[0]}), .CI(1'b0), .SUM({N100, N99, N98, 
        N97, N96, N95, N94, N93, N92}) );
  ALU_DW02_mult_0 mult_51 ( .A({n15, n14, n13, n12, n11, n10, n9, n8}), .B({n7, 
        n6, B[5:2], n5, B[0]}), .TC(1'b0), .PRODUCT({N125, N124, N123, N122, 
        N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, N110}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  BUFX2M U3 ( .A(A[7]), .Y(n15) );
  BUFX2M U4 ( .A(A[6]), .Y(n14) );
  BUFX2M U5 ( .A(A[1]), .Y(n9) );
  INVX2M U8 ( .A(n53), .Y(n150) );
  INVX2M U9 ( .A(n97), .Y(n148) );
  INVX2M U10 ( .A(n47), .Y(n147) );
  INVX2M U11 ( .A(n102), .Y(n146) );
  OAI2BB1X2M U12 ( .A0N(N124), .A1N(n35), .B0(n36), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U13 ( .A0N(N125), .A1N(n35), .B0(n36), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U14 ( .A0N(N121), .A1N(n35), .B0(n36), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U15 ( .A0N(N122), .A1N(n35), .B0(n36), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U16 ( .A0N(N123), .A1N(n35), .B0(n36), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U17 ( .A0N(N119), .A1N(n35), .B0(n36), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U18 ( .A0N(N120), .A1N(n35), .B0(n36), .Y(ALU_OUT_Comb[10]) );
  OAI21X2M U19 ( .A0(n3), .A1(n112), .B0(n111), .Y(n52) );
  NOR2X2M U20 ( .A(n101), .B(n3), .Y(n53) );
  OAI2B1X2M U21 ( .A1N(n110), .A0(n101), .B0(n111), .Y(n97) );
  NAND2X2M U22 ( .A(n151), .B(n110), .Y(n47) );
  INVX2M U23 ( .A(n50), .Y(n145) );
  INVX2M U24 ( .A(n112), .Y(n151) );
  NOR2BX2M U25 ( .AN(n113), .B(n3), .Y(n41) );
  NOR2BX2M U26 ( .AN(n40), .B(n144), .Y(n35) );
  NAND2X2M U27 ( .A(n113), .B(n110), .Y(n102) );
  OAI2BB2X1M U28 ( .B0(n137), .B1(n47), .A0N(N117), .A1N(n40), .Y(n46) );
  NOR3BX2M U29 ( .AN(n4), .B(n101), .C(ALU_FUN[0]), .Y(n39) );
  NOR3BX2M U30 ( .AN(n4), .B(n149), .C(n112), .Y(n57) );
  OAI2B11X2M U31 ( .A1N(N109), .A0(n102), .B0(n150), .C0(n148), .Y(n42) );
  NOR2X2M U32 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n113) );
  NOR2X2M U33 ( .A(n149), .B(n4), .Y(n110) );
  NAND3X2M U34 ( .A(n113), .B(n149), .C(n4), .Y(n50) );
  NAND2X2M U35 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n101) );
  NAND2X2M U36 ( .A(ALU_FUN[2]), .B(n152), .Y(n112) );
  NAND2X2M U37 ( .A(EN), .B(n42), .Y(n36) );
  INVX2M U38 ( .A(ALU_FUN[0]), .Y(n149) );
  INVX2M U39 ( .A(ALU_FUN[1]), .Y(n152) );
  NAND3X2M U40 ( .A(n113), .B(ALU_FUN[0]), .C(n4), .Y(n111) );
  AND4X2M U41 ( .A(N170), .B(n151), .C(n4), .D(n149), .Y(n100) );
  NOR3X2M U42 ( .A(n3), .B(ALU_FUN[2]), .C(n152), .Y(n40) );
  INVX2M U43 ( .A(EN), .Y(n144) );
  OR2X2M U44 ( .A(n4), .B(ALU_FUN[0]), .Y(n3) );
  AOI31X2M U45 ( .A0(n103), .A1(n104), .A2(n105), .B0(n144), .Y(
        ALU_OUT_Comb[0]) );
  AOI22X1M U46 ( .A0(N101), .A1(n146), .B0(N92), .B1(n41), .Y(n103) );
  AOI222X1M U47 ( .A0(N110), .A1(n40), .B0(n53), .B1(n143), .C0(n8), .C1(n147), 
        .Y(n104) );
  AOI211X2M U48 ( .A0(n9), .A1(n57), .B0(n106), .C0(n107), .Y(n105) );
  OAI2BB1X2M U49 ( .A0N(N128), .A1N(n48), .B0(n114), .Y(n106) );
  AOI31X2M U50 ( .A0(N168), .A1(n4), .A2(n115), .B0(n100), .Y(n114) );
  NOR3X2M U51 ( .A(n152), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n115) );
  AOI31X2M U52 ( .A0(n90), .A1(n91), .A2(n92), .B0(n144), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U53 ( .A0(N93), .A1(n41), .B0(N111), .B1(n40), .C0(N102), .C1(n146), .Y(n90) );
  AOI222X1M U54 ( .A0(n9), .A1(n147), .B0(n10), .B1(n57), .C0(n53), .C1(n126), 
        .Y(n91) );
  AOI211X2M U55 ( .A0(n8), .A1(n39), .B0(n93), .C0(n94), .Y(n92) );
  OAI2BB1X2M U56 ( .A0N(N129), .A1N(n48), .B0(n98), .Y(n93) );
  AOI31X2M U57 ( .A0(N169), .A1(n4), .A2(n99), .B0(n100), .Y(n98) );
  NOR3X2M U58 ( .A(n149), .B(ALU_FUN[2]), .C(n152), .Y(n99) );
  AOI31X2M U59 ( .A0(n83), .A1(n84), .A2(n85), .B0(n144), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U60 ( .A0(N103), .A1(n146), .B0(N94), .B1(n41), .Y(n83) );
  AOI222X1M U61 ( .A0(N112), .A1(n40), .B0(n53), .B1(n142), .C0(n10), .C1(n147), .Y(n84) );
  AOI221XLM U62 ( .A0(n9), .A1(n39), .B0(n11), .B1(n57), .C0(n86), .Y(n85) );
  AOI31X2M U63 ( .A0(n76), .A1(n77), .A2(n78), .B0(n144), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U64 ( .A0(N104), .A1(n146), .B0(N95), .B1(n41), .Y(n76) );
  AOI222X1M U65 ( .A0(N113), .A1(n40), .B0(n53), .B1(n141), .C0(n11), .C1(n147), .Y(n77) );
  AOI221XLM U66 ( .A0(n10), .A1(n39), .B0(n12), .B1(n57), .C0(n79), .Y(n78) );
  AOI31X2M U67 ( .A0(n69), .A1(n70), .A2(n71), .B0(n144), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U68 ( .A0(N105), .A1(n146), .B0(N96), .B1(n41), .Y(n69) );
  AOI222X1M U69 ( .A0(N114), .A1(n40), .B0(n53), .B1(n140), .C0(n12), .C1(n147), .Y(n70) );
  AOI221XLM U70 ( .A0(n11), .A1(n39), .B0(n57), .B1(n13), .C0(n72), .Y(n71) );
  AOI31X2M U71 ( .A0(n62), .A1(n63), .A2(n64), .B0(n144), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U72 ( .A0(N106), .A1(n146), .B0(N97), .B1(n41), .Y(n62) );
  AOI222X1M U73 ( .A0(N115), .A1(n40), .B0(n53), .B1(n139), .C0(n13), .C1(n147), .Y(n63) );
  AOI221XLM U74 ( .A0(n12), .A1(n39), .B0(n57), .B1(n14), .C0(n65), .Y(n64) );
  AOI31X2M U75 ( .A0(n54), .A1(n55), .A2(n56), .B0(n144), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U76 ( .A0(N107), .A1(n146), .B0(N98), .B1(n41), .Y(n54) );
  AOI221XLM U77 ( .A0(n13), .A1(n39), .B0(n57), .B1(n15), .C0(n58), .Y(n56) );
  AOI222X1M U78 ( .A0(N116), .A1(n40), .B0(n53), .B1(n138), .C0(n147), .C1(n14), .Y(n55) );
  AOI31X2M U79 ( .A0(n43), .A1(n44), .A2(n45), .B0(n144), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U80 ( .A0(n14), .A1(n39), .B0(n53), .B1(n137), .Y(n43) );
  AOI222X1M U81 ( .A0(n7), .A1(n136), .B0(N135), .B1(n48), .C0(n49), .C1(n133), 
        .Y(n44) );
  AOI221XLM U82 ( .A0(N108), .A1(n146), .B0(N99), .B1(n41), .C0(n46), .Y(n45)
         );
  AOI21X2M U83 ( .A0(n37), .A1(n38), .B0(n144), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U84 ( .A0(N100), .A1(n41), .B0(n42), .Y(n37) );
  AOI22X1M U85 ( .A0(n15), .A1(n39), .B0(N118), .B1(n40), .Y(n38) );
  INVX2M U86 ( .A(n6), .Y(n132) );
  OAI2B2X1M U87 ( .A1N(n5), .A0(n95), .B0(n5), .B1(n96), .Y(n94) );
  AOI221XLM U88 ( .A0(n145), .A1(n126), .B0(n9), .B1(n52), .C0(n147), .Y(n95)
         );
  AOI221XLM U89 ( .A0(n9), .A1(n145), .B0(n97), .B1(n126), .C0(n53), .Y(n96)
         );
  OAI221X1M U90 ( .A0(n10), .A1(n148), .B0(n50), .B1(n142), .C0(n150), .Y(n89)
         );
  OAI221X1M U91 ( .A0(n11), .A1(n148), .B0(n50), .B1(n141), .C0(n150), .Y(n82)
         );
  OAI221X1M U92 ( .A0(n12), .A1(n148), .B0(n50), .B1(n140), .C0(n150), .Y(n75)
         );
  OAI221X1M U93 ( .A0(n13), .A1(n148), .B0(n50), .B1(n139), .C0(n150), .Y(n68)
         );
  OAI221X1M U94 ( .A0(n14), .A1(n148), .B0(n50), .B1(n138), .C0(n150), .Y(n61)
         );
  OAI221X1M U95 ( .A0(n15), .A1(n148), .B0(n137), .B1(n50), .C0(n150), .Y(n49)
         );
  INVX2M U96 ( .A(n16), .Y(n128) );
  INVX2M U97 ( .A(n27), .Y(n130) );
  OAI21X2M U98 ( .A0(n59), .A1(n132), .B0(n60), .Y(n58) );
  AOI221XLM U99 ( .A0(n145), .A1(n138), .B0(n14), .B1(n52), .C0(n147), .Y(n59)
         );
  AOI22X1M U100 ( .A0(N134), .A1(n48), .B0(n61), .B1(n132), .Y(n60) );
  INVX2M U101 ( .A(n51), .Y(n136) );
  AOI221XLM U102 ( .A0(n52), .A1(n15), .B0(n137), .B1(n145), .C0(n147), .Y(n51) );
  INVX2M U103 ( .A(n9), .Y(n126) );
  BUFX2M U104 ( .A(ALU_FUN[3]), .Y(n4) );
  INVX2M U105 ( .A(n15), .Y(n137) );
  INVX2M U106 ( .A(n14), .Y(n138) );
  INVX2M U107 ( .A(n8), .Y(n143) );
  INVX2M U108 ( .A(n10), .Y(n142) );
  INVX2M U109 ( .A(n11), .Y(n141) );
  INVX2M U110 ( .A(n13), .Y(n139) );
  INVX2M U111 ( .A(n12), .Y(n140) );
  INVX2M U112 ( .A(n7), .Y(n133) );
  BUFX2M U113 ( .A(B[6]), .Y(n6) );
  BUFX2M U114 ( .A(B[7]), .Y(n7) );
  BUFX2M U115 ( .A(B[1]), .Y(n5) );
  BUFX2M U116 ( .A(A[5]), .Y(n13) );
  OAI21X2M U117 ( .A0(n87), .A1(n129), .B0(n88), .Y(n86) );
  AOI221XLM U118 ( .A0(n145), .A1(n142), .B0(n10), .B1(n52), .C0(n147), .Y(n87) );
  AOI22X1M U119 ( .A0(N130), .A1(n48), .B0(n89), .B1(n129), .Y(n88) );
  BUFX2M U120 ( .A(A[4]), .Y(n12) );
  BUFX2M U121 ( .A(A[3]), .Y(n11) );
  OAI21X2M U122 ( .A0(n80), .A1(n131), .B0(n81), .Y(n79) );
  AOI221XLM U123 ( .A0(n145), .A1(n141), .B0(n11), .B1(n52), .C0(n147), .Y(n80) );
  AOI22X1M U124 ( .A0(N131), .A1(n48), .B0(n82), .B1(n131), .Y(n81) );
  BUFX2M U125 ( .A(A[2]), .Y(n10) );
  OAI21X2M U126 ( .A0(n73), .A1(n135), .B0(n74), .Y(n72) );
  AOI221XLM U127 ( .A0(n145), .A1(n140), .B0(n12), .B1(n52), .C0(n147), .Y(n73) );
  AOI22X1M U128 ( .A0(N132), .A1(n48), .B0(n75), .B1(n135), .Y(n74) );
  INVX2M U129 ( .A(B[4]), .Y(n135) );
  BUFX2M U130 ( .A(A[0]), .Y(n8) );
  OAI21X2M U131 ( .A0(n66), .A1(n134), .B0(n67), .Y(n65) );
  AOI221XLM U132 ( .A0(n145), .A1(n139), .B0(n13), .B1(n52), .C0(n147), .Y(n66) );
  AOI22X1M U133 ( .A0(N133), .A1(n48), .B0(n68), .B1(n134), .Y(n67) );
  INVX2M U134 ( .A(B[5]), .Y(n134) );
  OAI2B2X1M U135 ( .A1N(B[0]), .A0(n108), .B0(B[0]), .B1(n109), .Y(n107) );
  AOI221XLM U136 ( .A0(n145), .A1(n143), .B0(n8), .B1(n52), .C0(n147), .Y(n108) );
  AOI221XLM U137 ( .A0(n8), .A1(n145), .B0(n97), .B1(n143), .C0(n53), .Y(n109)
         );
  INVX2M U138 ( .A(B[0]), .Y(n127) );
  INVX2M U139 ( .A(B[2]), .Y(n129) );
  AND3X2M U140 ( .A(n110), .B(ALU_FUN[1]), .C(n116), .Y(n48) );
  AOI21X2M U141 ( .A0(n117), .A1(n118), .B0(ALU_FUN[2]), .Y(n116) );
  NOR4X1M U142 ( .A(n7), .B(n6), .C(B[5]), .D(B[4]), .Y(n118) );
  NOR4X1M U143 ( .A(B[3]), .B(B[2]), .C(n5), .D(B[0]), .Y(n117) );
  INVX2M U144 ( .A(B[3]), .Y(n131) );
  NOR2X1M U145 ( .A(n137), .B(n7), .Y(n122) );
  NAND2BX1M U146 ( .AN(B[4]), .B(n12), .Y(n31) );
  NAND2BX1M U147 ( .AN(n12), .B(B[4]), .Y(n20) );
  CLKNAND2X2M U148 ( .A(n31), .B(n20), .Y(n33) );
  NOR2X1M U149 ( .A(n131), .B(n11), .Y(n28) );
  NOR2X1M U150 ( .A(n129), .B(n10), .Y(n19) );
  NOR2X1M U151 ( .A(n127), .B(n8), .Y(n16) );
  CLKNAND2X2M U152 ( .A(n10), .B(n129), .Y(n30) );
  NAND2BX1M U153 ( .AN(n19), .B(n30), .Y(n25) );
  AOI21X1M U154 ( .A0(n16), .A1(n126), .B0(n5), .Y(n17) );
  AOI211X1M U155 ( .A0(n9), .A1(n128), .B0(n25), .C0(n17), .Y(n18) );
  CLKNAND2X2M U156 ( .A(n11), .B(n131), .Y(n29) );
  OAI31X1M U157 ( .A0(n28), .A1(n19), .A2(n18), .B0(n29), .Y(n21) );
  NAND2BX1M U158 ( .AN(n13), .B(B[5]), .Y(n120) );
  OAI211X1M U159 ( .A0(n33), .A1(n21), .B0(n20), .C0(n120), .Y(n22) );
  NAND2BX1M U160 ( .AN(B[5]), .B(n13), .Y(n32) );
  XNOR2X1M U161 ( .A(n14), .B(n6), .Y(n119) );
  AOI32X1M U162 ( .A0(n22), .A1(n32), .A2(n119), .B0(n6), .B1(n138), .Y(n23)
         );
  CLKNAND2X2M U163 ( .A(n7), .B(n137), .Y(n123) );
  OAI21X1M U164 ( .A0(n122), .A1(n23), .B0(n123), .Y(N170) );
  CLKNAND2X2M U165 ( .A(n8), .B(n127), .Y(n26) );
  OA21X1M U166 ( .A0(n26), .A1(n126), .B0(n5), .Y(n24) );
  AOI211X1M U167 ( .A0(n26), .A1(n126), .B0(n25), .C0(n24), .Y(n27) );
  AOI31X1M U168 ( .A0(n130), .A1(n30), .A2(n29), .B0(n28), .Y(n34) );
  OAI2B11X1M U169 ( .A1N(n34), .A0(n33), .B0(n32), .C0(n31), .Y(n121) );
  AOI32X1M U170 ( .A0(n121), .A1(n120), .A2(n119), .B0(n14), .B1(n132), .Y(
        n124) );
  AOI2B1X1M U171 ( .A1N(n124), .A0(n123), .B0(n122), .Y(n125) );
  CLKINVX1M U172 ( .A(n125), .Y(N169) );
  NOR2X1M U173 ( .A(N170), .B(N169), .Y(N168) );
endmodule


module CLK_GATE ( CLK, CLK_en, gated_clk );
  input CLK, CLK_en;
  output gated_clk;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_en), .CK(CLK), .ECK(gated_clk) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_REF_RST, SYNC_UART_RST, UART_RX_V_OUT, UART_RX_V_SYNC,
         UART_TX_VLD, UART_TX_CLK, UART_TX_Busy_PULSE, FIFO_FULL,
         UART_TX_V_SYNC, UART_TX_Busy, UART_RX_CLK, ALU_OUT_VLD, RF_RdData_VLD,
         ALU_EN, RF_WrEn, RF_RdEn, CLKG_EN, ALU_CLK, n1, n2, n3, n4, n5, n6,
         n7;
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

  RST_SYNC_NUM_STAGES2_0 REF_RST_SYNC ( .clk(REF_CLK), .rst(RST_N), .SYNC_RST(
        SYNC_REF_RST) );
  RST_SYNC_NUM_STAGES2_1 UART_RST_SYNC ( .clk(UART_CLK), .rst(RST_N), 
        .SYNC_RST(SYNC_UART_RST) );
  DATA_SYNC_NUM_STAGES2_DATA_WIDTH8 DATA_sync_ref ( .CLK(REF_CLK), .RST(n6), 
        .bus_enable(UART_RX_V_OUT), .Unsync_bus(UART_RX_OUT), .sync_bus(
        UART_RX_SYNC), .enable_pulse(UART_RX_V_SYNC) );
  ASYNC_FIFO_ADDRES_WIDTH4_DATA_WIDTH8_FIFO_DEPTH8 U_FIFO ( .W_CLK(REF_CLK), 
        .W_RST(n6), .W_INC(UART_TX_VLD), .R_CLK(UART_TX_CLK), .R_RST(n4), 
        .R_INC(UART_TX_Busy_PULSE), .WR_DATA(UART_TX_IN), .FULL(FIFO_FULL), 
        .EMPTY(UART_TX_V_SYNC), .RD_DATA(UART_TX_SYNC) );
  PULSE_GEN U_PULSE_GEN ( .CLK(UART_TX_CLK), .RST(n4), .lvl_sig(UART_TX_Busy), 
        .pulse_sig(UART_TX_Busy_PULSE) );
  ClkDiv_0 Clk_Div_TX_CONS ( .i_ref_clk(UART_CLK), .i_rst(n4), .i_clk_en(1'b1), 
        .i_div_ratio(Div_RATIO), .o_div_clk(UART_TX_CLK) );
  CLKDIV_MUX CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]}) );
  ClkDiv_1 Clk_Div_RX_Prescale ( .i_ref_clk(UART_CLK), .i_rst(n4), .i_clk_en(
        1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), 
        .o_div_clk(UART_RX_CLK) );
  UART_TOP UART ( .RST(n4), .TX_CLK(UART_TX_CLK), .RX_CLK(UART_RX_CLK), 
        .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n1), .TX_OUT_S(UART_TX_O), .TX_OUT_V(
        UART_TX_Busy), .Prescale(UART_Config[7:2]), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error) );
  SYS_CTRL U_SYS_CTRL ( .CLK(REF_CLK), .RST(n6), .ALU_OUT(ALU_OUT), 
        .ALU_OUT_VALID(ALU_OUT_VLD), .RF_RdData(RF_RdData), .RF_RdData_VALID(
        RF_RdData_VLD), .UART_IN_DATA(UART_RX_SYNC), .UART_IN_VALID(
        UART_RX_V_SYNC), .FULL_FLAG(FIFO_FULL), .ALU_EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .RF_WrEn(RF_WrEn), .RF_RdEn(RF_RdEn), .RF_Addres(RF_Address), 
        .RF_WrData(RF_WrData), .TX_P_DATA(UART_TX_IN), .TX_D_VALID(UART_TX_VLD), .CLK_GATE_EN(CLKG_EN) );
  RegFile U_RegFile ( .CLK(REF_CLK), .RST(n6), .WrEn(RF_WrEn), .RdEn(RF_RdEn), 
        .Address({RF_Address[3:2], n3, n2}), .WrData(RF_WrData), .RdData(
        RF_RdData), .RdData_VLD(RF_RdData_VLD), .OP_A(Operand_A), .OP_B(
        Operand_B), .UART_CONFIG(UART_Config), .DIV_RATIO(Div_RATIO) );
  ALU U_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(ALU_FUN), 
        .CLK(ALU_CLK), .RST(n6), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VLD) );
  CLK_GATE U_CLK_GATE ( .CLK(REF_CLK), .CLK_en(CLKG_EN), .gated_clk(ALU_CLK)
         );
  INVX2M U2 ( .A(UART_TX_V_SYNC), .Y(n1) );
  BUFX2M U3 ( .A(RF_Address[1]), .Y(n3) );
  BUFX2M U4 ( .A(RF_Address[0]), .Y(n2) );
  INVX4M U5 ( .A(n7), .Y(n6) );
  INVX2M U6 ( .A(SYNC_REF_RST), .Y(n7) );
  INVX4M U7 ( .A(n5), .Y(n4) );
  INVX2M U8 ( .A(SYNC_UART_RST), .Y(n5) );
endmodule

