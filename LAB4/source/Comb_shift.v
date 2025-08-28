module Comb_shift(input [15:0] frac , input [1:0] int , input[1:0] ui_out , output reg [20 : 0] wr_data);

always @(frac , int , ui_out) begin
    wr_data = 21'b0;
    case (ui_out)
        2'b00 : wr_data = {3'b0 , int ,  frac};
        2'b01 : wr_data = {2'b0 , int ,  frac , 1'b0};
        2'b10 : wr_data = {1'b0 , int ,  frac , 2'b0};
        2'b11 : wr_data = {int ,  frac , 3'b0};
    endcase
end


endmodule
