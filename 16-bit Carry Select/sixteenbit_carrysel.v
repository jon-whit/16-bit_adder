`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 		 Jonathan Whitaker
// 
// Create Date:    14:47:04 02/06/2014 
// Module Name:    sixteenbit_carrysel 
// Description: 	 This verilog module implements a 16 bit carry select adder by
// 					 instantiating 4x4-bit carry select adders.
//////////////////////////////////////////////////////////////////////////////////
module sixteenbit_carrysel(input [15:0] X,input [15:0] Y,
								   input Cin,output [15:0] Sum,output Cout);
						
	// Declare three wires to hold temporary values between the carry select
	// blocks.
	wire W1, W2, W3;
	
	// Instantiate four 4-bit carry select adders to compute the 16-bit sum.
	// Set the sum bits and carry out bit appropriately.
	fourbit_carrysel CS1(X[3:0], Y[3:0], Cin, Sum[3:0], W1);
	fourbit_carrysel CS2(X[7:4], Y[7:4], W1, Sum[7:4], W2);
	fourbit_carrysel CS3(X[11:8], Y[11:8], W2, Sum[11:8], W3);
	fourbit_carrysel CS4(X[15:12], Y[15:12], W3, Sum[15:12], Cout);


endmodule
