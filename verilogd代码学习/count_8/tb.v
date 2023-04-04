module Tff_tb;
    reg clk,rstn;
    wire  T ;
    reg[7:0]count;//set vars
    initial begin  // inintial vars
        clk=0;
       // #1 clk=1;
        rstn=1;
        #1 rstn=0;
        #1 rstn=1;
        //T=1;
        //Q=0;
    end
    always #2 clk=~clk;//set input
    always #2 rstn=1;
    count_8 inst(      //instantiation
        .clk(clk),
        .rstn(rstn),
        .T(T),
        .count(count));
    always @(*) begin
        if(count>=2**8-1)
         $finish;
    end

endmodule

        

