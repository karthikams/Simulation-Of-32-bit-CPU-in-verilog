module sign_extension(opcode,immediate_value,rs_value,immediate_jump,immediate_value_sign,rs_value_sign);

input [15:0] immediate_value;
input [4:0] rs_value;
input[25:0] immediate_jump;
output reg[31:0] immediate_value_sign;
output reg [31:0] rs_value_sign;
input [5:0] opcode;

parameter BRA = 6'b10110;
parameter JUMP = 6'b10101;

always@*
begin

case(opcode)
BRA: 
begin
if(rs_value[4] == 1'b1) immediate_value_sign <= {27'b111111111111111111111111111,rs_value} ;
else if(rs_value[4] == 1'b0)  rs_value_sign <= {27'b0,rs_value};  

if(immediate_value[15] == 1) immediate_value_sign <= {16'b1111111111111111,immediate_value};
else if(immediate_value[15]==0) immediate_value_sign <= {16'b0,immediate_value};  
 

end

JUMP:
begin
if(immediate_jump[25] == 1) immediate_value_sign <= {6'b111111,immediate_jump};
else if(immediate_jump[25]==0) immediate_value_sign <= {6'b0,immediate_jump};  
end

default:
begin
if(immediate_value[15] == 1) immediate_value_sign <= {16'b1111111111111111,immediate_value};
else if(immediate_value[15]==0) immediate_value_sign <= {16'b0,immediate_value};  
end

endcase

end

endmodule
