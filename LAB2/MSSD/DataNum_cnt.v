module Datanum_cnt(input clk, rst, clkEn, cnt2, output co2);

    reg [1:0] PO;
    always @ (posedge clk, posedge rst) begin
        if(rst) PO <= 2'b0;
        else PO <= clkEn ? (cnt2 ? PO+ 1'b1 : PO) : PO;
    end

    assign co2 = & PO;


endmodule
