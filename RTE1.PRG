*---------------------------------------------------*
* RTE1.PRG - EXCLUSAO DA ORDEM DE SERVICO
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
                variavelACAO=SPACE(1)

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
        USE dbRT EXCLUSIVE
                REG1=RECCOUNT()

                 SAVE SCRE TO INICIO
                        SET COLOR TO (W/B,W/B)
                           @ 01,00 SAY "EXCLUSÇO| DIGITE O NUMERO DO RELATORIO TECNICO.                  "

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
        USE dbRT INDEX ntxRT1 EXCLUSIVE
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
*   FLOCK()                
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
   @ 06,00 SAY "ENTRADA...............:"
   @ 06,28 SAY lentrada PICT "99/99/9999"
   @ 07,00 SAY "APARELHO..............:"
   @ 07,28 SAY lAP PICT "@!" 
   @ 08,00 SAY "MODELO................:"
   @ 08,28 SAY lMODELO PICT "@!"
   @ 09,00 SAY "N/S...................:"
   @ 09,28 SAY lNS PICT "@!" 
   @ 10,00 SAY "MARCA.................:"
   @ 10,28 SAY lMARCA PICT "@!"
   @ 11,00 SAY "ACESSORIOS............:"
   @ 11,28 SAY lACESS PICT "@!"
   @ 12,00 SAY "DEFEITO RECLAMADO.....:"
   @ 12,28 SAY lDEF PICT "@!"
   @ 13,00 SAY "OBS...................:"
   @ 13,28 SAY lOBS PICT "@!"
   @ 14,00 SAY "TAXA DE VISITA........:"
   @ 14,28 SAY lVISITA PICT "999,999,999.99"
   @ 15,00 SAY "MAO DE OBRA...........:"
   @ 15,28 SAY lMOBRA PICT "999,999,999.99"
   @ 16,00 SAY "PRIORIDADE............:"
   @ 16,28 SAY lPRIORIDADE PICT "99/99/9999"
   @ 17,00 SAY "PRONTO................:"
   @ 17,25 SAY lPRONTO PICT "99/99/9999"
   @ 18,00 SAY "SAIDA.................:"
   @ 18,25 SAY lSAIDA PICT "99/99/9999"
   @ 19,00 SAY "TOTAL DO SERVI€O......:"
   @ 19,25 SAY lTOTAL PICT "999,999,999.99"
   
   READ


*********** TELA DE PERGUNTA EXCLUI S/N
                        variavelACAO=SPACE(1)
                        SET COLOR TO (W/N,W/N)
                                @ 22,17 CLEAR TO 23,61
                                SET COLOR TO (W/R,W/R)
                                @ 20,16 CLEAR TO 22,60
                                @ 20,16 TO 22,60 DOUBLE
                                @ 21,17 SAY "    EXCLUI ESTA ORDEM DE SERVI€O S/N? "
                                DO WHILE variavelACAO<>"S" .AND. variavelACAO<>"N"    
                                        WAIT TO variavelACAO
                                ENDDO

                      if variavelACAO="S"
                      @ 21,17 SAY "               Excluindo ....         "
                                  tro_Ani(21,52)
                      RLOCK()
                                 SELE 1
                                     DBDELETE()
                                 PACK
                       
                     ENDIF
                     ENDIF
                     ENDDO
                     
