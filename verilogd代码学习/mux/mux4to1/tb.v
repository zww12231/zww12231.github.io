module mux4to1_tb();
    reg ain,bin,select1,clk,cin,din,select0;
    wire outw;
    initial 
        begin
            ain=0;
            bin=0;
            cin=0;
            din=0;
            select1=0;
            select0=0;
            clk=0;
        end
    always 
        #10 clk=~clk;
    always
        begin
            #2 select1=!select1;
            #2 select0=!select0;
        end
    always@(posedge clk)
        begin
            #1 ain={$random}%2;
            #1 bin={$random}%2;
            #1 cin={$random}%2;
            #1 din={$random}%2;
        end
    initial 
        begin
            #200 $finish();
        end
    
mux4to1 mux4to1_inst(
    .a (ain),
    .b (bin),
    .c (cin),
    .d (din),
    .s1 (select1),
    .s0 (select0),
    .out (outw));
endmodule

     
