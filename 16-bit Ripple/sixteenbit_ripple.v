`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 	 	 Jonathan Whitaker
// 
// Create Date:    15:24:15 02/06/2014 
// Module Name:    sixteenbit_ripple 
// Description:    This verilog module implements a 16-bit ripple carry adder. It
//						 does so by instantiating 4x4-bit ripple carry adder.
//
//////////////////////////////////////////////////////////////////////////////////
module sixteenbit_ripple(input [15:0] X,input [15:0] Y,
								 input Cin, output [15:0] Sum,output Cout);
	
	// Create three wires to store the intermediate carry outs for
	// each of the stages.
	wire W1, W2, W3;
	
	// Instantiate four ripple carry adders to compute the sum and
	// carry out bits appropriately.
	fourbit_ripple S0(X[3:0], Y[3:0], Cin, Sum[3:0], W1);
	fourbit_ripple S1(X[7:4], Y[7:4], W1, Sum[7:4], W2);
	fourbit_ripple S2(X[11:8], Y[11:8], W2, Sum[11:8], W3);
	fourbit_ripple S3(X[15:12], Y[15:12], W3, Sum[15:12], Cout);

endmodule
