module decoder_5_32(in, out);
	input [4:0] in;
	output [31:0] out;
	
	//call 2:4 decoder 
	//wire [3:0] x;
	
	//decoder g0(in[4:3], x[3:0]);
	
	//decoder_3_8 g1(in[2:0], x[0], out[7:0]);
	//decoder_3_8 g2(in[2:0], x[1], out[15:8]);
	//decoder_3_8 g3(in[2:0], x[2], out[23:16]);
	//decoder_3_8 g4(in[2:0], x[3], out[31:24]);
	
	wire in_n1, in_n0, in_n2, in_n3, in_n4;
	
	not g0(in_n1, in[1]);
	not g1(in_n0, in[0]);
	not g2(in_n2, in[2]);
	not g3(in_n3, in[3]);
	not g4(in_n4, in[4]);
	
	and g5(out[0], in_n4, in_n3, in_n2, in_n1, in_n0);
	and g6(out[1], in_n4, in_n3, in_n2, in_n1, in[0]);
	and g7(out[2], in_n4, in_n3, in_n2, in[1], in_n0);
	and g8(out[3], in_n4, in_n3, in_n2, in[1], in[0]);
	and g9(out[4], in_n4, in_n3, in[2], in_n1, in_n0);
	and g10(out[5], in_n4, in_n3, in[2], in_n1, in[0]);
	and g11(out[6], in_n4, in_n3, in[2], in[1], in_n0);
	and g12(out[7], in_n4, in_n3, in[2], in[1], in[0]);
	and g13(out[8], in_n4, in[3], in_n2, in_n1, in_n0);
	and g14(out[9], in_n4, in[3], in_n2, in_n1, in[0]);
	and g15(out[10], in_n4, in[3], in_n2, in[1], in_n0);
	and g16(out[11], in_n4, in[3], in_n2, in[1], in[0]);
	and g17(out[12], in_n4, in[3], in[2], in_n1, in_n0);
	and g18(out[13], in_n4, in[3], in[2], in_n1, in[0]);
	and g19(out[14], in_n4, in[3], in[2], in[1], in_n0);
	and g20(out[15], in_n4, in[3], in[2], in[1], in[0]);
	and g21(out[16], in[4], in_n3, in_n2, in_n1, in_n0);
	and g22(out[17], in[4], in_n3, in_n2, in_n1, in[0]);
	and g23(out[18], in[4], in_n3, in_n2, in[1], in_n0);
	and g24(out[19], in[4], in_n3, in_n2, in[1], in[0]);
	and g25(out[20], in[4], in_n3, in[2], in_n1, in_n0);
	and g26(out[21], in[4], in_n3, in[2], in_n1, in[0]);
	and g27(out[22], in[4], in_n3, in[2], in[1], in_n0);
	and g28(out[23], in[4], in_n3, in[2], in[1], in[0]);
	and g29(out[24], in[4], in[3], in_n2, in_n1, in_n0);
	and g30(out[25], in[4], in[3], in_n2, in_n1, in[0]);
	and g31(out[26], in[4], in[3], in_n2, in[1], in_n0);
	and g32(out[27], in[4], in[3], in_n2, in[1], in[0]);
	and g33(out[28], in[4], in[3], in[2], in_n1, in_n0);
	and g34(out[29], in[4], in[3], in[2], in_n1, in[0]);
	and g35(out[30], in[4], in[3], in[2], in[1], in_n0);
	and g36(out[31], in[4], in[3], in[2], in[1], in[0]);
	
	
endmodule
