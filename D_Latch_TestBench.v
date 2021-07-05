`include "Sample.v"

module tb; 

reg Din , enable ; 
wire Q, Q_bar ; 

D_Latch DUT(Din , enable , Q , Q_bar) ;

initial 
    begin
    $monitor($time, " Din =%b, enable = %b, Q =%b, Q_bar =%b",Din,enable ,Q,Q_bar);
    #5 enable = 1 ; Din = 0 ; 
    #5 Din = 1 ; 
    #5 Din = 0 ; 
    #5 enable = 0 ; Din = 1 ; 
    #5 enable = 1 ; Din = 1 ; 
    end 
endmodule 
