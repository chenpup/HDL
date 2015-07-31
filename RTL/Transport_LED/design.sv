module sig_control(hwy,cntry,X,clock,clear);
  parameter TRUE=1'b1,FALSE=1'b0,Y2RDELAY=3,R2GDELAY=2;
  output [1:0] hwy,cntry;
  
  reg [1:0] hwy,cntry;
  
  input X;
  
  input clock,clear;//交通灯的状态
  
  parameter RED = 2'd0, YELLOW = 2'd1, GREEN=2'd2;
                        //HWY       CNTRY
  parameter S0 = 3'd0,// GREEN       RED
            S1 = 3'd1,// YELLOW      RED
            S2=  3'd2,// RED         RED
            S3=  3'd3,// RED         GREEN
            S4=  3'd4;// RED         YELLOW
  
  reg [2:0] state;
  reg [2:0] next_state;
  
  always @(posedge clock)
    if (clear)
      state <= S0;
    else
      state <= next_state;
  
  always@(state)
  begin
    hwy=GREEN;
    cntry=RED;
    case(state)
      S0:;
      S1: hwy=YELLOW;
      S2: hwy=RED;
      S3: begin
            hwy=RED;
        	cntry=GREEN;
       	   end
      S4:begin
     		hwy=RED;
        	cntry=YELLOW;
         end
    endcase
  end
  always @(state or X)
  begin
    case(state)
      S0:if(X)
      	  next_state =S1;
      	else
          next_state =S0;
      S1:begin
        repeat(Y2RDELAY) @(posedge clock);
          next_state = S3;
      	end
      S2:begin
        repeat(R2GDELAY) @(posedge clock);
          next_state = S3;
      	end
      S3:if(X)
        	next_state = S3;
      	else
          	next_state =S4;
      S4:begin
        repeat(Y2RDELAY) @(posedge clock);
        next_state = S0;
      	end
      default:next_state = S0;
    endcase
  end
endmodule
