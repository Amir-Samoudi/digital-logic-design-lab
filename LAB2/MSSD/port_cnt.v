module port_cnt(input clk, rst, clkEn, cnt1, output co1);

    reg [1:0] PO;
    always @ (posedge clk, posedge rst) begin
        if(rst) PO <= 2'b0;
        else PO <= clkEn ? (cnt1 ? PO+1'b1 : PO) : PO;
    end

    assign co1 = (PO == 2'b01)? 1'b1 : 1'b0;


endmodule
