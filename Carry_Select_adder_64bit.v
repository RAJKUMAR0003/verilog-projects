`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PSG COLLEGE OF TECHNOLOGY
// Engineer:  RAJKUMAR V.B(18L237)
// 
// Create Date: 01.01.2021 10:41:33
// Design Name: 
// Module Name: carry_select_adder
// Project Name: CARRY SELECT 22-3-4-5 Adder 
// Target Devices: 
// Tool Versions: 2017.4 Xilinx Vivado
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module sum(s,a,b,cin);
    input a,b,cin;
    output s;
    wire t; 
    xor G1(t,a,b);
    xor G2(s,t,cin); 
endmodule 

module carry(cout,a,b,cin);
    input a,b,cin;
    output cout;
    wire [2:0]t;
    and G1(t[0],a,b);
    and G2(t[1],b,cin);
    and G3(t[2],a,cin);
    or G4(cout,t[0],t[1],t[2]);
endmodule 

module full_adder(sum,cout,a,b,cin);
    input a,b,cin;
    output sum,cout;
    sum S1(sum,a,b,cin);
    carry C1(cout,a,b,cin);  
endmodule

module mux2to1(out,a,b,sel);
    input a,b,sel;
    output out;
    wire t[2:0];
    not G1(t[0],sel);
    and G2(t[1],t[0],a);
    and G3(t[2],b,sel);
    or G4(out,t[1],t[2]);
endmodule

module adder_ripple_2(sum,carry_out,a,b,carry_in);
    input [1:0] a,b;
    input carry_in;
    output [1:0] sum;
    output carry_out;
    wire t;
    full_adder F1(sum[0],t,a[0],b[0],carry_in);
    full_adder F2(sum[1],carry_out,a[1],b[1],t);
endmodule

module adder_ripple_3(sum,carry_out,a,b,carry_in);
    input [2:0] a,b;
    input carry_in;
    output [2:0] sum;
    output carry_out;
    wire [1:0]t;
    full_adder F1(sum[0],t[0],a[0],b[0],carry_in);
    full_adder F2(sum[1],t[1],a[1],b[1],t[0]);
    full_adder F3(sum[2],carry_out,a[2],b[2],t[1]);
endmodule

module adder_ripple_4(sum,carry_out,a,b,carry_in);
    input [3:0] a,b;
    input carry_in;
    output [3:0] sum;
    output carry_out;
    wire [2:0]t;
    full_adder F1(sum[0],t[0],a[0],b[0],carry_in);
    full_adder F2(sum[1],t[1],a[1],b[1],t[0]);
    full_adder F3(sum[2],t[2],a[2],b[2],t[1]);
    full_adder F4(sum[3],carry_out,a[3],b[3],t[2]);
endmodule


module adder_ripple_5(sum,carry_out,a,b,carry_in);
    input [4:0] a,b;
    input carry_in;
    output [4:0] sum;
    output carry_out;
    wire [3:0]t;
    full_adder F1(sum[0],t[0],a[0],b[0],carry_in);
    full_adder F2(sum[1],t[1],a[1],b[1],t[0]);
    full_adder F3(sum[2],t[2],a[2],b[2],t[1]);
    full_adder F4(sum[3],t[3],a[3],b[3],t[2]);
    full_adder F5(sum[4],carry_out,a[4],b[4],t[3]);
endmodule




module carry_select_adder(sum,carry_out,a,b,carry_in);
    input [15:0]a,b;
    input carry_in;
    output[15:0]sum;
    output carry_out;
    wire [8:0]t;         // carrry out from full adder 
    wire [2:0]t_mux;   // output from mux 
    wire [1:0]t1;  //output sum from ripple carry adder 2(2bit)
    wire [1:0]t2;  //output sum from ripple carry adder 3(2bit)
    
    
    wire [2:0] t3; // output sum from ripple carry adder 4(3bit)
    wire [2:0] t4; // output sum from ripple carry adder 5(3bit)
    
    wire [3:0] t5; // output sum from ripple carry adder 6(4bit)
    wire [3:0] t6; // output sum from ripple carry adder 7(4bit)
    
    wire [4:0] t7; // output sum from ripple carry adder 8(5bit)
    wire [4:0] t8; // output sum from ripple carry adder 9(5bit)
    
    adder_ripple_2 ADD1(sum[1:0],t[0],a[1:0],b[1:0],carry_in);
    adder_ripple_2 ADD2(t1[1:0],t[1],a[3:2],b[3:2],1'b0);
    adder_ripple_2 ADD3(t2[1:0],t[2],a[3:2],b[3:2],1'b1);
    
    
    mux2to1 sum_select_mux_1(sum[2],t1[0],t2[0],t[0]);
    mux2to1 sum_select_mux_2(sum[3],t1[1],t2[1],t[0]);
    
    mux2to1 carry_select_mux_1(t_mux[0],t[1],t[2],t[0]);
    
    
    adder_ripple_3 ADD4(t3,t[3],a[6:4],b[6:4],1'b0);
    adder_ripple_3 ADD5(t4,t[4],a[6:4],b[6:4],1'b1);
    
    mux2to1 sum_select_mux_3(sum[4],t3[0],t4[0],t_mux[0]);
    mux2to1 sum_select_mux_4(sum[5],t3[1],t4[1],t_mux[0]);
    mux2to1 sum_select_mux_5(sum[6],t3[2],t4[2],t_mux[0]);
    
    mux2to1 carry_select_mux_2(t_mux[1],t[3],t[4],t_mux[0]);
    
    
    adder_ripple_4 ADD6(t5,t[5],a[10:7],b[10:7],1'b0);
    adder_ripple_4 ADD7(t6,t[6],a[10:7],b[10:7],1'b1);
    
    mux2to1 sum_select_mux_6(sum[7],t5[0],t6[0],t_mux[1]);
    mux2to1 sum_select_mux_7(sum[8],t5[1],t6[1],t_mux[1]);
    mux2to1 sum_select_mux_8(sum[9],t5[2],t6[2],t_mux[1]);
    mux2to1 sum_select_mux_9(sum[10],t5[3],t6[3],t_mux[1]);
    
    mux2to1 carry_select_mux_3(t_mux[2],t[5],t[6],t_mux[1]);
    
    adder_ripple_5 ADD8(t7,t[7],a[15:11],b[15:11],1'b0);
    adder_ripple_5 ADD9(t8,t[8],a[15:11],b[15:11],1'b1);
    
    mux2to1 sum_select_mux_10(sum[11],t7[0],t8[0],t_mux[2]);
    mux2to1 sum_select_mux_11(sum[12],t7[1],t8[1],t_mux[2]);
    mux2to1 sum_select_mux_12(sum[13],t7[2],t8[2],t_mux[2]);
    mux2to1 sum_select_mux_13(sum[14],t7[3],t8[3],t_mux[2]);
    mux2to1 sum_select_mux_14(sum[15],t7[4],t8[4],t_mux[2]);
    
    mux2to1 carry_select_mux_4(carry_out,t[7],t[8],t_mux[2]);
endmodule


module carry_select_64_bit(sum,carry_out,a,b,carry_in);
    input [63:0] a,b;
    input carry_in;
    output [63:0] sum;
    output carry_out;
    wire [2:0]t ;
    carry_select_adder  CS1(sum[15:0],t[0],a[15:0],b[15:0],carry_in);
    carry_select_adder  CS2(sum[31:16],t[1],a[31:16],b[31:16],t[0]);
    carry_select_adder  CS3(sum[47:32],t[2],a[47:32],b[47:32],t[1]);
    carry_select_adder  CS4(sum[63:48],carry_out,a[63:48],b[63:48],t[2]);
endmodule
