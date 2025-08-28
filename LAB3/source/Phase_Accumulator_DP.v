module Phase_Accumulator_DP(input clk, rst, output co, output reg[5:0] Addr);

    always @(posedge clk, posedge rst) begin
        if (rst) Addr <= 6'b0;
        else Addr <= Addr + 1'b1;
    end

    assign co = &Addr;
    
endmodule
