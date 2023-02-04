module alu (
	input [15:0] input_1,
	input [15:0] input_2,
	input [3:0] alu_op,
	output reg[15:0] out,
	output reg[3:0] flags,
	input write_flag,
	input [3:0] input_flags,
	input clk
);

// flags [0] => Zero flag 
// flags [1] => negative flag
// flags [2] => carry flag 
// flags [3] => overflow flag

always @(*) begin
	case (alu_op)
		4'b0000 : begin 
			out = input_1;
		end
		4'b0001 : begin
			{flags[2],out} = input_1 + 1;
		end
		4'b0010 : begin
			{flags[2],out} = input_1 - 1;
		end
		4'b0011 : begin
			{flags[2],out} = input_1 + input_2;
		end
		4'b0100 : begin
			{flags[2],out} = input_1 - input_2;
		end
		4'b0101 : begin
			out = input_1 & input_2;
	   	end
		4'b0110 : begin
			out = input_1 | input_2;
	   	end
		4'b0111 : begin
			out = input_1 << input_2 - 1;
	  		flags[2] = out[15];
	  		out =  out << 1;
		end
		4'b1000 : begin
			out = input_1 >> input_2;
	   	end
		4'b1001 : begin
			out = ~input_2;
	   	end
		4'b1010 : begin
			flags[2] = 1; 
		end
		4'b1011 : begin
			flags[2] = 0;
		end
		4'b1111 : begin
			out =input_2; 
	  	end
	endcase

	flags [0] = (out == 0) ? 1 : 0;
	flags [1] = (out[15] == 1) ? 1 : 0;
	flags [3] = (((alu_op == 4'b0011) && (input_1[15] == 1) && (input_2[15] == 1) && (out[15] == 0)) | ((alu_op == 4'b0011) && (input_1[15] == 0) && (input_2[15] == 0) && (out[15] == 1)))  ? 1 : 0;

end 
always @(negedge clk) begin
	if (write_flag) begin
		flags = input_flags;
	end
end

endmodule

