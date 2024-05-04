`timescale 1ns / 1ps

module TOP_FSM2_P2(input logic CLK100MHZ,
                  input logic [5:0]sw,
                  input logic reset,
                  output logic [4:0]LED );
   
   logic internal_psc_clock;
   logic int_reset = 1;
   
   clck_psc my_clk (.relojentrada(CLK100MHZ), .my_out(internal_psc_clock));
   
   FSM_P2_sw p2_2 (.clk(internal_psc_clock), .reset(sw[2]), .TA(sw[0]),
                .TB(sw[1]), .TP1(sw[3]), .TP2(sw[4]), .E(sw[5]),.LA(LED[1:0]), .LB(LED[3:0]));
                
   assign LED[4] =  internal_psc_clock;      
                           
endmodule