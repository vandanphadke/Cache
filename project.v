module D_ff( 
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b , 
	input d, 
	output reg q);




module register32bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input [31:0] writeData,
	output [31:0] outR );

module register26bit( 
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input [25:0] writeData,
	output [25:0] outR );


module tag_array(
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input [25:0] tag_in0, tag_in1, tag_in2, tag_in3, tag_in4, tag_in5, tag_in6, tag_in7,
	output [25:0] tag_out0, tag_out1, tag_out2, tag_out3, tag_out4, tag_out5, tag_out6, tag_out7
	);

module block_array(
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input [31:0] block_in0, block_in1, block_in2, block_in3, block_in4, block_in5, block_in6, block_in7,
	output [31:0] block_out0, block_out1, block_out2, block_out3, block_out4, block_out5, block_out6, block_out7
	);

module valid_bit_array(
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input valid_in0, valid_in1, valid_in2, valid_in3, valid_in4, valid_in5, valid_in6, valid_in7,
	output valid_out0, valid_out1, valid_out2, valid_out3, valid_out4, valid_out5, valid_out6, valid_out7
	);

module dirty_bit_array(
	input clk, 
	input reset, 
	input regWrite, 
	input decOut1b, 
	input dirty_in0, dirty_in1, dirty_in2, dirty_in3, dirty_in4, dirty_in5, dirty_in6, dirty_in7,
	output dirty_out0, dirty_out1, dirty_out2, dirty_out3, dirty_out4, dirty_out5, dirty_out6, dirty_out7
	);



