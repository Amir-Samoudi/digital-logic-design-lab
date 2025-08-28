module MSSD(input clk, rst, clkPB, serIn, output done, SerOutValid, output [6:0]P0, P1, P2, P3, output serOut);

    wire clkEn, co1, co2, coD, cnt1, cnt2, cntD, ldcntD, sh_en, sh_enD;
    wire [3:0] NumData, count;
    wire [1:0] PortNum;
    wire [6:0] pdcnt;
    
    Onepulser One_Pulser(clk, rst, clkPB, clkEn);
    PortNum_shr shr_port(clk, rst, clkEn, serIn, sh_en, PortNum);
    port_cnt counter1(clk, rst, clkEn, cnt1, co1);
    DataNum_shr shr_data( clk, rst, clkEn, serIn, sh_enD, NumData);
    Datanum_cnt counter2(clk, rst, clkEn, cnt2, co2);
    DataTrans_cnt counter3(clk, rst, clkEn, cntD, ldcntD, NumData, count, coD);
    Demux demux(pdcnt, PortNum, P0, P1, P2, P3);
    SSD Seven_Seg(count, pdcnt);

    Controller CU(clk, rst, serIn, clkEn, co1, co2, coD, cnt1, cnt2, cntD, ldcntD, sh_en, sh_enD, SerOutValid, done);

    assign serOut = serIn;



endmodule
