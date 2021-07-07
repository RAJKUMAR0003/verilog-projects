// Serial parity detector 
// odd no of ones seen => output is 1  else output is 0 
// moore machine 

module parityDetector (serial_data, clock, out); 
    input serial_data , clock ; 
    output reg out ; 
    reg state ; 
    parameter S0 = 0 , S1 = 1; 

    always @(posedge clock)
        begin
            case (state) 
            S0 :    state <=   (serial_data) ? S1 : S0 ; 
            S1 :    state <=   (serial_data) ? S0 : S1 ; 
            default : state <= S0 ;
            endcase 
        end

    always @(state)
        begin 
            if(state == S0)
                out = 0 ; 
            else if (state ==S1)
                out = 1 ; 
            else 
                out = 0 ; 
        end 
endmodule  



module test_parity;
    reg clk, x; wire z;
    parityDetector PAR (x, clk, z);
    initial
        begin
            $dumpfile ("parity.vcd"); $dumpvars (0, test_parity);
            clk = 1'b0;
        end
    always #5 clk = ~clk;
    initial
        begin
            #2 x = 0; #10 x = 1; #10 x = 1; #10 x = 1;
            #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
            #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
            #10 $finish;
        end
endmodule
