module vending_machine(
    input [1:0]coin,    //01for 0.5,10 for 1yuan
    input clk,rstn,      
    output [1:0]change,
    output sell);   //output the drink
    // state decode
    parameter IDLE =3'b000;
    parameter GET05=3'b001;
    parameter GET10=3'b010;
    parameter GET15=3'b011;
    //machine variable
    reg[2:0] st_next,st_cur;
    //(1) state transfer
    always@(posedge clk or negedge rstn) begin
        if(!rstn)   begin
            st_cur <=IDLE;
        end
        else begin
            st_cur <=st_next;
        end
    end
    //(2) state swich,block assignmen for combination-logic
    always@(*) begin
        case(st_cur)
            IDLE :
                case(coin)
                    2'b01:st_next=GET05;
                    2'b10:st_next=GET10;
                    default: st_next=IDLE;
                endcase
            GET05 :
                case(coin)
                    2'b01 :st_next=GET10;
                    2'b10: st_next=GET15;
                    default:st_next=GET05;
                endcase
            GET10:
                case(coin)
                    2'b01: st_next=GET15;
                    2'b10: st_next=IDLE;
                    default: st_next=GET10;
                endcase
            GET15:
                case(coin)
                    2'b01:st_next=IDLE;
                    2'b10:st_next=IDLE;
                    default: st_next=GET15;
                endcase
            default: st_next=IDLE;
        endcase
    end
    //(3)output logic,using non-block assignment
    reg [1:0]   chang_r;
    reg         sell_r;
    always@(posedge clk or negedge rstn) begin
        if(!rstn)   begin
            change_r <=2'b0;
            sell_r <=1'b0;
        end
        else if((st_cur==GET15 && coin==2'b01)||(st_cur==GET10 && coin==2'b10)) begin
            change_r <=2'b0;
            sell_r <= 1'b1;
        end
        else if (st_cur==GET15 && coin==2'b01) begin
            change_r <=2'b0;
            sell_r <=1'b1;
        end
        else if(st_cur==GET15 &&

