`include "Sample.v"

module testbench; 
    reg s,r  ; 
    wire q , qbar ; 

    SR_NAND_LATCH DUT(.s(s) , .r(r) , .Q(q) , .Q_bar(qbar)) ; 

    initial 
        begin
        $monitor($time , " s = %b, r = %b, Q = %b , Qbar = %b",s,r,q,qbar); 
        #5 s = 1 ;  r = 0  ; 
        #5 s = 0 ;  r = 0  ; 
        #5 s = 0 ;  r = 1  ; 
        #5 s = 0 ;  r = 0  ; 
       // #5 s = 1 ;  r = 1  ; 
       // #5 s = 0 ;  r = 0  ;  RACE CONDITION 
        end
endmodule 
