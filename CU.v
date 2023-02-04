module CU (
  input  [5:0] Opcode,
  input stallLD,
  input   clk ,
  input FirstBit,
  output reg  [3:0] AluOperation,
  output reg  WB,
  output reg  MemoryRead,
  output reg  MemoryWrite,
  output reg JMP,
  output reg JZ,
  output reg JC,
  output reg JN,
  output reg StaLLBuffers,
  output reg Shift,
  output reg ForwardSP,
  output reg IncSP,
  output reg writeFlag,
  output reg writePcHigh,
  output reg writePcLow,
  output reg ForwardPCHighCall,
  output reg ForwardPCLowCall,
  output reg loaduseCase,
  output reg Ininst,
  output reg outinst
);

wire counter;
assign counter = (Opcode == 6'b010_010 || Opcode == 6'b000_101 || Opcode == 6'b000_110) ? 1'b1 : 1'b0;  //LDM ,SHL , SHR
reg enable = 1;
always @(posedge clk) begin
  if (FirstBit == 1 && enable == 1) begin
    enable = 0;
  end else if (enable == 0 && FirstBit == 1) begin
    enable = 1;
  end
end

always @(*) begin
  if (stallLD == 1) begin
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b000_000) begin // mov
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else  if (Opcode == 6'b000_001) begin // ADD
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0011;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b000_010) begin // Sub
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0100;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b000_011) begin // AND
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0101;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b000_100) begin // OR
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0110;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
	else if (Opcode == 6'b000_101&&counter == 1&&enable) begin // SHL
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 1;
    AluOperation = 4'b0111;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b000_110&&counter == 1&&enable) begin // SHR
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 1;
    AluOperation = 4'b1000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b001_000) begin // NOP
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b001_001) begin // SETC
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b1010;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b001_010) begin // CLRC
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b1011;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b001_011) begin // NOT
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b1001;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b001_100) begin // INC
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0001;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b001_101) begin // DEC
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0010;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b001_110) begin // INput
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 1;
    outinst = 0;
  end
  else if (Opcode == 6'b001_111) begin // output
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 1;
  end
  else if (Opcode == 6'b011_000) begin // JZ
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 1;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 1;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b011_001) begin // JN
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 1;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b011_010) begin // JC
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 1;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b011_011) begin // JMP
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JMP = 1;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b011_100) begin // CALL
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 1;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b011_101) begin // POPF
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 1;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 1;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 1;
    writePcLow = 0;
    writePcHigh = 0;
    IncSP = 1;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b011_110) begin // POPPchigh
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 1;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 1;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 1;
    IncSP = 1;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b011_111) begin // POPPcLow
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 1;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 1;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 1;
    writePcHigh = 0;
    IncSP = 1;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b111_001) begin // popWithoutWriteBack
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 1;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 1;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    IncSP = 1;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b111_010) begin // pushPChighCall
    WB = 0;
    MemoryWrite = 1;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 1;
    JC = 0;
    JZ = 0;
    JN = 0;
    IncSP = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 1;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b111_011) begin // pushPClowCall
    WB = 0;
    MemoryWrite = 1;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 1;
    JC = 0;
    JZ = 0;
    JN = 0;
    IncSP = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 1;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b010_000) begin // PUSH
    WB = 0;
    MemoryWrite = 1;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 1;
    JC = 0;
    JZ = 0;
    JN = 0;
    IncSP = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b010_001) begin // POP
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 1;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 1;
    JC = 0;
    JZ = 0;
    JN = 0;
    IncSP = 1;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 1;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b010_010&&counter == 1&&enable) begin // LDM
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 1;
    AluOperation = 4'b1111;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b010_011) begin // LDD
    WB = 1;
    MemoryWrite = 0;
    MemoryRead = 1;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 1;
    Ininst = 0;
    outinst = 0;
  end
  else if (Opcode == 6'b010_100) begin // STD
    WB = 0;
    MemoryWrite = 1;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
  else begin
    WB = 0;
    MemoryWrite = 0;
    MemoryRead = 0;
    JMP = 0;
    Shift = 0;
    AluOperation = 4'b0000;
    StaLLBuffers = 0;
    ForwardSP = 0;
    JC = 0;
    JZ = 0;
    JN = 0;
    writeFlag = 0;
    writePcLow = 0;
    writePcHigh = 0;
    ForwardPCHighCall = 0;
    ForwardPCLowCall = 0;
    loaduseCase = 0;
    Ininst = 0;
    outinst = 0;
  end
end

endmodule