module opcode_decoder(register_we,data_we,opcode,clock,reset);

output reg register_we,data_we;
input [5:0] opcode;
input clock,reset;

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


always@(opcode or reset)
begin
if(reset)
begin
register_we <=0;
data_we <= 0;
end
else if(opcode ==  ADD || opcode == SUB || opcode == SGE || opcode == SLE || opcode == SGT ||opcode == SLT || opcode == SEQ || opcode == SNE || opcode == AND || opcode == OR
|| opcode == XOR || opcode == SLI || opcode == SRI ||  opcode == ADDI || opcode == SUBI || opcode == MOVE || opcode == NOT || opcode == MOVEI )
begin
register_we = 1; 
data_we=0;
end

else if (opcode == STORE)  
begin
data_we=1;
register_we = 0;
end
else if (opcode == LOAD)   
data_we=0;
register_we = 1;
end

endmodule