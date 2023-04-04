module mux4to1_case_tb;
    reg [3:0] ain,bin,cin,din;
    reg clk;
    reg[1:0] select;         //vars
    wire [3:0]out;
    initial
        begin
            ain=2'b00;
            bin=2'b00;
            cin=2'b00;
            din=2'b00;      //initial
            select=2'b00;
            clk=2'b0;
        end
    always #2 select={$random}%4;//clk&&select
    always #1 clk=~clk;
    always @(posedge clk)
        begin
            ain={$random}%4;
            bin={$random}%4;
            cin={$random}%4;
            din={$random}%4;
        end

    mux4to1_case inst(
        .a(ain),.b(bin),.c(cin),.d(din),.s(select),.out(out));
    initial
        begin
            #100 $finish;
        end 
endmodule
