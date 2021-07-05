module tb ; 
    integer mycount  =1 ; 
        initial 
            begin
            //mycount =1 ; 
                while(mycount <= 255) 
                    begin
                        $display("Mycount = %d",mycount); 
                        mycount  = mycount +1 ;
                    end
            end
endmodule  

