// Matheus Inocêncio 119210532

parameter NBITS = 4;
module roteamento(
  input logic [NBITS-1:0] A, B, //entradas de 4 bits
  input logic SEL, //seleciona uma entrada para ser mostrada na saída
  output logic [NBITS-1:0] Saida //mostrará o resultado
);

// Se SEL = false, então saída = A. Caso true, então saída = B.
always_comb begin
	if (SEL == 0)
		Saida <= A;
	else
		Saida <= B;
end
  
endmodule
