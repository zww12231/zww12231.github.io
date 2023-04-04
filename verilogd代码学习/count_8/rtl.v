module count_8(
    input clk,rstn,
    output reg [7:0]T,count);
    Tff inst1(.clk(clk),.rstn(rstn),.T(T),.count(count));
endmodule
    
