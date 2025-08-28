module PortNum_shr(input clk, rst, clkEn, serIn, sh_en, output reg [1:0] PO);

    always@(posedge clk, posedge rst) begin
        if(rst) PO <= 2'b0;
        else
		PO <= clkEn?(sh_en ? {PO[0], serIn} : PO) : PO;
    end

endmodule