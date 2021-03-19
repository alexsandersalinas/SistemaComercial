*---------------------------------------------------*
* NOTI1.PRG - INCLUSAO DE NOTA FISCAL
* AUTOR: ALEXSANDER SALINAS - SALINAS@STARMEDIA.COM
* DATA: 12-11-1999
*---------------------------------------------------*
* ALTERADO ANTERIOR: 
* ULTIMA ALTERA€ÇO: 05/10/2001

*--->limpando tela

        SET COLOR TO (W/R,W/B)
                @ 04,01 CLEAR TO 04,78
        SET COLOR TO (W/B,W/B)
                @ 05,01 CLEAR TO 23,78

SET DATE BRITISH
SET EXCLUSIVE OFF
DO WHILE .T.

*-------> programa chamando variaveis
                
                ETDATA   = DATE()
                SDDATA   = DATE()
                lNTNUM   = 0
                lEMISSAO = ETDATA
                lSAIDA   = SDDATA
                lVENC    = lEMISSAO

                lOSAIDA   = SPACE(1)
                lOPERACAO = SPACE(27)
                lCFOP     = SPACE(4)
                lNCLIEN   = 0
                lNTOTAL   = 0
                lTOTAL    = 0
                lTOTAL1   = 0
                lTOTAL2   = 0
                lTOTAL3   = 0
                lTOTAL4   = 0
                lTOTAL5   = 0
                lTOTAL6   = 0
                lTOTAL7   = 0
                lTOTAL8   = 0
                lTOTAL9   = 0
                lTOTAL10  = 0
                
                
                lSTOTAL   = 0
                lSTOTAL1  = 0
                lSTOTAL2  = 0
                lSTOTAL3  = 0
                lSTOTAL4  = 0
                lSTOTAL5  = 0
                lSTOTAL6   = 0
                lSTOTAL7  = 0
                lSTOTAL8  = 0
                lSTOTAL9  = 0
                lSTOTAL10 = 0
                
                lDESC1    = SPACE(85)
                lUN1      = SPACE(2)
                lQTDA1    = 0
                lUNIT1    = 0

                lDESC2    = SPACE(85)
                lUN2      = SPACE(2)
                lQTDA2    = 0
                lUNIT2    = 0

                lDESC3    = SPACE(85)
                lUN3      = SPACE(2)
                lQTDA3    = 0
                lUNIT3    = 0

                lDESC4    = SPACE(85)
                lUN4      = SPACE(2)
                lQTDA4    = 0
                lUNIT4    = 0
 
                lDESC5    = SPACE(85)
                lUN5      = SPACE(2)
                lQTDA5    = 0
                lUNIT5    = 0
                
                lDESC6    = SPACE(85)
                lUN6      = SPACE(2)
                lQTDA6    = 0
                lUNIT6    = 0

                lDESC7    = SPACE(85)
                lUN7      = SPACE(2)
                lQTDA7    = 0
                lUNIT7    = 0

                lDESC8    = SPACE(85)
                lUN8      = SPACE(2)
                lQTDA8    = 0
                lUNIT8    = 0



                lTICMS    = 0
                *
                lSERV1    = SPACE(85)
                lSUN1     = SPACE(2)
                lSQTDA1   = 0
                lSUNIT1   = 0

                lSERV2=SPACE(85)    
        lSUN2=SPACE(2)
        lSQTDA2=0
        lSUNIT2=0

        lSERV3=SPACE(85)
        lSUN3=SPACE(2)
        lSQTDA3=0
        lSUNIT3=0

        lSERV4=SPACE(85)
        lSUN4=SPACE(2)
        lSQTDA4=0
        lSUNIT4=0

        lSERV5=SPACE(85)
        lSUN5=SPACE(2)
        lSQTDA5=0
        lSUNIT5=0

               lSERV6    = SPACE(85)
                lSUN6     = SPACE(2)
                lSQTDA6   = 0
                lSUNIT6   = 0

                lSERV7=SPACE(85)    
        lSUN7=SPACE(2)
        lSQTDA7=0
        lSUNIT7=0


 lNTOBS=SPACE(51)
 lNTOBS2=SPACE(55)
 lOBSERV=SPACE(51)
 lOBSERV2=SPACE(55)

        lICMS1=0
        lVALICMS1=0
        lICMS2=0
        lVALICMS2=0
        lICMS3=0
        lVALICMS3=0
        lICMS4=0
        lVALICMS4=0
        lICMS5    = 0
        lVALICMS5 = 0
        lICMS6=0
        lVALICMS6=0
        lICMS7=0
        lVALICMS7=0
        lICMS8=0
        lVALICMS8=0


                lDIAS=0
 lICMS=0
 lCICMS=0
 lISS=0
 lVALORICMS=0
 lTRANSNOM=SPACE(30)
 lTRANSPL=SPACE(7)
 lTRANSUF=SPACE(2)
 lTCGCPF=SPACE(18)
 lTRANIE=SPACE(15)
 lTRANSEND=SPACE(25)
 lTRANPUF=SPACE(2)
 lTRANSCID=SPACE(15) 
 lTRANSQTD=0
 lTRANSESP=SPACE(2)
 lTMARCA=SPACE(15)
 lTRASNUM=0
 lTRPBRT=SPACE(6)
 lTRPLQ=SPACE(6)
 lFRETE=SPACE(1)
 lvariavelDIF=space(6)
 ACAO=" "
   ACAO2=" "
   ACAO3=" "
   OPCAO0="  "
   REG=0
   pesquisaERRO=0
   lREFNT=0
   lREFEMS=SPACE(8)
   lNPEDIDO := SPACE(5)
   lNVENDDOR :=SPACE(15)
   lTIPOFATURA :=SPACE(1)
*******FINAL
        *
        SELE 4
        USE dbCLI1 SHARED 
        SELE 3
        USE dbCLI2 SHARED
        SELE 2
        USE dbNOT2 SHARED
                REG2=RECCOUNT()
        SELE 1
        USE dbNOT1 SHARED
                REG1=RECCOUNT()

                 SAVE SCRE TO INICIO
                        SET COLOR TO (W/B,W/B)
                           @ 01,00 SAY "INCLUSÇO| DIGITE O NUMERO DA NOTA FISCAL.                  "
                           varREG=(REG1+REG2)
                           @ 04,68 SAY varREG
                           @ 04,62 SAY "Registros:"

SET COLOR TO (W/N,W/N)
   @ 02,00 CLEAR TO 02,80
   @ 02,00 SAY "NF N§:"GET lNTNUM PICT "9999"
   * 05,13 CLEAR TO 05,78
   @ 03,00 CLEAR TO 22,78
************ CARREGANDO TELA 
     *                   SET COLOR TO (W/B,W/B)
     *                   @ 08,01 TO 08,78
     *                   @ 08,02 SAY " EMISSÇO "
     *                   @ 08,18 SAY "ENTR/SAIDA"
     *                   @ 08,29 SAY " VENCIMENTO "
     *                   @ 08,52 SAY " OPERA€ÇO "
     *                   @ 10,01 TO 10,78
     *                   @ 10,37 SAY "Â"
     *                          @ 11,37 SAY "³"
     *                           @ 12,37 SAY "³"
     *                           @ 13,37 SAY "³"
     *                           *@ 14,37 SAY "³"
     *                                   @ 14,01 TO 14,78
     *                           @ 14,37 SAY "Á"
     *                                   @ 17,01 TO 17,78
     *                           @ 17,02 SAY " TRANSPORTADOR "
                                READ
                IF lntnum=0
                        CLOSE ALL
                        RESTSCREEN(00,00,24,80,SUB4)
                        return
                endif
        SELE 1
        USE dbNOT1 INDEX ntxNNF1 shared
        SEEK lNTNUM
                IF FOUND()
                    SET COLOR TO (W/R,W/R)
                    @ 24,00 SAY " NUMERO JA' EXISTE. Pressione qualquer tecla. "
                    SET CONSOLE OFF
                    WAIT
                    LOOP
                    SET CONSOLE ON
                 ENDIF
        SELE 2    
        USE dbNOT2 INDEX ntxNNF2 SHARED
        SEEK lNTNUM
                IF FOUND()
                   SET color to (W/R,W/R)
                    @ 04,10 SAY "NUMERO JA' EXISTE. Pressione qualquer tecla. "
                     SET CONSOLE OFF
                     WAIT
                        LOOP
                        SET CONSOLE ON
                ENDIF
SET COLOR TO (W/N,W/N)
*
PESQUISA=SAVESCREEN(00,00,24,80)
DO NOTC0         

IF pesquisaERRO=1
   LOOP
ENDIF
IF pesquisaERRO#1
************** CAMPOS DE DATAS
   
 
   SET COLOR TO (W/R,W/R)
  
   
   SET COLOR TO (W/N,W/N)
   @ 05,00 TO 05,80
   @ 05,02 SAY " EMISSÇO "
   @ 05,18 SAY "ENTR/SAIDA"
   @ 05,29 SAY " VENCIMENTO "
   @ 05,52 SAY " OPERA€ÇO "
                        @ 07,00 TO 07,80
                        @ 09,37 SAY "Â"
                        @ 10,37 SAY "³"
                        @ 11,37 SAY "³"
                        @ 12,37 SAY "³"
                        @ 13,37 SAY "³"
                        @ 13,00 TO 13,78
                        @ 09,00 TO 09,78
                        @ 09,37 SAY "Â"
                        @ 13,37 SAY "Á"
                        @ 16,00 TO 16,78
                        @ 16,02 SAY " TRANSPORTADOR "
                        
   @ 06,02 GET lemissao PICT "99/99/9999"
   @ 06,16 GET lsaida PICT "99/99/9999"
   @ 06,30 SAY "  /  /  "
   READ
        SAVE SCRE TO ATEDATA
                DO NOTT1
   SET COLOR TO (W/B,W/B)
                SET COLOR TO W
       *         @ 11,02 SAY "OPERA€ÇO:"
                ** VARIAVEL DATA
                lVENC=(lEMISSAO+lDIAS)
                @ 06,30 SAY lVENC
       
       SAVE SCRE TO atoperacao
                INKEY(1)
               DO NOTT2
                ***VARIAVEL OPERACAO
                SET COLOR TO W
                @ 06,42 SAY lOPERACAO

 SET COLOR TO (W/N,W/N)
 @ 08,00 SAY "PEDIDO N§:"GET lNPEDIDO PICT "99999"
 @ 08,17 SAY "VENDEDOR(A)"GET lNVENDDOR PICT "@!" 
 SAVE SCRE TO LOGICA
 READ
************* ESTRUTURA P/ DESCRICAO DO PRODUTO

***** NOTTD1.PRG  - DESCRICAO DE VENDAS E REMESSA P/ CONSERTO
            IF lOPERACAO="VENDA" .OR. lOPERACAO="VENDA FORA DO ESTADO" 
            DO NOTTD1
             
             ENDIF
***** FIM NOTTD1

****** NOTTD2.PRG  - NOTA DE SOFTWARE C/ SUPORTE FISICO DIFERENCA - NORMAL
             IF lvariavelDIF="NORMAL"; 
             .OR. lOPERACAO="DEVOLU€ŽO DE SOFTWARE" .OR. lOPERACAO="DEVOLU€ŽO DE SOFTWARE F/ESTADO"
                        DO NOTTD2
             ENDIF
***** NOTTD3.PRG - SERVi€OS -REMESSA LOC - NOTA SOFTWARE MLP
        IF lOPERACAO="PRESTA€ŽO DE SERVI€O" .OR. lOPERACAO="PRESTA€ŽO DE SERVI€O F/ESTADO"; 
             .OR. lvariavelDIF="MOLP" .OR. lOPERACAO="COMISSAO DE VENDA";
             .OR. lOPERACAO="DEVOLU€ŽO DE LOCA€ŽO" .OR. lOPERACAO="DEVOLI€ŽO DE LOCA€ŽO F/ESTADO";
             .OR. lOPERACAO="DEV. SOFTWARE OPEN NO ESTADO" .OR. lOPERACAO="DEV. SOFTWARE OPEN F/ESTADO"
             DO NOTTD3
               lSTOTAL=(lSTOTAL1+lSTOTAL2+lSTOTAL3+lSTOTAL4+lSTOTAL5+lSTOTAL6+lSTOTAL7+lSTOTAL8+lSTOTAL9+lSTOTAL10)
               lCICMS=lTOTAL
       ENDIF
***** FIM NOTTD3
***** NOTTD4
      SAVE SCRE TO LOGICA
       IF lOPERACAO="DEVOLU€ŽO DE MERCADORIA" .OR. lOPERACAO="DEVOLU€ŽO DE MERCADORIA F/ESTADO";                   
        .OR. lOPERACAO="REMESSA PARA CONSERTO NO ESTADO" .OR. lOPERACAO="REMESSA PARA CONSERTO F/ESTADO";
        .OR. lOPERACAO="REMESSA PARA LOCA€ŽO" .OR.lOPERACAO="REMESSA PARA LOCA€ŽO F/ESTADO";
        .OR. lOPERACAO="REMESSA PARA DEMONSTRA€ŽO" .OR. lOPERACAO="REMESSA PARA DEMONSTRA€ŽO F/ESTADO";
        .OR. lOPERACAO="REMESSA PARA TROCA" .OR. lOPERACAO="REMESSA PARA TROCA F/ESTADO";
        .OR. lOPERACAO="DEVOLU€ŽO DE CONSERTO" .OR. lOPERACAO="DEVOLU€ŽO DE CONSERTO F/ESTADO";
        .OR. lOPERACAO="DEVOLU€ŽO DE DEMONSTRA€ŽO" .OR. lOPERACAO="DEVOLU€ŽO DE DEMONSTRA€ŽO F/ESTADO";
        .OR. lOPERACAO="DEVOLU€ŽO DE TROCA" .OR. lOPERACAO="DEVOLU€ŽO DE TROCA F/ESTADO";        
        .OR. lOPERACAO="SIMPLES REMESSA" .OR. lOPERACAO="SIMPLES REMESSA F/ESTADO";
        .OR. lOPERACAO="BRINDE" .OR. lOPERACAO="BRINDE F/ESTADO"
         DO NOTTD4
      ENDIF
***** FIM NOTTD4
*---> NOTTD5 - INCLUSAO NOTA COMPLEMENTAR                        
      IF lOPERACAO="NOTA FISCAL COMPLEMENTAR" .OR. lOPERACAO="NOTA FISCAL COMPLEMENTAR F/ESTADO"
       DO NOTTD5
IF pesquisaERRO=1
   LOOP
ENDIF
IF pesquisaERRO#1
     SET COLOR TO W
        @ 06,30 SAY lVENC
        @ 06,42 SAY lOPERACAO
                 SET COLOR TO BG+        
                          @ 10,40 say alltrim("BASE DE CALCULO DO ICMS:")
                          @ 10,col() say " " 
                          @ 10,col() GET lCICMS PICT "999,999.99"
                 SET COLOR TO BR+
                          @ 11,40 SAY alltrim("VALOR DO ICMS..........:")
                          @ 11,col() say " " 
                          @ 11,col() SAY lVALORICMS PICT "999,999.99"
                 SET COLOR TO R+
                          @ 12,40 SAY alltrim("N§  DA N/F .........:")
                          @ 12,col() say " " 
                          @ 12,col() SAY lREFNT
                          @ 12,col() say " "
                          @ 12,col() say alltrim("DE")
                          @ 12,col() say " " 
                          *@ 12,col() say lREFEMS
READ
                          
        *lNTNUM=lGARDA
ENDIF
       ENDIF
                        SET COLOR TO BG+
                        @ 10,02 SAY alltrim("TOTAL DO PRODUTO:")
                        @ 10,col() say " " 
                        @ 10,COL() say lTOTAL PICT "999,999,999.99"
                        *
                          @ 10,40 say alltrim("BASE DE CALCULO DO ICMS:")
                          @ 10,col() say " " 
                          @ 10,col() SAY lCICMS PICT "999,999.99"

                        SET COLOR TO BR+
                        @ 11,02 SAY alltrim("TOTAL DE SERVICO:")
                        @ 11,col() say " " 
                        @ 11,col() say lSTOTAL PICT "999,999,999.99"
                        *
                                @ 11,40 SAY alltrim("VALOR DO ISS...........:")
                                  lISS=((lSTOTAL*0.5)/100)
                                @ 11,col() say " "
                                @ 11,COL() SAY lISS PICT "999,999.99"

                        SET COLOR TO R+
                        @ 12,02 SAY alltrim("TOTAL DA NOTA...:")
                                lNTOTAL=(lTOTAL+lsTOTAL)
                                @ 12,col() say " "
                                @ 12,col() say lNTOTAL PICT "999,999,999.99" 
                            *
                          @ 12,40 SAY alltrim("VALOR DO ICMS..........:")
                          @ 12,col() say " " 
                          @ 12,col() SAY lVALORICMS PICT "999,999.99"


                                  *@ 10,40 SAY "VALOR DO ISS...........:"
                                  *        lISS=((lSTOTAL*0.5)/100)
                                  *@ 10,68 SAY lISS PICT "999,999.99"
                                *@ 11,40 say "BASE DE CALCULO DO ICMS:"
                                  *  @ 12,40 SAY "VALOR DO ICMS..........:"
                                *@ 11,68 SAY lCICMS PICT "999,999.99"
                                *@ 12,68 SAY lVALORICMS PICT "999,999.99"
             
             *     SET COLOR TO R
             *     @ 12,02 SAY "TOTAL DA NOTA:"
             *           lNTOTAL=(lTOTAL+lsTOTAL)
             *    @ 12,20 SAY lNTOTAL PICT "999,999,999.99"

SET COLOR TO (W/N,W/N)
@ 14,00 SAY "OBS:"GET lNTOBS PICT "@!"
@ 15,00 GET lNTOBS2 PICT "@!"
READ
** FINALIZANDO **
********** TRANSPORTE DA NOTA FISCAL
                SET COLOR TO W/N,W/N
                        @ 17,00 SAY "NOME.:"
                        READ
                                @ 17,45 SAY "FRETE P/CONTA.:"
                                DO NOTT3
                
*********** TELA DE PERGUNTA SALVA S/N
                        variavelACAO=SPACE(1)
                        SET COLOR TO W/B
                        *@ 16,66 CLEAR TO 17,78
                        *@ 17,01 TO 17,78
                        *@ 17,02 SAY " TRANSPORTADOR "
                        SET COLOR TO (W/N,W/N)
                                @ 22,17 CLEAR TO 23,61
                                SET COLOR TO (W/R,W/R)
                                @ 20,16 CLEAR TO 22,60
                                @ 20,16 TO 22,60 DOUBLE
                                @ 21,17 SAY "          SALVA A NOTA FISCAL S/N? "
                                
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
                                
                                UNLOCK ALL
                        APPEND BLANK
                              REPL NTNUM WITH lNTNUM
                              REPL EMISSAO WITH lEMISSAO
                              REPL SAIDA WITH lSAIDA
                              REPL VENC WITH lVENC
                              REPL NCLIEN WITH lNCLIEN
                              REPL OPERACAO WITH lOPERACAO
                              REPL CFOP WITH lCFOP
                              REPL OSAIDA WITH lOSAIDA
                              REPL DESC1 WITH lDESC1
                              REPL UN1 WITH lUN1
                              REPL QTDA1 WITH lQTDA1
                              REPL UNIT1 WITH lUNIT1
                              REPL TOTAL1 WITH lTOTAL1
                              REPL DESC2 WITH lDESC2
                              REPL UN2 WITH lUN2
                              REPL QTDA2 WITH lQTDA2
                              REPL UNIT2 WITH lUNIT2
                              REPL TOTAL2 WITH lTOTAL2
                              REPL DESC3 WITH lDESC3
                              REPL UN3 WITH lUN3
                              REPL QTDA3 WITH lQTDA3
                              REPL UNIT3 WITH lUNIT3
                              REPL TOTAL3 WITH lTOTAL3
                              REPL DESC4 WITH lDESC4
                              REPL UN4 WITH lUN4
                              REPL QTDA4 WITH lQTDA4
                              REPL UNIT4 WITH lUNIT4
                              REPL TOTAL4 WITH lTOTAL4
                              REPL DESC5 WITH lDESC5
                              REPL UN5 WITH lUN5
                              REPL QTDA5 WITH lQTDA5
                              REPL UNIT5 WITH lUNIT5
                              REPL TOTAL5 WITH lTOTAL5

                              REPL DESC6 WITH lDESC6
                              REPL UN6 WITH lUN6
                              REPL QTDA6 WITH lQTDA6
                              REPL UNIT6 WITH lUNIT6
                              REPL TOTAL6 WITH lTOTAL6
                              REPL DESC7 WITH lDESC7
                              REPL UN7 WITH lUN7
                              REPL QTDA7 WITH lQTDA7
                              REPL UNIT7 WITH lUNIT7
                              REPL TOTAL7 WITH lTOTAL7
                              REPL DESC8 WITH lDESC8
                              REPL UN8 WITH lUN8
                              REPL QTDA8 WITH lQTDA8
                              REPL UNIT8 WITH lUNIT8
                              REPL TOTAL8 WITH lTOTAL8

                              REPL TOTAL WITH lTOTAL
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

                              REPL NTOTAL WITH lNTOTAL 
                              REPL ICMS WITH lICMS, CICMS WITH lCICMS, ISS WITH lISS
                              REPL VALORICMS WITH lVALORICMS
                              *, UN1 WITH lUN1, UN2 WITH lUN2
                              *REPL UN3 WITH lUN3, UN4 WITH lUN4, UN5 WITH lUN5
                             * REPL SUN1 WITH lSUN1, SUN2 WITH lSUN2, SUN3 WITH lSUN3
                              *REPL SUN4 WITH lSUN4
                              REPL TRANSNOM WITH lTRANSNOM, TRANSPL WITH lTRANSPL
                              REPL TRANSUF WITH lTRANSUF, TCGCPF WITH lTCGCPF, TRANIE WITH lTRANIE
                              REPL TRANSEND WITH  lTRANSEND, TRANPUF WITH lTRANPUF, TRANSCID WITH lTRANSCID
                              REPL TRANSQTD WITH lTRANSQTD, TRANSESP WITH lTRANSESP, TMARCA WITH lTMARCA
                              REPL TRASNUM WITH lTRASNUM
                              REPL TRPBRT WITH lTRPBRT
                              REPL TRPLQ WITH lTRPLQ
                              REPL FRETE WITH lFRETE, NTOBS WITH lNTOBS, NTOBS2 WITH lNTOBS2
                              REPL OBSERV WITH lOBSERV, OBSERV2 WITH lOBSERV2
                              REPL ICMS1 WITH lICMS1
                              REPL VALICMS1 WITH lVALICMS1
                              REPL ICMS2 WITH lICMS2
                              REPL VALICMS2 WITH lVALICMS2
                              REPL ICMS3 WITH lICMS3
                              REPL VALICMS3 WITH lVALICMS3
                              REPL ICMS4 WITH lICMS4
                              REPL VALICMS4 WITH lVALICMS4
                              REPL ICMS5 WITH lICMS5    
                              REPL VALICMS5 WITH lVALICMS5 
                              REPL ICMS6 WITH lICMS6    
                              REPL VALICMS6 WITH lVALICMS6 
                              REPL ICMS7 WITH lICMS7    
                              REPL VALICMS7 WITH lVALICMS7 
                              REPL ICMS8 WITH lICMS8    
                              REPL VALICMS8 WITH lVALICMS8 

                              REPL DIF WITH lvariavelDIF
                              REPL NPEDIDO WITH lNPEDIDO
                              REPL NVENDDOR  WITH lNVENDDOR

                              USE
                ENDIF 
ENDIF
ENDDO

