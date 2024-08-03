module reg_mux_1bit_Async (a,clk,reset,clken,b);
parameter regi = 1;
    input a;
    input clk,clken,reset;

    output reg b;

    reg a_reg;

    always @(*) begin
        if (regi) begin
            b <= a_reg;
        end else begin
            b = a;
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            a_reg <= 0;
        end else begin
                if (clken) begin
                   a_reg <= a;
                end  
        end
    end

endmodule