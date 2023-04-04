module num_calculation(
    input [2:0]a,b,
    output[2:0]c,d,e,f,g,h,i,j);
   /* always@(*) begin
     */
    assign c=a/b;
    assign d=a||b;
    assign e=a%b;
    assign f=a|b;
    assign g=a*b;
    assign h=a+b;
    assign i=a-b;
    assign j=a&b;
endmodule

