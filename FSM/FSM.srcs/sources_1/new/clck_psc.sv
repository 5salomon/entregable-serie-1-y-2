`timescale 1ns / 1ps

module clck_psc( input logic relojentrada, 
                 output logic my_out);
    logic [31:0]myreg;
    
    always @(posedge relojentrada)
      myreg +=1;
      
      assign my_out = myreg[26];             
                 
endmodule
