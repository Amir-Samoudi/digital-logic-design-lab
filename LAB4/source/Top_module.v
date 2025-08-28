module Wrapper_Top_module(input clk , rst , wstart , input [4:0] Vi , input [1:0]Ui 
                    ,output wDone , output wr_req, output [20:0] wr_data);

    wire engDone , Ldx ,Shl, engstart , Ldu;
    wire [1:0] ui_out;
    wire [15:0] engx;
    wire [1:0] int;
    wire [15:0] frac;

    Wrapper_Controller Controller(clk, rst, wstart, engDone,Ldx, Shl, engstart, Ldu,wr_req, wDone);
 
    Ui_reg UI_Register(clk, rst, Ldu,Ui,ui_out);

    ShiftRegLeft Shift_reg(clk, rst, Ldx, Shl,Vi, engx);

    exponential exp(clk,rst,engstart, engx, engDone, int, frac);

    Comb_shift comb_Shl(frac ,int , ui_out , wr_data);

endmodule
