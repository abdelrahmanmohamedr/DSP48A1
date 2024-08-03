module multiplier (a,b,c);
    input [17:0]a,b;

    output [35:0]c;

    assign c = a * b;
endmodule