/* Roteiro 1 Problema 1
 * Matheus Inocêncio 119210532
 */
module circuit(
	input logic M, A1, A2, A3, //Entradas do programa
	output logic P //Saída
);
  
  /* P é uma saída que indica se a porta do elevador deve abrir. Ela abrirá quando o elevador
   * não estiver em movimento (M = 0) e um dos andares (A1, A2, A3) estiver 1.
   * Casos irrelevantes como ter mais de um andar no 1 ou então nenhum andar no 1 serão
   * desconsiderados.
   */
  always_comb P = ~M & (A1 | A2 | A3);
endmodule