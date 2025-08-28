module ShiftRegLeft(input clk, rst, Ldx, Shl, input [4:0] Vi, output reg [15:0] engx);

    always@(posedge clk, posedge rst) begin
        if(rst) engx <= 16'b0;
        else begin
		    if (Ldx) engx <= {3'b0 , Vi , 8'b0};
            else if(Shl) engx <= {engx[14:0], 1'b0}; 
        end
    end

endmodule
