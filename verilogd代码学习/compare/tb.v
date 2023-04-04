module compare_tb();
    //parameter wih=3;
    reg clk;
    reg [wih-1:0] ain;
    reg [wih-1:0] bin;
    wire [wih-1:0] out;
    initial 
        begin
            clk='d0;
            ain='d0;
            bin='d0;
        end
        
    always #10 clk=~clk;

    always @(posedge clk)      //no wire only reg
        begin
            ain={$random}%6;
            bin={$random}%6;
        end
        
compare compare_inst(
    .a (ain),
    .b (bin),
    .out (out));
    initial 
        begin
            #2000 $finish;
        end
endmodule
    
