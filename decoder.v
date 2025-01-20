module decoder(register, data);
	//2:4 decoder 
	input [1:0] register;
	output [3:0] data ;
	
	wire not_zero, not_one;
	
	not g0(not_zero, register[0]);
	not g1(not_one, register[1]);
	
	and g2(data[3], register[0], register[1]);
	and g3(data[2], register[1], not_zero);
	and g4(data[1], not_one, register[0]);
	and g5(data[0], not_zero, not_one);
	
	
	
endmodule
