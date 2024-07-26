module top_processor (
  input clk,
  input reset,
  input [31:0] instruction,
  output [31:0] result
);
  wire [4:0] rs1, rs2, rd;
  wire [6:0] opcode;
  wire [31:0] read_data1, read_data2, alu_result;
  wire [3:0] alu_control;
  wire reg_write;

  instruction_decoder decoder (
    .instruction(instruction),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .opcode(opcode)
  );

  reg_file rf (
    .clk(clk),
    .reset(reset),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(alu_result),
    .reg_write(reg_write),
    .read_data1(read_data1),
    .read_data2(read_data2)
  );

  control_unit cu (
    .opcode(opcode),
    .alu_control(alu_control),
    .reg_write(reg_write)
  );

  alu my_alu (
    .operand1(read_data1),
    .operand2(read_data2),
    .alu_control(alu_control),
    .result(alu_result)
  );

  assign result = alu_result;
endmodule
