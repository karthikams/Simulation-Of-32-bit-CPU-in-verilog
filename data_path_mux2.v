module data_path_mux2(data_path_out2,alu_alu_s2,bypass_alu2,dmem_alu2,mux2_out,alu_out_d2,alu_out_d3,DOut_d3);
output reg[31:0] data_path_out2;
input [31:0] mux2_out, alu_out_d2,alu_out_d3,DOut_d3;
input alu_alu_s2,bypass_alu2,dmem_alu2;

always@(*)
begin

if(alu_alu_s2) data_path_out2 <= alu_out_d2;
else if(bypass_alu2) data_path_out2 <= alu_out_d3;
else if(dmem_alu2) data_path_out2 <= DOut_d3;
else data_path_out2 <= mux2_out;

end
endmodule

