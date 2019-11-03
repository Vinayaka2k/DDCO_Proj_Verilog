`timescale 1 ns / 100 ps
`define TESTVECS 29

module tb;
  reg clk, reset, slt_sel,wr, sel,main_sel,sft_sel,ryt_sft_sel;
  reg [1:0] op;
  reg [3:0]sft_op;
  reg [2:0] rd_addr_a, rd_addr_b, wr_addr; reg [15:0] d_in;
  wire [15:0] d_out_a, d_out_b;
  reg [36:0] test_vecs [0:(`TESTVECS-1)];
  integer i;
  initial begin $dumpfile("tb_reg_alu.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1;    #0 reset = 1'b0;    end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
							// reg-store
    test_vecs[0][36] = 1'b0;
    test_vecs[0][35] = 1'b0;      test_vecs[0][34] = 1'b1;       test_vecs[0][33] = 1'b0;       test_vecs[0][32] = 1'b0;   
    test_vecs[0][31] = 1'b1;      test_vecs[0][30:29] = 2'b00;   test_vecs[0][28:25] = 4'b0000; test_vecs[0][24:22] = 3'o0; 
    test_vecs[0][21:19] = 3'ox;   test_vecs[0][18:16] = 3'h0;    test_vecs[0][15:0] = 16'd1023;

    test_vecs[1][36] = 1'b0;
    test_vecs[1][35] = 1'b0;      test_vecs[1][34] = 1'b1;       test_vecs[1][33] = 1'b0;       test_vecs[1][32] = 1'b0; 
    test_vecs[1][31] = 1'b1;      test_vecs[1][30:29] = 2'b00;   test_vecs[1][28:25] = 4'b0000; test_vecs[1][24:22] = 3'o0; 
    test_vecs[1][21:19] = 3'ox;   test_vecs[1][18:16] = 3'h1;    test_vecs[1][15:0] = 16'd0907;

    test_vecs[2][36] = 1'b0;
    test_vecs[2][35] = 1'b0;      test_vecs[2][34] = 1'b1;       test_vecs[2][33] = 1'b0;        test_vecs[2][32] = 1'b0; 
    test_vecs[2][31] = 1'b1;      test_vecs[2][30:29] = 2'b00;   test_vecs[2][28:25] = 4'b0000;  test_vecs[2][24:22] = 3'o1;
    test_vecs[2][21:19] = 3'o7;   test_vecs[2][18:16] = 3'h2;    test_vecs[2][15:0] = 16'd32769;

    test_vecs[3][36] = 1'b0;
    test_vecs[3][35] = 1'b0;      test_vecs[3][34] = 1'b1;       test_vecs[3][33] = 1'b0;        test_vecs[3][32] = 1'b0; 
    test_vecs[3][31] = 1'b1;      test_vecs[3][30:29] = 2'b00;   test_vecs[3][28:25] = 4'b0000;  test_vecs[3][24:22] = 3'o2; 
    test_vecs[3][21:19] = 3'o5;   test_vecs[3][18:16] = 3'h3;    test_vecs[3][15:0] = 16'd0678;
   
    test_vecs[4][36] = 1'b0;
    test_vecs[4][35] = 1'b0;      test_vecs[4][34] = 1'b1;       test_vecs[4][33] = 1'b0;         test_vecs[4][32] = 1'b0; 
    test_vecs[4][31] = 1'b1;      test_vecs[4][30:29] = 2'b00;   test_vecs[4][28:25] = 4'b0000;   test_vecs[4][24:22] = 3'o3; 
    test_vecs[4][21:19] = 3'o5;   test_vecs[4][18:16] = 3'h4;    test_vecs[4][15:0] = 16'd41245;

    test_vecs[5][36] = 1'b0;
    test_vecs[5][35] = 1'b0;      test_vecs[5][34] = 1'b1;       test_vecs[5][33] = 1'b0;         test_vecs[5][32] = 1'b0; 
    test_vecs[5][31] = 1'b1;      test_vecs[5][30:29] = 2'b00;   test_vecs[5][28:25] = 4'b0000;   test_vecs[5][24:22] = 3'o4; 
    test_vecs[5][21:19] = 3'o5;   test_vecs[5][18:16] = 3'h5;    test_vecs[5][15:0] = 16'd37119;

    test_vecs[6][36] = 1'b0;
    test_vecs[6][35] = 1'b0;      test_vecs[6][34] = 1'b1;       test_vecs[6][33] = 1'b0;         test_vecs[6][32] = 1'b0; 
    test_vecs[6][31] = 1'b1;      test_vecs[6][30:29] = 2'b00;   test_vecs[6][28:25] = 4'b0000;   test_vecs[6][24:22] = 3'o5;
    test_vecs[6][21:19] = 3'o7;   test_vecs[6][18:16] = 3'h6;    test_vecs[6][15:0] = 16'd33809;
    
    test_vecs[7][36] = 1'b0;
    test_vecs[7][35] = 1'b0;      test_vecs[7][34] = 1'b1;       test_vecs[7][33] = 1'b0;         test_vecs[7][32] = 1'b0;
    test_vecs[7][31] = 1'b1;      test_vecs[7][30:29] = 2'b00;   test_vecs[7][28:25] = 4'b0000;   test_vecs[7][24:22] = 3'o6; 
    test_vecs[7][21:19] = 3'o5;   test_vecs[7][18:16] = 3'h7;    test_vecs[7][15:0] = 16'd0101;   
   
								 //left-shift

    test_vecs[8][36] = 1'b0;
    test_vecs[8][35] = 1'b1;      test_vecs[8][34] = 1'b1;       test_vecs[8][33] = 1'b0;         test_vecs[8][32] = 1'b0;
    test_vecs[8][31] = 1'b1;      test_vecs[8][30:29] = 2'b00;   test_vecs[8][28:25] = 4'd0;      test_vecs[8][24:22] = 3'o2;
    test_vecs[8][21:19] = 3'o5;   test_vecs[8][18:16] = 3'h1;    test_vecs[8][15:0] = 16'd0101;   

    test_vecs[9][36] = 1'b0;
    test_vecs[9][35] = 1'b1;      test_vecs[9][34] = 1'b1;       test_vecs[9][33] = 1'b0;         test_vecs[9][32] = 1'b0; 
    test_vecs[9][31] = 1'b1;      test_vecs[9][30:29] = 2'b00;   test_vecs[9][28:25] = 4'd1;      test_vecs[9][24:22] = 3'o0;
    test_vecs[9][21:19] = 3'o5;   test_vecs[9][18:16] = 3'h1;    test_vecs[9][15:0] = 16'd0101;   

    test_vecs[10][36] = 1'b0;
    test_vecs[10][35] = 1'b1;     test_vecs[10][34] = 1'b1;      test_vecs[10][33] = 1'b0;        test_vecs[10][32] = 1'b0;
    test_vecs[10][31] = 1'b1;     test_vecs[10][30:29] = 2'b00;  test_vecs[10][28:25] = 4'd2;     test_vecs[10][24:22] = 3'o1;
    test_vecs[10][21:19] = 3'o5;  test_vecs[10][18:16] = 3'h1;   test_vecs[10][15:0] = 16'd0101;   

    test_vecs[11][36] = 1'b0;
    test_vecs[11][35] = 1'b1;     test_vecs[11][34] = 1'b1;      test_vecs[11][33] = 1'b0;        test_vecs[11][32] = 1'b0;
    test_vecs[11][31] = 1'b1;     test_vecs[11][30:29] = 2'b00;  test_vecs[11][28:25] = 4'd3;     test_vecs[11][24:22] = 3'o2;
    test_vecs[11][21:19] = 3'o5;  test_vecs[11][18:16] = 3'h1;   test_vecs[11][15:0] = 16'd0101;   

    test_vecs[12][36] = 1'b0;
    test_vecs[12][35] = 1'b1;    test_vecs[12][34] = 1'b1;       test_vecs[12][33] = 1'b0;        test_vecs[12][32] = 1'b0; 
    test_vecs[12][31] = 1'b1;    test_vecs[12][30:29] = 2'b00;   test_vecs[12][28:25] = 4'd4;     test_vecs[12][24:22] = 3'o3;
    test_vecs[12][21:19] = 3'o5; test_vecs[12][18:16] = 3'h1;    test_vecs[12][15:0] = 16'd0101;   

    test_vecs[13][36] = 1'b0;
    test_vecs[13][35] = 1'b1;    test_vecs[13][34] = 1'b1;       test_vecs[13][33] = 1'b0;        test_vecs[13][32] = 1'b0;
    test_vecs[13][31] = 1'b1;    test_vecs[13][30:29] = 2'b00;   test_vecs[13][28:25] = 4'd5;     test_vecs[13][24:22] = 3'o4; 
    test_vecs[13][21:19] = 3'o5; test_vecs[13][18:16] = 3'h1;    test_vecs[13][15:0] = 16'd0101;   
  
    test_vecs[14][36] = 1'b0;
    test_vecs[14][35] = 1'b1;    test_vecs[14][34] = 1'b1;       test_vecs[14][33] = 1'b0;        test_vecs[14][32] = 1'b0;
    test_vecs[14][31] = 1'b1;    test_vecs[14][30:29] = 2'b00;   test_vecs[14][28:25] = 4'd6;     test_vecs[14][24:22] = 3'o5; 
    test_vecs[14][21:19] = 3'o5; test_vecs[14][18:16] = 3'h1;    test_vecs[14][15:0] = 16'd0101;   

    test_vecs[15][36] = 1'b0;
    test_vecs[15][35] = 1'b1;    test_vecs[15][34] = 1'b1;       test_vecs[15][33] = 1'b0;        test_vecs[15][32] = 1'b0; 
    test_vecs[15][31] = 1'b1;    test_vecs[15][30:29] = 2'b00;   test_vecs[15][28:25] = 4'd7;     test_vecs[15][24:22] = 3'o6;
    test_vecs[15][21:19] = 3'o5; test_vecs[15][18:16] = 3'h1;    test_vecs[15][15:0] = 16'd0101;   

    test_vecs[16][36] = 1'b0;
    test_vecs[16][35] = 1'b1;    test_vecs[16][34] = 1'b1;       test_vecs[16][33] = 1'b0;        test_vecs[16][32] = 1'b0;
    test_vecs[16][31] = 1'b1;    test_vecs[16][30:29] = 2'b00;   test_vecs[16][28:25] = 4'b0010;  test_vecs[16][24:22] = 3'o7;
    test_vecs[16][21:19] = 3'o5; test_vecs[16][18:16] = 3'h1;    test_vecs[16][15:0] = 16'd0101;   

										//	 logical-right-shift

    test_vecs[17][36] = 1'b0;
    test_vecs[17][35] = 1'b1;    test_vecs[17][34] = 1'b1;       test_vecs[17][33] = 1'b1;        test_vecs[17][32] = 1'b0;   
    test_vecs[17][31] = 1'b1;    test_vecs[17][30:29] = 2'b00;   test_vecs[17][28:25] = 4'd3;     test_vecs[17][24:22] = 3'o5; 
    test_vecs[17][21:19] = 3'o5; test_vecs[17][18:16] = 3'h1;    test_vecs[17][15:0] = 16'd0101;  

    test_vecs[18][36] = 1'b0;
    test_vecs[18][35] = 1'b1;    test_vecs[18][34] = 1'b1;       test_vecs[18][33] = 1'b1;        test_vecs[18][32] = 1'b0;
    test_vecs[18][31] = 1'b1;    test_vecs[18][30:29] = 2'b00;   test_vecs[18][28:25] = 4'd2;     test_vecs[18][24:22] = 3'o0;
    test_vecs[18][21:19] = 3'o5; test_vecs[18][18:16] = 3'h1;    test_vecs[18][15:0] = 16'd0101;   

    test_vecs[19][36] = 1'b0;
    test_vecs[19][35] = 1'b1;    test_vecs[19][34] = 1'b1;       test_vecs[19][33] = 1'b1;        test_vecs[19][32] = 1'b0;
    test_vecs[19][31] = 1'b1;    test_vecs[19][30:29] = 2'b00;   test_vecs[19][28:25] = 4'd3;     test_vecs[19][24:22] = 3'o7; 
    test_vecs[19][21:19] = 3'o5; test_vecs[19][18:16] = 3'h1;    test_vecs[19][15:0] = 16'd0101;   

    test_vecs[20][36] = 1'b0;
    test_vecs[20][35] = 1'b1;    test_vecs[20][34] = 1'b1;       test_vecs[20][33] = 1'b1;        test_vecs[20][32] = 1'b0;   
    test_vecs[20][31] = 1'b1;    test_vecs[20][30:29] = 2'b00;   test_vecs[20][28:25] = 4'd4;     test_vecs[20][24:22] = 3'o2; 
    test_vecs[20][21:19] = 3'o5; test_vecs[20][18:16] = 3'h1;    test_vecs[20][15:0] = 16'd0101;   

    
										//arith- right-shift

    test_vecs[21][36] = 1'b0;
    test_vecs[21][35] = 1'b1;    test_vecs[21][34] = 1'b1;       test_vecs[21][33] = 1'b1;        test_vecs[21][32] = 1'b1;
    test_vecs[21][31] = 1'b1;    test_vecs[21][30:29] = 2'b00;   test_vecs[21][28:25] = 4'd5;     test_vecs[21][24:22] = 3'o4;
    test_vecs[21][21:19] = 3'o5; test_vecs[21][18:16] = 3'h1;    test_vecs[21][15:0] = 16'd0101;   
  
    test_vecs[22][36] = 1'b0;
    test_vecs[22][35] = 1'b1;    test_vecs[22][34] = 1'b1;       test_vecs[22][33] = 1'b1;        test_vecs[22][32] = 1'b1; 
    test_vecs[22][31] = 1'b1;    test_vecs[22][30:29] = 2'b00;   test_vecs[22][28:25] = 4'd6;     test_vecs[22][24:22] = 3'o5;
    test_vecs[22][21:19] = 3'o5; test_vecs[22][18:16] = 3'h1;    test_vecs[22][15:0] = 16'd0101;   

    test_vecs[23][36] = 1'b0;
    test_vecs[23][35] = 1'b1;    test_vecs[23][34] = 1'b1;       test_vecs[23][33] = 1'b1;        test_vecs[23][32] = 1'b1;
    test_vecs[23][31] = 1'b1;    test_vecs[23][30:29] = 2'b00;   test_vecs[23][28:25] = 4'd7;     test_vecs[23][24:22] = 3'o6;
    test_vecs[23][21:19] = 3'o5; test_vecs[23][18:16] = 3'h1;    test_vecs[23][15:0] = 16'd0101;   

    test_vecs[24][36] = 1'b0;
    test_vecs[24][35] = 1'b1;    test_vecs[24][34] = 1'b1;       test_vecs[24][33] = 1'b1;        test_vecs[24][32] = 1'b1;
    test_vecs[24][31] = 1'b1;    test_vecs[24][30:29] = 2'b00;   test_vecs[24][28:25] = 4'd2;     test_vecs[24][24:22] = 3'o2; 
    test_vecs[24][21:19] = 3'o5; test_vecs[24][18:16] = 3'h1;    test_vecs[24][15:0] = 16'd0101;   
										
										// slt

    test_vecs[25][36] = 1'b1;
    test_vecs[25][35] = 1'b1;    test_vecs[25][34] = 1'b0;       test_vecs[25][33] = 1'b1;        test_vecs[25][32] = 1'b1;
    test_vecs[25][31] = 1'b1;    test_vecs[25][30:29] = 2'b00;   test_vecs[25][28:25] = 4'd5;     test_vecs[25][24:22] = 3'o7;
    test_vecs[25][21:19] = 3'o3; test_vecs[25][18:16] = 3'h1;    test_vecs[25][15:0] = 16'd0101;   
  
    test_vecs[26][36] = 1'b1;
    test_vecs[26][35] = 1'b1;    test_vecs[26][34] = 1'b0;       test_vecs[26][33] = 1'b1;        test_vecs[26][32] = 1'b1; 
    test_vecs[26][31] = 1'b1;    test_vecs[26][30:29] = 2'b00;   test_vecs[26][28:25] = 4'd6;     test_vecs[26][24:22] = 3'o3;
    test_vecs[26][21:19] = 3'o7; test_vecs[26][18:16] = 3'h1;    test_vecs[26][15:0] = 16'd0101;   

    test_vecs[27][36] = 1'b1;
    test_vecs[27][35] = 1'b1;    test_vecs[27][34] = 1'b0;       test_vecs[27][33] = 1'b1;        test_vecs[27][32] = 1'b1;
    test_vecs[27][31] = 1'b1;    test_vecs[27][30:29] = 2'b00;   test_vecs[27][28:25] = 4'd7;     test_vecs[27][24:22] = 3'o0;
    test_vecs[27][21:19] = 3'o3; test_vecs[27][18:16] = 3'h1;    test_vecs[27][15:0] = 16'd0101;   

    test_vecs[28][36] = 1'b1;
    test_vecs[28][35] = 1'b1;    test_vecs[28][34] = 1'b0;       test_vecs[28][33] = 1'b1;        test_vecs[28][32] = 1'b1;
    test_vecs[28][31] = 1'b1;    test_vecs[28][30:29] = 2'b00;   test_vecs[28][28:25] = 4'd2;     test_vecs[28][24:22] = 3'o7; 
    test_vecs[28][21:19] = 3'o0; test_vecs[28][18:16] = 3'h1;    test_vecs[28][15:0] = 16'd0101;  

  end
  initial {slt_sel,sel,main_sel,sft_sel,ryt_sft_sel, wr, op, sft_op,rd_addr_a, rd_addr_b, wr_addr, d_in} = 0;
  reg_alu ALU(clk, reset,slt_sel, sel, main_sel,sft_sel,ryt_sft_sel,wr, op, sft_op, rd_addr_a, rd_addr_b, wr_addr, d_in,
  d_out_a, d_out_b, cout);
  initial begin
    #0
 for(i=0;i<`TESTVECS;i=i+1)
      begin #10 {slt_sel,sel,main_sel,sft_sel,ryt_sft_sel, wr, op, sft_op, rd_addr_a, rd_addr_b, wr_addr, d_in}=test_vecs[i]; end
    #100 $finish;
  end
endmodule
