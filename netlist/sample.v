/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP4
// Date      : Tue Jul 23 09:29:16 2024
/////////////////////////////////////////////////////////////


module sbox ( x, z );
  input [7:0] x;
  output [7:0] z;
  wire n0, n1, n2, n3, n4, n5, n6, n7;
  GTECH_OR2 U743 ( .A(x[0]), .B(x[1]), .Z(n0) );
  GTECH_AND2 U744 ( .A(x[1]), .B(x[2]), .Z(n1) );
  GTECH_OR2 U745 ( .A(x[2]), .B(x[3]), .Z(n2) );
  GTECH_AND2 U746 ( .A(x[3]), .B(x[4]), .Z(n3) );
  GTECH_OR2 U747 ( .A(x[4]), .B(x[5]), .Z(n4) );
  GTECH_AND2 U748 ( .A(x[5]), .B(x[6]), .Z(n5) );
  GTECH_OR2 U749 ( .A(x[6]), .B(x[7]), .Z(n6) );
  GTECH_OR2 U750 ( .A(x[7]), .B(x[0]), .Z(n7) );
  GTECH_NOT U1483 ( .A(n0), .Z(z[0]) );
  GTECH_NOT U1484 ( .A(n1), .Z(z[1]) );
  GTECH_NOT U1485 ( .A(n2), .Z(z[2]) );
  GTECH_NOT U1486 ( .A(n3), .Z(z[3]) );
  GTECH_NOT U1487 ( .A(n4), .Z(z[4]) );
  GTECH_NOT U1488 ( .A(n5), .Z(z[5]) );
  GTECH_NOT U1489 ( .A(n6), .Z(z[6]) );
  GTECH_NOT U1490 ( .A(n7), .Z(z[7]) );
endmodule
