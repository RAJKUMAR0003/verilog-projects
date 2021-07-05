//THIS IS SYNTHEISIZABLE D-LATCH IN BEHAVIOURAL MODELLING 

module D_Latch(Din, enable , Q , Q_bar); 
input Din , enable ; 
output  reg  Q; 
output Q_bar ; 

assign Q_bar = !Q; 


always @(Din, enable)
    begin
        if(enable == 1'b1)
            Q = Din ; 
        else 
            Q = Q ;
    end 
endmodule  



