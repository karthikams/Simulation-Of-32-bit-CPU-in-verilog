module cpu_module(din,clock,reset,rs1_data,rs2_data);

output  [31:0] din;
input[31:0] rs1_data,rs2_data;
input clock,reset;

wire[31:0] data_out;
wire [4:0] rs1,rs2,rd,rd_d1,rd_d2,rd_d3,rs_value,rs1_d1,rs2_d1,rs1_d2,rs2_d2;
wire clock,branch,jump,reset;
wire [15:0] immediate_value;
wire [25:0] immediate_jump;
wire[31:0] addr_in,reg_rs1,reg_rs2,immediate_value_sign,reg_rs2_d1,reg_rs1_d1,immediate_value_d1,mux1_out,mux2_out,alu_out,reg_rs1_d2,alu_out_d2,immediate_value_d2,
DOut,reg_rs1_d3,alu_out_d3,immediate_value_d3,DOut_d3,opcode_d3,din,pc_delay,rs_value_sign,pc_add_imme,data_path_out1,data_path_out2,sum,sum_d2,sum_d3,multiply,multiply_d2,multiply_d3;
wire [5:0] opcode_d1,opcode,opcode_d2;
wire register_we,data_we,data_we_d2,register_we_d2,register_we_d3,alu_alu_s1,alu_alu_s2,bypass_alu1,bypass_alu2,dmem_alu1,dmem_alu2;


program_counter pc(branch,jump,pc_add_imme,addr_in,reset,clock);
instruction_memory im (data_out,addr_in); 
delay_pc delayPC (pc_delay,addr_in,clock);
instruction_register ir(opcode,rs1,rs2,rd,immediate_value,immediate_jump,rs_value,data_out,clock); 


sign_extension signex (opcode,immediate_value,rs_value,immediate_jump,immediate_value_sign,rs_value_sign);
branch_program bp (pc_add_imme,pc_delay,immediate_value_sign,opcode);
opcode_decoder od (register_we,data_we,opcode,clock,reset);

register_file_2 rf(reg_rs1,reg_rs2,rs1,rs2,rd_d3, rs1_data,rs2_data,din, reset,clock,register_we_d3);
//register_file rf(reg_rs1,reg_rs2,rs1,rs2,rd, rs1_data,rs2_data,din,reset,clock,we);



compare_branch cb (branch,jump,reg_rs1,rs_value_sign,opcode);
program_counter pc_again(branch,jump,pc_add_imme,addr_in,reset,clock);
delay_input delay1 (reg_rs1_d1,reg_rs2_d1,opcode_d1,rs1_d1,rs2_d1,rd_d1,immediate_value_d1,register_we_d1,data_we_d1,reg_rs1,reg_rs2,rs1,rs2,rd,immediate_value_sign,opcode,register_we,data_we,clock);


mux1 m1(mux1_out,opcode_d1,reg_rs2_d1,reg_rs1_d1); 
mux2 m2 (mux2_out,opcode_d1,reg_rs2_d1,immediate_value_d1);

data_path_mux1 dp_mux1(data_path_out1,alu_alu_s1,bypass_alu1,dmem_alu1,mux1_out,alu_out_d2,alu_out_d3,DOut_d3);
data_path_mux2 dp_mux2(data_path_out2,alu_alu_s2,bypass_alu2,dmem_alu2,mux2_out,alu_out_d2,alu_out_d3,DOut_d3);


arithmetic_logic_unit alu(alu_out,data_path_out1,data_path_out2,opcode_d1);
floating_point_adder fa (sum ,data_path_out1,data_path_out2,opcode_d1);
floating_point_multiplier fm (multiply,data_path_out1,data_path_out2,opcode_d1);

//delay_input2 delay2(clock,reg_rs1_d1,alu_out,immediate_value_d1,opcode_d1,register_we_d1,data_we_d1,rd_d1,rs1_d1,rs2_d1,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,rd_d2,register_we_d2,data_we_d2,rs1_d2,rs2_d2);
//delay_input2 delay2(clock,reg_rs1_d1,alu_out,immediate_value_d1,opcode_d1,register_we_d1,data_we_d1,rd_d1,rs1_d1,rs2_d1,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,rd_d2,sum_d2,register_we_d2,data_we_d2,rs1_d2,rs2_d2,sum);
delay_input2 delay2(clock,reg_rs1_d1,multiply,alu_out,immediate_value_d1,opcode_d1,register_we_d1,data_we_d1,rd_d1,rs1_d1,rs2_d1,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,rd_d2,sum_d2,register_we_d2,data_we_d2,rs1_d2,rs2_d2,multiply_d2,sum);

data_path_compare_addr alu_alu_controlsignal (alu_alu_s1,alu_alu_s2,rd_d2,rs1_d1,rs2_d1);
data_memory dmem (DOut,reg_rs1_d2,alu_out_d2,data_we_d2,opcode_d2);

//delay_input3 delay3 (clock,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,register_we_d2,rd_d2,DOut,reg_rs1_d3,alu_out_d3,immediate_value_d3,opcode_d3,rd_d3,register_we_d3,DOut_d3);
//delay_input3 delay3 (clock,sum_d2,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,register_we_d2,rd_d2,DOut,reg_rs1_d3,alu_out_d3,immediate_value_d3,opcode_d3,rd_d3,register_we_d3,DOut_d3,sum_d3);
delay_input3 delay3 (clock,multiply_d2,sum_d2,reg_rs1_d2,alu_out_d2,immediate_value_d2,opcode_d2,register_we_d2,rd_d2,DOut,reg_rs1_d3,alu_out_d3,immediate_value_d3,opcode_d3,rd_d3,register_we_d3,DOut_d3,sum_d3,multiply_d3);

data_path_mem_bypass_alu bypass_alu (bypass_alu1,bypass_alu2,rs1_d1,rs2_d1,rd_d3);
data_path_compare_mem mem_alu (dmem_alu1,dmem_alu2,rs1_d1,rs2_d1,rd_d3);

//mux_output mux (din,reg_rs1_d3,alu_out_d3,immediate_value_d3,DOut_d3,opcode_d3);
mux_output mux (din,reg_rs1_d3,alu_out_d3,immediate_value_d3,DOut_d3,opcode_d3,sum_d3,multiply_d3);

//register_file_2 rfwite(reg_rs1,reg_rs2,rs1,rs2,rd_d3, rs1_data,rs2_data,din, reset,clock,register_we_d3);
 
//register_file rfwrite (reg_rs1,reg_rs2,rs1,rs2,rd_d3, rs1_data,rs2_data,din,reset,clock,register_we_d3);

endmodule
