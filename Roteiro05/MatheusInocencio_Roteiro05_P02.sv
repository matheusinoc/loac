// Matheus Inocêncio 119210532
parameter NBITS = 4; //parâmetro 
module contador(
  input logic clk, reset, load, // clock, reset e load
  input logic [NBITS-1:0] Data_in, // entrada paralela
  output logic [NBITS-1:0] Saida // saída
);
  
  always_ff @ (posedge clk) begin
    if (reset) // reseta a saída para o valor 0
      Saida <= 0;
    else if (load) // define a saída para o valor da entrada paralela
      Saida <= Data_in;
    else // contador em anel
      if (Saida[NBITS-1])
        Saida <= 1; // se o valor binário da saída for 1000 a saída será definida para 0001
      else
        Saida <= Saida << 1; // empurra o bit 1 para a esquerda
  end
  
endmodule