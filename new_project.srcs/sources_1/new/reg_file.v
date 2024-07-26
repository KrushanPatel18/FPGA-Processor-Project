module reg_file (
  input clk,
  input reset,
  input [4:0] rs1, rs2, rd,
  input [31:0] write_data,
  input reg_write,
  output [31:0] read_data1, read_data2
);
  reg [31:0] regs [31:0]; // 32 registers, each 32 bits
  integer i; // Declare the loop variable here

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Initialize all registers to zero
      for (i = 0; i < 32; i = i + 1) begin
        regs[i] <= 32'b0;
      end
    end else if (reg_write) begin
      regs[rd] <= write_data;
    end
  end

  assign read_data1 = regs[rs1];
  assign read_data2 = regs[rs2];
endmodule


