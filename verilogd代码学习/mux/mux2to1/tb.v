module mux2to1_tb();
    reg ain,bin,select;
    reg clk;
    wire outw;
    initial begin //0
    ain=0;
    bin=0;
    select=0;
    clk=0;
    end

    always #10 clk=~clk;
    always #3 select=~select;
    always @(select)
        begin
            #1 
            ain=~ain;// ain={$random}%2;
            #1 
            bin=~bin;//bin={$random}%2;
        end
    initial begin 
    #200
    $finish();
    end
    mux2to1 mux2to1_inst(
    .out (outw),
    .a   (ain),
    .b   (bin),
    .s   (select));
endmodule


