module DataNum_shr(input clk, rst, clkEn, serIn, sh_enD, output reg [3:0] PO);

    always@(posedge clk, posedge rst) begin
        if(rst) PO <= 4'b0;
        else
		PO <= clkEn?(sh_enD ? {PO[2:0], serIn} : PO) : PO;
    end

endmodule
