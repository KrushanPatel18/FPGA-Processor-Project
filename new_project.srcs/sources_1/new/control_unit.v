module control_unit (
  input [6:0] opcode,
  output reg [3:0] alu_control,
  output reg reg_write
);
  always @(*) begin
    case (opcode)
      7'b0110011: begin // R-type
        alu_control = 4'b0000; // Example: Addition
        reg_write = 1;
      end
      // Add cases for other instructions
      default: begin
        alu_control = 4'b0000;
        reg_write = 0;
      end
    endcase
  end
endmodule
