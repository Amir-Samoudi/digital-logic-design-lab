module Phase_Accumulator_TOP(input clk , rst , output sign_bit , Phase_pos , output [5:0]Addr);

    wire co;

    Phase_Accumulator_DP DP(clk, rst, co, Addr);
    Phase_Accumulator_CU CU(clk , rst, co , sign_bit , Phase_pos);

endmodule
