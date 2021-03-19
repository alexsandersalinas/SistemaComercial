
checkSAIDA=space(1)
   if lSAIDAA=lSAIDA
      checkSAIDA="S"
   endif
     
SET COLOR TO W
@ 19,00 CLEAR TO 23,80
   
   SET COLOR TO (W/N,W+/N)
   * 17,00 CLEAR TO 17,80
   @ 09,00 SAY "CONSTATADO......:"GET lCONST1 PICT "@!"
   @ 10,00 SAY ":...............:"GET lCONST2 PICT "@!"
   @ 11,00 SAY "TECNICO.........:"GET lTECNICO PICT "@!"
   @ 12,00 SAY "VISITA..........:"GET lVISITA PICT "999,999,999.99"
   @ 13,00 SAY "MAO DE OBRA.....:"GET lMOBRA PICT "999,999,999.99"
   @ 14,00 SAY "TOTAL DE PE€AS..:"
   @ 14,18 SAY lSTOTAL PICT "999,999,999.99"
   @ 15,00 SAY "TOTAL DO SERVI€O:"
   @ 16,00 SAY "PRONTO EM.......:"
   @ 16,18 SAY lPRONTO PICT "99/99/9999" 
   @ 17,00 SAY "DATA DE SAIDA...:"
   @ 17,18 SAY lSAIDA PICT "99/99/9999" 
  

  READ
 
SAVE SCRE TO LOGICA
DO RTLP
 lTOTAL = (+lVISITA+lMOBRA+lSTOTAL)
 *@ 13,00 SAY "TOTAL DE PE€AS.:"
 *@ 14,00 SAY "TOTAL DO SERVI€O:"
 @ 14,18 SAY lSTOTAL PICT "999,999,999.99"
 @ 15,18 SAY lTOTAL PICT "999,999,999.99"
 SET COLOR TO (W/N,W+/N) 
 @ 16,00 SAY "PRONTO EM.......:"GET lPRONTO PICT "99/99/9999"
 @ 17,00 SAY "SAIDA EM........:"GET lSAIDA PICT "99/99/9999"
 READ
 *IF checkSAIDA="S" 
 *   lPSAIDA=LSAIDA
 *ENDIF
 *   IF lSAIDA#lSAIDAA 
 *      POSSICAO="S"
 *                       if checkSAIDA="S" 
 *                               lPSAIDA=lSAIDA
 *                       ENDIF
 *              
 *              IF lPOSSICAO = "S"
 *                       IF IPSAIDA # lSAIDA
 *                               lALTERADO="S"
 *                        ENDIF
 *               ENDIF
 *     ENDIF
      
      IF lPRONTO=lPRONTOO
        lPOSSICAO="A"
      ENDIF

      IF lPRONTO#lPRONTOO
          lPOSSICAO="S"           

      ENDIF

*********** TELA DE PERGUNTA SALVA S/N
                        variavelACAO=SPACE(1)
                        SET COLOR TO (W/N,W/N)
                                @ 22,17 CLEAR TO 23,61
                                SET COLOR TO (W/R,W/R)
                                @ 20,16 CLEAR TO 22,60
                                @ 20,16 TO 22,60 DOUBLE
                                @ 21,17 SAY "     SALVA O RELATORIO TECNICO S/N?    "
                                
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
                              REPL CONST1 WITH lCONST1
                              REPL CONST2 WITH lCONST2
                              REPL TECNICO WITH lTECNICO
                              REPL MOBRA WITH lMOBRA
                              REPL SERV1 WITH lSERV1, SQTDA1 WITH lSQTDA1, SUNIT1 WITH lSUNIT1
                              REPL STOTAL1 WITH lSTOTAL1
                              REPL SERV2 WITH lSERV2, SQTDA2 WITH lSQTDA2, SUNIT2 WITH lSUNIT2
                              REPL STOTAL2 WITH lSTOTAL2
                              REPL SERV3 WITH lSERV3, SQTDA3 WITH lSQTDA3, SUNIT3 WITH lSUNIT3
                              REPL STOTAL3 WITH lSTOTAL3
                              REPL SERV4 WITH lSERV4, SQTDA4 WITH lSQTDA4, SUNIT4 WITH lSUNIT4
                              REPL STOTAL4 WITH lSTOTAL4, SERV5 WITH lSERV5, SQTDA5 WITH lSQTDA5
                              REPL SUNIT5 WITH lSUNIT5, STOTAL5 WITH lSTOTAL5, STOTAL WITH lSTOTAL
                              REPL SERV6 WITH lSERV6, SQTDA6 WITH lSQTDA6
                              REPL SUNIT6 WITH lSUNIT6, STOTAL6 WITH lSTOTAL6
                              REPL SERV7 WITH lSERV7, SQTDA7 WITH lSQTDA7
                              REPL SUNIT7 WITH lSUNIT7, STOTAL7 WITH lSTOTAL7
                              REPL STOTAL WITH lSTOTAL
                              REPL TOTAL WITH lTOTAL 
                              REPL POSSICAO WITH lPOSSICAO
                              REPL ALTERADO WITH lALTERADO
                              REPL PRONTO WITH lPRONTO
                              REPL SAIDA WITH lSAIDA
                              REPL PSAIDA WITH lPSAIDA
                              USE
                ENDIF 

 
SET COLOR TO W
@ 19,00 CLEAR TO 23,80
SET COLOR TO (W/N,N/W)
@ 19,00 PROMPT "VOLTA"
@ 20,00 PROMPT "IMPRESSAO"
MENU TO AG 
    DO CASE
       CASE AG=1
            RETURN
       CASE AG=2
          DO RTIP2
    ENDCASE

