module TB_almost_top();
    reg clk = 0, rst=0;
    reg [2:0] sel_wave_gen = 3'b011;
    reg [4:0] load;
    reg [1:0] sel_Amp= 2'b00;
    reg key_0 = 1'b1;
    wire [8:0] sign_DDS;
    wire [7:0] out_signal_wave, Out_signal;

    wire clk_bar;
    

    Waveform_Generator UUT1(clk_bar, rst, sel_wave_gen, sign_DDS, out_signal_wave);

    DDS UUT2(clk_bar, rst, sign_DDS);

    Amp_Sel UUT3(out_signal_wave,sel_Amp, Out_signal);
    
    Freq_Selector UUT4(clk , rst , key_0 , load ,  clk_bar);
    
    always #5 clk = ~clk;

    initial begin
        #10 rst = 1;
        #10 rst = 0;
        #10 load = 5'b10000;
        #10 key_0 = 0;
        #100000 load = 5'b11111;
        #100000 load = 5'b11110;
        //#10000 load = 5'b10000;
        
        #100000 sel_Amp = 2'b01;
        #100000 sel_Amp = 2'b10;
	#100000 sel_wave_gen = 3'b000;
	#100000 sel_wave_gen = 3'b010;
	#100000 load = 5'b11111;

        #100000 $stop;
    end 

endmodule
