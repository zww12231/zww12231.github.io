module Tff(
    input   clk,clk1,
    output  reg [3:0] T,Q,
            reg [31:0] count);//set in out vars
    //wire clk,clk1;
    //reg [3:0]T,Q;
    //reg [31:0]count;  

    always @(posedge clk or negedge clk1  ) begin
        if (!clk1) begin
            Q=0;
            count=0;
            T=1;
            //T=0;
        end
        Q=T^Q;
        count=count+1;
    end
endmodule

