module Freq_Selector(input clk , rst , key_0 , input [4:0] load , output co);

    wire ld ;
    assign ld = key_0 | co ;

    reg [8:0] count;
    always @(posedge clk , posedge rst) begin
        if (rst) count <= 9'b0;
        else begin
            if (ld) count <= {load, 4'b0110};
            else count <= count +1; 
        end
    end
    assign co = &count;
endmodule
