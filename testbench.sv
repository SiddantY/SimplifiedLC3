`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 09:48:28 PM
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module testbench();
timeunit 10ns;
timeprecision 1ns;
logic  Clk, Reset, Run, Continue;     

logic [15:0] SW;
logic [15:0] LED;
logic [7:0] hex_seg;
logic [3:0] hex_grid;
logic [7:0] hex_segB;
logic [3:0] hex_gridB;

slc3_testtop test_slc3(
.SW(SW),
 .Clk(Clk), .Reset(Reset), .Run(Run), .Continue(Continue),
 .LED(LED),
 .hex_seg(hex_seg),
 .hex_grid(hex_grid),
 .hex_segB(hex_segB),
 .hex_gridB(hex_gridB)
);


always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

//IO Test 1
/*initial begin: TEST_BODY
#1 Reset = 0;
    Run=0;
    Continue = 0;
#1 Reset = 1;
#5 Reset = 0;
SW = 16'h3;
#10 Run = 1;
SW = 16'h3;
#4 Run = 0;
#1   SW = 16'h3;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'h5;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
*/

//IO Test 2
/*initial begin: TEST_BODY
#1 Reset = 0;
    Run=0;
    Continue = 0;
#1 Reset = 1;
#5 Reset = 0;
#10 Run = 1;
#4 Run = 0;
#1  SW = 16'h6;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'h3;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'h5;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
*/

// Self-Modifying Code Test
/*initial begin: TEST_BODY
#1 Reset = 0;
    Run=0;
    Continue = 0;
#1 Reset = 1;
#5 Reset = 0;
#10 Run = 1;
#4 Run = 0;
#1 SW = 16'hB;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'h3;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'h5;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
*/

//XOR Test 
initial begin: TEST_BODY
#1 Reset = 0;
    Run=0;
    Continue = 0;
#1 Reset = 1;
#5 Reset = 0;
#10 Run = 1;
#4 Run = 0;
#1 SW = 16'h14;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'hF;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'hF;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;


/* Multiplier Test */

/*initial begin: TEST_BODY
#1 Reset = 0;
    Run=0;
    Continue = 0;
#1 Reset = 1;
#5 Reset = 0;
#10 Run = 1;
#4 Run = 0;
#1 SW = 16'h31;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'hC;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'hA;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
*/

/* Auto Count Test */
/*
initial begin: TEST_BODY
#1 Reset = 0;
    Run=0;
    Continue = 0;
#1 Reset = 1;
#5 Reset = 0;
#1 SW = 16'h9c;
#10 Run = 1;
#4 Run = 0;
*/


/* Sort Test  */
/*initial begin: TEST_BODY
#1 Reset = 0;
    Run=0;
    Continue = 0;
#1 Reset = 1;
#5 Reset = 0;
SW = 16'h5A;
#10 Run = 1;
#4 Run = 0;
#1 SW = 16'h5A;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#40 SW = 16'h0002;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
#20 Continue = 1;
#4 Continue = 0;
SW = 16'h0003;
#20 Continue = 1;
#4 Continue = 0;
#25000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
#1000 Continue = 1;
#4 Continue = 0;
*/




end
endmodule


