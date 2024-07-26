module alu (
  input [31:0] operand1, operand2,
  input [3:0] alu_control,
  output reg [31:0] result
);
  always @(*) begin
    case (alu_control)
      4'b0000: result = operand1 + operand2; // Addition
      4'b0001: result = operand1 - operand2; // Subtraction
      4'b0010: result = operand1 & operand2; // AND
      4'b0011: result = operand1 | operand2; // OR
      // Add more cases as needed
      default: result = 32'b0;
    endcase
  end
endmodule
