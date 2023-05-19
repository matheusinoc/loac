// Matheus Inocêncio 119210532
parameter NBITS = 4;
module Registrador(
  input logic clk, reset, Din_serie, SEL, 
  input logic [NBITS-1:0] Din,
  output logic [NBITS-1:0] Dout
);
  
  always_ff @(posedge clk or posedge reset) begin
    if (reset == 1)
      Dout <= 0;
    else begin
      if (SEL == 0)
        Dout <= Din;
      else
        Dout <= {Dout, Din_serie};
    end
  end
endmodule