//THIS IS SYNTHEISIZABLE 4bit Asynchronous up counter IN BEHAVIOURAL MODELLING 

module counter(clk , reset , count);
    input clk , reset ; 
    output reg [3:0]count; 

    always @(posedge clk , posedge reset )
        begin 
            if(reset == 1'b1)
                count = 0 ; 
            else 
                count  = count +1 ;
        end 
endmodule 


