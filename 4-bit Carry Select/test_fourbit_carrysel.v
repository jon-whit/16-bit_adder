`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////////////////////
// Engineer:		Jonathan Whitaker
//
// Create Date:   22:55:27 02/01/2014
// Design Name:   fourbit_carrysel
// Module Name:   C:/Users/Jonathan/Documents/Xilinx/Projects/fourbit_carrysel/test_carrysel.v
// Project Name:  fourbit_carrysel
// Description: 	This verilog test bench is used to test the implementation of the 4-bit carry 
// 					select block defined in the 'fourbit_carryselect verilog file.
//
// Verilog Test Fixture created by ISE for module: fourbit_carrysel
////////////////////////////////////////////////////////////////////////////////////////////////

module test_fourbit_carrysel;

	// Inputs
	reg [3:0] X;
	reg [3:0] Y;
	reg Cin;

	integer i;

	// Outputs
	wire [3:0] Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	fourbit_carrysel uut (
		.X(X), 
		.Y(Y), 
		.Cin(Cin), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		$display("4-bit Carry Select Simulation has Started..");
	
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
		
		$display("4-bit Carry Select Simulation has Ended..");
		$display("If no bit pattern was printed, then no errors occured.");
	end
      
endmodule

