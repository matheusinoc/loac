// Matheus Inocencio 119210532

parameter NBITS = 4;
module roteamento(
  input logic [NBITS-1:0] A, B, C, D, //entradas de 4 bits
  input logic [1:0] SEL, //variável de seleção
  output logic [NBITS-1:0] Saida //a saída mostrará uma das entradas dependendo da seleção
);

/* Se SEL = 0 então saída = A;
 * Se SEL = 1 então saída = B;
 * Se SEL = 2 então saída = C;
 * Se SEL = 3 então saída = D;
 */
always_comb begin
  case(SEL)
	2'b00: Saida <= A;
	2'b01: Saida <= B;
  	2'b10: Saida <= C;
  	2'b11: Saida <= D;
  endcase
end
  
endmodule