module DDS(input clk, rst, output reg [8:0] sign_DDS);

    reg [7:0] mem_out;
	 wire [7:0] mag;

    wire sign_bit,Phase_pos;
    wire[5:0] Addr;
    Phase_Accumulator_TOP PA(clk, rst, sign_bit, Phase_pos, Addr);


    wire [5:0] mem_in;
    assign mem_in = (Phase_pos) ? (~Addr +1):(Addr);

    //reg [7:0] LUT [0:63]; //ROM Memory
	//initial begin
	//$readmemb("sine.mem", LUT);
	// end
     (* romstyle = "M9K" *) (* ram_init_file = "sine.mif" *) reg [7:0] LUT [0:63]; 

    always @(mem_in) begin
        mem_out <= LUT[mem_in];
    end

    wire sel_mag;
    assign sel_mag = Phase_pos &(~|Addr);
    assign mag = (sel_mag)? (8'b11111111):(mem_out);




    always @(sign_bit, mag) begin
        if(~sign_bit)
            sign_DDS = {sign_bit, mag};
        else
            sign_DDS = ~mag +1 +255;    
    end
endmodule
