module regfile (clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg, ctrl_readRegA, 
	ctrl_readRegB, data_writeReg, data_readRegA, data_readRegB);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	
	//write_reg as input --> deceroder --> 32 output to enable register 
	//register input = write_data --> output --> tristate buffer
		//(need to put all 32 bits together) decoder --> enable of tristate
			//enable for tri is output of decoder 
	//tristate connect to wire of all 32 and --> wire to data_readreg

	wire [31:0] enable_32, enable_reg, ena_32, enb_32;
	wire [31:0] out_q, out_data_readRegA, out_data_readRegB, data_writeReg_for_zero;
	
	
	//decoder for write ctrl_writeReg to go to register
	decoder_5_32 g0(ctrl_writeReg[4:0], enable_32[31:0]);
	
	genvar k;
	
	generate 
		for(k = 0; k < 32; k= k + 1) begin : en_reg
			//code to execute
			//decoder for writing register AND && ctrl write enable
			and g4(enable_reg[k], enable_32[k], ctrl_writeEnable);
		end 
	endgenerate
	
	assign data_writeReg_for_zero = enable_reg[0] ? 32'h00000000 : data_writeReg;
	
	wire [31:0] out_q0, out_q1, out_q2, out_q3, out_q4, out_q5, out_q6, out_q7, out_q8, out_q9;
	wire [31:0] out_q10, out_q11, out_q12, out_q13, out_q14, out_q15, out_q16, out_q17, out_q18, out_q19;
	wire [31:0] out_q20, out_q21, out_q22, out_q23, out_q24, out_q25, out_q26, out_q27, out_q28, out_q29;
	wire [31:0] out_q30, out_q31;
	
	
	register r0(data_writeReg_for_zero[31:0], clock, enable_reg[0], ctrl_reset, out_q0[31:0]);
	register r1(data_writeReg_for_zero[31:0], clock, enable_reg[1], ctrl_reset, out_q1[31:0]);
	register r2(data_writeReg_for_zero[31:0], clock, enable_reg[2], ctrl_reset, out_q2[31:0]);
	register r3(data_writeReg_for_zero[31:0], clock, enable_reg[3], ctrl_reset, out_q3[31:0]);
	register r4(data_writeReg_for_zero[31:0], clock, enable_reg[4], ctrl_reset, out_q4[31:0]);
	register r5(data_writeReg_for_zero[31:0], clock, enable_reg[5], ctrl_reset, out_q5[31:0]);
	register r6(data_writeReg_for_zero[31:0], clock, enable_reg[6], ctrl_reset, out_q6[31:0]);
	register r7(data_writeReg_for_zero[31:0], clock, enable_reg[7], ctrl_reset, out_q7[31:0]);
	register r8(data_writeReg_for_zero[31:0], clock, enable_reg[8], ctrl_reset, out_q8[31:0]);
	register r9(data_writeReg_for_zero[31:0], clock, enable_reg[9], ctrl_reset, out_q9[31:0]);
	register r10(data_writeReg_for_zero[31:0], clock, enable_reg[10], ctrl_reset, out_q10[31:0]);
	register r11(data_writeReg_for_zero[31:0], clock, enable_reg[11], ctrl_reset, out_q11[31:0]);
	register r12(data_writeReg_for_zero[31:0], clock, enable_reg[12], ctrl_reset, out_q12[31:0]);
	register r13(data_writeReg_for_zero[31:0], clock, enable_reg[13], ctrl_reset, out_q13[31:0]);
	register r14(data_writeReg_for_zero[31:0], clock, enable_reg[14], ctrl_reset, out_q14[31:0]);
	register r15(data_writeReg_for_zero[31:0], clock, enable_reg[15], ctrl_reset, out_q15[31:0]);
	register r16(data_writeReg_for_zero[31:0], clock, enable_reg[16], ctrl_reset, out_q16[31:0]);
	register r17(data_writeReg_for_zero[31:0], clock, enable_reg[17], ctrl_reset, out_q17[31:0]);
	register r18(data_writeReg_for_zero[31:0], clock, enable_reg[18], ctrl_reset, out_q18[31:0]);
	register r19(data_writeReg_for_zero[31:0], clock, enable_reg[19], ctrl_reset, out_q19[31:0]);
	register r20(data_writeReg_for_zero[31:0], clock, enable_reg[20], ctrl_reset, out_q20[31:0]);
	register r21(data_writeReg_for_zero[31:0], clock, enable_reg[21], ctrl_reset, out_q21[31:0]);
	register r22(data_writeReg_for_zero[31:0], clock, enable_reg[22], ctrl_reset, out_q22[31:0]);
	register r23(data_writeReg_for_zero[31:0], clock, enable_reg[23], ctrl_reset, out_q23[31:0]);
	register r24(data_writeReg_for_zero[31:0], clock, enable_reg[24], ctrl_reset, out_q24[31:0]);
	register r25(data_writeReg_for_zero[31:0], clock, enable_reg[25], ctrl_reset, out_q25[31:0]);
	register r26(data_writeReg_for_zero[31:0], clock, enable_reg[26], ctrl_reset, out_q26[31:0]);
	register r27(data_writeReg_for_zero[31:0], clock, enable_reg[27], ctrl_reset, out_q27[31:0]);
	register r28(data_writeReg_for_zero[31:0], clock, enable_reg[28], ctrl_reset, out_q28[31:0]);
	register r29(data_writeReg_for_zero[31:0], clock, enable_reg[29], ctrl_reset, out_q29[31:0]);
	register r30(data_writeReg_for_zero[31:0], clock, enable_reg[30], ctrl_reset, out_q30[31:0]);
	register r31(data_writeReg_for_zero[31:0], clock, enable_reg[31], ctrl_reset, out_q31[31:0]);
	
	
	//decoder for tristate enable
	decoder_5_32 gA(ctrl_readRegA[4:0], ena_32[31:0]);
	decoder_5_32 gB(ctrl_readRegB[4:0], enb_32[31:0]);
	
	//create 32 tristate buffers 
	wire [31:0] out_data_regA, out_data_regB;
				

	assign out_data_regA[31:0] = ena_32[0] ? out_q0[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[1] ? out_q1[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[2] ? out_q2[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[3] ? out_q3[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[4] ? out_q4[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[5] ? out_q5[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[6] ? out_q6[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[7] ? out_q7[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[8] ? out_q8[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[9] ? out_q9[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[10] ? out_q10[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[11] ? out_q11[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[12] ? out_q12[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[13] ? out_q13[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[14] ? out_q14[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[15] ? out_q15[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[16] ? out_q16[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[17] ? out_q17[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[18] ? out_q18[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[19] ? out_q19[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[20] ? out_q20[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[21] ? out_q21[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[22] ? out_q22[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[23] ? out_q23[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[24] ? out_q24[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[25] ? out_q25[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[26] ? out_q26[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[27] ? out_q27[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[28] ? out_q28[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[29] ? out_q29[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[30] ? out_q30[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regA[31:0] = ena_32[31] ? out_q31[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	
	
	assign out_data_regB[31:0] = enb_32[0] ? out_q0[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[1] ? out_q1[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[2] ? out_q2[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[3] ? out_q3[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[4] ? out_q4[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[5] ? out_q5[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[6] ? out_q6[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[7] ? out_q7[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[8] ? out_q8[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[9] ? out_q9[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[10] ? out_q10[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[11] ? out_q11[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[12] ? out_q12[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[13] ? out_q13[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[14] ? out_q14[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[15] ? out_q15[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[16] ? out_q16[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[17] ? out_q17[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[18] ? out_q18[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[19] ? out_q19[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[20] ? out_q20[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[21] ? out_q21[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[22] ? out_q22[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[23] ? out_q23[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[24] ? out_q24[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[25] ? out_q25[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[26] ? out_q26[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[27] ? out_q27[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[28] ? out_q28[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[29] ? out_q29[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[30] ? out_q30[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign out_data_regB[31:0] = enb_32[31] ? out_q31[31:0] : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	
	
	assign data_readRegA = 1'b1 ? out_data_regA : out_data_regA;
	
	assign data_readRegB = 1'b1 ? out_data_regB : out_data_regB;
	
	
	
endmodule
