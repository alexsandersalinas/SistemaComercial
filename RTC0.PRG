***********************
* INICIO: 01/02/1999
* CONSULTA DE CLIENTE  - RTI1.PRG/
* AUTUALIZADO - 10/01/2001

*********************

DO WHILE .T.
*SELE 2
acao=" "
OP=0
lCGC=SPACE(19)
lCPF=SPACE(18)
        
******* TELA OPCAO
        SET COLOR TO W/N
                @ 02,13 SAY " OS PARA PESSOA FISICA/JURIDICA ?      "
        SET COLOR TO N+/N
        @ 04,15,07,27 BOX REPL(CHR(176),9)
        
        SET COLOR TO W/B
                @ 03,14 CLEAR TO 06,26
                @ 03,14 TO 06,26 DOUBLE
        SET COLOR TO (W/B,R/W)
                @ 04,15 PROMPT " FISICA    "
                @ 05,15 PROMPT " JURIDICA  "
        MENU TO OP
                DO CASE
        CASE OP=1
                        SET COLOR TO W
                        @ 02,13 CLEAR TO 02,79
                        set color to (W/N,W/N)
                        @ 03,14 CLEAR TO 09,28
              @ 02,13 SAY "CPF N§:"GET lCPF PICT "999.999.999-99"
             READ
                IF lCPF=SPACE(18)
                       pesquisaERRO=1
                       RETURN
                ENDIF
     *   @ 02,13 SAY "                             "
                lNCLIEN=lCPF
                SELE 4
                  USE dbCLI1 INDEX ntxCPF1 SHARED
                  seek lCPF
                  variavelCHECK=1
                  IF EOF()
                       SELE 3
                   USE dbCLI2 INDEX ntxCPF2 SHARED
                   seek lCPF
                   variavelCHECK=2
                   IF EOF()
                      SET COLOR TO W/R
                      @ 24,00 clear to 24,79
                      @ 24,00 SAY " CPF NAO EXISTE!                 "
                      INKEY(2)
                      pesquisaERRO=1
                      RETURN
                   ENDIF
                   endif
        *
        lCPF = CPF
        *   lNFA = NFA
        *   lEMP = EMP
        *   lend = END
        *   lNUM = nUM
        *   lDDD = lDDD
        *   lTELEF = lTELEF
        *
                      lidnome=EMP
                      *  SET COLOR TO W/N
                      *  @ 04,10 SAY "                                                " 
                      SET COLOR TO (W/N,W+/N)
                        @ 02,36 SAY "CLIENTE:"
                        @ 02,45 SAY emp PICT "@!S40"
                        @ 03,00 SAY "END..:" 
                        @ 03,07 SAY alltrim(end) PICT "@!S35"
                        @ 03,col() SAY " - "
                        @ 03,col() SAY alltrim(bairro) PICT "@!S20"
                        @ 03,col() SAY " - "
                        @ 03,col() SAY alltrim(cidade) PICT "@!S15"
                        @ 03,col() SAY " - "
                        @ 03,col() SAY UF
                        @ 04,00 say "CEP..:"
                        @ 04,07 say alltrim(cep) pict "99999-999"
                        @ 04,col() say " - "
                        @ 04,col() say alltrim(DDD) 
                        @ 04,col() say " - "
                        @ 04,col() say alltrim(TEL1)
                        @ 04,col() say " - "
                        SET COLOR TO W/N
                        @ 04,col() SAY "CONFIRMA DADOS DO CLIENTE             " 
                        SET COLOR TO W*/N
                        @ 04,74 SAY "S/N ?"
                        DO WHILE ACAO<>"S" .and. ACAO<>"N"
                                STORE ' ' TO MSGERRO
                                WAIT TO ACAO
                                if acao="N"
                                        SET CONSOLE OFF
                                        WAIT
                                         SET COLOR TO (W/B,W/B)
                                           @ 05,10 CLEAR TO 07,78
                                           @ 06,01 CLEAR TO 06,78
                                           @ 07,01 CLEAR TO 07,78
                                        LOOP
                                ENDIF
                                IF ACAO="S"                        
                                        SET COLOR TO W
                                        @ 04,69 SAY "CONFIRMADO"
                                        RETURN
                                ENDIF
                        ENDDO


      CASE OP=2
                        SET COLOR TO W/N
                        @ 02,13 clear to 02,79
                        set color to (w/n,w/n)
                        @ 03,13 CLEAR TO 09,28
        @ 02,13 SAY "CNPJ N§:"GET lCGC PICT "99.999.999/9999-99"
        READ
        IF lCGC=SPACE(19)
                 pesquisaERRO=1
                 RETURN
        ENDIF
        *@ 02,16 SAY "                             "
                lNCLIEN=lCGC
                
              SELE 4
                  USE dbCLI1 INDEX ntxCGC1 SHARED
                  seek lCGC
                  variavelCHECK=1
                  IF EOF()
                       SELE 3
                   USE dbCLI2 INDEX ntxCGC2 SHARED
                   seek lCGC
                   variavelCHECK=2
                   IF EOF()
                      SET COLOR TO W/R
                      @ 24,00 clear to 24,79
                      @ 24,00 SAY " CNPJ NAO EXISTE!                   "
                      INKEY(2)
                      pesquisaERRO=1
                      RETURN
                   ENDIF
                   endif
        *
        lCGC = CGC
        *   lNFA = NFA
        *   lEMP = EMP
        *   lend = END
        *   lNUM = nUM
        *   lDDD = lDDD
        *   lTELEF = lTELEF
        *
                       * SET COLOR TO W/R
                       * @ 04,10 SAY "                                                " 
                       lidnome=emp
                      SET COLOR TO (W/N,W+/N)
                        @ 02,41 SAY "EMP:"
                        @ 02,46 SAY emp PICT "@!S35"
                        @ 03,00 SAY alltrim("END..:")
                        @ 03,col() say " "
                        @ 03,col() say alltrim(end) PICT "@!S35" 
                        @ 03,col() say " - "
                        @ 03,col() SAY alltrim(bairro) PICT "@!S20"
                        @ 03,col() say " - "
                        @ 03,col() SAY alltrim(CIDADE) PICT "@!S15"
                        @ 03,col() say " - "
                        @ 03,col() SAY UF
                        @ 04,00 say "CEP..:"
                        @ 04,07 say alltrim(cep)
                        @ 04,col() say " - "
                        @ 04,col() say alltrim(ddd)
                        @ 04,col() say " - "
                        @ 04,col() say alltrim(TEL1)
                        @ 04,col() say " - "
                        SET COLOR TO N/W
                        @ 04,col() SAY "CONFIRMA DADOS DO CLIENTE             " 
                        SET COLOR TO N*/W
                        @ 04,74 SAY "S/N ?"
                        DO WHILE ACAO<>"S" .and. ACAO<>"N"
                                STORE ' ' TO MSGERRO
                                WAIT TO ACAO
                                if acao="N"
                                        SET CONSOLE OFF
                                        WAIT
                                         SET COLOR TO W
                                           @ 04,10 CLEAR TO 07,79
                                           *@ 06,01 CLEAR TO 06,78
                                           *@ 07,01 CLEAR TO 07,78
                                        LOOP
                                ENDIF
                                IF ACAO="S"                        
                                        SET COLOR TO W
                                        @ 04,69 SAY "CONFIRMADO"
                                        RETURN
                                ENDIF
                        ENDDO

        CASE OP=0
                              pesquisaERRO=1
                                         SET COLOR TO W
                                           @ 05,10 CLEAR TO 22,79
                                           *@ 06,01 CLEAR TO 22,78
                RETURN
ENDCASE
ENDDO   

