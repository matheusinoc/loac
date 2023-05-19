// Matheus Inocêncio 119210532

module irrigacao (
  input logic [1:0] U, //entrada de 2 bits
  output [1:0] Saida, //saída de 2 bits
  output logic A, B, C, D, E, F, G //simula um led de 7 segmentos (atividade extra)
);

always_comb  Saida <= U; //o resultado da saída é o valor da entrada
  
//atividade extra  
always_comb begin
  case(U)
    // caso 00. led apagado.
    2'b00: begin
      	A <= 0;
        B <= 0;
        C <= 0;
        D <= 0;
		E <= 0;
      	F <= 0;
      	G <= 0;
    end
    //caso 01. led mostrando 0.
    2'b01: begin
      	A <= 1;
		B <= 1;
        C <= 1;
        D <= 1;
        E <= 1;
        F <= 1;
        G <= 0;
    end
    // caso 10. led mostrando 1.
    2'b10: begin 
      	A <= 0;
      	B <= 1;
        C <= 1;
        D <= 0;
        E <= 0;
        F <= 0;
        G <= 0;
    end
    // caso 11. led mostrando 2.
    2'b11: begin 
      	A <= 1;
        B <= 1;
        C <= 0;
        D <= 1;
        E <= 1;
        F <= 0;
        G <= 1;
    end
  endcase
end
  
endmodule
