
module PCRegWrite(clk,out,INTStall,stallControlHazard,stallLoadUseCase,Rst,BrachEnable,BranchAddress,startINT,returnAddress,writePcHigh,writePcLow);
input [15:0] BranchAddress,returnAddress;
input clk,stallControlHazard,stallLoadUseCase,Rst,BrachEnable,startINT,INTStall,writePcHigh,writePcLow;
output reg [31:0] out;

initial begin
  out=2**5-1;
end

always @(negedge clk) begin
  if (stallControlHazard==1||stallLoadUseCase==1) begin
  end
  else if (Rst==1) begin
    out=2**5;
  end
  else if (startINT==1) begin
    out=0;
  end
  else if(writePcHigh == 1) begin
    out[31:16] = returnAddress;
  end
  else if(writePcLow == 1) begin
    out[15:0] = returnAddress;
  end
  else if (BrachEnable==1) begin
    out[15:0]=BranchAddress[15:0];
    out[31:16]=0;
  end
  else if (INTStall==1) begin
  end
  else begin
    out=out+1;
  end
end
endmodule