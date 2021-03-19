DO WHILE .T.

   lNTNUM=0
   lPESSOA = SPACE(1)
   lRG = SPACE(15)
   ACAO=" "
   ACAO2=" "
   ACAO3=" "
   ACAO5=" "
   ACAO4=" "
   OPCAO6=" "
   LINHA=0

*
SET COLOR TO W/B
@ 02,01 CLEAR TO 21,78
        
        SELE 2
        USE SP_CLIEN SHARED
        *
        SELE 1
        USE SP_NT SHARED
                SAVE SCRE TO INICIO
                        SET COLOR TO (W/N,W/N)
                           @ 23,01 SAY "DIGITE O PROXIMO NUMERO P/ CADASTRO.           "
                           @ 23,67 SAY "Regitros"+STR(RECCOUNT(),4)+" "
             set color to (n/w,n/w)
             @ 03,01 clear to 03,78
             @ 03,02 SAY "E M I S S A O  N O T A  F I S C A L"


SET COLOR TO W
   @ 02,03 SAY "PESSOA FISICA/JURIDICA"GET lPESSOA PICT "@!"    
   READ
   
   IF lPESSOA="J"
   @ 03,03 SAY "NOTA FISCAL N'."GET lNTNUM PICT "9999"

      READ
   IF lntnum=0
      return
   endif
USE SP_NT INDEX SPC_NTN SHARED
SEEK lNTNUM
        IF EOF()
              @ 23,01 SAY "NUMERO EXISTENTE. Pressione qualquer tecla. "
              SET CONSOLE OFF
              WAIT
              LOOP
              SET CONSOLE ON
        ENDIF
lNCLIEN = NCLIEN

lCGC=lNCLIEN
DO SP_NTP2

    SET COLOR TO N/W
    @ 23,01 SAY "Antes de imprimir verifique se a impressora " 
          SET COLOR TO W/B
          @ 22,01 SAY "Mensagem: Imprime as informacoes Sim ou Nao?                     "
          DO WHILE ACAO<>"S" .and. ACAO<>"N"
             STORE ' ' TO MSGERRO
             WAIT TO ACAO
          enddo
          IF ACAO="S"
          SET COLOR TO W/B
          @ 02,01 CLEAR TO 20,78 
          @ 22,01 SAY "Mensagem: Informacoes sendo Impressas...                       "
          SET COLOR TO W
          SET COLOR TO B/B
          SET DEVICE TO PRINT

SELE 1
       LINHA=LINHA+3
       @ LINHA,101 SAY "X"
       LINHA=LINHA+07
       @ LINHA,03 SAY OPERACAO
       @ LINHA,44 SAY CFOP
       LINHA=LINHA+3
SELE 2
       @ LINHA,03 SAY EMP
       @ LINHA,107 SAY CGC
SELE 1
       @ LINHA,142 SAY EMISSAO
SELE 2
       LINHA=LINHA+2
       @ LINHA,03 SAY ALLTRIM(END)
       @ LINHA,PCOL() SAY " " 
       @ LINHA,83 SAY BAIRRO
       @ LINHA,117 SAY CEP
SELE 1
       @ LINHA,142 SAY SAIDA
       LINHA=LINHA+2
SELE 2
       @ LINHA,03 SAY CIDADE
       @ LINHA,56 SAY "("
       @ LINHA,57 SAY ALLTRIM(DDD)
       @ LINHA,PCOL() SAY ")"
       @ LINHA,PCOL() SAY " "
       @ LINHA,PCOL() SAY ALLTRIM(TEL1)
       @ LINHA,85 SAY UF
       IF IE="000.000.000.000"
          @ LINHA,107 SAY "ISENTO"
       ENDIF
       IF IE#"000.000.000.000"
          @ LINHA,107 SAY IE
       ENDIF
       LINHA=LINHA+2
SELE 1
      IF OPERACAO="DEVOLUCAO DE MERCADORIA" .OR. OPERACAO="DEVOLUCAO DE CONSERTO";
        .OR. OPERACAO="REMESSA PARA CONSERTO" .OR. OPERACAO="REMESSA PARA DEMOSTRACAO";
        .OR. REFNT#0 .OR. OPERACAO="SIMPLES REMESSA" 
        
                      @ LINHA,79 SAY " "
                       LINHA=LINHA+1
                       @ LINHA,03 SAY " "
                       @ LINHA,77 SAY " "
SELE 2
       LINHA=LINHA+2
       @ LINHA,03 SAY " "
       @ LINHA,81 SAY ALLTRIM(" ")
       @ LINHA,PCOL() SAY " " 
       @ LINHA,PCOL() SAY " "


      ELSEIF OPERACAO#"DEVOLUCAO DE MERCADORIA" .OR. OPERACAO#"DEVOLUCAO DE CONSERTO";
        .OR. OPERACAO#"REMESSA PARA CONSERTO" .OR. OPERACAO#"PRESTACAO DE SERVICO";
        .OR. OPERACAO#"REMESSA PARA LOCACAO" .OR. OPERACAO#"REMESSA PARA DEMOSTRACAO";
        .OR. REFNT=0 .OR. OPERACAO="PRESTACAO DE SERVICO" .OR. OPERACAO="REMESSA PARA LOCACAO"
               
                      IF VENC=EMISSAO
                           @ LINHA,79 SAY " A VISTA "
                       ENDIF
                       IF VENC#EMISSAO
                            @ LINHA,79 SAY VENC
                       ENDIF
                       
       LINHA=LINHA+1
       @ LINHA,03 SAY NTNUM
       @ LINHA,77 SAY NTOTAL PICT "@E 999,999,999.99"
SELE 2
       LINHA=LINHA+2
       @ LINHA,03 SAY CIDADECB
       @ LINHA,81 SAY ALLTRIM(ENDCB)
       @ LINHA,PCOL() SAY " " 
       @ LINHA,PCOL() SAY BAIRROCB


       ENDIF

SELE 1
       LINHA=LINHA+5
       @ LINHA,19 SAY DESC1
       @ LINHA,79 SAY un1
                IF QTDA1=0
                   @ LINHA,85 SAY "  "
                ENDIF
                IF QTDA1#0
                   @ LINHA,85 SAY QTDA1
                ENDIF
               IF UNIT1=0
                   @ LINHA,92 SAY "   "
               ENDIF
               IF UNIT1#0
                       @ LINHA,92 SAY UNIT1 PICT "@E 999,999,999.99"
               ENDIF

               IF TOTAL1=0
                  @ LINHA,114 SAY "   "
               ENDIF
               IF TOTAL1#0
                       @ LINHA,114 SAY TOTAL1 PICT "@E 999,999,999.99"
               ENDIF
               IF ICMS1=0
                    @ LINHA,132 SAY "  "
                ENDIF
               IF ICMS1#0
                     @ LINHA,132 SAY ICMS1
               ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY DESC2
       @ LINHA,79 SAY UN2
                IF QTDA2=0
                   @ LINHA,85 SAY "  "
                ELSEIF QTDA2#0
                    @ LINHA,85 SAY QTDA2
                ENDIF
                IF UNIT2=0
                    @ LINHA,92 SAY "   "
                ELSEIF UNIT2#0
                   @ LINHA,92 SAY UNIT2 PICT "@E 999,999,999.99"
                ENDIF
                IF TOTAL2=0
                   @ LINHA,114 SAY "   "
                ELSEIF TOTAL2#0
                   @ LINHA,114 SAY TOTAL2 PICT "@E 999,999,999.99"
                ENDIF
               IF ICMS2=0
                    @ LINHA,132 SAY "  "
                ELSEIF ICMS2#0
                     @ LINHA,132 SAY ICMS2
               ENDIF

       LINHA=LINHA+1
       @ LINHA,19 SAY DESC3
       @ LINHA,79 SAY UN3
                IF QTDA3=0
                   @ LINHA,85 SAY " "
                ELSEIF QTDA3#0
                   @ LINHA,85 SAY QTDA3
                ENDIF
                IF UNIT3=0
                   @ LINHA,92 SAY "   "
                ELSEIF UNIT3#0
                   @ LINHA,92 SAY UNIT3 PICT "@E 999,999,999.99"
                ENDIF
                IF TOTAL3=0
                   @ LINHA,114 SAY "    "
                ELSEIF TOTAL3#0
                   @ LINHA,114 SAY TOTAL3 PICT "@E 999,999,999.99"
                ENDIF
               IF ICMS3=0
                    @ LINHA,132 SAY "  "
                ELSEIF ICMS3#0
                     @ LINHA,132 SAY ICMS3
               ENDIF

       LINHA=LINHA+1
       @ LINHA,19 SAY DESC4
       @ LINHA,79 SAY UN4
                IF QTDA4=0
                   @ LINHA,85 SAY " "
                ELSEIF QTDA4#0
                   @ LINHA,85 SAY QTDA4
                ENDIF
                IF UNIT4=0
                   @ LINHA,92 SAY "    "
                ELSEIF UNIT4#0
                   @ LINHA,92 SAY UNIT4 PICT "@E 999,999,999.99"
                ENDIF
                IF TOTAL4=0
                   @ LINHA,114 SAY "   "
                ELSEIF TOTAL4#0
                   @ LINHA,114 SAY TOTAL4 PICT "@E 999,999,999.99"
                ENDIF
               IF ICMS4=0
                    @ LINHA,132 SAY "  "
                ELSEIF ICMS4#0
                     @ LINHA,132 SAY ICMS4
               ENDIF

       LINHA=LINHA+1
       @ LINHA,19 SAY DESC5
       @ LINHA,79 SAY UN5
               IF QTDA5=0
                  @ LINHA,85 SAY " "
               ELSEIF QTDA5#0
                  @ LINHA,85 SAY QTDA5
               ENDIF
               IF UNIT5=0
                  @ LINHA,92 SAY "    "
               ELSEIF UNIT5#0
                   @ LINHA,92 SAY UNIT5 PICT "@E 999,999,999.99"
               ENDIF
               IF TOTAL5=0
                   @ LINHA,114 SAY "   "
               ELSEIF TOTAL5#0
                   @ LINHA,114 SAY TOTAL5 PICT "@E 999,999,999.99"
               ENDIF
               IF ICMS5=0
                    @ LINHA,132 SAY "  "
                ELSEIF ICMS5#0
                     @ LINHA,132 SAY ICMS5
               ENDIF

               IF REFNT=0
                       LINHA=LINHA+2
                                   @ LINHA,19 SAY NTOBS
                       LINHA=LINHA+1
                                   @ LINHA,19 SAY NTOBS2
               ELSEIF REFNT#0
                       LINHA=LINHA+2
                                   @ LINHA,19 SAY "NOTA FISCAL COMPLEMENTAR DE ICMS REF. A N/F "
                                   @ LINHA,64 SAY REFNT
                                   @ LINHA,70 SAY "DE"
                                   @ LINHA,74 SAY REFEMS
                        LINHA=LINHA+1
               ENDIF                                                             *
       LINHA=LINHA+5
       @ LINHA,19 SAY SERV1
                IF SQTDA1=0
                   @ LINHA,85 SAY " "
                ELSEIF SQTDA1#0
                   @ LINHA,85 SAY SQTDA1
                ENDIF
                IF SUNIT1=0
                   @ LINHA,92 SAY "   "
                ELSEIF SUNIT1#0
                   @ LINHA,92 SAY SUNIT1 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL1=0
                   @ LINHA,114 SAY  "    "
                ELSEIF STOTAL1#0
                    @ LINHA,114 SAY STOTAL1 PICT "@E 999,999,999.99"
                ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY SERV2
                IF SQTDA2=0
                   @ LINHA,85 SAY " "
                ELSEIF SQTDA2#0
                   @ LINHA,85 SAY SQTDA2
                ENDIF
                IF SUNIT2=0
                   @ LINHA,92 SAY "   "
                ELSEIF SUNIT2#0
                     @ LINHA,92 SAY SUNIT2 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL2=0
                   @ LINHA,114 SAY "   "
                ELSEIF STOTAL2#0
                   @ LINHA,114 SAY STOTAL2 PICT "@E 999,999,999.99"
                ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY SERV3
                IF SQTDA3=0
                   @ LINHA,85 SAY " "
                ELSEIF SQTDA3#0
                   @ LINHA,85 SAY SQTDA3
                ENDIF
                IF SUNIT3=0
                   @ LINHA,92 SAY "    "
                ELSEIF SUNIT3#0
                   @ LINHA,92 SAY SUNIT3 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL3=0
                   @ LINHA,114 SAY "   "
                ELSEIF STOTAL3#0
                   @ LINHA,114 SAY STOTAL3 PICT "@E 999,999,999.99"
                ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY SERV4
                IF SQTDA4=0
                    @ LINHA,85 SAY " "
                ELSEIF SQTDA4#0
                   @ LINHA,85 SAY SQTDA4
                ENDIF
                IF SUNIT4=0
                   @ LINHA,92 SAY "    "
                ELSEIF SUNIT4#0
                   @ LINHA,92 SAY SUNIT4 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL4=0
                   @ LINHA,114 SAY "   "
                ELSEIF STOTAL4#0
                   @ LINHA,114 SAY STOTAL4 PICT "@E 999,999,999.99"
                ENDIF
                IF ISS=0
                   @ LINHA,138 SAY "  "
                ELSEIF ISS#0
                       @ LINHA,138 SAY ISS PICT "999,999.99"
                ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY SERV5
                IF SQTDA5=0
                   @ LINHA,85 SAY "  "
                ELSEIF SQTDA5#0
                   @ LINHA,85 SAY SQTDA5
                ENDIF
                IF SUNIT5=0
                   @ LINHA,92 SAY "    "
                ELSEIF SUNIT5#0
                   @ LINHA,92 SAY SUNIT5 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL5=0
                   @ LINHA,114 SAY "   "
                ELSEIF STOTAL5#0
                       @ LINHA,114 SAY STOTAL5 PICT "@E 999,999,999.99"
                ENDIF
       LINHA=LINHA+1
                @ LINHA,19 SAY OBSERV
       LINHA=LINHA+1
                @ LINHA,19 SAY OBSERV2
       LINHA=LINHA+1
                         IF STOTAL=0
                                  @ LINHA,136 SAY "    "
                         ELSEIF STOTAL#0
                                  @ LINHA,136 SAY STOTAL PICT "@E 999,999,999.99"
                         ENDIF
       LINHA=LINHA+5
               IF CICMS=0
                  @ LINHA,03 SAY "   "
               ELSEIF CICMS#0
                   @ LINHA,03 SAY CICMS  PICT "@E 999,999,999.99"
               ENDIF
                       IF VALORICMS=0
                          @ LINHA,32 SAY "   "
                       ELSEIF VALORICMS#0
                          @ LINHA,32 SAY VALORICMS PICT "@E 999,999,999.99"
                       ENDIF
                               IF TOTAL=0
                                  @ LINHA,138 SAY " "
                                  LINHA=LINHA+1
                               ELSEIF TOTAL#0
                                    @ LINHA,138 SAY TOTAL  PICT "@E 999,999,999.99"
                                  LINHA=LINHA+1
                               ENDIF
                                IF NTOTAL=0
                                       @ LINHA,138 SAY " "
                                       LINHA=LINHA+3
                                ELSEIF NTOTAL#0
                                        @ LINHA,138 SAY NTOTAL PICT "@E 999,999,999.99"
                                LINHA=LINHA+3
                                ENDIF
               IF OPERACAO="PRESTACAO DE SERVICO"
                               @ LINHA,03 SAY " "
                               @ LINHA,86 SAY " "
                               @ LINHA,94 SAY " "
                               @ LINHA,110 SAY " "
                               @ LINHA,125 SAY " "
                               LINHA=LINHA+2
                               @ LINHA,03 SAY " "
                               @ LINHA,79 SAY " "
                               @ LINHA,110 SAY " "
                               @ LINHA, 125 SAY " "
                               LINHA=LINHA+2
                              @ LINHA,03 SAY "  "
                              @ LINHA,15 SAY " "
                              @ LINHA,38 SAY " "
                              @ LINHA,63 SAY " "
                              @ LINHA,99 SAY " "
                              @ LINHA,122 SAY " "                                

              ELSEIF OPERACAO#"PRESTACAO DE SERVICO"
                               @ LINHA,03 SAY TRANSNOM
                               @ LINHA,86 SAY FRETE
                               @ LINHA,94 SAY TRANSPL
                               @ LINHA,110 SAY TRANPUF
                               @ LINHA,125 SAY TCGCPF
                               LINHA=LINHA+2
                               @ LINHA,03 SAY TRANSEND
                               @ LINHA,79 SAY TRANSCID
                               @ LINHA,110 SAY TRANSUF
                               @ LINHA, 125 SAY TRANIE
                               LINHA=LINHA+2
                                       IF TRANSQTD=0
                                              @ LINHA,03 SAY "  "
                                       ELSEIF TRANSQTD#0
                                              @ LINHA,03 SAY TRANSQTD
                                       ENDIF
                               @ LINHA,15 SAY TRANSESP
                               @ LINHA,38 SAY TMARCA
                                       IF TRASNUM=0
                                          @ LINHA,63 SAY " "
                                       ELSEIF TRASNUM#0
                                          @ LINHA,63 SAY TRASNUM
                                       ENDIF
                               @ LINHA,99 SAY TRPBRT
                               @ LINHA,122 SAY TRPLQ
               ENDIF
               ENDIF
SET DEVICE TO SCREEN
ENDIF
    IF lPESSOA="F"
   
   @ 03,03 SAY "RG: N."GET lRG PICT "@!"

      READ
   IF lRG=SPACE(15)
      return
   endif
USE SP_NT INDEX SPRG SHARED
SEEK lRG
        IF EOF()
              @ 23,01 SAY "RG NAO EXISTE. Pressione qualquer tecla. "
              SET CONSOLE OFF
              WAIT
              LOOP
              SET CONSOLE ON
        ENDIF
lNCLIEN = RG

lRG=lNCLIEN
DO SP_NTP5

    SET COLOR TO N/W
    @ 23,01 SAY "Antes de imprimir verifique se a impressora " 
          SET COLOR TO W/B
          @ 22,01 SAY "Mensagem: Imprime as informacoes Sim ou Nao?                     "
          DO WHILE ACAO<>"S" .and. ACAO<>"N"
             STORE ' ' TO MSGERRO
             WAIT TO ACAO
          enddo
          IF ACAO="S"
          SET COLOR TO W/B
          @ 02,01 CLEAR TO 20,78 
          @ 22,01 SAY "Mensagem: Informacoes sendo Impressas...                       "
          SET COLOR TO W
          SET COLOR TO B/B
          SET DEVICE TO PRINT

SELE 1
       LINHA=LINHA+3
       @ LINHA,101 SAY "X"
       LINHA=LINHA+07
       @ LINHA,03 SAY OPERACAO
       @ LINHA,44 SAY CFOP
       LINHA=LINHA+3
SELE 2
       @ LINHA,03 SAY EMP
       @ LINHA,107 SAY "RG:"
       @ LINHA,110 SAY RG
SELE 1
       @ LINHA,142 SAY EMISSAO
SELE 2
       LINHA=LINHA+2
       @ LINHA,03 SAY ALLTRIM(END)
       @ LINHA,PCOL() SAY " " 
       @ LINHA,83 SAY BAIRRO
       @ LINHA,117 SAY CEP
SELE 1
       @ LINHA,142 SAY SAIDA
       LINHA=LINHA+2
SELE 2
       @ LINHA,03 SAY CIDADE
       @ LINHA,56 SAY "("
       @ LINHA,57 SAY ALLTRIM(DDD)
       @ LINHA,PCOL() SAY ")"
       @ LINHA,PCOL() SAY " "
       @ LINHA,PCOL() SAY ALLTRIM(TEL1)
       @ LINHA,85 SAY UF
       @ LINHA,107 SAY "CPF:"
       @ LINHA,111 SAY CPF
       LINHA=LINHA+2
SELE 1
      IF OPERACAO="DEVOLUCAO DE MERCADORIA" .OR. OPERACAO="DEVOLUCAO DE CONSERTO";
        .OR. OPERACAO="REMESSA PARA CONSERTO" .OR. OPERACAO="REMESSA PARA DEMOSTRACAO";
        .OR. REFNT#0 .OR. OPERACAO="SIMPLES REMESSA" 
        
                      @ LINHA,79 SAY " "
                       LINHA=LINHA+1
                       @ LINHA,03 SAY " "
                       @ LINHA,77 SAY " "
SELE 2
       LINHA=LINHA+2
       @ LINHA,03 SAY " "
       @ LINHA,81 SAY ALLTRIM(" ")
       @ LINHA,PCOL() SAY " " 
       @ LINHA,PCOL() SAY " "


      ELSEIF OPERACAO#"DEVOLUCAO DE MERCADORIA" .OR. OPERACAO#"DEVOLUCAO DE CONSERTO";
        .OR. OPERACAO#"REMESSA PARA CONSERTO" .OR. OPERACAO#"PRESTACAO DE SERVICO";
        .OR. OPERACAO#"REMESSA PARA LOCACAO" .OR. OPERACAO#"REMESSA PARA DEMOSTRACAO";
        .OR. REFNT=0 .OR. OPERACAO="PRESTACAO DE SERVICO" .OR. OPERACAO="REMESSA PARA LOCACAO"
               
                      IF VENC=EMISSAO
                           @ LINHA,79 SAY " A VISTA "
                       ENDIF
                       IF VENC#EMISSAO
                            @ LINHA,79 SAY VENC
                       ENDIF
                       
       LINHA=LINHA+1
       @ LINHA,03 SAY NTNUM
       @ LINHA,77 SAY NTOTAL PICT "@E 999,999,999.99"
SELE 2
       LINHA=LINHA+2
       @ LINHA,03 SAY CIDADECB
       @ LINHA,81 SAY ALLTRIM(ENDCB)
       @ LINHA,PCOL() SAY " " 
       @ LINHA,PCOL() SAY BAIRROCB


       ENDIF

SELE 1
       LINHA=LINHA+5
       @ LINHA,19 SAY DESC1
       @ LINHA,79 SAY un1
                IF QTDA1=0
                   @ LINHA,85 SAY "  "
                ENDIF
                IF QTDA1#0
                   @ LINHA,85 SAY QTDA1
                ENDIF
               IF UNIT1=0
                   @ LINHA,92 SAY "   "
               ENDIF
               IF UNIT1#0
                       @ LINHA,92 SAY UNIT1 PICT "@E 999,999,999.99"
               ENDIF

               IF TOTAL1=0
                  @ LINHA,114 SAY "   "
               ENDIF
               IF TOTAL1#0
                       @ LINHA,114 SAY TOTAL1 PICT "@E 999,999,999.99"
               ENDIF
               IF ICMS1=0
                    @ LINHA,132 SAY "  "
                ENDIF
               IF ICMS1#0
                     @ LINHA,132 SAY ICMS1
               ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY DESC2
       @ LINHA,79 SAY UN2
                IF QTDA2=0
                   @ LINHA,85 SAY "  "
                ELSEIF QTDA2#0
                    @ LINHA,85 SAY QTDA2
                ENDIF
                IF UNIT2=0
                    @ LINHA,92 SAY "   "
                ELSEIF UNIT2#0
                   @ LINHA,92 SAY UNIT2 PICT "@E 999,999,999.99"
                ENDIF
                IF TOTAL2=0
                   @ LINHA,114 SAY "   "
                ELSEIF TOTAL2#0
                   @ LINHA,114 SAY TOTAL2 PICT "@E 999,999,999.99"
                ENDIF
               IF ICMS2=0
                    @ LINHA,132 SAY "  "
                ELSEIF ICMS2#0
                     @ LINHA,132 SAY ICMS2
               ENDIF

       LINHA=LINHA+1
       @ LINHA,19 SAY DESC3
       @ LINHA,79 SAY UN3
                IF QTDA3=0
                   @ LINHA,85 SAY " "
                ELSEIF QTDA3#0
                   @ LINHA,85 SAY QTDA3
                ENDIF
                IF UNIT3=0
                   @ LINHA,92 SAY "   "
                ELSEIF UNIT3#0
                   @ LINHA,92 SAY UNIT3 PICT "@E 999,999,999.99"
                ENDIF
                IF TOTAL3=0
                   @ LINHA,114 SAY "    "
                ELSEIF TOTAL3#0
                   @ LINHA,114 SAY TOTAL3 PICT "@E 999,999,999.99"
                ENDIF
               IF ICMS3=0
                    @ LINHA,132 SAY "  "
                ELSEIF ICMS3#0
                     @ LINHA,132 SAY ICMS3
               ENDIF

       LINHA=LINHA+1
       @ LINHA,19 SAY DESC4
       @ LINHA,79 SAY UN4
                IF QTDA4=0
                   @ LINHA,85 SAY " "
                ELSEIF QTDA4#0
                   @ LINHA,85 SAY QTDA4
                ENDIF
                IF UNIT4=0
                   @ LINHA,92 SAY "    "
                ELSEIF UNIT4#0
                   @ LINHA,92 SAY UNIT4 PICT "@E 999,999,999.99"
                ENDIF
                IF TOTAL4=0
                   @ LINHA,114 SAY "   "
                ELSEIF TOTAL4#0
                   @ LINHA,114 SAY TOTAL4 PICT "@E 999,999,999.99"
                ENDIF
               IF ICMS4=0
                    @ LINHA,132 SAY "  "
                ELSEIF ICMS4#0
                     @ LINHA,132 SAY ICMS4
               ENDIF

       LINHA=LINHA+1
       @ LINHA,19 SAY DESC5
       @ LINHA,79 SAY UN5
               IF QTDA5=0
                  @ LINHA,85 SAY " "
               ELSEIF QTDA5#0
                  @ LINHA,85 SAY QTDA5
               ENDIF
               IF UNIT5=0
                  @ LINHA,92 SAY "    "
               ELSEIF UNIT5#0
                   @ LINHA,92 SAY UNIT5 PICT "@E 999,999,999.99"
               ENDIF
               IF TOTAL5=0
                   @ LINHA,114 SAY "   "
               ELSEIF TOTAL5#0
                   @ LINHA,114 SAY TOTAL5 PICT "@E 999,999,999.99"
               ENDIF
               IF ICMS5=0
                    @ LINHA,132 SAY "  "
                ELSEIF ICMS5#0
                     @ LINHA,132 SAY ICMS5
               ENDIF

               IF REFNT=0
                       LINHA=LINHA+2
                                   @ LINHA,19 SAY NTOBS
                       LINHA=LINHA+1
                                   @ LINHA,19 SAY NTOBS2
               ELSEIF REFNT#0
                       LINHA=LINHA+2
                                   @ LINHA,19 SAY "NOTA FISCAL COMPLEMENTAR DE ICMS REF. A N/F "
                                   @ LINHA,64 SAY REFNT
                                   @ LINHA,70 SAY "DE"
                                   @ LINHA,74 SAY REFEMS
                        LINHA=LINHA+1
               ENDIF                                                             *
       LINHA=LINHA+5
       @ LINHA,19 SAY SERV1
                IF SQTDA1=0
                   @ LINHA,85 SAY " "
                ELSEIF SQTDA1#0
                   @ LINHA,85 SAY SQTDA1
                ENDIF
                IF SUNIT1=0
                   @ LINHA,92 SAY "   "
                ELSEIF SUNIT1#0
                   @ LINHA,92 SAY SUNIT1 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL1=0
                   @ LINHA,114 SAY  "    "
                ELSEIF STOTAL1#0
                    @ LINHA,114 SAY STOTAL1 PICT "@E 999,999,999.99"
                ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY SERV2
                IF SQTDA2=0
                   @ LINHA,85 SAY " "
                ELSEIF SQTDA2#0
                   @ LINHA,85 SAY SQTDA2
                ENDIF
                IF SUNIT2=0
                   @ LINHA,92 SAY "   "
                ELSEIF SUNIT2#0
                     @ LINHA,92 SAY SUNIT2 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL2=0
                   @ LINHA,114 SAY "   "
                ELSEIF STOTAL2#0
                   @ LINHA,114 SAY STOTAL2 PICT "@E 999,999,999.99"
                ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY SERV3
                IF SQTDA3=0
                   @ LINHA,85 SAY " "
                ELSEIF SQTDA3#0
                   @ LINHA,85 SAY SQTDA3
                ENDIF
                IF SUNIT3=0
                   @ LINHA,92 SAY "    "
                ELSEIF SUNIT3#0
                   @ LINHA,92 SAY SUNIT3 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL3=0
                   @ LINHA,114 SAY "   "
                ELSEIF STOTAL3#0
                   @ LINHA,114 SAY STOTAL3 PICT "@E 999,999,999.99"
                ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY SERV4
                IF SQTDA4=0
                    @ LINHA,85 SAY " "
                ELSEIF SQTDA4#0
                   @ LINHA,85 SAY SQTDA4
                ENDIF
                IF SUNIT4=0
                   @ LINHA,92 SAY "    "
                ELSEIF SUNIT4#0
                   @ LINHA,92 SAY SUNIT4 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL4=0
                   @ LINHA,114 SAY "   "
                ELSEIF STOTAL4#0
                   @ LINHA,114 SAY STOTAL4 PICT "@E 999,999,999.99"
                ENDIF
                IF ISS=0
                   @ LINHA,138 SAY "  "
                ELSEIF ISS#0
                       @ LINHA,138 SAY ISS PICT "999,999.99"
                ENDIF
       LINHA=LINHA+1
       @ LINHA,19 SAY SERV5
                IF SQTDA5=0
                   @ LINHA,85 SAY "  "
                ELSEIF SQTDA5#0
                   @ LINHA,85 SAY SQTDA5
                ENDIF
                IF SUNIT5=0
                   @ LINHA,92 SAY "    "
                ELSEIF SUNIT5#0
                   @ LINHA,92 SAY SUNIT5 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL5=0
                   @ LINHA,114 SAY "   "
                ELSEIF STOTAL5#0
                       @ LINHA,114 SAY STOTAL5 PICT "@E 999,999,999.99"
                ENDIF
       LINHA=LINHA+1
                @ LINHA,19 SAY OBSERV
       LINHA=LINHA+1
                @ LINHA,19 SAY OBSERV2
       LINHA=LINHA+1
                         IF STOTAL=0
                                  @ LINHA,136 SAY "    "
                         ELSEIF STOTAL#0
                                  @ LINHA,136 SAY STOTAL PICT "@E 999,999,999.99"
                         ENDIF
       LINHA=LINHA+5
               IF CICMS=0
                  @ LINHA,03 SAY "   "
               ELSEIF CICMS#0
                   @ LINHA,03 SAY CICMS  PICT "@E 999,999,999.99"
               ENDIF
                       IF VALORICMS=0
                          @ LINHA,32 SAY "   "
                       ELSEIF VALORICMS#0
                          @ LINHA,32 SAY VALORICMS PICT "@E 999,999,999.99"
                       ENDIF
                               IF TOTAL=0
                                  @ LINHA,138 SAY " "
                                  LINHA=LINHA+1
                               ELSEIF TOTAL#0
                                    @ LINHA,138 SAY TOTAL  PICT "@E 999,999,999.99"
                                  LINHA=LINHA+1
                               ENDIF
                                IF NTOTAL=0
                                       @ LINHA,138 SAY " "
                                       LINHA=LINHA+3
                                ELSEIF NTOTAL#0
                                        @ LINHA,138 SAY NTOTAL PICT "@E 999,999,999.99"
                                LINHA=LINHA+3
                                ENDIF
               IF OPERACAO="PRESTACAO DE SERVICO"
                               @ LINHA,03 SAY " "
                               @ LINHA,86 SAY " "
                               @ LINHA,94 SAY " "
                               @ LINHA,110 SAY " "
                               @ LINHA,125 SAY " "
                               LINHA=LINHA+2
                               @ LINHA,03 SAY " "
                               @ LINHA,79 SAY " "
                               @ LINHA,110 SAY " "
                               @ LINHA, 125 SAY " "
                               LINHA=LINHA+2
                              @ LINHA,03 SAY "  "
                              @ LINHA,15 SAY " "
                              @ LINHA,38 SAY " "
                              @ LINHA,63 SAY " "
                              @ LINHA,99 SAY " "
                              @ LINHA,122 SAY " "                                

              ELSEIF OPERACAO#"PRESTACAO DE SERVICO"
                               @ LINHA,03 SAY TRANSNOM
                               @ LINHA,86 SAY FRETE
                               @ LINHA,94 SAY TRANSPL
                               @ LINHA,110 SAY TRANPUF
                               @ LINHA,125 SAY TCGCPF
                               LINHA=LINHA+2
                               @ LINHA,03 SAY TRANSEND
                               @ LINHA,79 SAY TRANSCID
                               @ LINHA,110 SAY TRANSUF
                               @ LINHA, 125 SAY TRANIE
                               LINHA=LINHA+2
                                       IF TRANSQTD=0
                                              @ LINHA,03 SAY "  "
                                       ELSEIF TRANSQTD#0
                                              @ LINHA,03 SAY TRANSQTD
                                       ENDIF
                               @ LINHA,15 SAY TRANSESP
                               @ LINHA,38 SAY TMARCA
                                       IF TRASNUM=0
                                          @ LINHA,63 SAY " "
                                       ELSEIF TRASNUM#0
                                          @ LINHA,63 SAY TRASNUM
                                       ENDIF
                               @ LINHA,99 SAY TRPBRT
                               @ LINHA,122 SAY TRPLQ
               ENDIF
               ENDIF
SET DEVICE TO SCREEN
ENDIF



ENDDO
