*****
** TELA DE OPCAO
** TELA DE DATA

SET COLOR TO (W+/W,W+/N)
        @ 16,25 PROMPT " NA HORA"
        @ 16,25 PROMPT "  5 DIAS "
        @ 16,25 PROMPT "  7 DIAS "
        @ 16,25 PROMPT " 10 DIAS"
        @ 16,25 PROMPT " 15 DIAS"
        @ 16,25 PROMPT " 20 DIAS"
        @ 16,25 PROMPT " 21 DIAS"
        @ 16,25 PROMPT " 28 DIAS"

          MENU TO ACAO
          DO CASE
             CASE ACAO=1
                      lDIAS=0
             CASE ACAO=2
                      lDIAS=4
             CASE ACAO=3
                      lDIAS=6
             CASE ACAO=4
                      lDIAS=09
             CASE ACAO=5
                      lDIAS=14
             CASE ACAO=6
                     lDIAS=19
             CASE ACAO=7
                     lDIAS=20
             CASE ACAO=8
                     lDIAS=27
             ENDCASE
RESTORE SCREEN FROM ATEDATA
