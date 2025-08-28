module Phase_Accumulator_CU(input clk , rst, co , output reg sign_bit , Phase_pos);

    reg [1:0] ps, ns;
    parameter [1:0] quarter1 = 0, quarter2 = 1, quarter3 = 2, quarter4 = 3;

    always @(ps, co) begin

        case (ps)
           quarter1 : ns = co ? quarter2 : quarter1;
           quarter2 : ns = co ? quarter3 : quarter2;
           quarter3 : ns = co ? quarter4 : quarter3;
           quarter4 : ns = co ? quarter1 : quarter4;
            default: ns = quarter1;
        endcase
    end

    always @(ps) begin
        {sign_bit, Phase_pos} = 2'b0;
        case (ps)
           quarter1 : {sign_bit, Phase_pos} = 2'b0;
           quarter2 : {sign_bit, Phase_pos} = 2'b01;
           quarter3 : {sign_bit, Phase_pos} = 2'b10;
           quarter4 : {sign_bit, Phase_pos} = 2'b11;
        endcase
        
    end

    always@(posedge clk , posedge rst) begin
        if (rst) ps <= quarter1;
        else ps <= ns;
    end
endmodule

