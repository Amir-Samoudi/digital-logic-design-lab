`timescale 1ns/1ns
module TB_DDS();

    reg clk=0, rst=0;
    wire [8:0] sign_DDS;

    DDS UUT2(clk, rst, sign_DDS);

    always #5 clk = ~clk;

    initial begin
        #10 rst = 1;
        #10 rst = 0;
        #6000 $stop;
    end

endmodule
