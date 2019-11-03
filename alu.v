module fa (input wire i0, i1, cin, output wire sum, cout);
wire w0,w1,w2;
xor3 x1(i0,i1,cin,sum);
and2 A1(i0,i1,w0);
and2 A2(i1,cin,w1);
and2 A3(cin,i0,w2);
or3 o1(w0,w1,w2,cout);
endmodule

module addsub (input wire addsub, i0, i1, cin, output wire sumdiff, cout);
wire w4;
xor2 x3(i1,addsub,w4);
fa d(i0,w4,cin,sumdiff,cout);
endmodule 

module alu_slice (input wire [1:0] op, input wire i0, i1, cin, output wire o, cout);
wire c1,c2,mo1,mo2,o1;
addsub a1(op[0],i0,i1,cin,o1,cout);
and2 A4(i0,i1,c1);
or2 o2(i0,i1,c2);
mux2 m1(c1,c2,op[0],mo1);
mux2 m2(o1,mo1,op[1],o);
endmodule

module shift(input wire sft_sel,ryt_sft_sel,input wire[3:0]op ,input wire[15:0]a,output wire [15:0]o);
wire [15:0]y,y1,y2,y3;
sll S4(op,a,y1);
srl S5(op,a,y2);
sra s6(op,a,y3);
assign y= (ryt_sft_sel==1'b0)? y2 : y3;
assign o= (sft_sel==1'b0)? y1 : y;
endmodule

module sll(input wire [3:0] op,input wire [15:0]a, output wire [15:0]y);
mux16 A({a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[0]);
mux16 A1({a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[1]);
mux16 A2({a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[2]);
mux16 A3({a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[3]);
mux16 A4({a[4],a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[4]);
mux16 A5({a[5],a[4],a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[5]);
mux16 A6({a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[6]);
mux16 A7({a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[7]);
mux16 A8({a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[8]);
mux16 A9({a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[9]);
mux16 A10({a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[10]);
mux16 A11({a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[11]);
mux16 A12({a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y[12]);
mux16 A13({a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0,1'b0},op[0],op[1],op[2],op[3],y[13]);
mux16 A14({a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0},op[0],op[1],op[2],op[3],y[14]);
mux16 A15({a[15],a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0]},op[0],op[1],op[2],op[3],y[15]);
endmodule

module srl(input wire [3:0] op,input wire [15:0]a1, output wire [15:0]y1);
mux16 B ({a1[0],a1[1],a1[2],a1[3],a1[4],a1[5],a1[6],a1[7],a1[8],a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15]},op[0],op[1],op[2],op[3],y1[0]);
mux16 B1({a1[1],a1[2],a1[3],a1[4],a1[5],a1[6],a1[7],a1[8],a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0},op[0],op[1],op[2],op[3],y1[1]);
mux16 B2({a1[2],a1[3],a1[4],a1[5],a1[6],a1[7],a1[8],a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0},op[0],op[1],op[2],op[3],y1[2]);
mux16 B3({a1[3],a1[4],a1[5],a1[6],a1[7],a1[8],a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[3]);
mux16 B4({a1[4],a1[5],a1[6],a1[7],a1[8],a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[4]);
mux16 B5({a1[5],a1[6],a1[7],a1[8],a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[5]);
mux16 B6({a1[6],a1[7],a1[8],a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[6]);
mux16 B7({a1[7],a1[8],a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[7]);
mux16 B8({a1[8],a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[8]);
mux16 B9({a1[9],a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[9]);
mux16 B10({a1[10],a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[10]);
mux16 B11({a1[11],a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[11]);
mux16 B12({a1[12],a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[12]);
mux16 B13({a1[13],a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[13]);
mux16 B14({a1[14],a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[14]);
mux16 B15({a1[15],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0},op[0],op[1],op[2],op[3],y1[15]);
endmodule

module sra(input wire [3:0] op,input wire [15:0]a, output wire [15:0]t);
mux16  C({a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15]},op[0],op[1],op[2],op[3],t[0]);
mux16 C1({a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[15]},op[0],op[1],op[2],op[3],t[1]);
mux16 C2({a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[2]);
mux16 C3({a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[3]);
mux16 C4({a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[4]);
mux16 C5({a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[5]);
mux16 C6({a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[6]);
mux16 C7({a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[7]);
mux16 C8({a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[8]);
mux16 C9({a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[9]);
mux16 C10({a[10],a[11],a[12],a[13],a[14],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[10]);
mux16 C11({a[11],a[12],a[13],a[14],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[11]);
mux16 C12({a[12],a[13],a[14],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[12]);
mux16 C13({a[13],a[14],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[13]);
mux16 C14({a[14],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[14]);
mux16 C15({a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15]},op[0],op[1],op[2],op[3],t[15]);
endmodule

module slt(input wire [15:0] i0, i1,output wire [15:0] r);
output wire [15:0]temp;
others O9(2'b01,i0,i1,temp);
assign r= (temp[15]==1'b1)?16'd1:16'd0;
endmodule

module others(input wire [1:0]op, input wire [15:0]i0,i1, output wire[15:0]o);
output wire [14:0]c;
alu_slice S1(op,i0[0],i1[0],op[0],o[0],c[0]);
alu_slice S2(op,i0[1],i1[1],c[0],o[1],c[1]);
alu_slice S3(op,i0[2],i1[2],c[1],o[2],c[2]);
alu_slice S4(op,i0[3],i1[3],c[2],o[3],c[3]);
alu_slice S5(op,i0[4],i1[4],c[3],o[4],c[4]);
alu_slice S6(op,i0[5],i1[5],c[4],o[5],c[5]);
alu_slice S7(op,i0[6],i1[6],c[5],o[6],c[6]);
alu_slice S8(op,i0[7],i1[7],c[6],o[7],c[7]);
alu_slice S9(op,i0[8],i1[8],c[7],o[8],c[8]);
alu_slice S10(op,i0[9],i1[9],c[8],o[9],c[9]);
alu_slice S11(op,i0[10],i1[10],c[9],o[10],c[10]);
alu_slice S12(op,i0[11],i1[11],c[10],o[11],c[11]);
alu_slice S13(op,i0[12],i1[12],c[11],o[12],c[12]);
alu_slice S14(op,i0[13],i1[13],c[12],o[13],c[13]);
alu_slice S15(op,i0[14],i1[14],c[13],o[14],c[14]);
alu_slice S16(op,i0[15],i1[15],c[14],o[15],cout);
endmodule


module alu (input wire slt_sel,main_sel,sft_sel,ryt_sft_sel,input wire [1:0] op,input wire [3:0] sft_op, input wire [15:0] i0, i1,output wire [15:0] o, output wire cout);
wire [15:0]u,u1,p,p1;
others O(op,i0,i1,p);
slt S0(i0,i1,p1);
assign u=(slt_sel==1'b0)?p:p1;
shift S9(sft_sel,ryt_sft_sel,sft_op,i0,u1);
assign o =(main_sel == 1'b0)? u : u1;
endmodule

