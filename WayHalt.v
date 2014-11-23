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