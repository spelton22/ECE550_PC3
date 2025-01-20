module decoder_3_8(in, en, out);
	input [2:0] in;
	input en;
	output [7:0] out;
	
	wire not_one, not_zero, not_two;
	
	not g0(not_one, in[1]);
	not g1(not_zero, in[0]);
	not g2(not_two, in[2]);
	
	and g3(out[0], not_two, not_one, not_zero, en);
	and g4(out[1], not_two, not_one, in[0], en);
	and g5(out[2], not_two, in[1], not_zero, en);
	and g6(out[3], not_two, in[1], in[0], en);
	and g7(out[4], in[2], not_one, not_zero, en);
	and g8(out[5], in[2], not_one, in[0], en);
	and g9(out[6], in[2], in[1], not_zero, en);
	and g10(out[7], in[2], in[1], in[0], en);
	
endmodule
