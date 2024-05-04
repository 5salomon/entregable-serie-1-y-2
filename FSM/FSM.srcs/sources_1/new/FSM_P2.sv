`timescale 1ns / 1ps

module FSM_P2(input logic clk,
              //INPUT LOGIC RESET
              input logic TA,TB,
              output logic [1:0]LA,LB);
   // signal declaration
   logic [1:0] current_state;
   logic [1:0] next_state;
   //state register
   always @(posedge clk)     
   begin 
   current_state <= next_state;
   end
// next state logic 
assign next_state[1] = current_state[1] ^ current_state[0];
assign next_state[0] = (~current_state[1] & ~current_state[0] & ~TA)
                        | (current_state[1] & ~current_state[0] & ~TB);
assign LA[0] = ~current_state[1] & current_state[0];
assign LA[1] = ~current_state[1];
assign LB[0] = ~current_state[1] & current_state[0];
assign LB[1] = ~current_state[1];             
endmodule
