module  SR_NAND_LATCH(Q, Q_bar , s , r); 
    output Q , Q_bar; 
    input s ,r ;

    assign Q = ~(Q_bar & ~s) ; 
    assign Q_bar = ~(Q & ~r) ; 

endmodule 
