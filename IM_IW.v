module IM_IW (
    input clk,
    input [15:0] aluDataIn,
    input [15:0] memoryDataIn,
    input memoryReadIn,
    input wbIn,
    input [2:0] rDstIn,
    input writeFlag,
    input writePcHigh,
    input writePcLow,
    output reg [15:0] aluDataOut,
    output reg [15:0] memoryDataOut,
    output reg memoryReadOut,
    output reg wbOut,
    output reg [2:0] rDstOut,
    output reg writeFlagOut,
    output reg writePcHighOut,
    output reg writePcLowOut,
    input Ininst,
    input outinst,
    output reg outIninst,
    output reg outoutinst
);

    always @(posedge clk ) begin
        aluDataOut = aluDataIn;
        memoryDataOut = memoryDataIn;
        memoryReadOut = memoryReadIn;
        wbOut = wbIn;
        rDstOut = rDstIn;
        writeFlagOut = writeFlag;
        writePcHighOut = writePcHigh;
        writePcLowOut = writePcLow;
        outIninst = Ininst;
        outoutinst = outinst;
    end
    
endmodule

module memoryOutMux (
    input memoryRead,
    input [15:0] aluData,
    input [15:0] memoryData,
    output [15:0] memoryOut
);

    assign memoryOut = memoryRead ? memoryData : aluData;
    
endmodule

