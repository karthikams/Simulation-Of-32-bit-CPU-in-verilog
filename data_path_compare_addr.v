module data_path_compare_addr(alu_alu_s1,alu_alu_s2,rd_d1,rs1,rs2);
input [4:0] rd_d1,rs1,rs2;
output alu_alu_s2,alu_alu_s1;
reg compare_rs1,compare_rs2;

always@(*)
begin
if(rd_d1 == rs1) compare_rs1 = 1 ;
else compare_rs1 = 0;

if(rd_d1 == rs2) compare_rs2 =1;
else compare_rs2 = 0;
end

assign alu_alu_s1 = compare_rs1;
assign alu_alu_s2 = compare_rs2;
endmodule

