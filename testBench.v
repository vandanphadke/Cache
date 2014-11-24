module testBenchCache;
   //Inputs to main module
   
   reg clk, reset, read_signal, write_signal;
   reg[31:0] address ; 
   reg[63:0] data ;    
   
   //Outputs 
   wire read_hit, write_hit , hit ; 
   wire [7:0] cacheOut ; 
   
   topmodule uut(clk, reset, address, read_signal, write_signal, data, read_hit, write_hit, cacheOut, hit);
   
       always #5 clk = ~clk; 
  
  initial 
    begin
          //Clear everything
          clk = 1'b1 ; reset = 1'b1 ; address = 32'd0 ; read_signal = 0 ; write_signal = 0 ; data = 64'd0 ; 
          
          //Read - miss , tag = 7 , index = 0 , data = 8246 , written to set0, way0
    #12   reset = 1'b0 ; address = 32'd448 ; read_signal = 1 ; write_signal = 0 ; data = 64'd8246 ;      
      
          //Read - miss , tag = 64 , index = 1 , data = 1597 , written to set1, way0
    #10   address = 32'd4104 ; read_signal = 1 ; write_signal = 0 ; data = 64'd1597 ;
    
          //Read - miss , tag = 31  , index = 7 , data =  7454 , written to set7, way0
    #10   address = 32'd2040 ; read_signal = 1 ; write_signal = 0 ; data = 64'd7454 ;
    
          //Read - miss , tag =  1 , index = 1 , data = 2013 , written to set1, way1
    #10   address = 32'd72 ; read_signal = 1 ; write_signal = 0 ; data = 64'd2013 ;
    
          //Read - miss , tag =  3 , index = 0, data = 963 , written to set0, way1
    #10   address = 32'd192 ; read_signal = 1 ; write_signal = 0 ; data = 64'd963 ;
    
          //Read - hit , tag =  64 , index = 7, data read from set7, way0
    #10   address = 32'd2040 ; read_signal = 1 ; write_signal = 0 ; data = 64'd0 ;
    
          //Write- hit , tag =  1 , index = 1 data = 3214 , overwritten to set1, way1
    #10   address = 32'd72 ; read_signal = 0 ; write_signal = 1 ; data = 64'd3214 ;
    
          //Read - miss , tag =  13 , index = 4, data = 1000 , written to set4, way0
    #10   address = 32'd864 ; read_signal = 1 ; write_signal = 0 ; data = 64'd1000 ;
    
          //Write - miss , tag =  57 , index = 4, data = 2000 , over written to set4, way1
    #10   address = 32'd3680 ; read_signal = 1 ; write_signal = 0 ; data = 64'd2000 ;
    
          //Read - miss , tag =  463 , index = 4, data = 3000 , written to set4, way2
    #10   address = 32'd29964 ; read_signal = 1 ; write_signal = 0 ; data = 64'd3000 ;
    
          //Read - miss , tag =  896 , index = 4, data = 4000 , written to set4, way3
    #10   address = 32'd57376 ; read_signal = 1 ; write_signal = 0 ; data = 64'd4000 ;
        
          //Read - hit , tag =  57 , index = 4, data = 2000 , read from set4, way1
    #10   address = 32'd3680 ; read_signal = 1 ; write_signal = 0 ; data = 64'd0000 ;
    
          //Write- hit , tag =  463 , index = 4, data = 9876 , overwritten to se4, way2
    #10   address = 32'd29964 ; read_signal = 0 ; write_signal = 1 ; data = 64'd3214 ;
    
          //Read - hit , tag =  3 , index = 0, data = 963 , read from set0, way1
    #10   address = 32'd192 ; read_signal = 1 ; write_signal = 0 ; data = 64'd0000 ;
    
          //Read - miss , tag = 16  , index = 6, data = 741 , written to set6, way0
    #10   address = 32'd1072 ; read_signal = 1 ; write_signal = 0 ; data = 64'd741 ;
    
          //Read - miss , tag = 24  , index = 6, data = 152 , written to set6, way1
    #10   address = 32'd1584 ; read_signal = 1 ; write_signal = 0 ; data = 64'd152 ;
    
          //Read - miss , tag = 120  , index = 6, data = 123 , written to set6, way2
    #10   address = 32'd7728 ; read_signal = 1 ; write_signal = 0 ; data = 64'd123 ;
    
          //Read - miss , tag = 71  , index = 6, data = 357 , written to set6, way3
    #10   address = 32'd4592 ; read_signal = 1 ; write_signal = 0 ; data = 64'd357 ;
      
          //Read - miss , tag = 2  , index = 6, data = 159 , written to set6, way4
    #10   address = 32'd176 ; read_signal = 1 ; write_signal = 0 ; data = 64'd159 ;
    
          //Read - hit , tag =  7 , index = 1, data read from set0, way0
    #10   address = 32'd448 ; read_signal = 1 ; write_signal = 0 ; data = 64'd0 ;
    
          //Read - hit , tag = 120  , index = 6, data = 123 , read from set6, way2
    #10   address = 32'd7728 ; read_signal = 1 ; write_signal = 0 ; data = 64'd0 ;
    
          //Read - miss , tag = 0  , index = 6, data = 245 , written to set6, way5
    #10   address = 32'd48 ; read_signal = 1 ; write_signal = 0 ; data = 64'd245 ;
    
          //Read - miss , tag = 10  , index = 6, data = 852 , written to set6, way6
    #10   address = 32'd688 ; read_signal = 1 ; write_signal = 0 ; data = 64'd852 ;
    
          //Read - miss , tag = 12  , index = 6, data = 917 , written to set6, way7
    #10   address = 32'd816 ; read_signal = 1 ; write_signal = 0 ; data = 64'd917 ;
    
          //Read - hit , tag =  120 , index = 1, data read from set6, way2
    #10   address = 32'd7728 ; read_signal = 1 ; write_signal = 0 ; data = 64'd0 ;
          
    
    end
   
 endmodule