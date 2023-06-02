//Matheus Inocêncio 119210532
parameter NBITS = 2; //parâmetro 
module detector_sequencia(
  // clock, reset e lampadas
  input logic clk, reset, Lampada1, Lampada2, Lampada3,
  // alarme que será acionado caso a lâmpadas sejam acesas na ordem 1-2-3
  output logic Alarme
);
  
  /**
  Estados que o programa possui.
  RESET_STATE: Ordem zerada.
  LAMP1: Lampada1 está acesa. Inicia a ordem em 1.
  LAMP2: Lampada2 está acesa após lampada1 no estado anterior. Continua ordem em 2.
  LAMP3: Lampada3 está acesa após lampada2 no estado anterior. Ordem Completa. Alarme ativo.
  */
  enum logic [NBITS-1:0] {RESET_STATE, LAMP1, LAMP2, LAMP3} state;
  
  always_ff @ (posedge clk) begin
    if (reset)
      state <= RESET_STATE; // reseta o estado 
    else
      unique case (state) // detector de sequência
       	RESET_STATE: // estado sem sequência detectada
          if (Lampada1)
          	state <= LAMP1; // sequência iniciada em 1
      	  else
          	state <= RESET_STATE; // nenhuma sequência detectada
        LAMP1: // estado com sequência detectada em 1
          if (Lampada2)
          	state <= LAMP2; // continua sequência em 2
          else if (Lampada1)
            state <= LAMP1; // desfaz atual sequência e inicia uma nova em 1
      	  else
          	state <= RESET_STATE; // desfaz atual sequência
        LAMP2: // estado com sequência detectada em 1-2
          if (Lampada3)
          	state <= LAMP3; // continua sequência em 3
          else if (Lampada1)
            state <= LAMP1; // desfaz atual sequência e inicia uma nova em 1
      	  else
          	state <= RESET_STATE; // desfaz atual sequência
        LAMP3: // estado com sequência 1-2-3 completamente detectada
          if (Lampada1)
          	state <= LAMP1; // desfaz atual sequência e inicia uma nova em 1
      	  else
          	state <= RESET_STATE; // desfaz atual sequência
      endcase
  end
  
  always_comb Alarme <= (state == LAMP3); // ativado quando a sequência 1-2-3 é detectada
  
endmodule