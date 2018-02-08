module branch_program(pc_add_imme,pc_delay,immediate_value_sign,opcode);

output reg [31:0] pc_add_imme;
input [31:0] pc_delay,immediate_value_sign;
input [5:0] opcode;


parameter JUMP = 6'b10101;
parameter BRA = 6'b10110;


always@(*)
begin
if(opcode == BRA) pc_add_imme <= pc_delay + immediate_value_sign;
if(opcode == JUMP) 
pc_add_imme <= immediate_value_sign;
end
endmodule


/*Issues

Need to add sign extension for immediate value. Problem in reg file. output(read) comes on 3rd cycle. As a result not able to compare with RSValue in the cycle itself. What can be done???
if comparison is sucessfull and opcode is BRA , only then braanch can be set to one.

should i change design of registerfile. Instead of creating an array and loading values everytime, should i create three individual reg_file for rs1,rs2 and rd and directly assign the values.
So output is not delayed

Or should i move the regfile just below pc, so load can be done in first cycle itself, whenever there is an rs1_value or rs2_value. then i can again integrate reg file below instruction register during read.
so output is not delayed.
*/