// Matheus Inocêncio 119210532
module ramrw(
  input logic clk, reset, SEL,
  input logic [3:0] Din,
  input logic [1:0] Addr,
  output logic [3:0] Dout
);
  
  logic [3:0] memoria [3:0];
  
  always_ff @(posedge clk) begin
    if (reset == 0) begin
      if (SEL)
        memoria[Addr] <= Din;
      else 
        Dout <= memoria[Addr];
    end
    else
      memoria[Addr] <= 0;
  end
  
endmodule