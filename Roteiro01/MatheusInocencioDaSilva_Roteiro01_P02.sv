/* Roteiro 1 Problema 2
 * Matheus Inocêncio 119210532
 */

parameter NBITS = 8;
module soma_8bits(
  input signed [NBITS-1:0] A, B, //As entradas que vão ser somadas
  output logic signed [NBITS-1:0] S, //A saída que vai mostrar o resultado da soma
  output logic Z, N, P
);
  
  always_comb begin
    S <= A + B; //Resultado
    Z <= (S == 0); //Verifica se o resultado é 0
    N <= S[NBITS-1]; //Verifica se é um número negativo vendo o bit mais significativo
    P <= ~(S[0]); //Verifica se o número é par vendo o bit menos significativo
  end
        
endmodule