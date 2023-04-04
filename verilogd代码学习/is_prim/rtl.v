module is_prim(
    input [7:0] x,
    output reg is_x);
    integer i;
    //reg j;
    always@(*)begin
        is_x=1;
        for (i=2;i<x;i=i+1) begin
                if(x%i==0) is_x=0;
        end
    end
    /*always@(*) begin
        if(j==0) is_x=0;
    end*/
endmodule
    

        
