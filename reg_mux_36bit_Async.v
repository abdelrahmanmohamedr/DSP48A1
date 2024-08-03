module reg_mux_36bit_Async (a,clk,reset,clken,b);
parameter regi = 1;
    input [35:0]a;
    input clk,clken,reset;

    output reg [35:0]b;

    reg [35:0]a_reg;

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