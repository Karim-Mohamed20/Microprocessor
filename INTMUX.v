
module INTMUX(
    input clk,
    input [15:0] PreINThandler,
    input INTEnable,
    input [15:0] NormalInstruction,
    output  [15:0] OutputInstruction
);

    assign OutputInstruction=(INTEnable==0)?NormalInstruction:PreINThandler;

endmodule
