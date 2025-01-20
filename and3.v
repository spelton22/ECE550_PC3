module and_4(in1, in2, in3, en, out);
	input in1, in2, in3, en;
	output out;
	
	wire x,y;
	
	and g0(x, in1, in2);
	and g2(y, in3, en);
	and g1(out, x, y);
	
endmodule
