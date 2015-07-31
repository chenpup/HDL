// Code your testbench here
// or browse Examples
module stimulus;
  
  parameter TRUE=1'b1,FALSE=1'b0,Y2RDELAY=3,R2GDELAY=2;
  wire [1:0] MAIN_SIG,CNTRY_SIG;
  reg CAR_ON_CNTRY_RD;
  
  reg CLOCK,CLEAR;
  
  sig_control SC(.hwy(MAIN_SIG),.cntry(CNTRY_SIG),.X(CAR_ON_CNTRY_RD),.clock(CLOCK),.clear(CLEAR));
  
  
  initial 
    $monitor($time,"Main Sig=%b Country Sig = %b Car_on_cntry =%b",MAIN_SIG,CNTRY_SIG,CAR_ON_CNTRY_RD);
   

   
  initial 
    begin 
      $dumpfile("dump.vcd");
      $dumpvars(1,stimulus);
      CLOCK = 1'b0;
      CLEAR = 1'b1;
      repeat(5) @(negedge CLOCK);CLEAR =1'b0;
    end
  
  initial 
    begin
      CAR_ON_CNTRY_RD=FALSE;
      
      repeat(20) @(negedge CLOCK); CAR_ON_CNTRY_RD=TRUE;
      repeat(15) @(negedge CLOCK); CAR_ON_CNTRY_RD=FALSE;
      
      repeat(20) @(negedge CLOCK); CAR_ON_CNTRY_RD=TRUE;
      repeat(10) @(negedge CLOCK); CAR_ON_CNTRY_RD=FALSE;
      
      repeat(25) @(negedge CLOCK); CAR_ON_CNTRY_RD=TRUE;
      repeat(20) @(negedge CLOCK); CAR_ON_CNTRY_RD=FALSE;
      
      repeat(20) @(negedge CLOCK); $finish;
      
    end
    always #5 CLOCK = ~CLOCK;
endmodule
      
      
      