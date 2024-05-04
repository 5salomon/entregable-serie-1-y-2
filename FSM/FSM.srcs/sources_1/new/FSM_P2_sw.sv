`timescale 1ns / 1ps

module FSM_P2_sw(input logic clk,
                 input logic reset,
                 input logic TA,TB,E,TP1,TP2,
                 output logic [1:0]LA,LB);
 
 typedef enum logic [2:0] {s0, s1, s2, s3} statetype; 
 statetype state , nextstate;
 
 typedef enum logic [1:0] {GREEN , YELLOW , RED} outtype;
 outtype la, lb;
 
   // state register
   always_ff @(posedge clk, posedge reset)
   if (reset) state <= s0;
   else state <= nextstate;
   
   //nest state logic
   always_comb  
    case (state)
     s0 : if((TA) && (!TP2)) nextstate = s0;
     else if ((!TA) && (!TP2)) nextstate = s1;
     else if (TP2) nextstate = s1;
     s1 :if (!E) nextstate = s2;
     else if (E) nextstate = s0;
     s2 : if ((TB) && (!E) && (!TP1)) nextstate = s2;
     else if (E) nextstate = s0;
     else if ((!TB) && (!E) && (!TP1)) nextstate = s3;
     else if ((!E) && (TP1)) nextstate =  s3;
     else nextstate = s3;
     default nextstate = s0;
     endcase
    // output logic pre- stage
    always_comb
    case(state)
       s0 : begin la = GREEN ; lb = RED; end 
       s1 : begin la = YELLOW ; lb = RED; end 
       s2 : begin la = RED ; lb = GREEN; end 
       s3 : begin la = RED ; lb = YELLOW; end 
   endcase
   // output logic
   assign LA = la;
   assign LB = lb;
                
endmodule
