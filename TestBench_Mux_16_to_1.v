`include "Sample.v"

module testbench; 
    reg [15:0] inp ; 
    reg [3:0]select; 
    output outp ;

    mux16to1 DUT(.in(inp) , .out(outp), .sel(select)) ; 

    initial 
        begin
        $monitor($time , " input = %h, select = %h, out = %h",inp,select,outp); 
        #5 inp = 16'h3f0a ; select = 4'h0 ; 
        #5 select = 4'h1 ; 
        #5 select = 4'h6 ; 
        #5 select = 4'hc ; 
        end
endmodule 
