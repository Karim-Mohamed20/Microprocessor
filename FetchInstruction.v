

module FetchInstruction(
    input clk,
    input int,
    input stall_control_hazard,
    input stall_load_usecase,
    input rst,
    input brach_enable,
    input [15:0] branch_address,
    output  [15:0] output_instruction,
    output half_pc_selector,
    output flags_selector,
    output push_flags_pc,
    output [31:0] current_pc,
    input [15:0] return_address,
    input write_pc_high,
    input write_pc_low,
    input [15:0] input_instruction,
    input write_instruction,
    input [31:0] memory_address
);

wire start_int, int_enable, int_stall;
wire [15:0] pre_int_handler;
wire [15:0] instruction_memory_out;

InterruptDedector InterruptDedect(clk, int, start_int, int_enable, pre_int_handler, int_stall, half_pc_selector, flags_selector, push_flags_pc);

PCRegWrite PcWrite(clk, current_pc, int_stall, stall_control_hazard, stall_load_usecase, rst, brach_enable, branch_address, start_int, return_address, write_pc_high, write_pc_low);

Instruction_Memory InstructionMemory(current_pc, clk, instruction_memory_out, input_instruction, write_instruction, memory_address);

INTMUX InterruptMux(clk, pre_int_handler, int_enable, instruction_memory_out, output_instruction);

endmodule
