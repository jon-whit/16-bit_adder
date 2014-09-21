`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// Engineer: 		 Jonathan Whitaker
// 
// Create Date:    18:08:47 01/31/2014 
// Module Name:    half_adder 
// Description:    This verilog module implements a half adder arithmetic unit that
//						 can add two bits appropriately.
////////////////////////////////////////////////////////////////////////////////////
module half_adder(input X,input Y,output Sum,output Cout);

	xor(Sum, X, Y);
	and(Cout, X, Y);

endmodule
