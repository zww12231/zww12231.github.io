parameter wih=3;
module compare(
    input [wih-1:0] a,[wih-1:0] b,
    output [wih-1:0] out);
    reg [wih-1:0] out_t;
    always @(*)
        begin
            if(a==b)
                out_t=1;
            else
                out_t=0;
        end 
    assign out=out_t;
endmodule 
