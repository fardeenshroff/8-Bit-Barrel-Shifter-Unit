// File: src/barrel_shifter.v
module barrel_shifter (
    input  [7:0] data_in,    // Input data
    input  [2:0] shift_amt,  // Shift amount (0-7)
    input        direction,   // 0: right shift, 1: left shift
    output [7:0] data_out    // Shifted output
);

    reg [7:0] shift_stage1;
    reg [7:0] shift_stage2;
    reg [7:0] shift_stage3;
    
    // Stage 1: Shift by 0 or 1
    always @(*) begin
        if (direction) begin  // Left shift
            shift_stage1 = shift_amt[0] ? {data_in[6:0], 1'b0} : data_in;
        end else begin       // Right shift
            shift_stage1 = shift_amt[0] ? {1'b0, data_in[7:1]} : data_in;
        end
    end
    
    // Stage 2: Shift by 0 or 2
    always @(*) begin
        if (direction) begin  // Left shift
            shift_stage2 = shift_amt[1] ? {shift_stage1[5:0], 2'b0} : shift_stage1;
        end else begin       // Right shift
            shift_stage2 = shift_amt[1] ? {2'b0, shift_stage1[7:2]} : shift_stage1;
        end
    end
    
    // Stage 3: Shift by 0 or 4
    always @(*) begin
        if (direction) begin  // Left shift
            shift_stage3 = shift_amt[2] ? {shift_stage2[3:0], 4'b0} : shift_stage2;
        end else begin       // Right shift
            shift_stage3 = shift_amt[2] ? {4'b0, shift_stage2[7:4]} : shift_stage2;
        end
    end
    
    assign data_out = shift_stage3;

endmodule
