`timescale 1ns/1ns
module TB_exponential();

    reg clk = 0, rst = 0, start = 0;
    reg [15:0] x;
    wire done;
    wire [1:0] intpart;
    wire [15:0] fracpart;
    wire [17:0] result;

    assign result = {intpart, fracpart};

    exponential UUT(clk,rst,start, x, done, intpart, fracpart);

    always #5 clk = ~clk;

    initial begin
        #10 rst = 1;
        #10 rst = 0; x = 16'b1000_0000_0000_0000;
        #10 start = 1;
        #10 start = 0;
        #500 start =1; x = 16'b0000_0000_0000_0000;
        #10 start = 0;
        #500 start =1; x = 16'b0100_0000_0000_0000;
        #10 start = 0;

        #1000 $stop;

    end

endmodule
