module invert (input wire i, output wire o);
   assign o = !i;
endmodule

module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

module mux2 (input wire i0, i1, j, output wire o);
  assign o = (j==0)?i0:i1;
endmodule

module df (input wire clk, in, output wire d_out);
  reg df_out;
  always@(posedge clk) df_out <= in;
  assign d_out = df_out;
endmodule

module dfr (input wire clk, reset, in, output wire d_out);
  wire reset_, df_in;
  invert invert_0 (reset, reset_);
  and2 and2_0 (in, reset_, df_in);
  df df_0 (clk, df_in, d_out);
endmodule



module PISO(input wire clk, reset, load, input wire[3:0] d_in, output wire d_out);

wire trms[6:0];

mux2 m0(1'b1, d_in[0], load, trms[0]);
dfr d0(clk,reset,trms[0],trms[1]);

mux2 m1(trms[1], d_in[1], load, trms[2]);
dfr d1(clk,reset,trms[2],trms[3]);

mux2 m2(trms[3], d_in[2], load, trms[4]);
dfr d2(clk,reset,trms[4],trms[5]);

mux2 m3(trms[5], d_in[3], load, trms[6]);
dfr d3(clk,reset,trms[6],d_out);
endmodule

