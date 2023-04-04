module mux2to1(out,a,b,s);
    input a,b,s;
    output out;
    
    not u1(nsel,s);
    and u2(sela,a,nsel);
    and u3(selb,b,s);
    or  u4(out,sela,selb);

endmodule
