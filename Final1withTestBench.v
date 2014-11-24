module D_ff(input clk, input reset, input regWrite,  input d, output reg q);
	always @(negedge clk)
		begin
			if(reset==1)
				q=0;
			else
				if(regWrite == 1)
						q=d;
		end
endmodule

module D_FF_LRU(input clk, input set, input reset, output reg Q);
  always @(negedge clk)
  begin
    if(reset==1'b1)
			Q=0;
		else
		begin
			if(set)
				Q=1;
			else
				Q=Q;
		end
	end
endmodule

module register4bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input [3:0] writeData,
	output [3:0] RegOut );
	
	D_ff d_ffh0(clk, reset, regWrite, writeData[0], RegOut[0]);
	D_ff d_ffh1(clk, reset, regWrite, writeData[1], RegOut[1]);
	D_ff d_ffh2(clk, reset, regWrite, writeData[2], RegOut[2]);
	D_ff d_ffh3(clk, reset, regWrite, writeData[3], RegOut[3]);
	
endmodule

module register8bit( 
	input clk, 
	input reset, 
	input regWrite, 

	input [7:0] writeData,
	output [7:0] outR );
	
	D_ff d_ff0(clk, reset, regWrite,writeData[0], outR[0]);
	D_ff d_ff1(clk, reset, regWrite,writeData[1], outR[1]);
	D_ff d_ff2(clk, reset, regWrite,writeData[2], outR[2]);
	D_ff d_ff3(clk, reset, regWrite,writeData[3], outR[3]);
	D_ff d_ff4(clk, reset, regWrite,writeData[4], outR[4]);
	D_ff d_ff5(clk, reset, regWrite,writeData[5], outR[5]);
	D_ff d_ff6(clk, reset, regWrite,writeData[6], outR[6]);
	D_ff d_ff7(clk, reset, regWrite,writeData[7], outR[7]);
	
endmodule
	
module register22bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input [21:0] writeData,
	output [21:0] outR );
	
	D_ff dff0(clk, reset, regWrite,  writeData[0], outR[0]);
	D_ff dff1(clk, reset, regWrite,  writeData[1], outR[1]);
	D_ff dff2(clk, reset, regWrite,  writeData[2], outR[2]);
	D_ff dff3(clk, reset, regWrite,  writeData[3], outR[3]);
	D_ff dff4(clk, reset, regWrite,  writeData[4], outR[4]);
	D_ff dff5(clk, reset, regWrite,  writeData[5], outR[5]);
	D_ff dff6(clk, reset, regWrite,  writeData[6], outR[6]);
	D_ff dff7(clk, reset, regWrite,  writeData[7], outR[7]);
	D_ff dff8(clk, reset, regWrite,  writeData[8], outR[8]);
	D_ff dff9(clk, reset, regWrite,  writeData[9], outR[9]);
	D_ff dff10(clk, reset, regWrite,  writeData[10], outR[10]);
	D_ff dff11(clk, reset, regWrite,  writeData[11], outR[11]);
	D_ff dff12(clk, reset, regWrite,  writeData[12], outR[12]);
	D_ff dff13(clk, reset, regWrite,  writeData[13], outR[13]);
	D_ff dff14(clk, reset, regWrite,  writeData[14], outR[14]);
	D_ff dff15(clk, reset, regWrite,  writeData[15], outR[15]);
	D_ff dff16(clk, reset, regWrite,  writeData[16], outR[16]);
	D_ff dff17(clk, reset, regWrite,  writeData[17], outR[17]);
	D_ff dff18(clk, reset, regWrite,  writeData[18], outR[18]);
	D_ff dff19(clk, reset, regWrite,  writeData[19], outR[19]);
	D_ff dff20(clk, reset, regWrite,  writeData[20], outR[20]);
	D_ff dff21(clk, reset, regWrite, writeData[21], outR[21]);
	
endmodule

module tag_array(
	input clk, 
	input reset,   
	input [7:0] decOut1b, 
	input [21:0] tag_in0,
  output [21:0] tag_out0,tag_out1, tag_out2, tag_out3, tag_out4, tag_out5, tag_out6, tag_out7
	);
	
	register22bit R0(clk, reset,   decOut1b[0], tag_in0, tag_out0 );
	register22bit R1(clk, reset,   decOut1b[1], tag_in0, tag_out1 );
	register22bit R2(clk, reset,   decOut1b[2], tag_in0, tag_out2 );
	register22bit R3(clk, reset,   decOut1b[3], tag_in0, tag_out3 );
	register22bit R4(clk, reset,   decOut1b[4], tag_in0, tag_out4 );
	register22bit R5(clk, reset,   decOut1b[5], tag_in0, tag_out5 );
	register22bit R6(clk, reset,   decOut1b[6], tag_in0, tag_out6 );
	register22bit R7(clk, reset,   decOut1b[7], tag_in0, tag_out7 );
	
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

/*
This block_data takes care whether we need to write a byte of data to the cache block or replace the whole block itself. In case of write hit/miss a byte 
of data is written or replaced. Only in read miss is the whole block replaced. The replacement circuitry used here is LRU_Square!
To solve the purpose we have used the decoded offset value which will help us choose the byte to which the data will be written.
In case read_signal is off, then only the 8-bit register which corresponds to the given offset will be used to take the write_byte.
*/
module block_data(
	input clk, 
	input reset, 
	input write_enable, read_signal, input[2:0] offset, input[7:0] write_byte,  
	input [7:0] block_in0, block_in1, block_in2, block_in3, block_in4, block_in5, block_in6, block_in7,
	output [7:0] block_out0, block_out1, block_out2, block_out3, block_out4, block_out5, block_out6, block_out7
	);
	
	wire [7:0] in0, in1, in2, in3, in4, in5, in6, in7, decOut;
	mux2to1_8b m1(write_byte,block_in0,read_signal,in0);
	mux2to1_8b m2(write_byte,block_in1,read_signal,in1);
	mux2to1_8b m3(write_byte,block_in2,read_signal,in2);
	mux2to1_8b m4(write_byte,block_in3,read_signal,in3);
	mux2to1_8b m5(write_byte,block_in4,read_signal,in4);
	mux2to1_8b m6(write_byte,block_in5,read_signal,in5);
	mux2to1_8b m7(write_byte,block_in6,read_signal,in6);
	mux2to1_8b m8(write_byte,block_in7,read_signal,in7);
	
	decoder_3to8 dec(offset, decOut);
	
	register8bit r0(clk, reset, write_enable & (decOut[0] | read_signal), in0, block_out0 );  
	register8bit r1(clk, reset, write_enable & (decOut[1] | read_signal), in1, block_out1 );
	register8bit r2(clk, reset, write_enable & (decOut[2] | read_signal), in2, block_out2 );
	register8bit r3(clk, reset, write_enable & (decOut[3] | read_signal), in3, block_out3 );
	register8bit r4(clk, reset, write_enable & (decOut[4] | read_signal), in4, block_out4 );
	register8bit r5(clk, reset, write_enable & (decOut[5] | read_signal), in5, block_out5 );
	register8bit r6(clk, reset, write_enable & (decOut[6] | read_signal), in6, block_out6 );
	register8bit r7(clk, reset, write_enable & (decOut[7] | read_signal), in7, block_out7 );
	
endmodule

module valid_bit_array(
	input clk, 
	input reset, 
	input [7:0]decOut1b, 
	input valid_in0,
	output valid_out0, valid_out1, valid_out2, valid_out3, valid_out4, valid_out5, valid_out6, valid_out7
	);
	
	D_ff valid0(clk, reset,   decOut1b[0] ,valid_in0, valid_out0);
	D_ff valid1(clk, reset,   decOut1b[1] ,valid_in0, valid_out1);
	D_ff valid2(clk, reset,   decOut1b[2] ,valid_in0, valid_out2);
	D_ff valid3(clk, reset,   decOut1b[3] ,valid_in0, valid_out3);
	D_ff valid4(clk, reset,   decOut1b[4] ,valid_in0, valid_out4);
	D_ff valid5(clk, reset,   decOut1b[5] ,valid_in0, valid_out5);
	D_ff valid6(clk, reset,   decOut1b[6] ,valid_in0, valid_out6);
	D_ff valid7(clk, reset,   decOut1b[7] ,valid_in0, valid_out7);
	
endmodule
	
	module data_array(
	input clk, 
	input reset,    
	input [7:0] we,
	input read_signal, input [2:0] offset, input [7:0] write_byte,
	input [63:0] in0,
	output [63:0] out0,out1,out2,out3,out4,out5,out6,out7);
	begin 
    block_data B0(clk,reset, we[0],read_signal,offset,write_byte,in0[7:0],in0[15:8], in0[23:16],in0[31:24],in0[39:32],
    in0[47:40],in0[55:48],in0[63:56],out0[7:0],out0[15:8], out0[23:16],out0[31:24],out0[39:32],
    out0[47:40],out0[55:48],out0[63:56]);
    
    block_data B1(clk,reset, we[1],read_signal,offset,write_byte,in0[7:0],in0[15:8], in0[23:16],in0[31:24],in0[39:32],
    in0[47:40],in0[55:48],in0[63:56],out1[7:0],out1[15:8],out1[23:16],out1[31:24],out1[39:32],
    out1[47:40],out1[55:48],out1[63:56]);	 
    
    block_data B2(clk,reset, we[2],read_signal,offset,write_byte,in0[7:0],in0[15:8], in0[23:16],in0[31:24],in0[39:32],
    in0[47:40],in0[55:48],in0[63:56],out2[7:0],out2[15:8], out2[23:16],out2[31:24],out2[39:32],
    out2[47:40],out2[55:48],out2[63:56]);
    
    block_data B3(clk,reset, we[3],read_signal,offset,write_byte,in0[7:0],in0[15:8], in0[23:16],in0[31:24],in0[39:32],
    in0[47:40],in0[55:48],in0[63:56],out3[7:0],out3[15:8], out3[23:16],out3[31:24],out3[39:32],
    out3[47:40],out3[55:48],out3[63:56]);
    
    block_data B4(clk,reset, we[4],read_signal,offset,write_byte,in0[7:0],in0[15:8], in0[23:16],in0[31:24],in0[39:32],
    in0[47:40],in0[55:48],in0[63:56],out4[7:0],out4[15:8], out4[23:16],out4[31:24],out4[39:32],
    out4[47:40],out4[55:48],out4[63:56]);
    
    block_data B5(clk,reset, we[5],read_signal,offset,write_byte,in0[7:0],in0[15:8], in0[23:16],in0[31:24],in0[39:32],
    in0[47:40],in0[55:48],in0[63:56],out5[7:0],out5[15:8], out5[23:16],out5[31:24],out5[39:32],
    out5[47:40],out5[55:48],out5[63:56]);
    
    block_data B6(clk,reset, we[6],read_signal,offset,write_byte,in0[7:0],in0[15:8], in0[23:16],in0[31:24],in0[39:32],
    in0[47:40],in0[55:48],in0[63:56],out6[7:0],out6[15:8], out6[23:16],out6[31:24],out6[39:32],
    out6[47:40],out6[55:48],out6[63:56]);
    
    block_data B7(clk,reset, we[7],read_signal,offset,write_byte,in0[7:0],in0[15:8], in0[23:16],in0[31:24],in0[39:32],
    in0[47:40],in0[55:48],in0[63:56],out7[7:0],out7[15:8], out7[23:16],out7[31:24],out7[39:32],
    out7[47:40],out7[55:48],out7[63:56]);
    
 end
 endmodule    
 
 module mux8to1_1b( input valid_in0, valid_in1, valid_in2, valid_in3, valid_in4, valid_in5, valid_in6, valid_in7,input[2:0] Sel,
	output reg  valid_out);
  always @(valid_in0, valid_in1, valid_in2, valid_in3, valid_in4, valid_in5, valid_in6, valid_in7,Sel)
    case(Sel)
      3'b000: valid_out=valid_in0;
      3'b001: valid_out=valid_in1;
      3'b010: valid_out=valid_in2;
      3'b011: valid_out=valid_in3;
      3'b100: valid_out=valid_in4;
      3'b101: valid_out=valid_in5;
      3'b110: valid_out=valid_in6;
      3'b111: valid_out=valid_in7;
  endcase
endmodule

module mux8to1_8b( input[7:0] valid_in0, valid_in1, valid_in2, valid_in3, valid_in4, valid_in5, valid_in6, valid_in7,input[2:0] Sel,
	output reg[7:0]  valid_out);
  always @(valid_in0, valid_in1, valid_in2, valid_in3, valid_in4, valid_in5, valid_in6, valid_in7,Sel)
    case(Sel)
      3'b000: valid_out=valid_in0;
      3'b001: valid_out=valid_in1;
      3'b010: valid_out=valid_in2;
      3'b011: valid_out=valid_in3;
      3'b100: valid_out=valid_in4;
      3'b101: valid_out=valid_in5;
      3'b110: valid_out=valid_in6;
      3'b111: valid_out=valid_in7;
  endcase
endmodule
 
module mux8to1_22b( input [21:0] tag_in0, tag_in1, tag_in2, tag_in3, tag_in4, tag_in5, tag_in6, tag_in7, input [2:0] Sel, output reg [21:0] tag_out );
  always @(tag_in0, tag_in1, tag_in2, tag_in3, tag_in4, tag_in5, tag_in6, tag_in7,Sel)
    case(Sel)
      3'b000: tag_out=tag_in0;
      3'b001: tag_out=tag_in1;
      3'b010: tag_out=tag_in2;
      3'b011: tag_out=tag_in3;
      3'b100: tag_out=tag_in4;
      3'b101: tag_out=tag_in5;
      3'b110: tag_out=tag_in6;
      3'b111: tag_out=tag_in7;
  endcase
endmodule

module mux2to1_8b(input [7:0] in1,in2, input Sel, output reg [7:0] data_out );
  always @(in1,in2,Sel)
    case(Sel)
      1'b0 : data_out = in1;
      1'b1 : data_out = in2;
  endcase
endmodule

module mux8to1_64b( input [63:0] in0,in1,in2,in3,in4,in5,in6,in7, input [2:0] Sel, output reg [63:0] data_out );
  always @(in0,in1,in2,in3,in4,in5,in6,in7,Sel)
    case(Sel)
      3'b000: data_out=in0;
      3'b001: data_out=in1;
      3'b010: data_out=in2;
      3'b011: data_out=in3;
      3'b100: data_out=in4;
      3'b101: data_out=in5;
      3'b110: data_out=in6;
      3'b111: data_out=in7;
  endcase
endmodule

module comparator_4bit(input [3:0] in1, input [3:0] in2,output reg compOut);
  
  always@(in1, in2) 
    begin
      if(in1 == in2)  compOut = 1 ; 
      
      else            compOut = 0 ;        
    end
    
endmodule

module comparator_22b(input [21:0] in1, input [21:0] in2, input flag ,output reg compOut);

always@(in1, in2,flag) 
   if(flag==1'b1)
    begin
      if(in1 == in2)  compOut = 1'b1 ;
         
      else            compOut = 1'b0 ;        
    end
    
  else compOut = 1'b0 ; 

endmodule
 
module decoder_3to8(input [2:0] muxOut, output reg [7:0] decOut);
  always@(muxOut)
  begin
    case(muxOut)
      3'b000 : decOut = 8'b00000001;
      3'b001 : decOut = 8'b00000010;
      3'b010 : decOut = 8'b00000100;
      3'b011 : decOut = 8'b00001000;
      3'b100 : decOut = 8'b00010000;
      3'b101 : decOut = 8'b00100000;
      3'b110 : decOut = 8'b01000000;
      3'b111 : decOut = 8'b10000000;
    endcase
  end
endmodule

module mux2to1_3bit(input [2:0] in0, input [2:0] in1, input Sel, output reg [2:0] data_out);
  always @(in0,in1,Sel)
    case(Sel)
      1'b0: data_out=in0;
      1'b1: data_out=in1;
  endcase
endmodule

module wr_enable_signals(input [7:0]set_arr, input [2:0]way, input hit, input read_signal, output [7:0] out1,out2,out3,out4,out5,out6,out7,out8);
  wire [7:0] way_arr;
  decoder_3to8 dec1(way,way_arr);
  assign val = (~(hit & read_signal));
  
  assign out1[0] = way_arr[0] & val & set_arr[0];
  assign out1[1] = way_arr[0] & val & set_arr[1];
  assign out1[2] = way_arr[0] & val & set_arr[2];
  assign out1[3] = way_arr[0] & val & set_arr[3];
  assign out1[4] = way_arr[0] & val & set_arr[4];
  assign out1[5] = way_arr[0] & val & set_arr[5];
  assign out1[6] = way_arr[0] & val & set_arr[6];
  assign out1[7] = way_arr[0] & val & set_arr[7];
  
  assign out2[0] = way_arr[1] & val & set_arr[0];
  assign out2[1] = way_arr[1] & val & set_arr[1];
  assign out2[2] = way_arr[1] & val & set_arr[2];
  assign out2[3] = way_arr[1] & val & set_arr[3];
  assign out2[4] = way_arr[1] & val & set_arr[4];
  assign out2[5] = way_arr[1] & val & set_arr[5];
  assign out2[6] = way_arr[1] & val & set_arr[6];
  assign out2[7] = way_arr[1] & val & set_arr[7];
  
  assign out3[0] = way_arr[2] & val & set_arr[0];
  assign out3[1] = way_arr[2] & val & set_arr[1];
  assign out3[2] = way_arr[2] & val & set_arr[2];
  assign out3[3] = way_arr[2] & val & set_arr[3];
  assign out3[4] = way_arr[2] & val & set_arr[4];
  assign out3[5] = way_arr[2] & val & set_arr[5];
  assign out3[6] = way_arr[2] & val & set_arr[6];
  assign out3[7] = way_arr[2] & val & set_arr[7];
  
  assign out4[0] = way_arr[3] & val & set_arr[0];
  assign out4[1] = way_arr[3] & val & set_arr[1];
  assign out4[2] = way_arr[3] & val & set_arr[2];
  assign out4[3] = way_arr[3] & val & set_arr[3];
  assign out4[4] = way_arr[3] & val & set_arr[4];
  assign out4[5] = way_arr[3] & val & set_arr[5];
  assign out4[6] = way_arr[3] & val & set_arr[6];
  assign out4[7] = way_arr[3] & val & set_arr[7];
  
  assign out5[0] = way_arr[4] & val & set_arr[0];
  assign out5[1] = way_arr[4] & val & set_arr[1];
  assign out5[2] = way_arr[4] & val & set_arr[2];
  assign out5[3] = way_arr[4] & val & set_arr[3];
  assign out5[4] = way_arr[4] & val & set_arr[4];
  assign out5[5] = way_arr[4] & val & set_arr[5];
  assign out5[6] = way_arr[4] & val & set_arr[6];
  assign out5[7] = way_arr[4] & val & set_arr[7];
  
  assign out6[0] = way_arr[5] & val & set_arr[0];
  assign out6[1] = way_arr[5] & val & set_arr[1];
  assign out6[2] = way_arr[5] & val & set_arr[2];
  assign out6[3] = way_arr[5] & val & set_arr[3];
  assign out6[4] = way_arr[5] & val & set_arr[4];
  assign out6[5] = way_arr[5] & val & set_arr[5];
  assign out6[6] = way_arr[5] & val & set_arr[6];
  assign out6[7] = way_arr[5] & val & set_arr[7];
  
  assign out7[0] = way_arr[6] & val & set_arr[0];
  assign out7[1] = way_arr[6] & val & set_arr[1];
  assign out7[2] = way_arr[6] & val & set_arr[2];
  assign out7[3] = way_arr[6] & val & set_arr[3];
  assign out7[4] = way_arr[6] & val & set_arr[4];
  assign out7[5] = way_arr[6] & val & set_arr[5];
  assign out7[6] = way_arr[6] & val & set_arr[6];
  assign out7[7] = way_arr[6] & val & set_arr[7];
  
  assign out8[0] = way_arr[7] & val & set_arr[0];
  assign out8[1] = way_arr[7] & val & set_arr[1];
  assign out8[2] = way_arr[7] & val & set_arr[2];
  assign out8[3] = way_arr[7] & val & set_arr[3];
  assign out8[4] = way_arr[7] & val & set_arr[4];
  assign out8[5] = way_arr[7] & val & set_arr[5];
  assign out8[6] = way_arr[7] & val & set_arr[6];
  assign out8[7] = way_arr[7] & val & set_arr[7];

endmodule


module way(input clk, reset, input read_signal, input [2:0] offset, input [7:0] write_byte, input [7:0] decOut,input valid_in0,input[21:0] tag_in0, input[63:0] data_in0, input [2:0] index, output valid_out_mux,output [21:0] tag_out_mux, output [63:0] data_out_mux); 
begin 
      wire valid_out1,valid_out2,valid_out3,valid_out4,valid_out5,valid_out6,valid_out7; 
      wire [21:0] tag_out0, tag_out1, tag_out2, tag_out3, tag_out4, tag_out5, tag_out6, tag_out7;
      wire [63:0] out0,out1,out2,out3,out4,out5,out6,out7;
    
      valid_bit_array validArray(clk,reset,decOut,valid_in0,valid_out0,valid_out1,valid_out2,valid_out3,valid_out4,valid_out5,valid_out6,valid_out7);     
      tag_array tagArray(clk,reset, decOut, tag_in0, tag_out0, tag_out1, tag_out2, tag_out3, tag_out4, tag_out5, tag_out6, tag_out7);
	    data_array dataArray(clk,reset,decOut,read_signal,offset,write_byte,data_in0,out0,out1,out2,out3,out4,out5,out6,out7);
	    
	    mux8to1_1b mux_valid(valid_out0, valid_out1,valid_out2,valid_out3,valid_out4,valid_out5,valid_out6,valid_out7,index,valid_out_mux);
	    mux8to1_22b mux_tag(tag_out0, tag_out1, tag_out2, tag_out3, tag_out4, tag_out5, tag_out6, tag_out7,index,tag_out_mux);
	    mux8to1_64b mux_data(out0,out1,out2,out3,out4,out5,out6,out7,index,data_out_mux);
	 
	 end
endmodule


module way_halting(input clk, 
                   input reset,
                   input[7:0] we,
                   input[3:0] halt_tag_write,  
                   input[3:0] tag, 
                   output halt_flag0, halt_flag1, halt_flag2, halt_flag3, halt_flag4, halt_flag5, halt_flag6, halt_flag7,
                   output final_halt_flag
                   );
                  
  wire[3:0] halt_regOut0, halt_regOut1, halt_regOut2, halt_regOut3, halt_regOut4, 
            halt_regOut5, halt_regOut6, halt_regOut7; 
  
  halt_tag_array array_halt(clk, reset, we, halt_tag_write, halt_regOut0, halt_regOut1, halt_regOut2, halt_regOut3, 
                              halt_regOut4, halt_regOut5, halt_regOut6, halt_regOut7);
                              
  comparator_4bit comp1(tag, halt_regOut0, halt_flag0);
  comparator_4bit comp2(tag, halt_regOut1, halt_flag1);
  comparator_4bit comp3(tag, halt_regOut2, halt_flag2);
  comparator_4bit comp4(tag, halt_regOut3, halt_flag3);
  comparator_4bit comp5(tag, halt_regOut4, halt_flag4);
  comparator_4bit comp6(tag, halt_regOut5, halt_flag5);
  comparator_4bit comp7(tag, halt_regOut6, halt_flag6);
  comparator_4bit comp8(tag, halt_regOut7, halt_flag7);
  
  assign final_halt_flag = halt_flag0 | halt_flag1 | halt_flag2 | halt_flag3 | halt_flag4 | halt_flag5 | halt_flag6 | halt_flag7 ; 
endmodule

module NxN_DFFs(input clk, input reset, input [7:0] decOut, output [7:0] NxNOut);
  wire [7:0]rPin;
	assign rPin=decOut|{8{reset}};
	wire [7:0] d0Out,d1Out,d2Out,d3Out,d4Out,d5Out,d6Out,d7Out;
	
	D_FF_LRU d0_0 (clk, decOut[0], rPin[0], d0Out[0]);
	D_FF_LRU d0_1 (clk, decOut[0], rPin[1], d0Out[1]);
	D_FF_LRU d0_2 (clk, decOut[0], rPin[2], d0Out[2]);
	D_FF_LRU d0_3 (clk, decOut[0], rPin[3], d0Out[3]);
	D_FF_LRU d0_4 (clk, decOut[0], rPin[4], d0Out[4]);
	D_FF_LRU d0_5 (clk, decOut[0], rPin[5], d0Out[5]);
	D_FF_LRU d0_6 (clk, decOut[0], rPin[6], d0Out[6]);
	D_FF_LRU d0_7 (clk, decOut[0], rPin[7], d0Out[7]);

	D_FF_LRU d1_0 (clk, decOut[1], rPin[0], d1Out[0]);
	D_FF_LRU d1_1 (clk, decOut[1], rPin[1], d1Out[1]);
	D_FF_LRU d1_2 (clk, decOut[1], rPin[2], d1Out[2]);
	D_FF_LRU d1_3 (clk, decOut[1], rPin[3], d1Out[3]);
	D_FF_LRU d1_4 (clk, decOut[1], rPin[4], d1Out[4]);
	D_FF_LRU d1_5 (clk, decOut[1], rPin[5], d1Out[5]);
	D_FF_LRU d1_6 (clk, decOut[1], rPin[6], d1Out[6]);
	D_FF_LRU d1_7 (clk, decOut[1], rPin[7], d1Out[7]);
		
	D_FF_LRU d2_0 (clk, decOut[2], rPin[0], d2Out[0]);
	D_FF_LRU d2_1 (clk, decOut[2], rPin[1], d2Out[1]);
	D_FF_LRU d2_2 (clk, decOut[2], rPin[2], d2Out[2]);
	D_FF_LRU d2_3 (clk, decOut[2], rPin[3], d2Out[3]);
	D_FF_LRU d2_4 (clk, decOut[2], rPin[4], d2Out[4]);
	D_FF_LRU d2_5 (clk, decOut[2], rPin[5], d2Out[5]);
	D_FF_LRU d2_6 (clk, decOut[2], rPin[6], d2Out[6]);
	D_FF_LRU d2_7 (clk, decOut[2], rPin[7], d2Out[7]);
		
	D_FF_LRU d3_0 (clk, decOut[3], rPin[0], d3Out[0]);
	D_FF_LRU d3_1 (clk, decOut[3], rPin[1], d3Out[1]);
	D_FF_LRU d3_2 (clk, decOut[3], rPin[2], d3Out[2]);
	D_FF_LRU d3_3 (clk, decOut[3], rPin[3], d3Out[3]);
	D_FF_LRU d3_4 (clk, decOut[3], rPin[4], d3Out[4]);
	D_FF_LRU d3_5 (clk, decOut[3], rPin[5], d3Out[5]);
	D_FF_LRU d3_6 (clk, decOut[3], rPin[6], d3Out[6]);
	D_FF_LRU d3_7 (clk, decOut[3], rPin[7], d3Out[7]);
			
	D_FF_LRU d4_0 (clk, decOut[4], rPin[0], d4Out[0]);
	D_FF_LRU d4_1 (clk, decOut[4], rPin[1], d4Out[1]);
	D_FF_LRU d4_2 (clk, decOut[4], rPin[2], d4Out[2]);
	D_FF_LRU d4_3 (clk, decOut[4], rPin[3], d4Out[3]);
	D_FF_LRU d4_4 (clk, decOut[4], rPin[4], d4Out[4]);
	D_FF_LRU d4_5 (clk, decOut[4], rPin[5], d4Out[5]);
	D_FF_LRU d4_6 (clk, decOut[4], rPin[6], d4Out[6]);
	D_FF_LRU d4_7 (clk, decOut[4], rPin[7], d4Out[7]);	
	
	D_FF_LRU d5_0 (clk, decOut[5], rPin[0], d5Out[0]);
	D_FF_LRU d5_1 (clk, decOut[5], rPin[1], d5Out[1]);
	D_FF_LRU d5_2 (clk, decOut[5], rPin[2], d5Out[2]);
	D_FF_LRU d5_3 (clk, decOut[5], rPin[3], d5Out[3]);
	D_FF_LRU d5_4 (clk, decOut[5], rPin[4], d5Out[4]);
	D_FF_LRU d5_5 (clk, decOut[5], rPin[5], d5Out[5]);
	D_FF_LRU d5_6 (clk, decOut[5], rPin[6], d5Out[6]);
	D_FF_LRU d5_7 (clk, decOut[5], rPin[7], d5Out[7]);
		
	D_FF_LRU d6_0 (clk, decOut[6], rPin[0], d6Out[0]);
	D_FF_LRU d6_1 (clk, decOut[6], rPin[1], d6Out[1]);
	D_FF_LRU d6_2 (clk, decOut[6], rPin[2], d6Out[2]);
	D_FF_LRU d6_3 (clk, decOut[6], rPin[3], d6Out[3]);
	D_FF_LRU d6_4 (clk, decOut[6], rPin[4], d6Out[4]);
	D_FF_LRU d6_5 (clk, decOut[6], rPin[5], d6Out[5]);
	D_FF_LRU d6_6 (clk, decOut[6], rPin[6], d6Out[6]);
	D_FF_LRU d6_7 (clk, decOut[6], rPin[7], d6Out[7]);		
	
	D_FF_LRU d7_0 (clk, decOut[7], rPin[0], d7Out[0]);
	D_FF_LRU d7_1 (clk, decOut[7], rPin[1], d7Out[1]);
	D_FF_LRU d7_2 (clk, decOut[7], rPin[2], d7Out[2]);
	D_FF_LRU d7_3 (clk, decOut[7], rPin[3], d7Out[3]);
	D_FF_LRU d7_4 (clk, decOut[7], rPin[4], d7Out[4]);
	D_FF_LRU d7_5 (clk, decOut[7], rPin[5], d7Out[5]);
	D_FF_LRU d7_6 (clk, decOut[7], rPin[6], d7Out[6]);
	D_FF_LRU d7_7 (clk, decOut[7], rPin[7], d7Out[7]);
	
	assign NxNOut[0]=d0Out[0]|d0Out[1]|d0Out[2]|d0Out[3]|d0Out[4]|d0Out[5]|d0Out[6]|d0Out[7];
	assign NxNOut[1]=d1Out[0]|d1Out[1]|d1Out[2]|d1Out[3]|d1Out[4]|d1Out[5]|d1Out[6]|d1Out[7];
	assign NxNOut[2]=d2Out[0]|d2Out[1]|d2Out[2]|d2Out[3]|d2Out[4]|d2Out[5]|d2Out[6]|d2Out[7];
	assign NxNOut[3]=d3Out[0]|d3Out[1]|d3Out[2]|d3Out[3]|d3Out[4]|d3Out[5]|d3Out[6]|d3Out[7];
	assign NxNOut[4]=d4Out[0]|d4Out[1]|d4Out[2]|d4Out[3]|d4Out[4]|d4Out[5]|d4Out[6]|d4Out[7];
	assign NxNOut[5]=d5Out[0]|d5Out[1]|d5Out[2]|d5Out[3]|d5Out[4]|d5Out[5]|d5Out[6]|d5Out[7];
	assign NxNOut[6]=d6Out[0]|d6Out[1]|d6Out[2]|d6Out[3]|d6Out[4]|d6Out[5]|d6Out[6]|d6Out[7];
	assign NxNOut[7]=d7Out[0]|d7Out[1]|d7Out[2]|d7Out[3]|d7Out[4]|d7Out[5]|d7Out[6]|d7Out[7];
	
endmodule

module priority_Encoder(input [7:0] NxNOut, output reg [2:0] LRUWay); 
  always@(NxNOut)
  begin
    if(NxNOut[0] == 1'b0)
      LRUWay = 3'b000;
    else if(NxNOut[1] == 1'b0)
      LRUWay = 3'b001;
    else if(NxNOut[2] == 1'b0)
      LRUWay = 3'b010;
    else if(NxNOut[3] == 1'b0)
      LRUWay = 3'b011;
    else if(NxNOut[4] == 1'b0)
      LRUWay = 3'b100;
    else if(NxNOut[5] == 1'b0)
      LRUWay = 3'b101;
    else if(NxNOut[6] == 1'b0)
      LRUWay = 3'b110;
    else if(NxNOut[7] == 1'b0)
      LRUWay = 3'b111;
  end
endmodule

module LRU_Square(input [2:0] LineIndex, input [2:0] input2, input clk, input reset, input Hit, output [2:0] LRUWay);
  wire[2:0] muxOut;
  wire[7:0] decOut, NxNOut;
  mux2to1_3bit R1(input2, LineIndex, Hit, muxOut);
  decoder_3to8 R2(muxOut, decOut);
  NxN_DFFs R3(clk, reset, decOut, NxNOut);
  priority_Encoder R4(NxNOut, LRUWay);
endmodule

module encoder(input [7:0] e, output reg [2:0] way);
  always@(e)
  begin
       case(e)
          //8'b00000000 : way = 3'b000;
          8'b00000001 : way = 3'b000;
          8'b00000010 : way = 3'b001;
          8'b00000100 : way = 3'b010;
          8'b00001000 : way = 3'b011;
          8'b00010000 : way = 3'b100;
          8'b00100000 : way = 3'b101;
          8'b01000000 : way = 3'b110;
          8'b10000000 : way = 3'b111;
        endcase
  end
endmodule  

module data_read(input [7:0] e, input hit, input [2:0]offset, input [63:0] data0, input [63:0] data1, input [63:0] data2, input [63:0] data3, input [63:0] data4, input [63:0] data5, input [63:0] data6, input [63:0] data7, output [2:0] line_index, output [7:0] out_data);
  wire [63:0] mux1_out;
  encoder enc(e,line_index);
  
  mux8to1_64b mux1(data0,data1,data2,data3,data4,data5,data6,data7,line_index,mux1_out);
  mux8to1_8b mux2(mux1_out[7:0],mux1_out[15:8],mux1_out[23:16],mux1_out[31:24],mux1_out[39:32],mux1_out[47:40],mux1_out[55:48],mux1_out[63:56],offset,out_data);

endmodule

module check_invalid(input valid0, input valid1, input valid2, input valid3, input valid4, input valid5, input valid6, input valid7, output reg [2:0] invalid_way, output reg lru_invalid);
  always@(valid0 or valid1 or valid2 or valid3 or valid4 or valid5 or valid6 or valid7)
  begin
    if(valid0 == 1'b0)
      begin
        lru_invalid = 1'b1;
        invalid_way = 3'b000;
      end
    else if(valid1 == 1'b0)
      begin
        lru_invalid = 1'b1;
        invalid_way = 3'b001;
      end
    else if(valid2 == 1'b0)
      begin
        lru_invalid = 1'b1;
        invalid_way = 3'b010;
      end
    else if(valid3 == 1'b0)
      begin
        lru_invalid = 1'b1;
        invalid_way = 3'b011;
      end
    else if(valid4 == 1'b0)
      begin
        lru_invalid = 1'b1;
        invalid_way = 3'b100;
      end
    else if(valid5 == 1'b0)
      begin
        lru_invalid = 1'b1;
        invalid_way = 3'b101;
      end
    else if(valid6 == 1'b0)
      begin
        lru_invalid = 1'b1;
        invalid_way = 3'b110;
      end
    else if(valid7 == 1'b0)
      begin
        lru_invalid = 1'b1;
        invalid_way = 3'b111;
      end
  end
endmodule

module topmodule(input clk,input reset,input [31:0]address,input read_signal,input write_signal,input [63:0]write_data,input [7:0] write_byte, output read_hit, output write_hit, output [7:0]read_data, output hit, output halt_hit);
  
  wire[21:0] tag0,tag1,tag2,tag3,tag4,tag5,tag6,tag7;
  wire[7:0] decOut,way0_sig,way1_sig,way2_sig,way3_sig,way4_sig,way5_sig,way6_sig,way7_sig;
  wire[2:0] LRU_Way,invalid_way,out1,line_index,final_way;
  wire[63:0] data0,data1,data2,data3,data4,data5,data6,data7;
  wire valid0,valid1,valid2,valid3,valid4,valid5,valid6,valid7,flag00, flag01, flag02,  flag03,  flag04,  flag05,  flag06,  flag07;
  wire flag10, flag11, flag12,  flag13,  flag14,  flag15,  flag16,  flag17,flag20, flag21, flag22,  flag23,  flag24,  flag25,  flag26,  flag27;
  wire flag30, flag31, flag32,  flag33,  flag34,  flag35,  flag36,  flag37,flag40, flag41, flag42,  flag43,  flag44,  flag45,  flag46,  flag47;
  wire flag50, flag51, flag52,  flag53,  flag54,  flag55,  flag56,  flag57, flag60, flag61, flag62,  flag63,  flag64,  flag65,  flag66,  flag67;
  wire flag70, flag71, flag72,  flag73,  flag74,  flag75,  flag76,  flag77;
  wire flag0, flag1, flag2,  flag3,  flag4,  flag5,  flag6,  flag7;
  wire compOut0,compOut1,compOut2,compOut3,compOut4,compOut5,compOut6,compOut7;
  wire halt_flag0, halt_flag1, halt_flag2, halt_flag3, halt_flag4, halt_flag5, halt_flag6, halt_flag7 ; 
  
   decoder_3to8 dec(address[5:3], decOut);                      //decOut will have the bit corresponding to the matched set as 1 while all would be 0.
   mux2to1_3bit r1( LRU_Way,invalid_way,lru_invalid,out1 );    //basically to choose which block to replace. In case of an invalid block, that will be chosen irrespective of what LRU_Square decides to replace.
   mux2to1_3bit r2( out1,line_index,hit,final_way );
   wr_enable_signals r3(decOut,final_way,hit,read_signal,way0_sig,way1_sig,way2_sig,way3_sig,way4_sig,way5_sig,way6_sig,way7_sig); //Generation of all 64 write_enables for all the 64 blocks (valid + tag + data).
   
   way r4(clk,reset,read_signal,address[2:0],write_byte,way0_sig,1'b1,address[31:10],write_data,address[5:3],valid0,tag0,data0);
   way r5(clk,reset,read_signal,address[2:0],write_byte,way1_sig,1'b1,address[31:10],write_data,address[5:3],valid1,tag1,data1);
   way r6(clk,reset,read_signal,address[2:0],write_byte,way2_sig,1'b1,address[31:10],write_data,address[5:3],valid2,tag2,data2);
   way r7(clk,reset,read_signal,address[2:0],write_byte,way3_sig,1'b1,address[31:10],write_data,address[5:3],valid3,tag3,data3);
   way r8(clk,reset,read_signal,address[2:0],write_byte,way4_sig,1'b1,address[31:10],write_data,address[5:3],valid4,tag4,data4);
   way r9(clk,reset,read_signal,address[2:0],write_byte,way5_sig,1'b1,address[31:10],write_data,address[5:3],valid5,tag5,data5); 
   way r10(clk,reset,read_signal,address[2:0],write_byte,way6_sig,1'b1,address[31:10],write_data,address[5:3],valid6,tag6,data6);
   way r11(clk,reset,read_signal,address[2:0],write_byte,way7_sig,1'b1,address[31:10],write_data,address[5:3],valid7,tag7,data7); 
   
   way_halting w1(clk, reset, way0_sig, address[9:6], address[9:6], flag00, flag01, flag02,  flag03,  flag04,  flag05,  flag06,  flag07, halt_flag0);
   way_halting w2(clk, reset, way1_sig, address[9:6], address[9:6], flag10, flag11, flag12,  flag13,  flag14,  flag15,  flag16,  flag17, halt_flag1);
   way_halting w3(clk, reset, way2_sig, address[9:6], address[9:6], flag20, flag21, flag22,  flag23,  flag24,  flag25,  flag26,  flag27, halt_flag2);
   way_halting w4(clk, reset, way3_sig, address[9:6], address[9:6], flag30, flag31, flag32,  flag33,  flag34,  flag35,  flag36,  flag37, halt_flag3);
   way_halting w5(clk, reset, way4_sig, address[9:6], address[9:6], flag40, flag41, flag42,  flag43,  flag44,  flag45,  flag46,  flag47, halt_flag4);
   way_halting w6(clk, reset, way5_sig, address[9:6], address[9:6], flag50, flag51, flag52,  flag53,  flag54,  flag55,  flag56,  flag57, halt_flag5);
   way_halting w7(clk, reset, way6_sig, address[9:6], address[9:6], flag60, flag61, flag62,  flag63,  flag64,  flag65,  flag66,  flag67, halt_flag6);
   way_halting w8(clk, reset, way7_sig, address[9:6], address[9:6], flag70, flag71, flag72,  flag73,  flag74,  flag75,  flag76,  flag77, halt_flag7);
   
   mux8to1_1b m1( flag00&decOut[0], flag01&decOut[1], flag02&decOut[2],  flag03&decOut[3],  flag04&decOut[4],  flag05&decOut[5],  flag06&decOut[6],  flag07&decOut[7], address[5:3],flag0);
   mux8to1_1b m2( flag10&decOut[0], flag11&decOut[1], flag12&decOut[2],  flag13&decOut[3],  flag14&decOut[4],  flag15&decOut[5],  flag16&decOut[6],  flag17&decOut[7], address[5:3],flag1);
   mux8to1_1b m3( flag20&decOut[0], flag21&decOut[1], flag22&decOut[2],  flag23&decOut[3],  flag24&decOut[4],  flag25&decOut[5],  flag26&decOut[6],  flag27&decOut[7], address[5:3],flag2);
   mux8to1_1b m4( flag30&decOut[0], flag31&decOut[1], flag32&decOut[2],  flag33&decOut[3],  flag34&decOut[4],  flag35&decOut[5],  flag36&decOut[6],  flag37&decOut[7], address[5:3],flag3);
   mux8to1_1b m5( flag40&decOut[0], flag41&decOut[1], flag42&decOut[2],  flag43&decOut[3],  flag44&decOut[4],  flag45&decOut[5],  flag46&decOut[6],  flag47&decOut[7], address[5:3],flag4);
   mux8to1_1b m6( flag50&decOut[0], flag51&decOut[1], flag52&decOut[2],  flag53&decOut[3],  flag54&decOut[4],  flag55&decOut[5],  flag56&decOut[6],  flag57&decOut[7], address[5:3],flag5);
   mux8to1_1b m7( flag60&decOut[0], flag61&decOut[1], flag62&decOut[2],  flag63&decOut[3],  flag64&decOut[4],  flag65&decOut[5],  flag66&decOut[6],  flag67&decOut[7], address[5:3],flag6);
   mux8to1_1b m8( flag70&decOut[0], flag71&decOut[1], flag72&decOut[2],  flag73&decOut[3],  flag74&decOut[4],  flag75&decOut[5],  flag76&decOut[6],  flag77&decOut[7], address[5:3],flag7);
   
   comparator_22b c1(tag0, address[31:10], flag0, compOut0);
   comparator_22b c2(tag1, address[31:10], flag1, compOut1);
   comparator_22b c3(tag2, address[31:10], flag2, compOut2);
   comparator_22b c4(tag3, address[31:10], flag3, compOut3);
   comparator_22b c5(tag4, address[31:10], flag4, compOut4);
   comparator_22b c6(tag5, address[31:10], flag5, compOut5);
   comparator_22b c7(tag6, address[31:10], flag6, compOut6);
   comparator_22b c8(tag7, address[31:10], flag7, compOut7);
   
   
   assign hit = ((valid0&compOut0) | (valid1&compOut1) | (valid2&compOut2) | (valid3&compOut3) | (valid4&compOut4) | (valid5&compOut5) | (valid6&compOut6) | (valid7&compOut7));
   assign write_hit = hit & write_signal;
   assign read_hit = hit & read_signal;
   assign halt_hit = (halt_flag0 | halt_flag1 | halt_flag2 | halt_flag3 | halt_flag4 | halt_flag5 | halt_flag6 | halt_flag7);  
   
   
   LRU_Square ls(line_index, out1, clk, reset, hit, LRU_Way); //A slight modification made in the usual implementation to consider the case when the recently placed block in case of a miss if an invalid block instead of what LRU_Square last chose.
   
   data_read dr({(valid7&compOut7),(valid6&compOut6),(valid5&compOut5),(valid4&compOut4),(valid3&compOut3),(valid2&compOut2),(valid1&compOut1),(valid0&compOut0)}, hit, address[2:0], data0, data1, data2, data3, data4, data5, data6, data7, line_index, read_data);
   check_invalid chk(valid0, valid1, valid2, valid3, valid4, valid5, valid6, valid7, invalid_way, lru_invalid);
   
   
 endmodule
 
 module testBenchCache;
   //Inputs to main module
   
   reg clk, reset, read_signal, write_signal;
   reg[31:0] address ; 
   reg[63:0] data ;
   reg[7:0] byte ;     
   
   //Outputs
   wire read_hit, write_hit , hit , halt_hit; 
   wire [7:0] cacheOut ; 
   
   topmodule uut(clk, reset, address, read_signal, write_signal, data, byte ,  read_hit, write_hit, cacheOut, hit, halt_hit);
   
       always #5 clk = ~clk; 
  
  initial 
    begin
          //Clear everything
          clk = 1'b1 ; reset = 1'b1 ; address = 32'd0 ; read_signal = 0 ; write_signal = 0 ; data = 64'd0 ; byte = 8'd0 ; 
          
          //Read - miss , tag = 7 , index = 0 , data = 8246 , written to set0, way0
    #12   reset = 1'b0 ; address = 32'd448 ; read_signal = 1 ; write_signal = 0 ; data = 64'd8246 ;
    
          //Read - miss , tag = 64 , index = 1 , data = 1597 , written to set1, way0
    #10   address = 32'd4104 ; read_signal = 1 ; write_signal = 0 ; data = 64'd1597 ;
    
          //Read - miss , tag = 31  , index = 7 , data =  7454 , written to set7, way0
    #10   address = 32'd2040 ; read_signal = 1 ; write_signal = 0 ; data = 64'd7454 ;      
          
          //Read - hit , tag = 7    , index = 0 , data =  7454 , read by set7, way0
    #10   address = 32'd448 ; read_signal = 1 ; write_signal = 0 ; data = 64'd0 ;
    
          //Read - miss , tag = 3  , index = 0 , data =  963 , written to set0, way1
    #10   address = 32'd192 ; read_signal = 1 ; write_signal = 0 ; data = 64'd963 ;
    
          //Write - hit , tag = 31 , index = 7 , data = 789 overwritten to set7, way0
    #10   address = 32'd2040 ; read_signal = 0 ; write_signal = 1 ; data = 64'd789 ; byte = 8'd85 ;
    
    end
   
 endmodule