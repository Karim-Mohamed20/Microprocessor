
module Instruction_Memory (
    input  [31:0] addres,
    input clk ,
    output [15:0] instruction,
    input [15:0] Inputinstruction,
    input writeInstruction,
    input [31:0] MemoryAddress
);

    reg  [31:0]  WriteAddress;
    reg [15:0] memory_instruction [100:0];
    assign instruction = memory_instruction[addres[20:0]];
    
    always @(MemoryAddress) begin
        WriteAddress = MemoryAddress;
    end
    
    always @(posedge clk) begin
        if (writeInstruction == 1) begin
            memory_instruction[WriteAddress] = Inputinstruction;
            WriteAddress = WriteAddress + 1;
        end
    end

endmodule