module data_memory(DOut,reg_rs1_d2,alu_out_d2,data_we_d2,opcode_d2);
output reg[31:0] DOut;
input[31:0] reg_rs1_d2,alu_out_d2;
input data_we_d2;
input [ 5:0] opcode_d2;


reg [31:0] dmem [10:0];
integer i;

parameter LOAD= 6'b100;

initial
begin
for (i =0 ; i<11 ;i=i+1) dmem[i] =32'b0; 
dmem[1] = 32'b100;
end

//reading and writing
always@(*)
begin
if(data_we_d2) dmem[alu_out_d2] <= reg_rs1_d2;
else if(opcode_d2 == LOAD) DOut <= dmem[alu_out_d2];
end

endmodule
