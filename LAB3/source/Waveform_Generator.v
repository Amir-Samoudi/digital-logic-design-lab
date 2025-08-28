module Waveform_Generator(input clk, rst, input [2:0] sel, input [8:0] sign_DDS, output reg [7:0] out_signal);

    reg [7:0] counter_out;
    reg [7:0] square , reciprocal , triangle, sine, full_wave, half_wave;


    always @(posedge clk, posedge rst) begin
        if (rst) counter_out <= 8'b0;
        else counter_out <= counter_out + 1'b1;
    end

    always @(posedge clk) begin
        if(counter_out < 128)
            square <= 8'b0;
        else
            square <= 8'b11111111;
        
    end

    always @(posedge clk) begin
        if(counter_out < 128)
            triangle <= counter_out << 1;
        else 
            triangle <= 255 - (counter_out <<1);
    end

    always @(posedge clk) begin
        
        reciprocal <= (255)/(255-counter_out);
    end

    always @(posedge clk) begin   ///Sine
        
        sine <= sign_DDS[7:0];
    end

    always @(posedge clk) begin  ///full_wave
        
        if (sign_DDS < 128 )
            full_wave <= ~sign_DDS[7:0] + 1 +255;
        else
            full_wave <= sign_DDS[7:0];
    end

    always @(posedge clk) begin  ///half_wave
        
        if (sign_DDS < 128 )
            half_wave <= 8'b01111111;
        else
            half_wave <= sign_DDS[7:0];
    end


    always @(sel, reciprocal, triangle, square, sine, full_wave, half_wave) begin
        out_signal <= 8'b0;
        case (sel)
        3'b000: out_signal <= reciprocal;
        3'b001: out_signal <= triangle;
        3'b010: out_signal <= square;
        3'b011: out_signal <= sine;
        3'b100: out_signal <= full_wave;
        3'b101: out_signal <= half_wave;
        default: out_signal <= 8'b0;
    endcase


    end
    
endmodule
