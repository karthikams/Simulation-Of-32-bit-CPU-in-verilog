module mux1(mux1_out,opcode,reg_rs2,reg_rs1); //mux2 is the either reg_rs2 or immediate_value
output reg[31:0] mux1_out;
input [31:0] reg_rs2,reg_rs1;
input [5:0] opcode;

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
parameter ADDF = 6'b10111;
parameter MULF = 6'b11000;

always@(*)
begin
if(opcode ==  ADD || opcode == SUB || opcode == SGE || opcode == SLE || opcode == SGT ||opcode == SLT || opcode == SEQ || opcode == SNE || opcode == AND || opcode == OR
|| opcode == XOR || opcode == SLI || opcode == SRI ||  opcode == ADDI || opcode == SUBI || opcode == LOAD || opcode == NOT || opcode == ADDF || opcode == MULF) mux1_out <= reg_rs1;

else if ( opcode == STORE)  mux1_out<= reg_rs2;
end
endmodule


