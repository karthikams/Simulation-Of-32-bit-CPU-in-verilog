module floating_point_adder(sum ,number1,number2,opcode_d1);

input [31:0] number1,number2;
input [5:0] opcode_d1;
output reg[31:0] sum ;

reg  s1,s2,s3;   
reg[7:0] exp1,exp2,exp3,diff,exp;
reg[23:0]  frac1,frac2,fracS,fracA,fracB,fracC,fracD,frac,fracN,count;
reg[22:0] frac3;
reg sign;

parameter ADDF = 6'b10111;


initial
begin
count <= 24'b0;
end

always @(opcode_d1)
begin
	if(opcode_d1 == ADDF)
	begin
#2;
	s1 =  number1[31];
	exp1 = number1[30:23];
	
	//frac1 = 22'b111;
	frac1 = {1'b1,number1[22:0]};

	s2 = number2[31];
	exp2 = number2[30:23];
	frac2 = {1'b1,number2[22:0]};
	
	diff = #1 (exp1-exp2);

	if(diff > 0)        sign = 0;
	else if (diff < 0)  sign = 1;
		

	if(sign == 0) exp = exp1;
	else if(sign ==1 )exp = exp2;


	if(sign == 0 ) fracB = frac1;
	else fracB = frac2;


	case (sign)

	1 :  fracS = frac1;
	0 :  fracS = frac2;
	endcase
	
	fracA = fracS >> diff;

	if (sign == 0)
	begin
	if(s2 == 1)  fracC = ~fracA + 24'b1;
	else fracC = fracA;
	if (s1 == 1) fracD = ~fracB + 24'b1;
	else fracD = fracB;
	end

	else if (sign == 1)
	begin
	if(s1 == 1)  fracC = ~fracA + 24'b1;
	else fracC = fracA;

	if (s2 == 1) fracD = ~fracB +24'b1;
	else fracD = fracB;
	end	
	frac = (fracC + fracD);

	fracN = frac;

	if(fracN != 0)
	begin
	while(fracN[23] == 0)
	begin
	fracN = fracN << 1 ;
	count  = count +1 ;
	end
	end

	exp3 = exp - count;

	if( exp3 < 8'b0 | exp3 > 8'b11111111)
	$stop;

	s3 = frac[23];
	frac3  = fracN[22:0];

	sum = {s3,exp3,frac3}; 
	end
end
endmodule




