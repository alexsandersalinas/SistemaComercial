*---------------------------------------------------*
* RTA1.PRG - ALTERACAO DA ORDEM DE SERVI€O
* AUTOR: ALEXSANDER SALINAS - SALINAS@STARMEDIA.COM
* DATA: 12-11-1999
* ATUALIZADO: 10/01/2001
*---------------------------------------------------*
*--->limpando tela

        SET COLOR TO (W/R,W/B)
                @ 04,01 CLEAR TO 04,78
        SET COLOR TO (W/N,W/N)
                @ 05,01 CLEAR TO 23,78

SET DATE BRITISH
SET EXCLUSIVE OFF
DO WHILE .T.

*-------> programa chamando variaveis
                
                ETDATA   = DATE()
                SDDATA   = DATE()
                lRTNUM   = SPACE(4)
                checkCLIENTE=SPACE(20)
                pesquisaERRO=0
*******FINAL
        *
        SELE 4
        USE dbCLI1 SHARED 
        SELE 3
        USE dbCLI2 SHARED
        * SELE 2
        * USE dbRT SHARED
        *        REG2=RECCOUNT()
        SELE 1
        USE dbRT SHARED
                REG1=RECCOUNT()

                 SAVE SCRE TO INICIO
                        SET COLOR TO (W/B,W/B)
                           @ 01,00 SAY "ALTERA€ÇO| DIGITE O NUMERO DA ORDEM DE SERVI€O.                  "

SET COLOR TO (W/N,W/N)
   @ 02,00 CLEAR TO 24,80
   @ 02,00 SAY "OS N§:"GET lRTNUM PICT "9999"
   * 05,13 CLEAR TO 05,78
   @ 03,00 CLEAR TO 22,78
                           set color to w
                           @ 24,60 SAY alltrim("Registros:")
                           @ 24,col() say REG1
                                
                                READ
                IF lRTNUM=space(4)
                        CLOSE ALL
                        RESTSCREEN(00,00,24,80,JLTELA)
                        return
                endif
        SELE 1
        USE dbRT INDEX ntxRT1 shared
        SEEK lRTNUM
                IF .NOT. FOUND()
                    SET COLOR TO (W/R,W/R)
                    @ 24,00 SAY " NUMERO NAO EXISTE. Pressione qualquer tecla. "
                    SET CONSOLE OFF
                    WAIT
                    LOOP
                    SET CONSOLE ON
                 ENDIF
        *SELE 2    
        *USE dbNOT2 INDEX ntxNNF2 SHARED
        *SEEK lRTNUM
        *        IF FOUND()
        *           SET color to (W/R,W/R)
        *            @ 04,10 SAY "NUMERO JA' EXISTE. Pressione qualquer tecla. "
        *             SET CONSOLE OFF
        *             WAIT
        *                LOOP
        *                SET CONSOLE ON
        *        ENDIF

                lENTRADA = ENTRADA
                lSAIDA   = SAIDA
                lPRONTO  = PRONTO
                lAP      = AP
                lMODELO  = MODELO       
                lNS      = NS
                lMARCA   = MARCA
                lACESS   = ACESS
                lDEF     = DEFEITO
                lOBS     = OBS
                lVISITA  = VISITA
                lMOBRA   = MOBRA
                lDIAS    =  0
                lPRIORIDADE = PRIORIDADE
                lNCLIEN = ID
                lSTOTAL  = STOTAL
                lTOTAL   = TOTAL

checkCLIENTE=lNCLIEN
PESQUISA=SAVESCREEN(00,00,24,80)
DO RTC1         

IF pesquisaERRO=1
   LOOP
ENDIF
IF pesquisaERRO#1

************** CAMPOS DE DATAS
   SET COLOR TO (W/N,W/N)
   @ 06,00 SAY "ENTRADA...............:"GET lentrada PICT "99/99/9999"
   @ 07,00 SAY "APARELHO..............:"GET lAP PICT "@!" 
   @ 08,00 SAY "MODELO................:"GET lMODELO PICT "@!"
   @ 09,00 SAY "N/S...................:"GET lNS PICT "@!" 
   @ 10,00 SAY "MARCA.................:"GET lMARCA PICT "@!"
   @ 11,00 SAY "ACESSORIOS............:"GET lACESS PICT "@!"
   @ 12,00 SAY "DEFEITO RECLAMADO.....:"GET lDEF PICT "@!"
   @ 13,00 SAY "OBS...................:"GET lOBS PICT "@!"
   @ 14,00 SAY "TAXA DE VISITA........:"GET lVISITA PICT "999,999,999.99"
   @ 15,00 SAY "MAO DE OBRA...........:"GET lMOBRA PICT "999,999,999.99"
   @ 16,00 SAY "PRIORIDADE............:"GET lPRIORIDADE PICT "99/99/9999"
   @ 17,00 SAY "PRONTO................:"
   @ 17,25 SAY lPRONTO PICT "99/99/9999"
   @ 18,00 SAY "SAIDA.................:"
   @ 18,25 SAY lSAIDA PICT "99/99/9999"
   @ 19,00 SAY "TOTAL DO SERVI€O......:"
   @ 19,25 SAY lTOTAL PICT "999,999,999.99"
   READ


*********** TELA DE PERGUNTA SALVA S/N
                        variavelACAO=SPACE(1)
                        SET COLOR TO (W/N,W/N)
                                @ 22,17 CLEAR TO 23,61
                                SET COLOR TO (W/R,W/R)
                                @ 20,16 CLEAR TO 22,60
                                @ 20,16 TO 22,60 DOUBLE
                                @ 21,17 SAY "          SALVA A ORDEM DE SERVI€O S/N? "
                                
                                DO WHILE variavelACAO<>"S" .AND. variavelACAO<>"N"    
                                        WAIT TO variavelACAO
                                ENDDO

                      if variavelACAO="S"
                      @ 21,17 SAY "               Salvando ....         "
                        INKEY(1)
                               
                                 SELE 1
                                IF REG1 >3000
                                      SELE 2
                                ENDIF
                                
                           *     UNLOCK ALL
                           RLOCK()
                              REPL RTNUM WITH lRTNUM
                              REPL ENTRADA WITH lENTRADA
                              *REPL SAIDA WITH lSAIDA
                              REPL PRIORIDADE WITH lPRIORIDADE
                              REPL ID WITH lNCLIEN
                              REPL AP WITH lAP
                              REPL MODELO WITH lMODELO
                              REPL NS WITH lNS
                              REPL MARCA WITH lMARCA
                              REPL DEFEITO WITH lDEF
                              REPL ACESS WITH lACESS
                              REPL OBS WITH lOBS
                              REPL VISITA WITH lVISITA
                              REPL MOBRA WITH lMOBRA
                              USE
                ENDIF 
ENDIF
ENDDO

