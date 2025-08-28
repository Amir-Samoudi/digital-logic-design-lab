`timescale 1ns/1ns
module TB_Onepulser();
reg clk = 0 , rst = 0 , clkPB = 0;
wire clkEn;

    Onepulser UUt(clk , rst , clkPB , clkEn);

    always #5 clk = ~clk;

    initial begin
        #10 rst = 1;
        #10 rst = 0;
        #10 clkPB = 1;
        #30 clkPB = 0;

        #20 clkPB = 1;
        #40 clkPB = 1;
        #50 $stop;
    end
endmodule
