module register(data_in, clk, en, clr, out_q);
	//create a 32 bit register 
	
	input clk, en, clr;
	
	input [31:0] data_in;
	
	output [31:0] out_q;
	
	//use generate for to create 32 dffe with data[i] and out[i]
	//en and clk the same for all 
	
	genvar i;
	
	generate 
		for(i = 0; i < 32; i= i + 1) begin : notb
			//code to execute
			dffe_ref g0(out_q[i], data_in[i], clk, en, clr);
		end 
	endgenerate 
	
	
	
	
endmodule
