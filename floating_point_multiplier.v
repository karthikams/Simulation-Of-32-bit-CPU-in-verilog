module floating_point_multiplier(multiply,floating_num1,floating_num2,opcode_d1);
input [31:0] floating_num1,floating_num2;
input [5:0] opcode_d1;
output [31:0] multiply;


reg sign1,sign2,sign_final;
reg[7:0] exp_num1,exp_num2,biased,rexp_num1,rexp_num2,rexp_final,exp_final,r;
reg[22:0] fraction_num1,fraction_num2,fraction_final;
reg [23:0] frac1,frac2;
reg [45:0] fraction;
reg [47:0] fraction_temp;
reg [31:0] result;
reg[1:0] temp;
integer count;
parameter MULF = 6'b11000;

initial 
begin
biased = 8'b1111111;
count = 0;
end


always@(opcode_d1)
begin
if(opcode_d1 == MULF)
begin
//Assigning the sign, exponent and fraction portion of floating_num1
#1;
sign1 =   floating_num1[31];
//sign1 = 1'b0;
exp_num1 = floating_num1[30:23];
fraction_num1 = floating_num1[22:0];


sign2 = floating_num2[31];
exp_num2 = floating_num2[30:23];
fraction_num2 = floating_num2[22:0];

//Sign final
sign_final = sign1 ^ sign2;

//rexp final
rexp_num1 = exp_num1 - biased;
rexp_num2 = exp_num2 - biased;
r = rexp_num1 + rexp_num2;

frac1 = {1'b1,fraction_num1};
frac2 = {1'b1,fraction_num2};
fraction_temp = (frac1*frac2) ;

temp = fraction_temp[47:46];

//Output should only be in the form of 1.0001
if(temp == 10) 
begin
count = count+1;
fraction = fraction_temp[46:1];
end
else if (temp == 11)
begin
count = count+1;
 fraction= fraction_temp[46:1];
end
else if (temp == 01) 
begin
fraction_temp = fraction_temp << 1;
fraction = fraction_temp[46:1];
end
else if(temp == 00)
begin
if(fraction_temp != 0)
begin
	while(fraction_temp[47] == 0)
	begin
	fraction_temp = fraction_temp << 1 ;
	count  = count-1 ;
	end
	fraction = fraction_temp[46:1];
end
end

/*//Normalizing
if(fraction_final != 0)
begin
	while(fraction_final[47] == 0)
	begin
	fraction_final = fraction_final << 1 ;
	count  = count +1 ;
	end
end*/

rexp_final = r + count;
if((rexp_final < 0) | (rexp_final > 8'b11111111)) $stop;
exp_final = rexp_final + biased;
fraction_final = fraction[45:23];

result = {sign_final,exp_final,fraction_final};

end
end
assign multiply = result;
endmodule
