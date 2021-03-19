*--------------------------------------------
* NOTT2.PRG - TELA DE OPCAO OPERACAO
* AUTOR: ALEXSANDER SALINAS SANTOS - SALINAS@STARMEDIA.COM
* DATA: 12/11/1999
* ALTERADO- 05-05/2000
* --------------------------------------------
        
        SET COLOR TO (R/W,R/W)
        @ 06,42 PROMPT "01-VENDA NO ESTADO                   "
        @ 06,42 PROMPT "02-VENDA FORA DO ESTADO              "      
        @ 06,42 PROMPT "03-LIC. USO SOFTWARE NO ESTADO       " 
        @ 06,42 PROMPT "04-LIC. USO SOFTWARE F/ESTADO        "
        @ 06,42 PROMPT "05-LIC. USO SOFTWARE OPEN NO ESTADO  "
        @ 06,42 PROMPT "06-LIC. USO SOFTWARE OPEN F/ESTADO   "
        @ 06,42 PROMPT "07-REMESSA PARA CONSERTO NO ESTADO   " 
        @ 06,42 PROMPT "08-REMESSA PARA CONSERTO F/ESTADO    " 
        @ 06,42 PROMPT "09-REMESSA PARA LOCA€ŽO NO ESTADO    "
        @ 06,42 PROMPT "10-REMESSA PARA LOCA€ŽO F/ ESTADO    "
        @ 06,42 PROMPT "11-REMESSA PARA DEMOSTRA€ŽO NO ESTADO"
        @ 06,42 PROMPT "12-REMESSA PARA DEMOSTRA€ŽO F/ESTADO "
        @ 06,42 PROMPT "13-REMESSA PARA TROCA NO ESTADO      "
        @ 06,42 PROMPT "14-REMESSA PARA TROCA F/ESTADO       "
        @ 06,42 PROMPT "15-DEV. DE MERCADORIA NO ESTADO      "
        @ 06,42 PROMPT "16-DEV. DE MERCADORIA F/ESTADO       "
        @ 06,42 PROMPT "17-DEV. DE SOFTWARE NO ESTADO        "
        @ 06,42 PROMPT "18-DEV. DE SOFTWARE F/ ESTADO        "
        @ 06,42 PROMPT "19-DEVOLU€ŽO DE CONSERTO NO ESTADO   "
        @ 06,42 PROMPT "20-DEVOLU€ŽO DE CONSERTO F/ESTADO    "
        @ 06,42 PROMPT "21-DEVOLU€ŽO DE TROCA NO ESTADO      "
        @ 06,42 PROMPT "22-DEVOLU€ŽO DE TROCA F/ ESTADO      "
        @ 06,42 PROMPT "23-DEVOLU€ŽO DE LOCA€ŽO NO ESTADO    "
        @ 06,42 PROMPT "24-DEVOLU€ŽO DE LOCA€ŽO F/ESTADO     "
        @ 06,42 PROMPT "25-DEVOLU€ŽO DE DEMOSTRA€ŽO NO ESTADO"
        @ 06,42 PROMPT "26-DEVOLU€ŽO DE DEMOSTRA€ŽO F/ESTADO "
        @ 06,42 PROMPT "27-PRESTA€ŽO DE SERVI€O NO ESTADO    "
        @ 06,42 PROMPT "28-PRESTA€ŽO DE SERVI€O F/ESTADO     "
        @ 06,42 PROMPT "29-SIMPLES REMESSA NO ESTADO         "
        @ 06,42 PROMPT "30-SIMPLES REMESSA FORA ESTADO       " 
        @ 06,42 PROMPT "31-NOTA FISCAL COMPLEMENTAR NO ESTADO" 
        @ 06,42 PROMPT "32-NOTA FISCAL COMPLEMENTAR F/ESTADO "
        @ 06,42 PROMPT "33-BRINDE NO ESTADO                  "
        @ 06,42 PROMPT "34-BRINDE F/ ESTADO                  "
        @ 06,42 PROMPT "35-COMISSŽO DE VENDA                 "
        @ 06,42 PROMPT "36-DEV. SOFTWARE OPEN NO ESTADO      " 
        @ 06,42 PROMPT "37-DEV. SOFTWARE OPEN FORA DO ESTADO " 
        @ 06,42 PROMPT "38-DEV.DE MERC. NO ESTADO - ISENTO   " 
        @ 06,42 PROMPT "39-DEV.DE MERC. FORA DO ESTADO-ISENTO" 
        MENU TO ACAO
          DO CASE
             CASE ACAO=1
                      lOPERACAO="VENDA"
                      lCFOP="5.12"
             CASE ACAO=2
                      lOPERACAO="VENDA FORA DO ESTADO"
                      lCFOP="6.12"
             CASE ACAO=3
                     lvariavelDIF="NORMAL"
                     lOPERACAO="LIC. USO SOFTWARE"
                     lCFOP="5.99"
             CASE ACAO=4
                     lvariavelDIF="NORMAL"
                     lOPERACAO="LIC.USO SOFTWARES F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=5
                     lvariavelDIF="MOLP"
                     lOPERACAO="LIC. USO SOFTWARE "
                     lCFOP="5.99"
             CASE ACAO=6
                     lvariavelDIF="MOLP"
                     lOPERACAO="LIC.USO SOFTWARES F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=7
                     lOPERACAO="REMESSA PARA CONSERTO NO ESTADO"
                     lCFOP="5.99"
             CASE ACAO=8
                     lOPERACAO="REMESSA PARA CONSERTO F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=9
                     lOPERACAO="REMESSA PARA LOCA€ŽO"
                     lCFOP="5.99"
             CASE ACAO=10
                     lOPERACAO="REMESSA PARA LOCA€ŽO F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=11
                     lOPERACAO="REMESSA PARA DEMONSTRA€ŽO"
                     lCFOP="5.99"
             CASE ACAO=12
                     lOPERACAO="REMESSA PARA DEMONSTRA€ŽO F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=13
                     lOPERACAO="REMESSA PARA TROCA"
                     lCFOP="5.99"
             CASE ACAO=14
                     lOPERACAO="REMESSA PARA TROCA F/ESTADO"
                     lCFOP="6.99"
            CASE ACAO=15
                     lOPERACAO="DEVOLU€ŽO DE MERCADORIA" 
                     lCFOP="5.32"
            CASE ACAO=16                               
                     lOPERACAO="DEVOLU€ŽO DE MERCADORIA F/ESTADO" 
                     lCFOP="6.32"
             CASE ACAO=17
                    lOPERACAO="DEVOLU€ŽO DE SOFTWARE"
                    lCFOP="5.99"
             CASE ACAO=18
                    lOPERACAO="DEVOLU€ŽO DE SOFTWARE F/ESTADO"
                    lCFOP="6.99"
             CASE ACAO=19
                     lOPERACAO="DEVOLU€ŽO DE CONSERTO"
                     lCFOP="5.99"
             CASE ACAO=20
                     lOPERACAO="DEVOLU€ŽO DE CONSERTO F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=21
                     lOPERACAO="DEVOLU€ŽO DE TROCA"
                     lCFOP="5.99"
             CASE ACAO=22
                     lOPERACAO="DEVOLU€ŽO DE TROCA F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=23       
                     lOPERACAO="DEVOLU€ŽO DE LOCA€ŽO"
                     lCFOP="5.99"
             CASE ACAO=24
                     lOPERACAO="DEVOLU€ŽO DE LOCA€ŽO F/ESTADO"
                     lCFOP="6.99"
            CASE ACAO=25
                     lOPERACAO="DEVOLU€ŽO DE DEMONSTRA€ŽO"
                     lCFOP="5.99"
             CASE ACAO=26
                     lOPERACAO="DEVOLU€ŽO DE DEMONSTRA€ŽO F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=27
                     lOPERACAO="PRESTA€ŽO DE SERVI€O"
                     lCFOP="5.99"
             CASE ACAO=28
                     lOPERACAO="PRESTA€ŽO DE SERVI€O F/ESTADO"
                     lCFOP="6.99"
             CASE ACAO=29
                     lOPERACAO="SIMPLES REMESSA"
                     lCFOP="5.99"
            CASE ACAO=30
                     lOPERACAO="SIMPLES REMESSA F/ESTADO"
                     lCFOP="6.99" 
            CASE ACAO=31
                    lOPERACAO="NOTA FISCAL COMPLEMENTAR"
                    lCFOP="5.12"
            CASE ACAO=32
                    lOPERACAO="NOTA FISCAL COMPLEMENTAR F/ESTADO"
                    lCFOP="6.12"
            CASE ACAO=33
                    lOPERACAO="BRINDE"
                    lCFOP="5.99"
            CASE ACAO=34
                    lOPERACAO="BRINDE F/ESTADO"
                    lCFOP="6.99"
            CASE ACAO=35
                    lOPERACAO="COMISSAO DE VENDA"
                    lCFOP="5.99"
            CASE ACAO=36
                    lOPERACAO="DEV. SOFTWARE OPEN NO ESTADO" 
                    lCFOP="5.99"
            CASE ACAO=37
                    lOPERACAO="DEV. SOFTWARE OPEN FORA DO ESTADO" 
                    lCFOP="6.99"
            CASE ACAO=38
                    lOPERACAO="DEVOLU€ŽO DE MERCADORIA NO ESTADO" 
                    lCFOP="1.32"
            CASE ACAO=39
                    lOPERACAO="DEVOLU€ŽO DE MERCADORIA F/ESTADO" 
                    lCFOP="2.32"
            ENDCASE
            
RESTORE SCREEN FROM ATOPERACAO
