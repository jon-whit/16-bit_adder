`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 		 Jonathan Whitaker
// 
// Create Date:    21:30:27 01/30/2014 
// Module Name:    fourbit_ripple 
// Description: 	 This verilog module implements a 4-bit ripple carry adder.
//
//////////////////////////////////////////////////////////////////////////////////
module fourbit_ripple(input [3:0] X,input [3:0] Y,input Cin,
						   output [3:0] Sum,output Cout);
							
	// Create three wires to use for the intermediate carry outs for
	// three of the stages in the 4-bit ripple carry adder.
	wire W1, W2, W3;
	
	// Combine four full adders and ripple the carry out to each
	// subsequent adder. Assign each intermediate sum, and at the
	// end assign the carry out.
	full_adder s0(X[0], Y[0], Cin, Sum[0], W1);
	full_adder s1(X[1], Y[1], W1, Sum[1], W2);
	full_adder s2(X[2], Y[2], W2, Sum[2], W3);
	full_adder s3(X[3], Y[3], W3, Sum[3], Cout);


endmodule
