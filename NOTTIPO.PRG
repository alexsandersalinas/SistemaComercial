***** CRIADO: 03/10/2001
***** ALTERA€ÇO: 05/10/2001

*****
ACAO = 0


SET COLOR TO (W/R,W/R)
        @ 03,01 PROMPT "FATURAMENTO DE NOTA: SAIDA                  "
        @ 03,01 PROMPT "FATURAMENTO DE NOTA: ENTRADA                "

          MENU TO ACAO
          DO CASE
             CASE ACAO=1
                     lTIPOFATURA=1
             CASE ACAO=2
                     lTIPOFATURA=2
           ENDCASE

RESTORE SCREEN FROM TIPOFATURAMENTO

