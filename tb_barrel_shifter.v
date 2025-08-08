`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 21:17:47
// Design Name: 
// Module Name: tb_barrel_shifter
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

module tb_barrel_shifter;

    reg [3:0] data_in;
    reg [1:0] shift_amt;
    reg       dir;
    reg [1:0] mode;
    wire [3:0] data_out;

    barrel_shifter_4bit uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .dir(dir),
        .mode(mode),
        .data_out(data_out)
    );

    initial begin
        $display("Starting Barrel Shifter Test");
        
        // Logical Left
        data_in = 4'b1011; shift_amt = 2'd1; dir = 0; mode = 2'b00; #10;
        $display("LSL: %b << 1 = %b", data_in, data_out);
        
        // Logical Right
        data_in = 4'b1011; shift_amt = 2'd1; dir = 1; mode = 2'b00; #10;
        $display("LSR: %b >> 1 = %b", data_in, data_out);

        // Rotate Left
        data_in = 4'b1011; shift_amt = 2'd1; dir = 0; mode = 2'b01; #10;
        $display("ROL: %b << 1 = %b", data_in, data_out);

        // Rotate Right
        data_in = 4'b1011; shift_amt = 2'd1; dir = 1; mode = 2'b01; #10;
        $display("ROR: %b >> 1 = %b", data_in, data_out);

        // Arithmetic Right
        data_in = 4'b1011; shift_amt = 2'd1; dir = 1; mode = 2'b10; #10;
        $display("ASR: %b >> 1 = %b", data_in, data_out);

        $finish;
    end
endmodule