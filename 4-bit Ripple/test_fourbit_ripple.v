`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer:		Jonathan Whitaker
//
// Create Date:   16:30:51 02/01/2014
// Design Name:   fourbit_ripple
// Module Name:   C:/Users/Jonathan/Documents/Xilinx/Projects/fourbit_ripple/test_fourbit_ripple.v
// Project Name:  fourbit_ripple
// Description: 	This verilog test bench is used to test the 4-bit ripple carry
// 					adder implementation.
//
// Verilog Test Fixture created by ISE for module: fourbit_ripple
////////////////////////////////////////////////////////////////////////////////

module test_fourbit_ripple;

	// Inputs
	reg [3:0] X;
	reg [3:0] Y;
	reg Cin;

	integer i;

	// Outputs
	wire [3:0] Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	fourbit_ripple uut (
		.X(X), 
		.Y(Y), 
		.Cin(Cin), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		$display("4-bit Ripple Adder Simulation has Started..");
	
		// Initialize Inputs
		X = 0;
		Y = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
       
		// Add stimulus here
		for(i = 0; i < 2**9; i = i+1)
		begin 
			{X, Y, Cin} = i;
			#10
			
			if({Cout, Sum} != (X+Y+Cin))
			begin
				$display("An Error Occured when Adding:");
				$display("X Y Cin	Cout	Sum");
				$display("%d %d %d	%d	%d", X, Y, Cin, Cout, Sum);
			end
		end
		
		$display("4-bit Ripple Adder Simulation has Ended..");
		$display("If no bit pattern was printed, then no errors occured.");
	end
      
endmodule

