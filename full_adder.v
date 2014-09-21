`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 		 Jonathan Whitaker
// 
// Create Date:    21:10:06 01/30/2014 
// Module Name:    full_adder 
// Description: 	 This verilog module implements a full adder arithmetic unit that
//						 will add three bits together appropriately.
//////////////////////////////////////////////////////////////////////////////////
module full_adder(input X,input Y,input Cin,output Sum,output Cout);

	// Create three wires for the intermediate values between the
	// two half adders.
	wire W1, W2, W3;
	
	// Compute the sum and carry out from the given inputs.
	half_adder h1(X, Y, W1, W2);
	half_adder h2(W1, Cin, Sum, W3);
	or(Cout, W2, W3);

endmodule
