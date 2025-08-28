module Controller(input clk, rst, serIn, clkEn, co1, co2, coD, output reg cnt1, cnt2, cntD, ldcntD, sh_en, sh_enD, SerOutValid, done);
    parameter [2:0] Idle = 0, port = 1, num_data = 2 ,waiting = 3, data = 4, pending = 5;

    reg [2:0] ps,ns;

    always@(ps, serIn, clkEn, co1, co2, coD) begin

        case(ps)

            Idle :     ns = clkEn ?(serIn? Idle : port): Idle;
            port :     ns = clkEn ? (co1 ? num_data : port): port;
            num_data : ns = clkEn?(co2 ? waiting : num_data):num_data;
            waiting :  ns = data;  
            data :     ns = clkEn?(coD ? pending : data): data;
            pending :  ns = clkEn?(serIn ? Idle : pending):pending;
            default :  ns = Idle;

        endcase
    end

    always@(ps) begin
        {cnt1, cnt2, cntD, ldcntD, sh_en, sh_enD, SerOutValid, done} = 8'b0;
        case(ps)
            Idle : done = 1'b1;
            port : {sh_en, cnt1} = 2'b11;
            num_data : {sh_enD, cnt2} = 2'b11;
            waiting : ldcntD = 1'b1;
            data : {cntD, SerOutValid} = 2'b11;
            pending : done = 1'b1;
        endcase
    end

    always@(posedge clk , posedge rst) begin
        if (rst) ps <= Idle;
        else ps <= ns;
    end

endmodule
