// vending-machine
// 2 yuan for a bottle of drink
// only 2 coins supported: 5 jiao and 1 yuan
// finish the function of selling and changing

module  vending_machine (
    input           clk ,
    input           rstn ,
    input [1:0]     coin ,     //01 for 0.5 jiao, 10 for 1 yuan

    output [1:0]    change ,
    output          sell    //output the drink
    );

    //machine state decode
    parameter            IDLE   = 3'd0 ;
    parameter            GET05  = 3'd1 ;
    parameter            GET10  = 3'd2 ;
    parameter            GET15  = 3'd3 ;

    //machine variable
    reg [2:0]            st_next ;
    reg [2:0]            st_cur ;

    //(1) state transfer
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            st_cur      <= 'b0 ;
        end
        else begin
            st_cur      <= st_next ;
        end
    end

    //(2) state switch, using block assignment for combination-logic
    //all case items need to be displayed completely    
    always @(*) begin
        //st_next = st_cur ;//如果条件选项考虑不全，可以赋初值消除latch
        case(st_cur)
            IDLE:
                case (coin)
                    2'b01:     st_next = GET05 ;
                    2'b10:     st_next = GET10 ;
                    default:   st_next = IDLE ;
                endcase
            GET05:
                case (coin)
                    2'b01:     st_next = GET10 ;
                    2'b10:     st_next = GET15 ;
                    default:   st_next = GET05 ;
                endcase

            GET10:
                case (coin)
                    2'b01:     st_next = GET15 ;
                    2'b10:     st_next = IDLE ;
                    default:   st_next = GET10 ;
                endcase
            GET15:
                case (coin)
                    2'b01,2'b10:
                               st_next = IDLE ;
                    default:   st_next = GET15 ;
                endcase
            default:    st_next = IDLE ;
        endcase
    end

    //(3) output logic, using non-block assignment
    reg  [1:0]   change_r ;
    reg          sell_r ;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            change_r       <= 2'b0 ;
            sell_r         <= 1'b0 ;
        end
        else if ((st_cur == GET15 && coin ==2'h1)
               || (st_cur == GET10 && coin ==2'd2)) begin
            change_r       <= 2'b0 ;
            sell_r         <= 1'b1 ;
        end
        else if (st_cur == GET15 && coin == 2'h2) begin
            change_r       <= 2'b1 ;
            sell_r         <= 1'b1 ;
        end
        else begin
            change_r       <= 2'b0 ;
            sell_r         <= 1'b0 ;
        end
    end
    assign       sell    = sell_r ;
    assign       change  = change_r ;

endmodule
