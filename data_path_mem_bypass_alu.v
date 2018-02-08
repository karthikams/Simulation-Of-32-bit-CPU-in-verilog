module data_path_mem_bypass_alu(bypass_alu1,bypass_alu2,rs1_d1,rs2_d1,rd_d3);
output bypass_alu1,bypass_alu2;
input [4:0] rs1_d1,rs2_d1,rd_d3;

reg bypass1,bypass2;

always@(*)
begin
if(rs1_d1 == rd_d3) bypass1<=1;
else bypass1 = 0;

if(rs2_d1 == rd_d3) bypass2 <= 1;
else bypass2 = 0;

end
assign bypass_alu1 = bypass1;
assign bypass_alu2 = bypass2;
endmodule

