module reg_mux_18bit_sync (a,clk,reset,clken,b);
parameter regi = 1;
    input [17:0]a;
    input clk,clken,reset;

    output reg [17:0]b;

    reg [17:0]a_reg;

    always @(*) begin
        if (regi) begin 
             b <= a_reg;
        end else begin
            b = a;
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            a_reg <= 0;
        end else begin
            if (clken) begin
                   a_reg <= a;
                end  
        end
    end

endmodule