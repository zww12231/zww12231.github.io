module mux2to1(
    input a,
    input b,
    input s,
    output out);
    reg out_t;
    always @(s or a or b)
        if(!s)
            out_t=a;
        else
            out_t=b;
    assign out=out_t;
endmodule

