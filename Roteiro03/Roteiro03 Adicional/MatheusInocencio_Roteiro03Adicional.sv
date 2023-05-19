// Matheus Inocencio 119210532
module comparador(
  input [7:0] A, B,
  output S
);
  
  always_comb begin
    S0 <= ~(A[0] ^ B[0]);
    S1 <= ~(A[1] ^ B[1]);
    S2 <= ~(A[2] ^ B[2]);
    S3 <= ~(A[3] ^ B[3]);
    S4 <= ~(A[4] ^ B[4]);
    S5 <= ~(A[5] ^ B[5]);
    S6 <= ~(A[6] ^ B[6]);
    S7 <= ~(A[7] ^ B[7]);
    
    S <= S0 & S1 & S2 & S3 & S4 & S5 & S6 & S7;
  end
  
endmodule