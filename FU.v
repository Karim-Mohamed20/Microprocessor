module FU (
    input [2:0] dst,
    input [2:0] src,
    input [2:0] prevDst,
    input [2:0] prePrevDst,
    input [15:0] prevData,
    input [15:0] prePrevData,
    input prevWB,
    input prePrevWB,
    output forwardSrc,
    output forwardDst,
    output [15:0] outSrc,
    output [15:0] outDst
);
    
    wire forwardPrevSrc, forwardPrevDst;
    assign forwardPrevSrc = (prevWB && prevDst == src) ? 1 : 0;
    assign forwardPrevDst = (prevWB && prevDst == dst) ? 1 : 0;
    
    wire forwardPrePrevSrc, forwardPrePrevDst;
    assign forwardPrePrevSrc = (prePrevWB && prePrevDst == src) ? 1 : 0;
    assign forwardPrePrevDst = (prePrevWB && prePrevDst == dst) ? 1 : 0;

    assign forwardSrc = forwardPrevSrc || forwardPrePrevSrc;
    assign forwardDst = forwardPrevDst || forwardPrePrevDst;
    
    assign outSrc = (forwardPrevSrc ? prevData : (forwardPrePrevSrc ? prePrevData : 16'bz));
    assign outDst = (forwardPrevDst ? prevData : (forwardPrePrevDst ? prePrevData : 16'bz));
    
endmodule