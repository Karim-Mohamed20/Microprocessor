module IF_ID (
    input clk,
    input flush,
    input stallLD,
    input immediate,
    input [15:0] instIn,
    output reg [15:0] instOut,
    output reg [15:0] immediateValue,
    input [15:0] Inport,
    output reg [15:0] InPortOut
);
 reg inside = 0;
    always @(posedge clk ) begin
        
        if(immediate == 1'b1 & inside == 0) begin
            inside = 1;
            immediateValue = instIn;
        end else if(stallLD == 1'b0) begin
            instOut = instIn;
            inside = 0;
            InPortOut = Inport;
        end

        if(flush) begin
            instOut = 0;
        end
    end
    
endmodule