module Pipeline_Tb();
    reg clk;
    wire INT;
    wire [15:0] InPort;
    wire [15:0] outPort;
    reg rst;
    reg [15:0] Inputinstruction;
    reg [31:0] MemoryAddress;
    reg writeInstruction;
    main Main(clk, INT, InPort, outPort, rst, Inputinstruction, writeInstruction,MemoryAddress);
    always begin
      #50 clk =~ clk;
    end
    initial begin
        clk = 1;
        writeInstruction = 1;
        MemoryAddress = 0;
        Inputinstruction = 16'b000_011_011_100_0000;
        #50
        Inputinstruction = 16'b000_001_001_100_0000;
        #100
        Inputinstruction = 16'b001_111_100_100_0000;
        #100
        Inputinstruction = 16'b011_101_001_011_000_0;
        #100
        Inputinstruction = 16'b011_111_001_011_000_0;
        #100
        Inputinstruction = 16'b011_110_001_011_000_0;
        #100
        MemoryAddress = 32;
        Inputinstruction = 16'b010_010_000_001_000_1;
        #100
        Inputinstruction = 16'b0000000000001010;
        #100
        Inputinstruction = 16'b000_000_001_011_0000;
        #100
        Inputinstruction = 16'b000_001_001_010_0000;
        #100
        Inputinstruction = 16'b000_010_101_001_0000;
        #100
        Inputinstruction = 16'b000_011_111_100_0000;
        #100
        Inputinstruction = 16'b000_100_010_001_0000;
        #100
        Inputinstruction = 16'b000_101_001_001_000_1;
        #100
        Inputinstruction = 16'b0000000000000100;
        #100
        Inputinstruction = 16'b000_110_001_001_000_1;
        #100
        Inputinstruction = 16'b0000000000000010;
        #100
        Inputinstruction = 16'b011_011_010_010_0000;
        #100

        writeInstruction=0;
        rst = 1;
        #100
        rst = 0;
    end
endmodule