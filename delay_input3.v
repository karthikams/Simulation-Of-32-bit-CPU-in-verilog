module delay_input3(clock,multiply_d2,sum_d2,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,register_we_d2,rd_d2,DOut,reg_rs1_d3,alu_out_d3,immediate_value_d3,opcode_d3,rd_d3,register_we_d3,DOut_d3,sum_d3,multiply_d3);

output reg[31:0] reg_rs1_d3,alu_out_d3,immediate_value_d3, DOut_d3,sum_d3,multiply_d3;
output reg[5:0] opcode_d3;
output reg[4:0] rd_d3;
output reg register_we_d3;

input [31:0] reg_rs1_d2,alu_out_d2,immediate_value_d2, DOut,sum_d2,multiply_d2;
input [5:0] opcode_d2;
input [4:0] rd_d2;
input register_we_d2,clock;

always@(posedge clock)
begin

reg_rs1_d3 <= reg_rs1_d2;
alu_out_d3 <= alu_out_d2;
immediate_value_d3 <= immediate_value_d2;
DOut_d3 <= DOut;
opcode_d3 <= opcode_d2;
rd_d3 <= rd_d2;
register_we_d3 <= register_we_d2;
sum_d3 <= sum_d2;
multiply_d3 <= multiply_d2;
end
endmodule