module Wrapper_Controller(input clk, rst, wstart, engDone,
                         output reg Ldx, Shl, engstart, Ldu,wr_req, wDone);

    reg cntrst, cnt_en;
    wire co;
    Counter_2bit cnt(clk, rst, cntrst, cnt_en, co);

    parameter [2:0] Idle = 0, start = 1, Acc = 2, Wait = 3, inc = 4;
    reg [2:0] ps, ns;

    always @(ps, wstart, engDone, co) begin
        case (ps)
           Idle :  ns = wstart ? start : Idle;
           start : ns = wstart ? start : Acc;
           Acc :   ns = Wait;
           Wait :  ns = engDone ? inc : Wait;
           inc :   ns = co ? Idle : Acc;
          default: ns = Idle;
        endcase
    end
    always @(ps) begin
        {Ldx, Shl, engstart, Ldu, wr_req, wDone, cntrst, cnt_en} = 8'b0;
        case (ps)
           Idle :  wDone = 1'b1;
           start : {Ldx, Ldu, cntrst} = 3'b111;  
           Acc :  engstart = 1'b1;
           Wait : ;
           inc : {cnt_en, wr_req, Shl} = 3'b111;

        endcase
    end

    always @(posedge clk, posedge rst) begin
        if(rst) ps <= Idle;
        else ps <= ns;
    end

endmodule
