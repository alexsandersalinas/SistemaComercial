        
        SET COLOR TO (N/BG,R/W)
        
        @ 06,15 PROMPT "01-VENDA                   "
        @ 06,15 PROMPT "02-VENDA                   "
        @ 06,15 PROMPT "03-DEVOLU��O DE MERCADORIA "
        @ 06,15 PROMPT "04-DEVOLU��O DE MERCADORIA "
        @ 06,15 PROMPT "05-REMESSA PARA CONSERTO   " 
        @ 06,15 PROMPT "06-REMESSA PARA CONSERTO   " 
        @ 06,15 PROMPT "07-DEVOLU��O DE CONSERTO   "
        @ 06,15 PROMPT "08-DEVOLU��O DE CONSERTO   "
        @ 06,15 PROMPT "09-DEVOLU��O DE TROCA      "
        @ 06,15 PROMPT "10-DEVOLU��O DE TROCA      "
        @ 06,15 PROMPT "11-LIC. USO SOFTWARE       " 
        @ 06,15 PROMPT "12-LIC. USO SOFTWARE       "
        @ 06,15 PROMPT "13-LIC. USO SOFTWARE MOLP  "
        @ 06,15 PROMPT "14-LIC. USO SOFTWARE MOLP  "
        @ 06,15 PROMPT "15-DEVOLU��O DE SOFTWARE   "
        @ 06,15 PROMPT "16-DEVOLU��O DE SOFTWARE   "
        @ 06,15 PROMPT "17-PRESTA��O DE SERVI�O    "
        @ 06,15 PROMPT "18-PRESTA��O DE SERVI�O    "
        @ 06,15 PROMPT "19-REMESSA PARA LOCA��O    "
        @ 06,15 PROMPT "20-REMESSA PARA LOCA��O    "
        @ 06,15 PROMPT "21-DEVOLU��O DE LOCA��O    "
        @ 06,15 PROMPT "22-DEVOLU��O DE LOCA��O    "
        @ 06,15 PROMPT "23-REMESSA PARA DEMOSTRA��O"
        @ 06,15 PROMPT "24-REMESSA PARA DEMOSTRA��O"
        @ 06,15 PROMPT "25-DEVOLU��O DE DEMOSTRA��O"
        @ 06,15 PROMPT "26-DEVOLU��O DE DEMOSTRA��O"
        @ 06,15 PROMPT "27-SIMPLES REMESSA         "
        @ 06,15 PROMPT "28-SIMPLES REMESSA         " 
        @ 06,15 PROMPT "29-NOTA FISCAL COMPLEMENTAR" 
        @ 06,15 PROMPT "30-NOTA FISCAL COMPLEMENTAR"
        @ 06,15 PROMPT "31-BRINDE                  "
        @ 06,15 PROMPT "32-BRINDE                  "
        MENU TO ACAO
          DO CASE
             CASE ACAO=1
                      lOPERACAO="VENDA"
                      lCFOP="5.12"
             CASE ACAO=2
                      lOPERACAO="VENDA FORA DO ESTADO"
                      lCFOP="6.12"
             CASE ACAO=3
                      lOPERACAO="DEVOLU��O DE MERCADORIA"
                      lCFOP="5.32"
             CASE ACAO=4
                     lOPERACAO="DEVOLU��O DE MERCADORIA F/ESTADO" 
                     lCFOP="6.12"
             CASE ACAO=5
                     lOPERACAO="REMESSA PARA CONSERTO"
                     lCFOP="5.99"
             CASE ACAO=6
                     lOPERACAO="REMESSA PARA CONSERTO F/ESTADO"
                     lCFOP="6.12"
             CASE ACAO=7
                     lOPERACAO="DEVOLU��O DE CONSERTO"
                     lCFOP="5.99"
             CASE ACAO=8
                     lOPERACAO="DEVOLU��O DE CONSERTO F/ESTADO"
                     lCFOP="6.12"
             CASE ACAO=9
                     lOPERACAO="DEVOLU��O DE TROCA"
                     lCFOP="5.99"
             CASE ACAO=10
                     lOPERACAO="DEVOLU��O DE TROCA F/ESTADO"
                     lCFOP="6.12"
             CASE ACAO=11
                     lvariavelDIF="NORMAL"
                     lOPERACAO="LIC. USO SOFTWARE"
                     lCFOP="5.99"
             CASE ACAO=12
                     lvariavelDIF="NORMAL"
                     lOPERACAO="LIC.USO SOFTWARES F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=13
                     lvariavelDIF="MOLP"
                     lOPERACAO="LIC. USO SOFTWARE "
                     lCFOP="5.99"
             CASE ACAO=14
                     lvariavelDIF="MOLP"
                     lOPERACAO="LIC.USO SOFTWARES F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=15
                    lOPERACAO="DEVOLU��O DE SOFTWARE"
                    lCFOP="5.99"
             CASE ACAO=16
                    lOPERACAO="DEVOLU��O DE SOFTWARE F/ESTADO"
                    lCFOP="6.12"
             CASE ACAO=17
                     lOPERACAO="PRESTA��O DE SERVI�O"
                     lCFOP="5.99"
             CASE ACAO=18
                     lOPERACAO="PRESTA��O DE SERVI�O F/ESTADO"
                     lCFOP="6.12"
             CASE ACAO=19
                     lOPERACAO="REMESSA PARA LOCA��O"
                     lCFOP="5.99"
             CASE ACAO=20
                     lOPERACAO="REMESSA PARA LOCA��O F/ESTADO"
                     lCFOP="6.12"
             CASE ACAO=21
                     lOPERACAO="DEVOLU��O DE LOCA��O"
                     lCFOP="5.99"
             CASE ACAO=22
                     lPERACAO="DEVOLU��O DE LOCA��O F/ESTADO"
                     lCFOP="6.12"
             CASE ACAO=23
                     lOPERACAO="REMESSA PARA DEMONSTRA��O"
                     lCFOP="5.99"
             CASE ACAO=24
                     lOPERACAO="REMESSA PARA DEMONSTRA��O F/ESTADO"
                     lCFOP="6.12"
             CASE ACAO=25
                     lOPERACAO="DEVOLU��O DE DEMONSTRA��O"
                     lCFOP="5.99"
             CASE ACAO=26
                     lOPERACAO="DEVOLU��O DE DEMONSTRA��O F/ESTADO"
                     lCFOP="6.12"
             CASE ACAO=27
                     lOPERACAO="SIMPLES REMESSA"
                     lCFOP="5.99"
            CASE ACAO=28
                     lOPERACAO="SIMPLES REMESSA F/ESTADO"
                     lCFOP="6.12" 
            CASE ACAO=29
                    lOPERACAO="NOTA FISCAL COMPLEMENTAR"
                    lCFOP="5.99"
            CASE ACAO=30
                    lOPERACAO="NOTA FISCAL COMPLEMENTAR F/ESTADO"
                    lCFOP="6.12"
            CASE ACAO=31
                    lOPERACAO="BRINDE"
                    lCFOP="5.99"
            CASE ACAO=32
                    lOPERACAO="BRINDE F/ESTADO"
                    lCFOP="6.99"
            ENDCASE
RESTORE SCREEN FROM ATOPERACAO
