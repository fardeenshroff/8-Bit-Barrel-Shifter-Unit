// File: testbench/barrel_shifter_tb.v
`timescale 1ns/1ps

module barrel_shifter_tb;

    reg  [7:0] data_in;
    reg  [2:0] shift_amt;
    reg        direction;
    wire [7:0] data_out;
    
    // Instantiate the barrel shifter
    barrel_shifter uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .direction(direction),
        .data_out(data_out)
    );
    
    // Test stimulus
    initial begin
        $monitor("Time=%0t data_in=%b shift_amt=%d direction=%b data_out=%b",
                 $time, data_in, shift_amt, direction, data_out);
                 
        // Test case 1: Left shift
        data_in = 8'b10101010;
        direction = 1;
        
        for (shift_amt = 0; shift_amt < 8; shift_amt = shift_amt + 1) begin
            #10;
        end
        
        // Test case 2: Right shift
        data_in = 8'b10101010;
        direction = 0;
        
        for (shift_amt = 0; shift_amt < 8; shift_amt = shift_amt + 1) begin
            #10;
        end
        
        // Add more test cases as needed
        
        #10 $finish;
    end

endmodule
