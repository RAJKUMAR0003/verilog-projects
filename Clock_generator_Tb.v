module clock  ; 

reg clk ; 

initial 
    begin  
    clk = 1'b0 ; 
    $monitor($time, " Clock = %b",clk); 
    end

initial
    #500 $finish ; 

always 
    #5 clk = !clk ; 

endmodule 
