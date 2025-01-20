module tristate_buffer(data, enable, out);
	input enable;
	input [31:0] data;
	output [31:0] out;
	
	assign out[31:0] = enable ? data[31:0] : 1'bz;

endmodule
