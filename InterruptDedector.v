

module InterruptDedector(
    input clk,
    input INT,
    output reg StartINT,
    output reg INTEnable,
    output reg [15:0] PreINThandler,
    output reg INTstall,
    output reg HalfPcSelector,
    output reg FlagsSelector,
    output reg PushFlagsPc
);

    reg [3:0] counter;
    assign counter = 0;
    assign INTstall = 0;
    assign INTEnable = 0;
    assign PushFlagsPc = 0;

    always @(posedge clk) begin

        counter = counter + 1;

        if (INTstall == 1 & counter == 4) begin
            INTEnable = 1;
            PreINThandler = 16'b010_000_011_011_0000; //Push R3
            HalfPcSelector = 0;
            FlagsSelector = 0;
            PushFlagsPc = 1;
        end
        else if (INTstall == 1 & counter == 7) begin
            HalfPcSelector = 1;
            PreINThandler = 16'bxxxxxxxxxxxxxxxx;
        end
        else if (INTstall == 1 & counter == 8) begin
            HalfPcSelector = 0;
        end
        else if (INTstall == 1 & counter == 9) begin
            FlagsSelector = 1;
        end
        else if (INTstall == 1 & counter == 10) begin
            INTstall = 0;
            INTEnable = 0;
            StartINT = 1;
            PushFlagsPc = 0;
        end
        else if (counter == 11 & StartINT == 1) begin
            StartINT = 0;
        end
        if (INT == 1 & INTstall == 0) begin
            counter = 0;
            INTstall = 1;
        end
   end

endmodule