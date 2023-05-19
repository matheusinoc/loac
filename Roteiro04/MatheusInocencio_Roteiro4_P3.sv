// Matheus Inocêncio 119210532
module ramrom(
  input logic [1:0] Addr,
  output logic [3:0] Dout
);
  
  always_comb begin
    case (Addr)
      0: Dout = 'b0100;
      1: Dout = 'b1100;
      2: Dout = 'b0110;
      3: Dout = 'b0111;
    endcase
  end
  
endmodule