module Amp_Sel(input [7:0] In_signal, input [1:0] sel, output reg [7:0] Out_signal);

    always @(sel, In_signal) begin
        //Out_signal = 8'b0;
        case (sel)
           2'b00 : Out_signal <= In_signal;
           2'b01 : Out_signal <= In_signal >> 1;
           2'b10 : Out_signal <= In_signal >> 2;
           2'b11 : Out_signal <= In_signal >> 3;
        endcase
        
    end

endmodule
