
module PISO_tb;
reg clk, reset;
reg[3:0] d_in;
reg load;
wire d_out;
PISO p1(clk,reset,load, d_in,d_out);

initial 
begin
$dumpfile("dumpPiso.vcd");
$dumpvars(0, PISO_tb);
clk=0;
reset=0;
d_in=4'b0000;
#20 reset=1;
#20 reset=0;
#60 d_in= 4'b1001; load = 1;
#10 load = 0;
#80 reset = 1;
#10 reset = 0; 
d_in= 4'b1010; load = 1;
#10 load = 0;
#80 reset = 1; 
#10 reset = 0; 
d_in= 4'b1111; load = 1;
#10 load = 0;

#60 $finish;
end
always #10 clk = ~clk;
endmodule 



