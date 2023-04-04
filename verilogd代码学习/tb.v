module num_calculation_tb;
    reg [2:0]ain,bin;
    wire [2:0]c,d,e,f,g,h,i,j;
    reg clk;

    initial begin//  initial
        ain=3'b000;
        bin=ain;
        clk=0;
    end

    always #2 clk=~clk;// clk

    always @(posedge clk) begin//input change
        ain={$random}%7;
        bin={$random}&7;
    end
    num_calculation inst(   //instantiation
        .a (ain),
        .b (bin),
        .c (c),
        .d (d),
        .e(e),
        .f(f),
        .g(g),
        .h(h),
        .i(i),
        .j(j));
    initial
         #1000 $finish;
endmodule
        
