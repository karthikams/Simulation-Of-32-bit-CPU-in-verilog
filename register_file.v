module register_file(reg_rs1,reg_rs2,rs1,rs2,rd, rs1_data,rs2_data,din,clock,we);
output reg [31:0] reg_rs1;
output reg [31:0] reg_rs2;
input[4:0]  rs1;
input[4:0]  rs2;
input[4:0]  rd;
input [31:0] din;  // data to be written in rd after ALU opertaion.
input [31:0] rs1_data, rs2_data; // data stored in registers rs1 and rs2. Doubt whether this should be given as input or given a default value in this module itself
input clock,we; // Put the write enable signal to write the output of load or add opertaions in the register file. Dependent on opcode

reg [31:0] reg_file[5:0];   //creating 32 bit register file with 32 registers. Doubt is it okay to create 3 seperate registers insead of this. So its easy to read and write 
integer i;
//Storing the values in registers
initial
begin
for (i =0 ; i<6 ;i=i+1) reg_file[i] <= 32'b0;
end

//loading data
always@(rs1 or rs2 or rs1_data or rs2_data)
begin
 reg_file[rs1] <= rs1_data;
 reg_file[rs2] <= rs2_data;
end

always@(*)
begin
	reg_rs1 = reg_file[rs1];
	reg_rs2 = reg_file[rs2];
  end

//Write operation or read
always@(*)
begin
 if(we) 
 reg_file[rd] <= din;  
end

  
endmodule

