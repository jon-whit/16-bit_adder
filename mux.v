`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 		 Jonathan Whitaker
// 
// Create Date:    21:17:28 01/30/2014 
// Module Name:    two-one_mux 
// Description: 	 This verilog module implements a 2-1 multiplexor.
//
//////////////////////////////////////////////////////////////////////////////////
module mux(input A,input B,input Select,output O);

	// Create two wires for intermediate values.
	wire W0, W1;
	
	// Push A or B through the output depending on the 'Select' lines
	// value.
	and(W0, A, ~Select);
	and(W1, B, Select);
	or(O, W0, W1);

endmodule
