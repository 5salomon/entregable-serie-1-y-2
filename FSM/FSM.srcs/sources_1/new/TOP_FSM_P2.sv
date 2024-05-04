`timescale 1ns / 1ps

module TOP_FSM_P2(input logic CLK100MHZ,
                  input logic [1:0]sw,
                  output logic [4:0]LED);
   
   logic internal_psc_clock;
   
   clck_psc my_clk (CLK100MHZ, internal_psc_clock);
   FSM_P2 p_2 (.clk(internal_psc_clock), .TA(sw[0]),
                   .TB(sw[1]), .LA(LED[1:0]), .LB(LED[3:2]));
   assign LED[4] =  internal_psc_clock;      
                           
endmodule
