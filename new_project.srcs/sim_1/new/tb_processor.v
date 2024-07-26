module tb_processor;
  reg clk;
  reg reset;
  reg [31:0] instruction;
  wire [31:0] result;

  top_processor uut (
    .clk(clk),
    .reset(reset),
    .instruction(instruction),
    .result(result)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    instruction = 32'b0;
    #10;
    reset = 0;
    // Apply test vectors
    instruction = 32'h00028293; // Example R-type instruction
    #10;
    // Check results
    $finish;
  end
endmodule
