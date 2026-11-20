/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP1
// Date      : Wed Nov 11 17:35:40 2026
/////////////////////////////////////////////////////////////


module ex1 ( A, B, S, C );
  input A, B;
  output S, C;
  wire   N0, n3;
  assign C = N0;

  AND_GATE U4 ( .I1(A), .I2(B), .O(N0) );
  NOR_GATE U5 ( .I1(A), .I2(B), .O(n3) );
  NOR_GATE U6 ( .I1(N0), .I2(n3), .O(S) );
endmodule

