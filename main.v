module main (A,B,C,D,CLK,CARRYIN,OPMODE,BCIN,RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRYIN,RSTOPMODE,CEA,CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE,PCIN,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF);

    parameter A0REG = 0;
    parameter B0REG = 0;
    parameter A1REG = 1;
    parameter B1REG = 1;
    parameter CREG = 1;
    parameter DREG = 1;
    parameter MREG = 1;
    parameter PREG = 1;
    parameter CARRYINREG = 1;
    parameter CARRYOUTREG = 1;
    parameter OPMODEREG = 1;
    parameter CARRYINSEL = "OPMODE5";
    parameter B_INPUT = "DIRECT";
    parameter RSTTYPE = "SYNC";

    input [47:0]C,PCIN;
    input [17:0] A,B,D,BCIN;
    input [7:0] OPMODE;
    input CLK,CARRYIN,RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRYIN,RSTOPMODE,CEA,CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE;

    output [47:0]PCOUT,P;
    output [35:0]M;
    output [17:0]BCOUT;
    output CARRYOUT,CARRYOUTF;

    wire [47:0]c_reg;
    reg [47:0]x_mux;
    reg [47:0]z_mux;
    wire [47:0]postadd_sub_out;
    wire [35:0]multiply_out;
    wire [17:0]b_bcin;
    wire [17:0]b0_preout;
    wire [17:0]a0_reg;
    wire [17:0]a1_reg;
    wire [17:0]b0_reg;
    wire [17:0]d_reg;
    wire [17:0]preadd_sub_out;
    wire [7:0]opmode_reg;
    wire cin_op5;
    wire cin_reg;
    wire cout_reg;

    generate
    if (RSTTYPE == "SYNC") begin
        reg_mux_18bit_sync #(A0REG) reg_mux_18bit_sync1 (A,CLK,RSTA,CEA,a0_reg );
        reg_mux_18bit_sync #(A1REG) reg_mux_18bit_sync2 (a0_reg,CLK,RSTA,CEA,a1_reg );
        reg_mux_18bit_sync #(B0REG) reg_mux_18bit_sync3 (B,CLK,RSTB,CEB,b0_reg );
        reg_mux_18bit_sync #(B1REG) reg_mux_18bit_sync4 (b0_preout,CLK,RSTB,CEB,BCOUT );
        reg_mux_48bit_sync #(CREG) reg_mux_48bit_sync1 (C,CLK,RSTC,CEC,c_reg );
        reg_mux_18bit_sync #(DREG) reg_mux_18bit_sync6 (D,CLK,RSTD,CED,d_reg );
        reg_mux_8bit_sync #(OPMODEREG) reg_mux_8bit_sync1 (OPMODE,CLK,RSTOPMODE,CEOPMODE,opmode_reg );
        reg_mux_36bit_sync #(MREG) reg_mux_36bit_sync1 (multiply_out,CLK,RSTM,CEM,M );
        reg_mux_1bit_sync #(CARRYINREG) reg_mux_1bit_sync1 (cin_op5,CLK,RSTCARRYIN,CECARRYIN,cin_reg );
        reg_mux_48bit_sync #(PREG) reg_mux_48bit_sync2 (postadd_sub_out,CLK,RSTP,CEP,PCOUT );
        reg_mux_1bit_sync #(CARRYOUTREG) reg_mux_1bit_sync2 (cout_reg,CLK,RSTCARRYIN,CECARRYIN,CARRYOUT );

    end else begin

        reg_mux_18bit_Async #(A0REG) reg_mux_18bit_Async7 (A,CLK,RSTA,CEA,a0_reg );
        reg_mux_18bit_Async #(A1REG) reg_mux_18bit_Async8 (a0_reg,CLK,RSTA,CEA,a1_reg );
        reg_mux_18bit_Async #(B0REG) reg_mux_18bit_Async9 (B,CLK,RSTB,CEB,b0_reg );
        reg_mux_18bit_Async #(B1REG) reg_mux_18bit_Async4 (b0_preout,CLK,RSTB,CEB,BCOUT );
        reg_mux_48bit_Async #(CREG) reg_mux_48bit_Async3 (C,CLK,RSTC,CEC,c_reg );
        reg_mux_18bit_Async #(DREG) reg_mux_18bit_Async12 (D,CLK,RSTD,CED,d_reg );
        reg_mux_8bit_Async #(OPMODEREG) reg_mux_8bit_Async2 (OPMODE,CLK,RSTOPMODE,CEOPMODE,opmode_reg );
        reg_mux_36bit_Async #(MREG) reg_mux_36bit_Async2 (multiply_out,CLK,RSTM,CEM,M ); 
        reg_mux_1bit_Async #(CARRYINREG) reg_mux_1bit_Async3 (cin_op5,CLK,RSTCARRYIN,CECARRYIN,cin_reg );
        reg_mux_48bit_Async #(PREG) reg_mux_48bit_Async4 (postadd_sub_out,CLK,RSTP,CEP,PCOUT );
        reg_mux_1bit_sync #(CARRYOUTREG) reg_mux_1bit_sync4 (cout_reg,CLK,RSTCARRYIN,CECARRYIN,CARRYOUT );
    end
endgenerate

    per_adder_sub per_adder_sub (d_reg,b0_reg,opmode_reg[6],preadd_sub_out);
    multiplier multiplier (BCOUT,a1_reg,multiply_out);
    post_adder_sub post_adder_sub (z_mux,x_mux,opmode_reg[7],cin_op5,postadd_sub_out);

    always @(*) begin
        case (opmode_reg[1:0])
            2'b11: x_mux = {d_reg[11:0],a1_reg[17:0],BCOUT[17:0]};
            2'b10: x_mux = PCOUT;
            2'b01: x_mux = M;
            2'b00: x_mux = 0;
        endcase
    end

    always @(*) begin
        case (opmode_reg[3:2])
            2'b11: z_mux = c_reg;
            2'b10: z_mux = PCOUT;
            2'b01: z_mux = PCIN;
            2'b00: z_mux = 0;
        endcase
    end

   assign b_bcin = (B_INPUT == "DIRECT")?B:(B_INPUT == "CASCADE")?BCIN:0;
   assign b0_preout = (opmode_reg[4])?preadd_sub_out:b0_reg;
   assign {cout_reg,cin_op5} = (CARRYINSEL == "OPMODE5")?opmode_reg[5]:(B_INPUT == "CARRYIN")?CARRYIN:0;
   assign CARRYOUTF = CARRYOUT;
   assign P = PCOUT;

endmodule