module mux16to1(in , out ,sel); 
    input [15:0] in ; 
    input [3:0]sel; 
    output out;
    wire [3:0]t ;
    mux4to1 m1 (in[3:0] , t[0] , sel[1:0]) ;
    mux4to1 m2 (in[7:4] , t[1] , sel[1:0]) ;
    mux4to1 m3 (in[11:8] , t[2] , sel[1:0]) ;
    mux4to1 m4 (in[15:12] , t[3] , sel[1:0]) ;
    mux4to1 m5 (t[3:0] , out , sel[3:2]) ;

endmodule 

module mux4to1(in , out ,sel); 
    input [3:0] in ; 
    input [1:0]sel; 
    output out;
    wire [1:0]t; 
    mux2to1 m1(in[1:0] , t[0], sel[0]) ;
    mux2to1 m2(in[3:2] , t[1], sel[0]) ;
    mux2to1 m3(t, out, sel[1]) ;
endmodule 

module mux2to1(in , out ,sel); 
    input [1:0] in ; 
    input sel; 
    output out;
    wire t[2:0] ;

    not  G1(t[0], sel); 
    and G2(t[1] , t[0] , in[0]) ;
    and G3(t[2], sel, in[1]) ; 
    or G4(out, t[1] , t[2]) ;  

endmodule 
