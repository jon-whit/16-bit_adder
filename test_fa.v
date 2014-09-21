`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer:	   Jonathan Whitaker
//
// Create Date:   18:26:48 01/31/2014
// Design Name:   full_adder
// Module Name:   C:/Users/Jonathan/Documents/Xilinx/Projects/full_adder/test_fa.v
// Project Name:  full_adder 
// Description: 	This verilog test bench is used to test all of the possible
//						input combinations for the verilog implementation of the full
//						adder.
//
// Verilog Test Fixture created by ISE for module: full_adder
////////////////////////////////////////////////////////////////////////////////

module test_fa;

	// Inputs
	reg X;
	reg Y;
	reg Cin;

	// Outputs
	wire Sum;
	wire Cout;
	
	integer i;
	integer j;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.X(X), 
		.Y(Y), 
		.Cin(Cin), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		$display("Full Adder Simulation has Started..");
		
		// Initialize Inputs
		X = 0;
		Y = 0;
		Cin = 0;
		j = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for(i = 0; i < 2**3; i = i+1)
		begin
			{X, Y, Cin} = i;
			#10
			
			if ({Cout, Sum} != (X+Y+Cin))
			begin
				$display("XYCin	Cout	Sum");
				$display("%b%b%b	%b	%b was incorrectly added.", X, Y, Cin, Cout, Sum);
			end
		end
		
		$display("Full Adder Simulation has Ended..");
		$dipslay("If no bit pattern was printed, there no errors occurred.");
	end
      
endmodule

