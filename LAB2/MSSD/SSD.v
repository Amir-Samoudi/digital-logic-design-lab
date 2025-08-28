module SSD(input [3:0]count, output reg [6:0]pdcnt);
    always@(count)begin
        case (count)
            4'h0: pdcnt = 7'h40;
            4'h1: pdcnt = 7'h79;
            4'h2: pdcnt = 7'h24;
            4'h3: pdcnt = 7'h30;
            4'h4: pdcnt = 7'h19;
            4'h5: pdcnt = 7'h12;
            4'h6: pdcnt = 7'h02;
            4'h7: pdcnt = 7'h78;
            4'h8: pdcnt = 7'h00;
            4'h9: pdcnt = 7'h10;
            4'ha: pdcnt = 7'h08;
            4'hb: pdcnt = 7'h03;
            4'hc: pdcnt = 7'h46;
            4'hd: pdcnt = 7'h21;
            4'he: pdcnt = 7'h06;
            4'hf: pdcnt = 7'h0e;
            default:pdcnt = 7'h00;
        endcase
    end

endmodule
