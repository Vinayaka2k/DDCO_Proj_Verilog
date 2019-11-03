`include "mylib.v"
`include "alu.v"
// Write code for modules you need here
module reg_16(input wire clk,reset,load,input wire [15:0] in, output wire[15:0] out);
	dfrl d0(.clk(clk),.reset(reset),.load(load),.in(in[0]),.out(out[0]));
	dfrl d1(.clk(clk),.reset(reset),.load(load),.in(in[1]),.out(out[1]));
	dfrl d2(.clk(clk),.reset(reset),.load(load),.in(in[2]),.out(out[2]));
	dfrl d3(.clk(clk),.reset(reset),.load(load),.in(in[3]),.out(out[3]));
	dfrl d4(.clk(clk),.reset(reset),.load(load),.in(in[4]),.out(out[4]));
	dfrl d5(.clk(clk),.reset(reset),.load(load),.in(in[5]),.out(out[5]));
	dfrl d6(.clk(clk),.reset(reset),.load(load),.in(in[6]),.out(out[6]));
	dfrl d7(.clk(clk),.reset(reset),.load(load),.in(in[7]),.out(out[7]));
	dfrl d8(.clk(clk),.reset(reset),.load(load),.in(in[8]),.out(out[8]));
	dfrl d9(.clk(clk),.reset(reset),.load(load),.in(in[9]),.out(out[9]));
	dfrl d10(.clk(clk),.reset(reset),.load(load),.in(in[10]),.out(out[10]));
	dfrl d11(.clk(clk),.reset(reset),.load(load),.in(in[11]),.out(out[11]));
	dfrl d12(.clk(clk),.reset(reset),.load(load),.in(in[12]),.out(out[12]));
	dfrl d13(.clk(clk),.reset(reset),.load(load),.in(in[13]),.out(out[13]));
	dfrl d14(.clk(clk),.reset(reset),.load(load),.in(in[14]),.out(out[14]));
	dfrl d15(.clk(clk),.reset(reset),.load(load),.in(in[15]),.out(out[15]));
endmodule

module reg16_8(input wire clk,reset,input wire [0:7] load,input wire [15:0] u,output wire [15:0] q0,q1,q2,q3,q4,q5,q6,q7);
	reg_16 r1(clk,reset,load[0],u,q0);
	reg_16 r2(clk,reset,load[1],u,q1);
	reg_16 r3(clk,reset,load[2],u,q2);
	reg_16 r4(clk,reset,load[3],u,q3);
	reg_16 r5(clk,reset,load[4],u,q4);
	reg_16 r6(clk,reset,load[5],u,q5);
	reg_16 r7(clk,reset,load[6],u,q6);
	reg_16 r8(clk,reset,load[7],u,q7);
endmodule

module mux8_16(input wire [15:0] i0,i1,i2,i3,i4,i5,i6,i7,input wire [2:0] rd_addr,output wire [15:0] o);
	mux8 m0({i0[0],i1[0],i2[0],i3[0],i4[0],i5[0],i6[0],i7[0]},rd_addr[0],rd_addr[1],rd_addr[2],o[0]);
	mux8 m1({i0[1],i1[1],i2[1],i3[1],i4[1],i5[1],i6[1],i7[1]},rd_addr[0],rd_addr[1],rd_addr[2],o[1]);
	mux8 m2({i0[2],i1[2],i2[2],i3[2],i4[2],i5[2],i6[2],i7[2]},rd_addr[0],rd_addr[1],rd_addr[2],o[2]);
	mux8 m3({i0[3],i1[3],i2[3],i3[3],i4[3],i5[3],i6[3],i7[3]},rd_addr[0],rd_addr[1],rd_addr[2],o[3]);
	mux8 m4({i0[4],i1[4],i2[4],i3[4],i4[4],i5[4],i6[4],i7[4]},rd_addr[0],rd_addr[1],rd_addr[2],o[4]);
	mux8 m5({i0[5],i1[5],i2[5],i3[5],i4[5],i5[5],i6[5],i7[5]},rd_addr[0],rd_addr[1],rd_addr[2],o[5]);
	mux8 m6({i0[6],i1[6],i2[6],i3[6],i4[6],i5[6],i6[6],i7[6]},rd_addr[0],rd_addr[1],rd_addr[2],o[6]);
	mux8 m7({i0[7],i1[7],i2[7],i3[7],i4[7],i5[7],i6[7],i7[7]},rd_addr[0],rd_addr[1],rd_addr[2],o[7]);
	mux8 m8({i0[8],i1[8],i2[8],i3[8],i4[8],i5[8],i6[8],i7[8]},rd_addr[0],rd_addr[1],rd_addr[2],o[8]);
	mux8 m9({i0[9],i1[9],i2[9],i3[9],i4[9],i5[9],i6[9],i7[9]},rd_addr[0],rd_addr[1],rd_addr[2],o[9]);
	mux8 m10({i0[10],i1[10],i2[10],i3[10],i4[10],i5[10],i6[10],i7[10]},rd_addr[0],rd_addr[1],rd_addr[2],o[10]);
	mux8 m11({i0[11],i1[11],i2[11],i3[11],i4[11],i5[11],i6[11],i7[11]},rd_addr[0],rd_addr[1],rd_addr[2],o[11]);
	mux8 m12({i0[12],i1[12],i2[12],i3[12],i4[12],i5[12],i6[12],i7[12]},rd_addr[0],rd_addr[1],rd_addr[2],o[12]);
	mux8 m13({i0[13],i1[13],i2[13],i3[13],i4[13],i5[13],i6[13],i7[13]},rd_addr[0],rd_addr[1],rd_addr[2],o[13]);
	mux8 m14({i0[14],i1[14],i2[14],i3[14],i4[14],i5[14],i6[14],i7[14]},rd_addr[0],rd_addr[1],rd_addr[2],o[14]);
	mux8 m15({i0[15],i1[15],i2[15],i3[15],i4[15],i5[15],i6[15],i7[15]},rd_addr[0],rd_addr[1],rd_addr[2],o[15]);
endmodule	

module reg_file (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b);

// Declare wires here
	wire [0:7] load;
	wire[15:0] q0,q1,q2,q3,q4,q5,q6,q7;
// Instantiate modules here
	demux8 d8(.i(wr),.j2(wr_addr[2]),.j1(wr_addr[1]),.j0(wr_addr[0]),.o(load));
   	reg16_8 r16(clk,reset,load,d_in,q0,q1,q2,q3,q4,q5,q6,q7);
	mux8_16 m8(q0,q1,q2,q3,q4,q5,q6,q7,rd_addr_a,d_out_a);
	mux8_16 m9(q0,q1,q2,q3,q4,q5,q6,q7,rd_addr_b,d_out_b);
endmodule


module mux2_16(input wire op,input wire [15:0]i0,i1,output wire [15:0]o);
mux2 m1(i0[15],i1[15],op,o[15]);
mux2 m2(i0[14],i1[14],op,o[14]);
mux2 m3(i0[13],i1[13],op,o[13]);
mux2 m4(i0[12],i1[12],op,o[12]);
mux2 m5(i0[11],i1[11],op,o[11]);
mux2 m6(i0[10],i1[10],op,o[10]);
mux2 m7(i0[9],i1[9],op,o[9]);
mux2 m8(i0[8],i1[8],op,o[8]);
mux2 m9(i0[7],i1[7],op,o[7]);
mux2 m10(i0[6],i1[6],op,o[6]);
mux2 m11(i0[5],i1[5],op,o[5]);
mux2 m12(i0[4],i1[4],op,o[4]);
mux2 m13(i0[3],i1[3],op,o[3]);
mux2 m14(i0[2],i1[2],op,o[2]);
mux2 m15(i0[1],i1[1],op,o[1]);
mux2 m16(i0[0],i1[0],op,o[0]);
endmodule

module reg_alu (input wire clk, reset, slt_sel,sel,main_sel,sft_sel,ryt_sft_sel,wr, input wire [1:0] op,input wire[3:0]sft_op, input wire [2:0] rd_addr_a,rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b, output wire cout);
// Declare wires here
wire [15:0] reg_write_ip,alu_wire_op;
wire cout1;
// Instantiate modules here
reg_file rf(clk,reset,wr,rd_addr_a,rd_addr_b,wr_addr,reg_write_ip,d_out_a,d_out_b);
mux2_16 m216(sel,d_in,alu_wire_op,reg_write_ip);
alu A(slt_sel,main_sel,sft_sel,ryt_sft_sel,op,sft_op,d_out_a,d_out_b,alu_wire_op,cout1);
dfr d(clk,reset,cout1,cout);
endmodule

