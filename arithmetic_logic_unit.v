module arithmetic_logic_unit(alu_out,reg_rs1,reg_rs2,opcode);
output reg[31:0] alu_out;
input [31:0] reg_rs1,reg_rs2;
input [5:0] opcode;

parameter NOP = 6'b0;
parameter ADD = 6'b1;
parameter SUB = 6'b10;
parameter STORE = 6'b11;
parameter LOAD= 6'b100;
parameter MOVE = 6'b101;
parameter SGE = 6'b110;
parameter SLE = 6'b111;
parameter SGT = 6'b1000;
parameter SLT = 6'b1001;
parameter SEQ = 6'b1010;
parameter SNE = 6'b1011;
parameter AND = 6'b1100;
parameter OR = 6'b1101;
parameter XOR= 6'b1110;
parameter NOT = 6'b1111;
parameter MOVEI = 6'b10000;
parameter SLI = 6'b10001;
parameter SRI = 6'b10010;
parameter ADDI = 6'b10011;
parameter SUBI = 6'b10100;
parameter JUMP = 6'b10101;
parameter BRA = 6'b10110;
parameter ADDF = 6'b10111;
parameter MULF = 6'b 11000;

always@*
begin 

case(opcode)

ADD : alu_out <= reg_rs1 + reg_rs2;
SUB : alu_out <= reg_rs1 - reg_rs2;
SGE : alu_out <= reg_rs1 >= reg_rs2;
SLE : alu_out <= reg_rs1 <= reg_rs2;
SGT : alu_out <= reg_rs1 > reg_rs2;
SLT : alu_out <= reg_rs1 < reg_rs2;
SEQ : alu_out <= reg_rs1 == reg_rs2;
SNE : alu_out <= reg_rs1 != reg_rs2; 
AND : 
begin
if(reg_rs1 == reg_rs2) alu_out<= 1;
else alu_out <= 0;
end

OR :
begin
if(reg_rs1 != reg_rs2) alu_out <= 0;
else alu_out <= 1;
end 
/*AND : alu_out <= reg_rs1 && reg_rs2;
OR  : alu_out <= reg_rs1 || reg_rs2;
XOR : alu_out <= reg_rs1 ^ reg_rs2;*/

XOR : alu_out <= reg_rs1^ reg_rs2;

NOT : alu_out <= ~reg_rs1;
SLI : alu_out <= reg_rs1 << reg_rs2;
SRI : alu_out <= reg_rs1 >> reg_rs2;
ADDI: alu_out <= reg_rs1 + reg_rs2;
SUBI: alu_out <= reg_rs1 - reg_rs2;
LOAD: alu_out <= reg_rs1 + reg_rs2;
STORE: alu_out <= reg_rs1 + reg_rs2;
NOP : ;
BRA : ;
JUMP: ;
default : alu_out <= 1111111;
endcase
end
endmodule
