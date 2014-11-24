//************************Write Buffer Started*******************************************		

module writeBuffer(
	input clk,
	input reset,
	input readBit,
	input writeBit,
	input  [92:0] in_entry,
	output [92:0] out_entry
	);
//in_entry/out_entry  format :>  tag(26 bits) + index (3 bit) + data_block(64 bits)	

	reg [2:0]  readCounter, writeCounter;
	wire [7:0]  decOut;
	wire [92:0] out_entry0, out_entry1, out_entry2, out_entry3, out_entry4, out_entry5, out_entry6, out_entry7;
  reg [7:0] valid_bit_array;
  
	
	always@(negedge clk, reset, writeBit, readBit, in_entry)
			
		begin
		  //Resets the whole buffer
		  if (reset == 1)
		    begin 
		       readCounter = 3'd0;
           writeCounter = 3'd0;
           valid_bit_array = 8'd0; 
                  
        end
	//*******************************************************************			
			
			//Writes to buffer	
			if (writeBit == 1)
				begin	
				  valid_bit_array[writeCounter] = 1'b1;			
					writeCounter = writeCounter + 3'b001;			
				end		
	//*******************************************************************						
				
			//Reads from buffer	
			if (readBit == 1)
				begin
				  if (valid_bit_array[readCounter]==1)
				      begin
				          
				            valid_bit_array[readCounter] = 1'b0;	
					          readCounter = readCounter + 3'b001;
					        
					    end
				end	
	//*******************************************************************		
		end	
		
		
           decoder dec_write(writeCounter, decOut);
	
	         register94bit entry0(clk, reset, decOut[0], in_entry, out_entry0 );
	         register94bit entry1(clk, reset, decOut[1], in_entry, out_entry1 );
	         register94bit entry2(clk, reset, decOut[2], in_entry, out_entry2 );
	         register94bit entry3(clk, reset, decOut[3], in_entry, out_entry3 );
	         register94bit entry4(clk, reset, decOut[4], in_entry, out_entry4 );
	         register94bit entry5(clk, reset, decOut[5], in_entry, out_entry5 );
	         register94bit entry6(clk, reset, decOut[6], in_entry, out_entry6 );
	         register94bit entry7(clk, reset, decOut[7], in_entry, out_entry7 );
	
          	mux_8_to_1 read_mux( readCounter, out_entry0, out_entry1, out_entry2, out_entry3, out_entry4, out_entry5, out_entry6, out_entry7,out_entry);			
		
endmodule

//*******************************************************************		

module register94bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input [92:0] writeData,
	output [92:0] outR );
	
	
	register32bit R0(clk, reset, regWrite, writeData[31:0],outR[31:0] );
	register32bit R1(clk, reset, regWrite, writeData[63:32],outR[63:32] );
	register29bit R2(clk, reset, regWrite, writeData[92:64], outR[92:64] );
	
	
	
endmodule

//*******************************************************************		
	
module decoder(
	input [2:0]in,
	output reg [7:0]out
	);
	
	always@(in)
	case(in)
		3'b000 : out = 8'b00000001;
		3'b001 : out = 8'b00000010;
		3'b010 : out = 8'b00000100;
		3'b011 : out = 8'b00001000;
		3'b100 : out = 8'b00010000;
		3'b101 : out = 8'b00100000;
		3'b110 : out = 8'b01000000;
		3'b111 : out = 8'b10000000;
	endcase
	
endmodule

//*******************************************************************		
	
module mux_8_to_1(
	input [2:0] sel,
	input [92:0] block0, block1, block2, block3, block4, block5, block6, block7,
	output reg [92:0] out
	);
	
	always@(sel)
		case(sel)
			3'b000 : out = block0;
			3'b001 : out = block1;
			3'b010 : out = block2;
			3'b011 : out = block3;
			3'b100 : out = block4;
			3'b101 : out = block5;
			3'b110 : out = block6;
			3'b111 : out = block7;
		endcase	
	
endmodule

//*******************************************************************		



module D_ff( 
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


//*******************************************************************		

module register32bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input [31:0] writeData,
	output [31:0] outR );
	
	D_ff d_ff0(clk, reset, regWrite, writeData[0], outR[0]);
	D_ff d_ff1(clk, reset, regWrite, writeData[1], outR[1]);
	D_ff d_ff2(clk, reset, regWrite, writeData[2], outR[2]);
	D_ff d_ff3(clk, reset, regWrite, writeData[3], outR[3]);
	D_ff d_ff4(clk, reset, regWrite, writeData[4], outR[4]);
	D_ff d_ff5(clk, reset, regWrite, writeData[5], outR[5]);
	D_ff d_ff6(clk, reset, regWrite, writeData[6], outR[6]);
	D_ff d_ff7(clk, reset, regWrite, writeData[7], outR[7]);
	D_ff d_ff8(clk, reset, regWrite, writeData[8], outR[8]);
	D_ff d_ff9(clk, reset, regWrite, writeData[9], outR[9]);
	D_ff d_ff10(clk, reset, regWrite, writeData[10], outR[10]);
	D_ff d_ff11(clk, reset, regWrite, writeData[11], outR[11]);
	D_ff d_ff12(clk, reset, regWrite, writeData[12], outR[12]);
	D_ff d_ff13(clk, reset, regWrite, writeData[13], outR[13]);
	D_ff d_ff14(clk, reset, regWrite, writeData[14], outR[14]);
	D_ff d_ff15(clk, reset, regWrite, writeData[15], outR[15]);
	D_ff d_ff16(clk, reset, regWrite, writeData[16], outR[16]);
	D_ff d_ff17(clk, reset, regWrite, writeData[17], outR[17]);
	D_ff d_ff18(clk, reset, regWrite, writeData[18], outR[18]);
	D_ff d_ff19(clk, reset, regWrite, writeData[19], outR[19]);
	D_ff d_ff20(clk, reset, regWrite, writeData[20], outR[20]);
	D_ff d_ff21(clk, reset, regWrite, writeData[21], outR[21]);
	D_ff d_ff22(clk, reset, regWrite, writeData[22], outR[22]);
	D_ff d_ff23(clk, reset, regWrite, writeData[23], outR[23]);
	D_ff d_ff24(clk, reset, regWrite, writeData[24], outR[24]);
	D_ff d_ff25(clk, reset, regWrite, writeData[25], outR[25]);
	D_ff d_ff26(clk, reset, regWrite, writeData[26], outR[26]);
	D_ff d_ff27(clk, reset, regWrite, writeData[27], outR[27]);
	D_ff d_ff28(clk, reset, regWrite, writeData[28], outR[28]);
	D_ff d_ff29(clk, reset, regWrite, writeData[29], outR[29]);
	D_ff d_ff30(clk, reset, regWrite, writeData[30], outR[30]);
	D_ff d_ff31(clk, reset, regWrite, writeData[31], outR[31]);
	
endmodule

//*******************************************************************		

module register29bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input [28:0] writeData,
	output [28:0] outR );
	
	D_ff d_ff0(clk, reset, regWrite, writeData[0], outR[0]);
	D_ff d_ff1(clk, reset, regWrite, writeData[1], outR[1]);
	D_ff d_ff2(clk, reset, regWrite, writeData[2], outR[2]);
	D_ff d_ff3(clk, reset, regWrite, writeData[3], outR[3]);
	D_ff d_ff4(clk, reset, regWrite, writeData[4], outR[4]);
	D_ff d_ff5(clk, reset, regWrite, writeData[5], outR[5]);
	D_ff d_ff6(clk, reset, regWrite, writeData[6], outR[6]);
	D_ff d_ff7(clk, reset, regWrite, writeData[7], outR[7]);
	D_ff d_ff8(clk, reset, regWrite, writeData[8], outR[8]);
	D_ff d_ff9(clk, reset, regWrite, writeData[9], outR[9]);
	D_ff d_ff10(clk, reset, regWrite, writeData[10], outR[10]);
	D_ff d_ff11(clk, reset, regWrite, writeData[11], outR[11]);
	D_ff d_ff12(clk, reset, regWrite, writeData[12], outR[12]);
	D_ff d_ff13(clk, reset, regWrite, writeData[13], outR[13]);
	D_ff d_ff14(clk, reset, regWrite, writeData[14], outR[14]);
	D_ff d_ff15(clk, reset, regWrite, writeData[15], outR[15]);
	D_ff d_ff16(clk, reset, regWrite, writeData[16], outR[16]);
	D_ff d_ff17(clk, reset, regWrite, writeData[17], outR[17]);
	D_ff d_ff18(clk, reset, regWrite, writeData[18], outR[18]);
	D_ff d_ff19(clk, reset, regWrite, writeData[19], outR[19]);
	D_ff d_ff20(clk, reset, regWrite, writeData[20], outR[20]);
	D_ff d_ff21(clk, reset, regWrite, writeData[21], outR[21]);
	D_ff d_ff22(clk, reset, regWrite, writeData[22], outR[22]);
	D_ff d_ff23(clk, reset, regWrite, writeData[23], outR[23]);
	D_ff d_ff24(clk, reset, regWrite, writeData[24], outR[24]);
	D_ff d_ff25(clk, reset, regWrite, writeData[25], outR[25]);
	D_ff d_ff26(clk, reset, regWrite, writeData[26], outR[26]);
	D_ff d_ff27(clk, reset, regWrite, writeData[27], outR[27]);
	D_ff d_ff28(clk, reset, regWrite, writeData[28], outR[28]);
	
	
endmodule

//********************Write Buffer Completed  **********************************************		