// Matheus Inocêncio 119210532

parameter NBITS = 8; //número de bits
module ULA(
  input logic signed [NBITS-1:0] A, B, //entradas
  input logic [1:0] F, //seletor de operações
  output logic signed [NBITS-1:0] Saida, //saída
  output logic FLAG_O //indica se houve um overflow/underflow
);
  
  always_comb begin
    case(F)
      2'b00: begin //and
        Saida <= A & B;
        FLAG_O <= 0;
      end
      2'b01: begin //or
        Saida <= A | B;
        FLAG_O <= 0;
      end
      2'b10: begin //adição
        Saida <= A + B;
        /*Se dois números positivos somados passarem de 127 ocorrerá um overflow e a 
        saída será negativa, pois Saida[7] será 1.
        Se dois números negativos somados passarem de -128 ocorrerá um underflow e a
        saída será positiva, pois Saida[7] será 0 porque o número 1 estará no
        "Saida[8]" e como Saida só tem 8 bits então esse 1 será descartado.*/
        FLAG_O <= (A > 0 && B > 0 && Saida < 0) || (A < 0 && B < 0 && Saida > 0);
      end
      2'b11: begin //subtração
        Saida <= A - B;
        /*Mesma lógica da adição, porém com a segunda entrada invertida, afinal, a
        subtração é uma adição com a segunda entrada negada. Se B é negativo será
        somado como positivo, caso seja positivo, será somado como um número negativo.
        */
        FLAG_O <= (A > 0 && B < 0 && Saida < 0) || (A < 0 && B > 0 && Saida > 0);
      end
    endcase
  end
  
endmodule