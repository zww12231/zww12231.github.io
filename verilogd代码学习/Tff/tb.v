module Tff_tb;
    reg clk_in,clk1_in;
    wire [3:0] T_out , Q_out;
    reg[31:0]count_t;//set vars
    initial begin  // inintial vars
        clk_in=0;
       // #1 clk=1;
        clk1_in=1;
        #1 clk1_in=0;
        //T=1;
        //Q=0;
    end
    always #2 clk_in=~clk_in;//set input
    always #2 clk1_in=1;
    Tff Tff_inst(      //instantiation
        .clk(clk_in),
        .clk1(clk1_in),
        .T(T_out),
        .Q(Q_out),
        .count(count_t));
    always@ (*)
        if(count_t>=2**5) $finish;
endmodule

        

