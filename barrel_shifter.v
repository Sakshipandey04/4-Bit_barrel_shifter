`timescale 1ns / 1ps

module barrel_shifter_4bit (
    input  [3:0] data_in,
    input  [1:0] shift_amt,
    input        dir,        // 0 = left, 1 = right
    input  [1:0] mode,       // 00 = Logical, 01 = Rotate, 10 = Arithmetic (bonus)
    output [3:0] data_out
);
reg [3:0] result;
integer i;

  always@(*)begin
    case (mode)
        2'b00: begin // Logical Shift
            if (dir == 1'b0)  // Left
                result = data_in << shift_amt;
            else              // Right
                result = data_in >> shift_amt;
        end

        2'b01: begin // Rotate
            case (shift_amt)
                2'd0: result = data_in;
                2'd1: result = (dir == 0) ? {data_in[2:0], data_in[3]} : {data_in[0], data_in[3:1]};
                2'd2: result = (dir == 0) ? {data_in[1:0], data_in[3:2]} : {data_in[1:0], data_in[3:2]};
                2'd3: result = (dir == 0) ? {data_in[0], data_in[3:1]} : {data_in[2:0], data_in[3]};
            endcase
        end

        2'b10: begin // Arithmetic Shift Right (Bonus)
            if (dir == 1) begin
                result = {data_in[3], data_in[3:1]}; // Maintain MSB (sign bit)
            end else begin
                result = data_in << shift_amt; // Left = same as logical left
            end
        end

        default: result = 4'b0000;
    endcase
end

 assign data_out = result;

endmodule