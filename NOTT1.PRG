*****
** TELA DE OPCAO
** TELA DE DATA

SET COLOR TO (R/W,R/W)
        @ 06,30 PROMPT "1- A VISTA"
        @ 06,30 PROMPT "2- 5 DIAS "
        @ 06,30 PROMPT "3- 7 DIAS "
        @ 06,30 PROMPT "4- 10 DIAS"
        @ 06,30 PROMPT "5- 15 DIAS"
        @ 06,30 PROMPT "6- 20 DIAS"
        @ 06,30 PROMPT "7- 21 DIAS"
        @ 06,30 PROMPT "8- 28 DIAS"

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
