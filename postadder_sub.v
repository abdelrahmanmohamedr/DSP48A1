module post_adder_sub (a,b,operator,carryin,c);
    input [47:0]a,b;
    input operator,carryin;

    output reg [47:0]c;

    always @(*) begin
        if (operator) begin
            c = a - (b  + carryin);
        end else begin
            c = a + b + carryin;
        end
    end
endmodule