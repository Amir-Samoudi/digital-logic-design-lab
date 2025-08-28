module Onepulser(input clk,rst,clkPB , output reg clkEn);
    parameter [1:0] A = 0, B = 1, C = 2;
    reg [1:0] ps, ns ;

    always@(ps, clkPB) begin
      case (ps)
         A : ns = clkPB ? B : A;
         B : ns = C;
         C : ns = clkPB ? C : A;
         default : ns = A;

        endcase
    end
    
    always@(ps) begin

        clkEn = 1'b0;
        case (ps) 
            B : clkEn = 1'b1;
        endcase
    end

    always@(posedge clk , posedge rst) begin
        if (rst) ps <= A;
        else ps <= ns;
    end

endmodule
