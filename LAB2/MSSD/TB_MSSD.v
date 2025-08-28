`timescale 1ns/1ns
module TB_MSSD();
    reg clk = 0 , rst = 0 , clkPB = 0 ,serIn = 1;
    wire done , SerOutValid;
    wire [0:3] P;
    wire [6:0] pdcnt;
    MSSD UUT(clk, rst, clkPB, serIn, done, SerOutValid, P, pdcnt);
    always #5 clk = ~clk;
    initial begin
        #10 rst = 1;
        #10 rst = 0;
        #10 clkPB = 1;
        #10 serIn = 0; clkPB = 0 ;

        #50 clkPB = 1;
        #10 serIn = 0; clkPB = 0 ; //port

        #50 clkPB = 1;
        #10 serIn = 1; clkPB = 0 ; //port

        #50 clkPB = 1;
        #10 serIn = 0; clkPB = 0 ;

        #50 clkPB = 1;
        #10 serIn = 1; clkPB = 0;
        
        #50 clkPB = 1;
        #10 serIn = 1; clkPB = 0;

        #50 clkPB = 1;
        #10 serIn = 1; clkPB = 0 ; //number of data

        #50 clkPB = 1;
        #10 serIn = 0; clkPB = 0;

        #50 clkPB = 1;
        #10 serIn = 1; clkPB = 0;

        #50 clkPB = 1;
        #10 serIn = 1; clkPB = 0;

        #50 clkPB = 1;
        #10 serIn = 0; clkPB = 0;

        #50 clkPB = 1;
        #10 serIn = 1; clkPB = 0;

        #50 clkPB = 1;
        #10 serIn = 0; clkPB = 0; //data
       

        #50 clkPB = 1;
        #10 serIn = 0; clkPB = 0;  //pending

        #50 clkPB = 1;
        #10 serIn = 1; clkPB = 0; //idle

        #50 clkPB = 1;
        #10 serIn = 1; clkPB = 0;//idle
        #20 clkPB = 1;

        #50 $stop;
    end
endmodule
