module delay_pc(pc_delay,addr_in,clock);
output reg[31:0] pc_delay;
input [31:0] addr_in;
input clock;


always@(posedge clock)
 pc_delay <= addr_in;
endmodule
