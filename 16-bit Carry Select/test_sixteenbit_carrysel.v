`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer:		Jonathan Whitaker
//
// Create Date:   14:57:20 02/06/2014
// Design Name:   sixteenbit_carrysel
// Module Name:   C:/Users/Jonathan/Documents/Xilinx/Projects/sixteenbit_carrysel/test_sixteenbit_carrysel.v
// Project Name:  sixteenbit_carrysel
// Description:   This verilog test bench is used to test the 16-bit carry select
//						verilog module.
//
// Verilog Test Fixture created by ISE for module: sixteenbit_carrysel
////////////////////////////////////////////////////////////////////////////////

module test_sixteenbit_carrysel;

	// Inputs
	reg [15:0] X;
	reg [15:0] Y;
	reg Cin;

	integer i;
	
	// Outputs
	wire [15:0] Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	sixteenbit_carrysel uut (
		.X(X), 
		.Y(Y), 
		.Cin(Cin), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		$display("16-bit Carry Select Simulation has Started..");
		
		// Initialize Inputs
		X = 0;
		Y = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$display("X	Y	Cin	Cout	Sum");
		
		// NOTE: Both of the loops below are unreasonably large. To 
		//			simulate the correct addition of these #s,just change 
		// 		the conditional statement in the loops.
		// 		I just wanted to show that I conceptually understood
		//			the testing process for a 16-bit adder.
		
		// Test the addition of X and Y assuming the Cin is 0.
		Cin = 0;
		for(i = 0; i < 2**32; i = i+1)
		begin
			{X, Y} = i;
			#10
			
			if ({Cout, Sum} != (X+Y+Cin))
			begin
				$display("Error When Adding:");
				$display("%d	%d	%d	%d	%d", X, Y, Cin, Cout, Sum);
			end
		end
		
		// Test the addition of X and Y assuming Cin is 1.
		Cin = 1;
		for(i = 0; i < 2**32; i = i+1)
		begin
			{X, Y} = i;
			#10
			
			if ({Cout, Sum} != (X+Y+Cin))
			begin
				$display("Error When Adding:");
				$display("%d	%d	%d	%d	%d", X, Y, Cin, Cout, Sum);
			end
		end
		
		$display("16-bit Carry Select Simulation has Ended..");
		$display("If no decimal output was displayed, then there weren't any errors.");
	end
      
endmodule

