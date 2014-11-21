module D_FF(input clk, input set, input reset, output reg Q);
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

module NxN_DFFs(input clk, input reset, input [7:0] decOut, output [7:0] NxNOut);
  	wire [7:0]rPin;
	assign rPin=decOut|{8{reset}};
	wire [7:0] d0Out,d1Out,d2Out,d3Out,d4Out,d5Out,d6Out,d7Out;
	
	D_FF d0_0 (clk, decOut[0], rPin[0], d0Out[0]);
	D_FF d0_1 (clk, decOut[0], rPin[1], d0Out[1]);
	D_FF d0_2 (clk, decOut[0], rPin[2], d0Out[2]);
	D_FF d0_3 (clk, decOut[0], rPin[3], d0Out[3]);
	D_FF d0_4 (clk, decOut[0], rPin[4], d0Out[4]);
	D_FF d0_5 (clk, decOut[0], rPin[5], d0Out[5]);
	D_FF d0_6 (clk, decOut[0], rPin[6], d0Out[6]);
	D_FF d0_7 (clk, decOut[0], rPin[7], d0Out[7]);

	D_FF d1_0 (clk, decOut[1], rPin[0], d1Out[0]);
	D_FF d1_1 (clk, decOut[1], rPin[1], d1Out[1]);
	D_FF d1_2 (clk, decOut[1], rPin[2], d1Out[2]);
	D_FF d1_3 (clk, decOut[1], rPin[3], d1Out[3]);
	D_FF d1_4 (clk, decOut[1], rPin[4], d1Out[4]);
	D_FF d1_5 (clk, decOut[1], rPin[5], d1Out[5]);
	D_FF d1_6 (clk, decOut[1], rPin[6], d1Out[6]);
	D_FF d1_7 (clk, decOut[1], rPin[7], d1Out[7]);
		
	D_FF d2_0 (clk, decOut[2], rPin[0], d2Out[0]);
	D_FF d2_1 (clk, decOut[2], rPin[1], d2Out[1]);
	D_FF d2_2 (clk, decOut[2], rPin[2], d2Out[2]);
	D_FF d2_3 (clk, decOut[2], rPin[3], d2Out[3]);
	D_FF d2_4 (clk, decOut[2], rPin[4], d2Out[4]);
	D_FF d2_5 (clk, decOut[2], rPin[5], d2Out[5]);
	D_FF d2_6 (clk, decOut[2], rPin[6], d2Out[6]);
	D_FF d2_7 (clk, decOut[2], rPin[7], d2Out[7]);
		
	D_FF d3_0 (clk, decOut[3], rPin[0], d3Out[0]);
	D_FF d3_1 (clk, decOut[3], rPin[1], d3Out[1]);
	D_FF d3_2 (clk, decOut[3], rPin[2], d3Out[2]);
	D_FF d3_3 (clk, decOut[3], rPin[3], d3Out[3]);
	D_FF d3_4 (clk, decOut[3], rPin[4], d3Out[4]);
	D_FF d3_5 (clk, decOut[3], rPin[5], d3Out[5]);
	D_FF d3_6 (clk, decOut[3], rPin[6], d3Out[6]);
	D_FF d3_7 (clk, decOut[3], rPin[7], d3Out[7]);
			
	D_FF d4_0 (clk, decOut[4], rPin[0], d4Out[0]);
	D_FF d4_1 (clk, decOut[4], rPin[1], d4Out[1]);
	D_FF d4_2 (clk, decOut[4], rPin[2], d4Out[2]);
	D_FF d4_3 (clk, decOut[4], rPin[3], d4Out[3]);
	D_FF d4_4 (clk, decOut[4], rPin[4], d4Out[4]);
	D_FF d4_5 (clk, decOut[4], rPin[5], d4Out[5]);
	D_FF d4_6 (clk, decOut[4], rPin[6], d4Out[6]);
	D_FF d4_7 (clk, decOut[4], rPin[7], d4Out[7]);	
	
	D_FF d5_0 (clk, decOut[5], rPin[0], d5Out[0]);
	D_FF d5_1 (clk, decOut[5], rPin[1], d5Out[1]);
	D_FF d5_2 (clk, decOut[5], rPin[2], d5Out[2]);
	D_FF d5_3 (clk, decOut[5], rPin[3], d5Out[3]);
	D_FF d5_4 (clk, decOut[5], rPin[4], d5Out[4]);
	D_FF d5_5 (clk, decOut[5], rPin[5], d5Out[5]);
	D_FF d5_6 (clk, decOut[5], rPin[6], d5Out[6]);
	D_FF d5_7 (clk, decOut[5], rPin[7], d5Out[7]);
		
	D_FF d6_0 (clk, decOut[6], rPin[0], d6Out[0]);
	D_FF d6_1 (clk, decOut[6], rPin[1], d6Out[1]);
	D_FF d6_2 (clk, decOut[6], rPin[2], d6Out[2]);
	D_FF d6_3 (clk, decOut[6], rPin[3], d6Out[3]);
	D_FF d6_4 (clk, decOut[6], rPin[4], d6Out[4]);
	D_FF d6_5 (clk, decOut[6], rPin[5], d6Out[5]);
	D_FF d6_6 (clk, decOut[6], rPin[6], d6Out[6]);
	D_FF d6_7 (clk, decOut[6], rPin[7], d6Out[7]);		
	
	D_FF d7_0 (clk, decOut[7], rPin[0], d7Out[0]);
	D_FF d7_1 (clk, decOut[7], rPin[1], d7Out[1]);
	D_FF d7_2 (clk, decOut[7], rPin[2], d7Out[2]);
	D_FF d7_3 (clk, decOut[7], rPin[3], d7Out[3]);
	D_FF d7_4 (clk, decOut[7], rPin[4], d7Out[4]);
	D_FF d7_5 (clk, decOut[7], rPin[5], d7Out[5]);
	D_FF d7_6 (clk, decOut[7], rPin[6], d7Out[6]);
	D_FF d7_7 (clk, decOut[7], rPin[7], d7Out[7]);
	
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
    else if(NxNOut[2] ==1'b0)
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

module mux(input [2:0] LineIndex, input [2:0] LRUWay, input Hit, output reg [2:0] muxOut);
  always@(LineIndex or LRUWay or Hit)
  begin
    case(Hit)
      1'b0 : muxOut = LRUWay;
      1'b1 : muxOut = LineIndex;
    endcase
  end
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

module LRU_Square(input [2:0] LineIndex, input clk, input reset, input Hit, output reg [2:0] LRUWay);
  wire[2:0] muxOut;
  wire[7:0] decOut, NxNOut;
  mux R1(LineIndex, LRUWay, Hit, muxOut);
  decoder_3to8 R2(muxOut, decOut);
  NxN_DFFs R3(clk, reset, decOut, NxNOut);
  priority_Encoder R4(NxNOut, LRUWay);
endmodule
