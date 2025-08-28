module Ui_reg(input clk, rst, Ldu, input [1:0] Ui, output reg [1:0] ui_out);

    always@(posedge clk, posedge rst) begin
        if(rst) ui_out <= 2'b0;
        else if (Ldu) ui_out <= Ui;
    end

endmodule
