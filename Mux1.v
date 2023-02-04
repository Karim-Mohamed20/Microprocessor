module AluMux1 (inputFromBuf,inputFromFU,selectorFromFU,out);
    
    input [15:0] inputFromBuf,inputFromFU;
    input selectorFromFU;
    output [15:0] out;

    assign out = ((selectorFromFU) ? inputFromFU : inputFromBuf);

endmodule