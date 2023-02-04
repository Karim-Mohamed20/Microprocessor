module AluMux2 (
    input [15:0] inputFromBuf,
    input [15:0] inputImm,
    input [15:0] inputFromFU,
    input selectorFromFU,
    input selectorFromCU,
    output [15:0] out
);

    assign out = (selectorFromCU ? inputImm : ((selectorFromFU) ? inputFromFU : inputFromBuf));

endmodule