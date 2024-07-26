module instruction_decoder (
  input [31:0] instruction,
  output [4:0] rs1, rs2, rd,
  output [6:0] opcode
);
  assign rs1 = instruction[19:15];
  assign rs2 = instruction[24:20];
  assign rd = instruction[11:7];
  assign opcode = instruction[6:0];
endmodule
