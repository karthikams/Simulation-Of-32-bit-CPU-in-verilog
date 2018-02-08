module program_counter(branch,jump,pc_add_imme,addr_in,reset,clock);

input clock,branch,jump,reset;
output [31:0] addr_in;
input [31:0] pc_add_imme;


reg[31:0] pc;

always@(posedge clock or reset)
begin
if(reset) 
begin
pc <= 32'b11111111111111111111111111111111;
end
else if(pc == 32'b0) pc = 32'b0; 
else if(branch) pc = pc_add_imme;
else if(jump) pc = pc_add_imme;
else pc = pc+1;
end
assign addr_in = pc;
endmodule
