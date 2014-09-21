`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 		 Jonathan Whitaker
// 
// Create Date:    21:40:06 01/30/2014 
// Module Name:    fourbit_carrysel 
// Description: 	 This verilog module implements a 4-bit carry select adder.
//
//////////////////////////////////////////////////////////////////////////////////
module fourbit_carrysel(input [3:0] X,input [3:0] Y,input Cin,
							  output [3:0] Sum,output Cout);

	 // Create two buses that are of width 4 to store the
	 // sum from the two 4-bit ripple carry adders.
	 wire [3:0] S0, S1;
	 
	 // Cretae two wires for the carry out from each of the
	 // 4-bit ripple carry adders.
	 wire Cout0, Cout1;
	 
	 // Compute the sums and carry out assuming a carry in of 0 and 
	 // a carry in of 1. Store the results on a temporary bus.
	 fourbit_ripple s0(X[3:0], Y[3:0], 1'b0, S0, Cout0);
	 fourbit_ripple s1(X[3:0], Y[3:0], 1'b1, S1, Cout1);
	 
	 // Select the appropriate sums and carry out based on the carry
	 // in.
	 mux m0(S0[0], S1[0], Cin, Sum[0]); 
	 mux m1(S0[1], S1[1], Cin, Sum[1]);
	 mux m2(S0[2], S1[2], Cin, Sum[2]); 
	 mux m3(S0[3], S1[3], Cin, Sum[3]);
	 mux m4(Cout0, Cout1, Cin, Cout);

	
endmodule
