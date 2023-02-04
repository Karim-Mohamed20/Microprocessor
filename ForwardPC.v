module ForwardPC (
    input [15:0] normalData,
    input [15:0] pcL,
    input [15:0] pcH,
    input [3:0] flags,
    input halfPcSelector,
    input flagsSelector,
    input pushPcFlags,
    output [15:0] memoryData,
    input IM_ForwardPCHighCall,
    input IM_ForwardPCLowCall
);

    wire [15:0] pcFlagsMuxOut;
    PC_Flags_Mux pcFlagsMux(pcL, pcH, flags, halfPcSelector, flagsSelector, pcFlagsMuxOut);

    assign memoryData = IM_ForwardPCHighCall?pcH:IM_ForwardPCLowCall?pcL-2:(pushPcFlags) ? pcFlagsMuxOut : normalData;
    
endmodule

module PC_Flags_Mux (
    input [15:0] pcL,
    input [15:0] pcH,
    input [3:0] flags,
    input halfPcSelector,
    input flagsSelector,
    output [15:0] out
);
    
    assign out = (flagsSelector ? {12'b0,flags} : (halfPcSelector ? pcH : pcL));
    
endmodule