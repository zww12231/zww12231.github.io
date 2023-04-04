module mux2to1(out,a,b,s);
    input a,b,s;
    output out;
    wire nsel,sela,selb;

    assign nsel =~s;
    assign sela=a&nsel;
    assign selb=b&s;
    assign out=sela|selb;
endmodule
