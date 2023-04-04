module is_prim_tb;
    reg [7:0]x;
    initial begin
        x=3;
    end
    //always #2 clk=~clk;
    always #2 x={$random};
    is_prim (.x(x),.is_x(is_x));
    initial
        #200 $finish;
endmodule
