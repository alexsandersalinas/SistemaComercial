*---------------------------------------------------*
* RTI1.PRG - INCLUSAO DE RELATORIO TECNICO
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
                
                variavelSAIDA = SPACE(1)
                variavelACAO  = SPACE(1)
                ETDATA   = DATE()
                SDDATA   = DATE()
                lRTNUM   = SPACE(4)
                lPRONTOO   = CTOD("  /  /    ")
                checkCLIENTE=SPACE(20)
                pesquisaERRO=0
                lPOSSICAO = SPACE(1)
                lPOSSICAO2= SPACE(1)
                lTECNICO  = SPACE(30)
                AG = 0
                lTOTAL    = 0
                lSTOTAL   = 0
                
                lSERV1    = SPACE(85)
                lSQTDA1   = 0
                lSUNIT1   = 0
                lSTOTAL1  = 0 

                lSERV2    = SPACE(85)    
                lSQTDA2   = 0
                lSUNIT2   = 0
                lSTOTAL2  = 0
                
                lSERV3    = SPACE(85)
                lSQTDA3   = 0
                lSUNIT3   = 0
                lSTOTAL3  = 0

                lSERV4    = SPACE(85)
                lSQTDA4   = 0
                lSUNIT4   = 0
                lSTOTAL4  = 0

                lSERV5    = SPACE(85)
                lSQTDA5   = 0
                lSUNIT5   = 0
                lSTOTAL5  = 0

                lSERV6    = SPACE(85)
                lSQTDA6   = 0
                lSUNIT6   = 0
                lSTOTAL6  = 0

                lSERV7    = SPACE(85)    
                lSQTDA7   = 0
                lSUNIT7   = 0
                lSTOTAL7  = 0
                lSAIDAA    = CTOD("  /  /    ") 
                lPSAIDA    = CTOD("  /  /    ") 
                
                
                            

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
                           @ 01,00 SAY "POSSI€ÇO| DIGITE O NUMERO DA ORDEM DE SERVI€O.      "
                           varREG=(REG1)
                           @ 04,68 SAY varREG
                           @ 04,62 SAY "Registros:"

SET COLOR TO (W/N,W/N)
   @ 02,00 CLEAR TO 24,80
   @ 02,00 SAY "OS N§:"GET lRTNUM PICT "9999"
   * 05,13 CLEAR TO 05,78
   @ 03,00 CLEAR TO 22,78
                                READ
                IF lRTNUM=space(4)
                        CLOSE ALL
                        RESTSCREEN(00,00,24,80,SUB21)
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

                lTECNICO  = TECNICO
                lENTRADA = ENTRADA
                lSAIDA   = SAIDA
                lAP      = AP
                lMODELO  = MODELO       
                lNS      = NS
                lMARCA   = MARCA
                lACESS   = ACESS
                lDEF     = DEFEITO
                lOBS     = OBS
                lDIAS    =  0
                lPRIORIDADE = PRIORIDADE
                lNCLIEN = ID
                lCONST1 = CONST1
                lCONST2 = CONST2
                lVISITA  = VISITA
                lMOBRA   = MOBRA
                lTOTAL  = TOTAL
                lSTOTAL = STOTAL
                lIDNOME = IDNOME
                        
                         lSERV1     = SERV1
                         lSQTDA1    = SQTDA1
                         lSUNIT1    = SUNIT1
                         lSTOTAL1   = STOTAL1

                         lSERV2     = SERV2
                         lSQTDA2    = SQTDA2
                         lSUNIT2    = SUNIT2
                         lSTOTAL2   = STOTAL2

                         lSERV3     = SERV3
                         lSQTDA3    = SQTDA3
                         lSUNIT3    = SUNIT3
                         lSTOTAL3   = STOTAL3

                         lSERV4     = SERV4
                         lSQTDA4    = SQTDA4
                         lSUNIT4    = SUNIT4
                         lSTOTAL4   = STOTAL4

                         lSERV5     = SERV5
                         lSQTDA5    = SQTDA5
                         lSUNIT5    = SUNIT5
                         lSTOTAL5   = STOTAL5
                         
                         lSERV6     = SERV6
                         lSQTDA6    = SQTDA6
                         lSUNIT6    = SUNIT6
                         lSTOTAL6   = STOTAL6

                         lSERV7     = SERV7
                         lSQTDA7    = SQTDA7
                         lSUNIT7    = SUNIT7
                         lSTOTAL7   = STOTAL7
                         lPRONTO    = PRONTO
                         lSAIDA     = SAIDA
                         lPSAIDA    = PSAIDA
                         lALTERADO  = ALTERADO
                         lFINAL     = POSSICAO

                                             


checkCLIENTE=lNCLIEN
PESQUISA=SAVESCREEN(00,00,24,80)
DO RTC1         

IF pesquisaERRO=1
   LOOP
ENDIF
IF pesquisaERRO#1

************** CAMPOS DE DATAS
   
   SET COLOR TO (W/N,W+/N)
   @ 05,00 SAY ALLTRIM("ENTRADA:")
   @ 05,COL() SAY lENTRADA PICT "99/99/9999"
   @ 05,COL() SAY " "
   @ 05,COL() SAY ALLTRIM("PRIORIDADE:")
   @ 05,COL() SAY lPRIORIDADE PICT "99/99/9999"
   @ 05,COL() SAY " "
   @ 05,COL() SAY alltrim("APARELHO:")
   @ 05,COL() SAY lAP PICT "@!"
   @ 06,00 SAY AllTRIM("MODELO..:")
   @ 06,col() say ltrim(lmodelo)
   @ 06,col() say " "
   @ 06,col() say "N/S:"
   @ 06,col() say " "
   @ 06,col() say ltrim(lns)
   @ 07,00 say alltrim("MARCA...:")
   @ 07,COL() say ltrim(lmarca)
   
   @ 09,00 SAY "CONSTATADO......:"
   @ 10,00 SAY ":...............:"
   @ 11,00 SAY "TECNICO.........:"
   @ 12,00 SAY "VISITA..........:"
   @ 13,00 SAY "MAO DE OBRA.....:"
   @ 14,00 SAY "TOTAL DE PE€AS..:"
   @ 15,00 SAY "TOTAL DO SERVI€O."
   @ 16,00 SAY "PRONTO EM.......:"
   @ 17,00 SAY "DATA DE SAIDA...:"
   SET COLOR TO (R+/N,W+/N)
   @ 15,00 SAY "TOTAL DO SERVI€O:"
        SET COLOR TO (W/N,W+/N)
                @ 09,18 SAY lCONST1 
                @ 10,18 SAY lCONST2
                @ 11,18 SAY lTECNICO PICT "@!"
                @ 12,18 SAY lVISITA PICT "999,999,999.99"
                @ 13,18 SAY lMOBRA PICT "999,999,999.99"
                @ 14,18 SAY lSTOTAL PICT "999,999,999.99"
                @ 15,18 SAY lTOTAL PICT "999,999,999.99" 
                @ 16,18 SAY lPRONTO PICT "99/99/9999"
                @ 17,18 SAY lSAIDA PICT "99/99/9999"
                        SET COLOR TO (R+/N,W+/N)
                                        @ 15,18 SAY lTOTAL PICT "999,999,999.99"
                                SET COLOR TO (W/N,W+/N)   
                                        @ 16,00 SAY "PRONTO EM......:"
                                        @ 17,00 SAY "DATA DE SAIDA..:"
                                        IF lSAIDA#lSAIDAA
                                           SET COLOR TO R*
                                               @ 24,30 SAY "RT JA FINALIZADA!!!   "
                                               SET COLOR TO W
                                                        IF lALTERADO="S"
                                                                SET COLOR TO R
                                                                @ 17,30 SAY "DATA DE SAIDA ALTERADA!!!   "
                                                                SET COLOR TO W
                                                        ENDIF
                                        ENDIF


                                
                                
                                SET COLOR TO (W/N,N/W)
                                        @ 19,00 PROMPT ALLTRIM("ALTERAR")
                                        @ 20,00 PROMPT "FINALIZAR"
                                        @ 21,00 PROMPT "IMPRESSAO"
                        RTIP1=SAVESCREEN(00,00,24,80)
                        MENU TO AG
                                DO CASE
                                CASE AG=0
                                        RESTSCREEN(00,00,24,80,SUB21)
                                       RETURN
                                CASE AG=1
                                        do rtip2
                                CASE AG=2
                                          
                                          IF lFINAL#"S"
                                             SET COLOR TO R*
                                               @ 24,00 SAY "SEM POSSICAO ATE O MOMENTO... "
                                               INKEY(5)
                                               SET COLOR TO W
                                           ENDIF
                                           if lSAIDA#lPRONTOO
                                                SET COLOR TO (W+/R,W/R)                    
                                                @ 23,00 CLEAR TO 24,80
                                                @ 23,30 SAY "ORDEM DE SERVICO JA FINALIZADA"
                                                @ 24,50 SAY "IMPOSSIVEL ACESSO"
                                                INKEY(8)
                                                RETURN
                                           ENDIF
                                             
                                                
                                                        IF lFINAL="S"
                                                           SET COLOR TO (W/N,W+/N)
                                                           @ 17,00 SAY "DATA DE SAIDA...:"GET lSAIDAA PICT "99/99/9999"
                                                           READ
                                                           IF lSAIDA>=lPRONTO
                                                                SET COLOR TO R*
                                                                @ 24,00 SAY "DADO INREGULAR"
                                                                INKEY(5)
                                                                SET COLOR TO W
                                                                RETURN
                                                           ENDIF
                                                               lPOSSICAO2 = "X"

                                                      *********** TELA DE PERGUNTA SALVA S/N
                                                        variavelACAO=SPACE(1)
                                                        variavelSAIDA=SPACE(1)
                                                        SET COLOR TO (W/N,W/N)
                                                         @ 22,17 CLEAR TO 23,61
                                                        SET COLOR TO (W/R,W/R)
                                                        @ 20,16 CLEAR TO 22,60
                                                        @ 20,16 TO 22,60 DOUBLE
                                                        SET COLOR TO (W+/R,W/R)
                                                                @ 21,17 SAY "     SALVA A ORDEM DE SERVI€O S/N?        "
                                                                DO WHILE variavelACAO<>"S" .AND. variavelACAO<>"N"    
                                                                        WAIT TO variavelACAO
                                                                ENDDO

                                                                if variavelACAO="S"
                                                                        @ 21,17 SAY "               Salvando ....         "
                                                                       INKEY(1)
                                                                     SELE 1
                                                                RLOCK()
                                                                REPL SAIDA WITH lSAIDAA
                                                                REPL POSSICAO WITH lPOSSICAO2

                                                                        USE
                                                                ENDIF 
                                                          ENDIF
                                                *ENDIF
                                        *endif
                                        
                                CASE AG=3
                                        *  DO NOTE1
                                CASE AG=4
                                        *       DO SUB44
                                CASE AG=5
                                        *  DO sub45
                                ENDCASE
                
                
      ENDIF
ENDDO

