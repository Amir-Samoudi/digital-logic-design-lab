module Demux(input [6:0] pdcnt, input [1:0] port_num, output reg [6:0] P0, P1, P2, P3);

    always@(port_num, pdcnt) begin
        {P0, P1, P2, P3} = 28'bz;
        case (port_num)
           2'b00 : P0 = pdcnt;
           2'b01 : P1 = pdcnt;
           2'b10 : P2 = pdcnt;
           2'b11 : P3 = pdcnt;  
        endcase
    end
endmodule
