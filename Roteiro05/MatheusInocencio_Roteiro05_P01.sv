// Matheus Inocêncio 119210532
parameter NBITS = 4; //parâmetro 
module contador(
  input logic clk, reset, count_up, //clock, reset e count_up 1 = crescente; 0 = decrescente
  output logic [NBITS-1:0] Saida //Saída
);
  
  always_ff @ (posedge reset or posedge clk) begin
    if (reset) // Reseta a saída para o valor 0
      Saida <= 0;
    else begin // Contador
      if (count_up)
        Saida <= Saida + 1; // Se for crescente aumenta o valor da saída em 1
      else
        Saida <= Saida - 1; // Se for decrescente diminui o valor da saída em 1
    end
  end
  
endmodule