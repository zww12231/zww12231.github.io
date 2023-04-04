module mux4to1_case 
    # (parameter w=3)
    (
    input [w:0] a,b,c,d,
    input [1:0] s,
    output [3:0] out);
    reg[3:0] out_t;
        always @(*)
        case (s)
            2'b00: out_t=a;
            2'b01: out_t=b;
            2'b10: out_t=c;
            2'b11: out_t=d;
        endcase
    assign out=out_t;
endmodule
