module main (
    input clk,
    input INT,
    input [15:0] InPort,
    output reg [15:0] outPort,
    input rst,
    input [15:0] Inputinstruction,
    input writeInstruction,
    input [31:0] MemoryAddress
);

    wire IW_MemReadOut, IW_WBOut;
    wire [2:0] IW_RdstAddressOut;
    wire [15:0] IW_MemoryWBData;
    
    wire [15:0] IM_AluOut;
    wire [2:0] IM_RsrcAddressOut, IM_RdstAddressOut;
    wire IM_WBOut, IM_MemReadOut, IM_MemWriteOut, IM_BranchOut, IM_ShiftOut,IM_writeFlag,IM_writePcHigh,IM_writePcLow;

    wire stallCtrl, BrachEnable, HalfPcSelector, FlagsSelector, PushFlagsPc;
    reg stallLD = 0;
    wire [31:0] Pc;
    wire [15:0] OutputInstruction;
    wire [15:0] BranchAddress;
    wire IW_writeFlag, IW_writePcHigh, IW_writePcLow;
    wire [15:0] IW_AluOut, IW_MemoryOut;

    FetchInstruction fetch (clk, INT, stallCtrl, stallLD, rst, BrachEnable, BranchAddress, OutputInstruction, HalfPcSelector, FlagsSelector, PushFlagsPc, Pc, IW_MemoryOut, IW_writePcHigh, IW_writePcLow, Inputinstruction, writeInstruction, MemoryAddress);

    wire flush;
    wire [15:0] bufInstOut, immediateValue, IF_Inport;
    IF_ID fetchBuffer (clk, flush, 0, bufInstOut[0], OutputInstruction, bufInstOut, immediateValue, InPort, IF_Inport);

    wire [3:0] AluOp;
    wire WB, MemoryRead, MemoryWrite, Branch, Shift, ForwardSP, IncSP, JZ, JC, JN, writeFlag, writePcHigh, writePcLow ,ForwardPCHighCall, ForwardPCLowCall, loaduseCase, Ininst, outinst;
    wire [5:0] CUopcode;
    assign CUopcode = bufInstOut[15:10];
    CU controlUnit (CUopcode, stallLD, clk, bufInstOut[0], AluOp, WB, MemoryRead, MemoryWrite, Branch, JZ, JC, JN, stallCtrl, Shift, ForwardSP, IncSP, writeFlag, writePcHigh, writePcLow, ForwardPCHighCall, ForwardPCLowCall, loaduseCase, Ininst, outinst);

    wire [15:0] rSrc, rDst, rsrc_SP, rsrc_Inport;
    wire [2:0] rSrcAddress, rDstAddress;
    reg [15:0] SP = 2**11 - 1;
    assign rSrcAddress = bufInstOut[9:7];
    assign rDstAddress = bufInstOut[6:4];

    Register_file regFile (IW_WBOut, rSrc, IW_MemoryWBData, clk, rst, rSrcAddress, IW_RdstAddressOut, rDst, rDstAddress);
    wire [15:0] IE_RsrcDataOut, IE_RdstDataOut, IE_ImmediateOut;
    wire [2:0] IE_RsrcAddressOut, IE_RdstAddressOut;
    wire IE_WBOut, IE_MemReadOut, IE_MemWriteOut, IE_BranchOut, IE_ShiftOut, IE_writeFlag, IE_writePcHigh, IE_writePcLow, IE_ForwardPCHighCall, IE_ForwardPCLowCall, IE_loaduseCase, IE_Ininst, IE_outinst;
    wire [3:0] IE_AluOpOut;

    assign rsrc_SP = (ForwardSP) ? ((IncSP) ? SP + 1 : SP) : rSrc;
    assign rsrc_Inport = (Ininst == 1) ? IF_Inport : rsrc_SP;
    assign stallLD = (IE_loaduseCase && (IE_RdstAddressOut == rDstAddress || rSrcAddress == IE_RdstAddressOut)) ? 1 : 0;
    ID_IE decodeBuffer (clk, rsrc_Inport, rDst, immediateValue, rSrcAddress, rDstAddress, AluOp, WB, MemoryRead, MemoryWrite, Branch, JZ, JC, JN, Shift, writeFlag, writePcHigh, writePcLow, loaduseCase, stallCtrl, IE_RsrcDataOut, IE_RdstDataOut, IE_RsrcAddressOut, IE_RdstAddressOut, IE_AluOpOut, IE_WBOut, IE_MemReadOut, IE_MemWriteOut, IE_BranchOut, IE_JZ, IE_JC, IE_JN, IE_ShiftOut, IE_ImmediateOut, flush, stallLD, IE_writeFlag, IE_writePcHigh, IE_writePcLow, ForwardPCHighCall, ForwardPCLowCall, IE_ForwardPCHighCall, IE_ForwardPCLowCall, IE_loaduseCase, Ininst, outinst, IE_Ininst, IE_outinst);
    
    wire [15:0] inputFromFU1, inputFromFU2, aluOp1, aluOp2;
    wire selectorFromFU1, selectorFromFU2;

    FU ForwardUnit(IE_RdstAddressOut, IE_RsrcAddressOut, IM_RdstAddressOut, IW_RdstAddressOut, IM_AluOut, IW_MemoryWBData, IM_WBOut, IW_WBOut, selectorFromFU1, selectorFromFU2, inputFromFU1, inputFromFU2);
    AluMux1 mux1 (IE_RsrcDataOut, inputFromFU1, selectorFromFU1, aluOp1);
    AluMux2 mux2 (IE_RdstDataOut, immediateValue, inputFromFU2, selectorFromFU2, IE_ShiftOut, aluOp2);

    wire [15:0] aluOut;
    wire [3:0] flags;
    alu ALU (aluOp1, aluOp2, IE_AluOpOut, aluOut, flags, IW_writeFlag, IW_MemoryOut[3:0], clk);

    wire IM_ForwardPCHighCall, IM_ForwardPCLowCall, IM_Ininst, IM_outinst;
    wire [15:0] IM_RsrcDataOut, IM_RdstDataOut;
    wire [3:0] IM_AluOpOut, IM_flags;
    IE_IM executeBuffer (clk, aluOut, flags, IE_RsrcAddressOut, IE_RdstAddressOut, IE_AluOpOut, IE_WBOut, IE_MemReadOut, IE_MemWriteOut, IE_BranchOut, IE_JZ, IE_JC, IE_JN, IE_ShiftOut, IE_writeFlag, IE_writePcHigh, IE_writePcLow, stallCtrl, IE_RsrcDataOut, IE_RdstDataOut, IM_AluOut, IM_RsrcAddressOut, IM_RdstAddressOut, IM_AluOpOut, IM_WBOut, IM_MemReadOut, IM_MemWriteOut, IM_BranchOut, IM_JZ, IM_JC, IM_JN, IM_ShiftOut, IM_RsrcDataOut, IM_RdstDataOut, flush, IM_flags, IM_writeFlag, IM_writePcHigh, IM_writePcLow, IE_ForwardPCHighCall, IE_ForwardPCLowCall, IM_ForwardPCHighCall, IM_ForwardPCLowCall, IE_Ininst, IE_outinst, IM_Ininst, IM_outinst);
    
    wire startBranch;
    assign BranchAddress = IM_RdstDataOut;
    assign startBranch = (IM_BranchOut) | (IM_JZ&IM_flags[0]) | (IM_JC&IM_flags[2]) | (IM_JN&IM_flags[1]);
    assign flush = startBranch;
    assign BrachEnable = startBranch;

    wire [15:0] ForwardedMemoryData, WB_M_Forward, WB_M_Forward_Address;
    ForwardPC Forwardpc( IM_RdstDataOut, Pc[15:0], Pc[31:16], flags,HalfPcSelector, FlagsSelector, PushFlagsPc, ForwardedMemoryData, IM_ForwardPCHighCall, IM_ForwardPCLowCall);

    wire [15:0] memoryOut;
    assign WB_M_Forward= (!PushFlagsPc && IW_WBOut && IM_MemWriteOut && IM_RdstAddressOut == IW_RdstAddressOut) ? IW_MemoryWBData : ForwardedMemoryData;
    assign WB_M_Forward_Address = (!PushFlagsPc && IW_WBOut && (IM_MemWriteOut || IM_MemReadOut) && IM_RsrcAddressOut == IW_RdstAddressOut) ? IW_MemoryWBData : IM_RsrcDataOut;

    data_Memory DM (WB_M_Forward_Address, clk, IM_MemReadOut, IM_MemWriteOut, memoryOut, WB_M_Forward);

    wire  IW_Ininst, IW_outinst;
    IM_IW writeBackBuffer (clk, IM_AluOut, memoryOut, IM_MemReadOut, IM_WBOut, IM_RdstAddressOut, IM_writeFlag, IM_writePcHigh, IM_writePcLow, IW_AluOut, IW_MemoryOut, IW_MemReadOut, IW_WBOut, IW_RdstAddressOut, IW_writeFlag, IW_writePcHigh, IW_writePcLow, IM_Ininst, IM_outinst, IW_Ininst, IW_outinst);

    memoryOutMux memMux(IW_MemReadOut, IW_AluOut, IW_MemoryOut, IW_MemoryWBData);
    reg decSP = 0;
    always @(posedge clk) begin
        if (ForwardSP) begin
            if(IncSP)begin
                SP = SP + 1;
            end
            else begin
                decSP = 1;
            end
        end
        if (decSP) begin
            SP = SP - 1;
            decSP = 0;
        end
    end
    always @(negedge clk) begin
        if (IW_outinst == 1) begin
            outPort = IW_MemoryWBData;
        end
    end
endmodule