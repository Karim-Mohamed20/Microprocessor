module ID_IE (
    input clk,
    input [15:0] RsrcData,
    input [15:0] RdstData,
    input [15:0] immValue,
    input [2:0] RsrcAddress,
    input [2:0] RdstAddress,
    input [3:0] AluOp,
    input WB,
    input memRead,
    input memWrite,
    input branch,
    input JZ,
    input JC,
    input JN,
    input shift,
    input writeFlag,
    input writePcHigh,
    input writePcLow,
    input loaduseCase,
    input stallBuffer,
    output [15:0] outRsrcData,
    output [15:0] outRdstData,
    output [2:0] outRsrcAddress,
    output [2:0] outRdstAddress,
    output [3:0] outAluOp,
    output outWB,
    output outMemRead,
    output outMemWrite,
    output outBranch,
    output outJZ,
    output outJC,
    output outJN,
    output outShift,
    output [15:0] outImmValue,
    input Flush,
    input stallLD,
    output outwriteFlag,
    output outwritePcHigh,
    output outwritePcLow,
    input ForwardPCHighCall,
    input ForwardPCLowCall,
    output outForwardPCHighCall,
    output outForwardPCLowCall,
    output outloaduseCase,
    input Ininst,
    input outinst,
    output outIninst,
    output outoutinst
);

always @(posedge clk) begin
    if (stallBuffer == 0) begin
        outRsrcData = RsrcData;
        outRdstData = RdstData;
        outRsrcAddress = RsrcAddress;
        outRdstAddress = RdstAddress;
        outAluOp = AluOp;
        outWB = WB;
        outMemRead = memRead;
        outMemWrite = memWrite;
        outBranch = branch;
        outShift = shift;
        outImmValue = immValue;
        outJZ = JZ;
        outJC = JC;
        outJN = JN;
        outwriteFlag = writeFlag;
        outwritePcHigh = writePcHigh;
        outwritePcLow = writePcLow;
        outForwardPCHighCall = ForwardPCHighCall;
        outForwardPCLowCall = ForwardPCLowCall;
        outloaduseCase = loaduseCase;
        outIninst = Ininst;
        outoutinst = outinst;
    end
    if (Flush == 1) begin
        outRsrcData = 0;
        outRdstData = 0;
        outRsrcAddress = 0;
        outRdstAddress = 0;
        outAluOp = 0;
        outWB = 0;
        outMemRead = 0;
        outMemWrite = 0;
        outBranch = 0;
        outShift = 0;
        outImmValue = 0;
        outJZ = 0;
        outJC = 0;
        outJN = 0;
        outwriteFlag = 0;
        outwritePcHigh = 0;
        outwritePcLow = 0;
        outForwardPCHighCall = 0;
        outForwardPCLowCall = 0;
        outloaduseCase = 0;
        outIninst = 0;
        outoutinst = 0;
    end
end

endmodule