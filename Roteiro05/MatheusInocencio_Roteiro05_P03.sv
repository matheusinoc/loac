// Matheus Inocêncio 119210532
parameter NBITS = 1; //parâmetro 
module detector_paridade(
  input logic clk, reset, in_bit, // clock, reset e in_bit (entrada serial bit por bit)
  output logic [NBITS-1:0] Saida // saída
);
  
  enum logic [NBITS-1:0] {PAR, IMPAR} state; // estado (par ou ímpar)
  
  always_ff @ (posedge clk) begin
    if (reset)
      state <= PAR; // reseta o estado para par
    else
      unique case (state) // detector de paridade par
        PAR: // estado par
          if (in_bit == 0)
          	state <= PAR; // se o bit for 0 mantém o estado 
      	  else
          	state <= IMPAR; // se o bit for 1 altera o estado
        IMPAR: // estado ímpar
          if (in_bit == 0)
          	state <= IMPAR; // se o bit for 0 mantém o estado 
      	  else
          	state <= PAR; // se o bit for 1 altera o estado
      endcase
  end
  
  always_comb Saida <= (state == IMPAR); // se for par a saída é 0, se for ímpar é 1
  
endmodule