module Counter_2bit(input clk, rst, cntrst, cnt_en, output co);

    reg [1:0] PO;
    always @(posedge clk, posedge rst) begin
        if (rst) PO <= 2'b0;
        else begin
             if (cntrst) PO <= 2'b0;
             else if (cnt_en) PO <= PO + 1'b1;
        end
    end
    assign co = &PO;

endmodule
