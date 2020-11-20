module PIPO_tb;
reg clk, reset;
reg[3:0] d_in;
wire[3:0] d_out;
PIPO p1(clk,reset,d_in,d_out);

initial 
begin
$dumpfile("dump.vcd");
$dumpvars(0, PIPO_tb);
clk=0;
reset=0;
d_in=4'b0000;
#20 reset=1;
#20 reset=0;
#60 d_in= 4'b1001;
#60 d_in= 4'b1010;
#60 d_in= 4'b1111;

#60 $finish;
end
always #10 clk = ~clk;
endmodule 



