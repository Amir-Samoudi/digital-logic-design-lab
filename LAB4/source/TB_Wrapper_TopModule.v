`timescale 1ns/1ns
module TB_Wrapper_TopModule();

    reg clk = 0, rst = 0, wstart = 0;
    reg [4:0] Vi;
    reg [1:0] Ui;
    wire wDone , wr_req;
    wire [20:0] wr_data;


    Wrapper_Top_module UUT(clk , rst , wstart , Vi , Ui, wDone , wr_req, wr_data);

    always #5 clk = ~clk;
    initial begin
        #10 rst = 1;
        #10 rst = 0;
        #10 Vi = 5'b10000; Ui = 2'b01;
        #10 wstart = 1;
        #10 wstart = 0;
        #3000 Vi = 5'b00110; Ui = 2'b10;
        #10 wstart = 1;
        #10 wstart = 0;
        #3000 $stop;
    end

endmodule
