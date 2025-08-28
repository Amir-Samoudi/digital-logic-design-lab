module DataTrans_cnt(input clk, rst, clkEn, cntD, ldcntD,input [3:0] NumData, output reg [3:0] count, output coD);

    always @ (posedge clk, posedge rst) begin
        if(rst) count <= 4'b0;
        else begin
            if (ldcntD) count <= NumData;
            else count <= clkEn ? (cntD ? count- 1'b1 : count) : count;
        end
    end

    assign coD = (count == 4'b0)? 1'b1 : 1'b0;


endmodule
