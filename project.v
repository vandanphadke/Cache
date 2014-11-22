module D_ff( 
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b , 
	input d, 
	output reg q);
	
	always @ (negedge clk)
		begin
			if(reset==1)
				q=0;
			else
				if(regWrite == 1 && decOut1b==1)
					begin
						q=d;
					end
		end
endmodule


module register32bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input [31:0] writeData,
	output [31:0] outR );
	
	D_ff d_ff0(clk, reset, regWrite, decOut1b ,writeData[0], outR[0]);
	D_ff d_ff1(clk, reset, regWrite, decOut1b ,writeData[1], outR[1]);
	D_ff d_ff2(clk, reset, regWrite, decOut1b ,writeData[2], outR[2]);
	D_ff d_ff3(clk, reset, regWrite, decOut1b ,writeData[3], outR[3]);
	D_ff d_ff4(clk, reset, regWrite, decOut1b ,writeData[4], outR[4]);
	D_ff d_ff5(clk, reset, regWrite, decOut1b ,writeData[5], outR[5]);
	D_ff d_ff6(clk, reset, regWrite, decOut1b ,writeData[6], outR[6]);
	D_ff d_ff7(clk, reset, regWrite, decOut1b ,writeData[7], outR[7]);
	D_ff d_ff8(clk, reset, regWrite, decOut1b ,writeData[8], outR[8]);
	D_ff d_ff9(clk, reset, regWrite, decOut1b ,writeData[9], outR[9]);
	D_ff d_ff10(clk, reset, regWrite, decOut1b ,writeData[10], outR[10]);
	D_ff d_ff11(clk, reset, regWrite, decOut1b ,writeData[11], outR[11]);
	D_ff d_ff12(clk, reset, regWrite, decOut1b ,writeData[12], outR[12]);
	D_ff d_ff13(clk, reset, regWrite, decOut1b ,writeData[13], outR[13]);
	D_ff d_ff14(clk, reset, regWrite, decOut1b ,writeData[14], outR[14]);
	D_ff d_ff15(clk, reset, regWrite, decOut1b ,writeData[15], outR[15]);
	D_ff d_ff16(clk, reset, regWrite, decOut1b ,writeData[16], outR[16]);
	D_ff d_ff17(clk, reset, regWrite, decOut1b ,writeData[17], outR[17]);
	D_ff d_ff18(clk, reset, regWrite, decOut1b ,writeData[18], outR[18]);
	D_ff d_ff19(clk, reset, regWrite, decOut1b ,writeData[19], outR[19]);
	D_ff d_ff20(clk, reset, regWrite, decOut1b ,writeData[20], outR[20]);
	D_ff d_ff21(clk, reset, regWrite, decOut1b ,writeData[21], outR[21]);
	D_ff d_ff22(clk, reset, regWrite, decOut1b ,writeData[22], outR[22]);
	D_ff d_ff23(clk, reset, regWrite, decOut1b ,writeData[23], outR[23]);
	D_ff d_ff24(clk, reset, regWrite, decOut1b ,writeData[24], outR[24]);
	D_ff d_ff25(clk, reset, regWrite, decOut1b ,writeData[25], outR[25]);
	D_ff d_ff26(clk, reset, regWrite, decOut1b ,writeData[26], outR[26]);
	D_ff d_ff27(clk, reset, regWrite, decOut1b ,writeData[27], outR[27]);
	D_ff d_ff28(clk, reset, regWrite, decOut1b ,writeData[28], outR[28]);
	D_ff d_ff29(clk, reset, regWrite, decOut1b ,writeData[29], outR[29]);
	D_ff d_ff30(clk, reset, regWrite, decOut1b ,writeData[30], outR[30]);
	D_ff d_ff31(clk, reset, regWrite, decOut1b ,writeData[31], outR[31]);
	
endmodule
	

module register26bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input [25:0] writeData,
	output [25:0] outR );
	
	D_ff dff0(clk, reset, regWrite, decOut1b ,writeData[0], outR[0]);
	D_ff dff1(clk, reset, regWrite, decOut1b ,writeData[1], outR[1]);
	D_ff dff2(clk, reset, regWrite, decOut1b ,writeData[2], outR[2]);
	D_ff dff3(clk, reset, regWrite, decOut1b ,writeData[3], outR[3]);
	D_ff dff4(clk, reset, regWrite, decOut1b ,writeData[4], outR[4]);
	D_ff dff5(clk, reset, regWrite, decOut1b ,writeData[5], outR[5]);
	D_ff dff6(clk, reset, regWrite, decOut1b ,writeData[6], outR[6]);
	D_ff dff7(clk, reset, regWrite, decOut1b ,writeData[7], outR[7]);
	D_ff dff8(clk, reset, regWrite, decOut1b ,writeData[8], outR[8]);
	D_ff dff9(clk, reset, regWrite, decOut1b ,writeData[9], outR[9]);
	D_ff dff10(clk, reset, regWrite, decOut1b ,writeData[10], outR[10]);
	D_ff dff11(clk, reset, regWrite, decOut1b ,writeData[11], outR[11]);
	D_ff dff12(clk, reset, regWrite, decOut1b ,writeData[12], outR[12]);
	D_ff dff13(clk, reset, regWrite, decOut1b ,writeData[13], outR[13]);
	D_ff dff14(clk, reset, regWrite, decOut1b ,writeData[14], outR[14]);
	D_ff dff15(clk, reset, regWrite, decOut1b ,writeData[15], outR[15]);
	D_ff dff16(clk, reset, regWrite, decOut1b ,writeData[16], outR[16]);
	D_ff dff17(clk, reset, regWrite, decOut1b ,writeData[17], outR[17]);
	D_ff dff18(clk, reset, regWrite, decOut1b ,writeData[18], outR[18]);
	D_ff dff19(clk, reset, regWrite, decOut1b ,writeData[19], outR[19]);
	D_ff dff20(clk, reset, regWrite, decOut1b ,writeData[20], outR[20]);
	D_ff dff21(clk, reset, regWrite, decOut1b ,writeData[21], outR[21]);
	D_ff dff22(clk, reset, regWrite, decOut1b ,writeData[22], outR[22]);
	D_ff dff23(clk, reset, regWrite, decOut1b ,writeData[23], outR[23]);
	D_ff dff24(clk, reset, regWrite, decOut1b ,writeData[24], outR[24]);
	D_ff dff25(clk, reset, regWrite, decOut1b ,writeData[25], outR[25]);
	
endmodule


module tag_array(
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input [25:0] tag_in0, tag_in1, tag_in2, tag_in3, tag_in4, tag_in5, tag_in6, tag_in7,
	output [25:0] tag_out0, tag_out1, tag_out2, tag_out3, tag_out4, tag_out5, tag_out6, tag_out7
	);
	
	register26bit R0(clk, reset, regWrite, decOut1b, tag_in0, tag_out0 );
	register26bit R1(clk, reset, regWrite, decOut1b, tag_in1, tag_out1 );
	register26bit R2(clk, reset, regWrite, decOut1b, tag_in2, tag_out2 );
	register26bit R3(clk, reset, regWrite, decOut1b, tag_in3, tag_out3 );
	register26bit R4(clk, reset, regWrite, decOut1b, tag_in4, tag_out4 );
	register26bit R5(clk, reset, regWrite, decOut1b, tag_in5, tag_out5 );
	register26bit R6(clk, reset, regWrite, decOut1b, tag_in6, tag_out6 );
	register26bit R7(clk, reset, regWrite, decOut1b, tag_in7, tag_out7 );
	
endmodule

	
	

module block_array(
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input [31:0] block_in0, block_in1, block_in2, block_in3, block_in4, block_in5, block_in6, block_in7,
	output [31:0] block_out0, block_out1, block_out2, block_out3, block_out4, block_out5, block_out6, block_out7
	);
	
	register32bit r0(clk, reset, regWrite, decOut1b, block_in0, block_out0 );
	register32bit r1(clk, reset, regWrite, decOut1b, block_in1, block_out1 );
	register32bit r2(clk, reset, regWrite, decOut1b, block_in2, block_out2 );
	register32bit r3(clk, reset, regWrite, decOut1b, block_in3, block_out3 );
	register32bit r4(clk, reset, regWrite, decOut1b, block_in4, block_out4 );
	register32bit r5(clk, reset, regWrite, decOut1b, block_in5, block_out5 );
	register32bit r6(clk, reset, regWrite, decOut1b, block_in6, block_out6 );
	register32bit r7(clk, reset, regWrite, decOut1b, block_in7, block_out7 );
	
endmodule

module valid_bit_array(
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input valid_in0, valid_in1, valid_in2, valid_in3, valid_in4, valid_in5, valid_in6, valid_in7,
	output valid_out0, valid_out1, valid_out2, valid_out3, valid_out4, valid_out5, valid_out6, valid_out7
	);
	
	D_ff valid0(clk, reset, regWrite, decOut1b ,valid_in0, valid_out0);
	D_ff valid1(clk, reset, regWrite, decOut1b ,valid_in1, valid_out1);
	D_ff valid2(clk, reset, regWrite, decOut1b ,valid_in2, valid_out2);
	D_ff valid3(clk, reset, regWrite, decOut1b ,valid_in3, valid_out3);
	D_ff valid4(clk, reset, regWrite, decOut1b ,valid_in4, valid_out4);
	D_ff valid5(clk, reset, regWrite, decOut1b ,valid_in5, valid_out5);
	D_ff valid6(clk, reset, regWrite, decOut1b ,valid_in6, valid_out6);
	D_ff valid7(clk, reset, regWrite, decOut1b ,valid_in7, valid_out7);
	
endmodule
	

module dirty_bit_array(
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b,
	input dirty_in0, dirty_in1, dirty_in2, dirty_in3, dirty_in4, dirty_in5, dirty_in6, dirty_in7,
	output dirty_out0, dirty_out1, dirty_out2, dirty_out3, dirty_out4, dirty_out5, dirty_out6, dirty_out7
	);
	
	D_ff dirty0(clk, reset, regWrite, decOut1b ,dirty_in0, dirty_out0);
	D_ff dirty1(clk, reset, regWrite, decOut1b ,dirty_in1, dirty_out1);
	D_ff dirty2(clk, reset, regWrite, decOut1b ,dirty_in2, dirty_out2);
	D_ff dirty3(clk, reset, regWrite, decOut1b ,dirty_in3, dirty_out3);
	D_ff dirty4(clk, reset, regWrite, decOut1b ,dirty_in4, dirty_out4);
	D_ff dirty5(clk, reset, regWrite, decOut1b ,dirty_in5, dirty_out5);
	D_ff dirty6(clk, reset, regWrite, decOut1b ,dirty_in6, dirty_out6);
	D_ff dirty7(clk, reset, regWrite, decOut1b ,dirty_in7, dirty_out7);

endmodule

module D_ff_Halt( 
	input clk, 
	input reset, 
	input regWrite,  
	input d, 
	output reg q);
	
	always @ (negedge clk)
		begin
			if(reset==1)
				q=0;
			else
				if(regWrite == 1)
					begin
						q=d;
					end
		end
endmodule

module register4bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input [3:0] writeData,
	output [3:0] RegOut );
	
	D_ff_Halt d_ffh0(clk, reset, regWrite, writeData[0], RegOut[0]);
	D_ff_Halt d_ffh1(clk, reset, regWrite, writeData[1], RegOut[1]);
	D_ff_Halt d_ffh2(clk, reset, regWrite, writeData[2], RegOut[2]);
	D_ff_Halt d_ffh3(clk, reset, regWrite, writeData[3], RegOut[3]);
	
endmodule

module halt_tag_array(
	input clk, 
	input reset, 
	input [7:0] write_enable,  
	input [3:0] halt_tag_in,
	output[3:0] halt_tag_out0, halt_tag_out1, halt_tag_out2, halt_tag_out3, halt_tag_out4, halt_tag_out5, halt_tag_out6, halt_tag_out7
 	);
	
	register4bit R0(clk, reset, write_enable[0], halt_tag_in, halt_tag_out0 );
	register4bit R1(clk, reset, write_enable[1], halt_tag_in, halt_tag_out1 );
	register4bit R2(clk, reset, write_enable[2], halt_tag_in, halt_tag_out2 );
	register4bit R3(clk, reset, write_enable[3], halt_tag_in, halt_tag_out3 );
	register4bit R4(clk, reset, write_enable[4], halt_tag_in, halt_tag_out4 );
	register4bit R5(clk, reset, write_enable[5], halt_tag_in, halt_tag_out5 );
	register4bit R6(clk, reset, write_enable[6], halt_tag_in, halt_tag_out6 );
	register4bit R7(clk, reset, write_enable[7], halt_tag_in, halt_tag_out7 );
	
endmodule

module comparator4bit(input [3:0] in1, input [3:0] in2,output reg compOut);
  
  always@(in1, in2) 
    begin
      if(in1 == in2)  compOut = 1 ; 
      
      else            compOut = 0 ;        
    end
    
endmodule

module mux8to1_1bit(input in1, in2, in3, in4, in5, in6, in7, in8, input [2:0] sel, output reg muxOut );
  always@(in1, in2, in3, in4, in5, in6, in7, in8, sel)
    begin
      case(sel)
        3'b000 : muxOut = in1 ;
        3'b001 : muxOut = in2 ;
        3'b010 : muxOut = in3 ;
        3'b011 : muxOut = in4 ;
        3'b100 : muxOut = in5 ;
        3'b101 : muxOut = in6 ;
        3'b110 : muxOut = in7 ;
        3'b111 : muxOut = in8 ;
      endcase  
    end  
endmodule


module way_halting(input clk, 
                   input reset,
                   input[7:0] we,
                   input[3:0] halt_tag_write,  
                   input[3:0] tag, 
                   output halt_flag0, halt_flag1, halt_flag2, halt_flag3, halt_flag4, halt_flag5, halt_flag6, halt_flag7
                   );
                  
  wire[3:0] halt_regOut0, halt_regOut1, halt_regOut2, halt_regOut3, halt_regOut4, 
            halt_regOut5, halt_regOut6, halt_regOut7; 
  
  halt_tag_array array_halt(clk, reset, we, halt_tag_write, halt_regOut0, halt_regOut1, halt_regOut2, halt_regOut3, 
                              halt_regOut4, halt_regOut5, halt_regOut6, halt_regOut7);
                              
  comparator4bit comp1(tag, halt_regOut0, halt_flag0);
  comparator4bit comp2(tag, halt_regOut1, halt_flag1);
  comparator4bit comp3(tag, halt_regOut2, halt_flag2);
  comparator4bit comp4(tag, halt_regOut3, halt_flag3);
  comparator4bit comp5(tag, halt_regOut4, halt_flag4);
  comparator4bit comp6(tag, halt_regOut5, halt_flag5);
  comparator4bit comp7(tag, halt_regOut6, halt_flag6);
  comparator4bit comp8(tag, halt_regOut7, halt_flag7);
  
  
endmodule