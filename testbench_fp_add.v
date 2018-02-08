module testbench_fp_add();

reg [31:0] floating_num1,floating_num2;
reg[5:0] opcode_d1;
wire [31:0] mulf1,mulf2 ;
///reg [31:0] number1,number2;
//wire sum;

//floating_point_adder fa ( sum ,number1,number2);
floating_point_multiplier fm (multiply,floating_num1,floating_num2,opcode_d1);

initial

begin

opcode_d1 = 6'b11000;
floating_num1=32'b11111101000000000000000000000000;
floating_num2=32'b11111100111000000000000000000000;


end

endmodule
