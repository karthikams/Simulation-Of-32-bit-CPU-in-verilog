module instruction_register(opcode,rs1,rs2,rd,immediate_value,immediate_jump,rs_value,data_out,clock);

output reg[5:0]opcode;
output reg[4:0]rs1;
output reg[4:0]rs2;
output reg[4:0]rd;
output reg[15:0]immediate_value;
output reg[25:0]immediate_jump;
output reg[4:0] rs_value;
input [31:0] data_out;
input clock;

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

always@(posedge clock)
begin
   
    opcode = data_out[31:26];

    if(opcode ==  ADD || opcode == SUB || opcode == SGE || opcode == SLE || opcode == SGT ||opcode == SLT || opcode == SEQ || 
        opcode == SNE || opcode == AND || opcode == OR || opcode == XOR ) 
    begin
    rs1 <= data_out[25:21];
    rs2 <= data_out[20:16];
    rd <= data_out[15:11];
    end
   
    else if(opcode == SLI || opcode == SRI ||  opcode == ADDI || opcode == SUBI || opcode == LOAD)
    begin
    immediate_value = data_out[15:0];
    rd  = data_out[20:16];
    rs1 = data_out[25:21];
    rs2 = 5'b11101;
    end

    else if(opcode == MOVE || opcode == NOT)
    begin
    rd = data_out[20:16];
    rs1 = data_out[25:21];
    end

    else if(opcode == MOVEI )
    begin
    rd = data_out[20:16];
    immediate_value = data_out[15:0];
    end
    
    else if(opcode == JUMP )
    begin
    immediate_jump = data_out[25:0];
    end

    else if(opcode == BRA )
    begin
    rs1 = data_out[25:21];
    rs_value = data_out[20:16];
    immediate_value = data_out[15:0];
    end  
    
 else if ( opcode == STORE )
 begin
 rs2  = data_out[20:16];
 rs1 <= data_out[25:21];
 rd <=  5'b11110;
 immediate_value = data_out[15:0];
 end


    else if(opcode == NOP) 
    begin  
    rs1 <= 5'b10011;
    rs2 <= 5'b11001;
    rd <=  5'b11011;
    end

    else if (opcode == ADDF)
    begin
    rs1 <= data_out[25:21];
    rs2 <= data_out[20:16];
    rd <= data_out[15:11];
    end

    else if (opcode == MULF)
    begin
    rs1 <= data_out[25:21];
    rs2 <= data_out[20:16];
    rd <= data_out[15:11];
    end
end

endmodule
