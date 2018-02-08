module delay_input2(clock,reg_rs1_d1,multiply,alu_out,immediate_value_d1,opcode_d1,register_we_d1,data_we_d1,rd_d1,rs1_d1,rs2_d1,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,rd_d2,sum_d2,register_we_d2,data_we_d2,rs1_d2,rs2_d2,multiply_d2,sum);
output reg [31:0] reg_rs1_d2,alu_out_d2,immediate_value_d2;
output reg [5:0] opcode_d2;
output reg [4:0] rd_d2,rs1_d2,rs2_d2;
output reg register_we_d2,data_we_d2;
output reg [31:0] sum_d2,multiply_d2;


input[31:0] reg_rs1_d1,alu_out,immediate_value_d1,sum,multiply;
input [5:0] opcode_d1;
input [4:0] rd_d1,rs1_d1,rs2_d1;
input register_we_d1,data_we_d1;
input clock;


always@(posedge clock)
begin
reg_rs1_d2<=reg_rs1_d1;
alu_out_d2 <= alu_out;
immediate_value_d2<= immediate_value_d1;
opcode_d2<=opcode_d1;
rd_d2<=rd_d1;
register_we_d2 <= register_we_d1;
data_we_d2 <= data_we_d1;
rs1_d2 <= rs1_d1;
rs2_d2 <= rs2_d1;
sum_d2 <= sum;
multiply_d2<= multiply;

end
endmodule
