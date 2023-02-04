module Register_file #(parameter N=16) (
  input write_enable,
  output [N-1:0]read_data,
  input [N-1:0] write_data,
  input clk,
  input rst,
  input [2:0] read_addr,
  input [2:0] write_addr,
  output [N-1:0] read_data2,
  input [2:0] read_addr2
);

  reg [N-1:0] regfile [7:0];
  reg [3:0] i;
  always @(negedge clk, posedge rst) begin
    for (i = 0; i < 8; i = i+1 ) begin
      if (rst) begin
        regfile[i]=0;
      end else if(write_enable)
      begin
        if(write_addr == i)
          regfile[i] = write_data;
      end
    end
  end
  assign read_data = regfile[read_addr];
  assign  read_data2 = regfile[read_addr2];
endmodule

module ControlHazardDetector (
  input zero_flag,
  input negative_flag,
  input carry_flag,
  input branch_signal,
  input [15:0] Rsrc_value,
  input [15:0] immediate_value,
  input [2:0] instruction,
  output controlHazardFlag
);
 
  assign controlHazardFlag = branch_signal &&  (
    (instruction == 000 && zero_flag) ||      // JZ
    (instruction == 001 && negative_flag) ||  // JN
    (instruction == 010 && carry_flag) ||     // JC
    (instruction == 011) ||                   // JMP
    (instruction == 111 && Rsrc_value == immediate_value)
  );  //cmpeq Rsrc,value
endmodule
