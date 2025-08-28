`timescale 1ns/1ns
module TB_counter_signals();

    reg clk = 0, rst=0;
    reg [2:0] sel = 3'b000;
    wire [8:0] sign_DDS;
    wire [7:0] out_signal;

    Waveform_Generator UUT1(clk, rst, sel, sign_DDS, out_signal);

    DDS UUT2(clk, rst, sign_DDS);

    always #5 clk = ~clk;

    initial begin
        #10 rst = 1;
        #10 rst = 0;
        #5120 sel = 3'b001;
        #5120 sel = 3'b010;
        #5120 sel = 3'b011;
        #5120 sel = 3'b100;
        #5120 sel = 3'b101;

        #5120 $stop;
    end 

endmodule