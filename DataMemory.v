

module data_Memory (
    input  [11:0] address,
    input clk ,
    input readEnable ,
    input writeEnable ,
    output wire [15:0] outdata,
    input  [15:0] indata
);
    
reg [15:0] memory_data [(2**12)-1:0];

always @(negedge clk) begin
    if (writeEnable) begin
        memory_data[address] = indata;
    end
end

assign  outdata = memory_data[address];

endmodule
