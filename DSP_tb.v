module dsp_tb ();

    reg [47:0]C,PCIN;
    reg [17:0] A,B,D,BCIN;
    reg [7:0] OPMODE;
    reg CLK,CARRYIN,RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRYIN,RSTOPMODE,CEA,CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE;

    wire [47:0]PCOUT,P;
    wire [35:0]M;
    wire [17:0]BCOUT;
    wire CARRYOUT,CARRYOUTF;
    integer i;

    main main (A,B,C,D,CLK,CARRYIN,OPMODE,BCIN,RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRYIN,RSTOPMODE,CEA,CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE,PCIN,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF);


    initial begin
        CLK = 0;
        forever begin
            #20;
            CLK = ~CLK;
        end
    end

    initial begin
                        CEA=1;
                        CEB=1;
                        CEM=1;
                        CEP=1;
                        CEC=1;
                        CED=1;
                        CECARRYIN=1;
                        CEOPMODE=1;
        for (i =0 ;i < 9 ;i=i+1) begin
            case (i)
                0: begin
                        C = 9;
                        PCIN =16;
                        A = 8;
                        B =7; 
                        D =6; 
                        OPMODE = 'b00011101;
                        BCIN = 15;
                        CARRYIN=1;
                        RSTA=1;
                        RSTB=1;
                        RSTM=1;
                        RSTP=1;
                        RSTC=1;
                        RSTD=1;
                        RSTCARRYIN=1;
                        RSTOPMODE=1;

                end
                1: begin
                        C = 9;
                        PCIN =16;
                        A = 8;
                        B =7; 
                        D =6; 
                        OPMODE = 'b00111101;
                        BCIN = 15;
                        CARRYIN=1;
                        RSTA=0;
                        RSTB=0;
                        RSTM=0;
                        RSTP=0;
                        RSTC=0;
                        RSTD=0;
                        RSTCARRYIN=0;
                        RSTOPMODE=0;

                end
                2: begin
                        C = 9;
                        PCIN =16;
                        A = 8;
                        B =7; 
                        D =6; 
                        OPMODE = 'b00111110;
                        BCIN = 15;
                        CARRYIN=1;
                        RSTA=0;
                        RSTB=0;
                        RSTM=0;
                        RSTP=0;
                        RSTC=0;
                        RSTD=0;
                        RSTCARRYIN=0;
                        RSTOPMODE=0;

                end
                3: begin
                        C = 9;
                        PCIN =16;
                        A = 8;
                        B =7; 
                        D =6; 
                        OPMODE = 'b00111010;
                        BCIN = 15;
                        CARRYIN=1;
                        RSTA=0;
                        RSTB=0;
                        RSTM=0;
                        RSTP=0;
                        RSTC=0;
                        RSTD=0;
                        RSTCARRYIN=0;
                        RSTOPMODE=0;

                end
                4: begin
                        C = 9;
                        PCIN =16;
                        A = 8;
                        B =7; 
                        D =6; 
                        OPMODE = 'b00111111;
                        BCIN = 15;
                        CARRYIN=1;
                        RSTA=0;
                        RSTB=0;
                        RSTM=0;
                        RSTP=0;
                        RSTC=0;
                        RSTD=0;
                        RSTCARRYIN=0;
                        RSTOPMODE=0;

                end
                5: begin
                        C = 9;
                        PCIN =16;
                        A = 8;
                        B =7; 
                        D =6; 
                        OPMODE = 'b00110110;
                        BCIN = 15;
                        CARRYIN=1;
                        RSTA=0;
                        RSTB=0;
                        RSTM=0;
                        RSTP=0;
                        RSTC=0;
                        RSTD=0;
                        RSTCARRYIN=0;
                        RSTOPMODE=0;

                end
                6: begin
                        C = 9;
                        PCIN =16;
                        A = 8;
                        B =7; 
                        D =6; 
                        OPMODE = 'b00110000;
                        BCIN = 15;
                        CARRYIN=1;
                        RSTA=0;
                        RSTB=0;
                        RSTM=0;
                        RSTP=0;
                        RSTC=0;
                        RSTD=0;
                        RSTCARRYIN=0;
                        RSTOPMODE=0;

                end
                7: begin
                        C = 9;
                        PCIN =16;
                        A = 8;
                        B =6; 
                        D =7; 
                        OPMODE = 'b11011101;
                        BCIN = 15;
                        CARRYIN=1;
                        RSTA=0;
                        RSTB=0;
                        RSTM=0;
                        RSTP=0;
                        RSTC=0;
                        RSTD=0;
                        RSTCARRYIN=0;
                        RSTOPMODE=0;

                end
                8: begin
                        C = 9;
                        PCIN =16;
                        A = 8;
                        B =7; 
                        D =6; 
                        OPMODE = 'b00101101;
                        BCIN = 15;
                        CARRYIN=1;
                        RSTA=0;
                        RSTB=0;
                        RSTM=0;
                        RSTP=0;
                        RSTC=0;
                        RSTD=0;
                        RSTCARRYIN=0;
                        RSTOPMODE=0;

                end 
            endcase
            repeat(5)begin
                @(negedge CLK);    
            end

        end
        $stop;

    end

    initial begin
        $monitor("A = %d,B = %d,C = %d,D = %d,CLK = %b,CARRYIN = %d,OPMODE = %b,BCIN = %d,RSTA = %d,RSTB = %d,RSTM = %d,RSTP = %d,RSTC = %d,RSTD = %d,RSTCARRYIN = %d,RSTOPMODE = %d,CEA = %d,CEB = %d,CEM = %d,CEP = %d,CEC = %d,CED = %d,CECARRYIN = %d,CEOPMODE = %d,PCIN = %d,BCOUT = %d,PCOUT = %d,P = %d,M = %d,CARRYOUT = %d,CARRYOUTF = %d",
        A,B,C,D,CLK,CARRYIN,OPMODE,BCIN,RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRYIN,RSTOPMODE,CEA,CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE,PCIN,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF);
    end
endmodule