# 8-Bit Barrel Shifter Unit

A digital design implementation of an 8-bit barrel shifter unit. This component performs bidirectional (left/right) logical shifts on 8-bit data inputs.

## Overview

A **barrel shifter** is a digital circuit that can shift a data word by a specified number of bits in one clock cycle. It’s commonly used in microprocessors and digital signal processing (DSP) applications.

This 8-bit barrel shifter supports:
- **Bidirectional shifting**: Perform left or right logical shifts.
- **Configurable shift amount**: Shift data by 0 to 7 bits.
- **Single-cycle operation**: Efficient for real-time processing.

## Features

- **8-bit data input/output**: Operates on an 8-bit wide data word.
- **Shift amount (0-7 bits)**: Control how much to shift the data.
- **Bidirectional control**: Shift data left or right.
- **Single-cycle operation**: Performs shifts in one clock cycle.

## Implementation

### Architecture

- **Multiplexer-based design**: Uses multiplexers to route data bits based on shift amount.
- **Shift Control**: A 3-bit signal determines the shift amount (0-7 bits).
- **Direction Control**: A signal decides whether to shift left or right.

### Logic

- **Left Shift**: Shifts bits to the left, filling the lower bits with zeros.
- **Right Shift**: Shifts bits to the right, filling the higher bits with zeros.
- **No Shift**: When shift amount is 0, no change to the data.

## Verilog Example

Here is a simple Verilog code snippet for the barrel shifter:

```verilog
module barrel_shifter(
    input [7:0] data_in,    // 8-bit input data
    input [2:0] shift_amt,  // 3-bit shift amount (0-7)
    input dir,              // Direction: 0 for left, 1 for right
    output [7:0] data_out   // 8-bit shifted data output
);
    always @(*) begin
        case (dir)
            1'b0: begin // Left shift
                case (shift_amt)
                    3'd0: data_out = data_in;
                    3'd1: data_out = {data_in[6:0], 1'b0};
                    3'd2: data_out = {data_in[5:0], 2'b00};
                    3'd3: data_out = {data_in[4:0], 3'b000};
                    3'd4: data_out = {data_in[3:0], 4'b0000};
                    3'd5: data_out = {data_in[2:0], 5'b00000};
                    3'd6: data_out = {data_in[1:0], 6'b000000};
                    3'd7: data_out = {data_in[0], 7'b0000000};
                    default: data_out = data_in;
                endcase
            end
            1'b1: begin // Right shift
                case (shift_amt)
                    3'd0: data_out = data_in;
                    3'd1: data_out = {1'b0, data_in[7:1]};
                    3'd2: data_out = {2'b00, data_in[7:2]};
                    3'd3: data_out = {3'b000, data_in[7:3]};
                    3'd4: data_out = {4'b0000, data_in[7:4]};
                    3'd5: data_out = {5'b00000, data_in[7:5]};
                    3'd6: data_out = {6'b000000, data_in[7:6]};
                    3'd7: data_out = {7'b0000000, data_in[7]};
                    default: data_out = data_in;
                endcase
            end
            default: data_out = data_in;
        endcase
    end
endmodule
