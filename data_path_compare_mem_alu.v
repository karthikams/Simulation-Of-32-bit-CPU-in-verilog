module data_path_compare_mem(dmem_alu1,dmem_alu2,rs1_d1,rs2_d1,rd_d3);
output  dmem_alu1,dmem_alu2;
input [4:0] rs1_d1,rs2_d1,rd_d3;

reg compare1,compare2;

always@(*)
begin
if(rd_d3 == rs1_d1) compare1<=1;
else compare1<=0;

if(rd_d3 == rs2_d1) compare2<=1;
else compare2 <=0; 
end

assign dmem_alu1 = compare1;
assign dmem_alu2 = compare2;

endmodule
