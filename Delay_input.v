module delay_input(reg_rs1_d1,reg_rs2_d1,opcode_d1,rs1_d1,rs2_d1,rd_d1,immediate_value_d1,register_we_d1,data_we_d1,reg_rs1,reg_rs2,rs1,rs2,rd,immediate_value_sign,opcode,register_we,data_we,clock);


output reg [31:0] reg_rs1_d1,reg_rs2_d1,immediate_value_d1;
output reg [5:0] opcode_d1;
output reg[4:0] rd_d1,rs1_d1,rs2_d1;
output reg register_we_d1,data_we_d1;
input [31:0] reg_rs1,reg_rs2,immediate_value_sign;
input[5:0] opcode;
input [4:0] rd,rs1,rs2;
input clock,register_we,data_we;

always@(posedge clock)
begin
 reg_rs1_d1 <= reg_rs1;
 reg_rs2_d1 <= reg_rs2;
 immediate_value_d1 <= immediate_value_sign;
 opcode_d1 <= opcode;
 rd_d1 <= rd;
 rs1_d1 <= rs1;
 rs2_d1 <= rs2;
 register_we_d1 <= register_we;
 data_we_d1 <= data_we;
end
endmodule
