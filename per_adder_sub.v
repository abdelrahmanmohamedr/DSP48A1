module per_adder_sub (a,b,operator,c);
    input [17:0]a,b;
    input operator;

    output reg [17:0]c;

    always @(*) begin
        if (operator) begin
            c = a - b;
        end else begin
            c = a + b;
        end
    end
endmodule