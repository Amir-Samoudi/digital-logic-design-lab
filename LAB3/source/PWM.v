module PWM(input clk, rst, input [7:0] In_PWM, output Out_PWM);
	reg [7:0] count;
	always@(posedge clk, posedge rst) begin
		if(rst) count <= 8'b0;
		else count <= count + 1'b1;
		
	end
	assign Out_PWM = (count <= In_PWM) ? 1'b1 : 1'b0;
	
endmodule