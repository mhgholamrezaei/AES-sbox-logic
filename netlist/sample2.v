
module sbox (input [0:0] x, output [0:0] z );
  wire n0, n1;
  GTECH_NOT U1485 ( .A(n1), .Z(z[0]) );

  GTECH_NOT U1484 ( .A(n0), .Z(n1));
  GTECH_NOT U1483 ( .A(x[0]), .Z(n0) ); 
endmodule
