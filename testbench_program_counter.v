module testbench_program_counter();

wire [31:0] din;
reg clock,reset;
reg[31:0] rs1_data,rs2_data;
//program_counter pc (addrin,clock);

cpu_module cpu (din,clock, reset,rs1_data,rs2_data);

initial
begin
clock = 0;
forever  #5 clock = ~ clock;
end

initial
begin
reset = 1;
#5 reset = 0;
end


initial
begin

#15 rs1_data=32'b10111110100000000000000000000000;

    rs2_data=32'b10111110011100000000000000000000;
//#5 rs1_data = 32'b101; rs2_data = 32'b110;
//#15 rs1_data=32'b00111111000000000000000000000000;rs2_data=32'b10111110111000000000000000000000;
/*#10 rs1_data = 32'b100;
#10 rs1_data = 32'b111; rs2_data = 32'b110;
#10 rs1_data = 32'b1; rs2_data = 32'b11;
#10 rs1_data = 32'b10; rs2_data = 32'b0;
//#10 rs1_data = 32'b11; rs2_data = 32'b1;*/

end

endmodule
