module data_path_mux1(data_path_out1,alu_alu_s1,bypass_alu1,dmem_alu1,mux1_out,alu_out_d2,alu_out_d3,DOut_d3);

output reg[31:0] data_path_out1;
input[31:0] mux1_out, alu_out_d2,alu_out_d3,DOut_d3;
input alu_alu_s1,bypass_alu1,dmem_alu1;




always@(*)
begin

if (dmem_alu1) data_path_out1 <= DOut_d3;
else if(bypass_alu1) data_path_out1<= alu_out_d3;
else if(alu_alu_s1) data_path_out1 <= alu_out_d2;
else data_path_out1 <= mux1_out;

end
endmodule

