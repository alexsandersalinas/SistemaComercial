***************************************
* NOTE1.PRG - EXCLUSÇO DE NOTA FISCAL
* AUTOR: ALEXSANDER SALINAS SANTOS - SALINAS@STARMEDIA.COM
* DATA: 16-11-1999
*****************************************
*-----------LIMPANDO TELA

SET DATE BRITISH
SET EXCLUSIVE OFF
SET CENTURY ON
SET CONSOLE OFF
SET EXCLUSIVE ON

DO WHILE .T.
*------------------ INICIO DAS VARIAVEIS
   lNTNUM=0
   ACAO=" "
   ACAO2=" "
   ACAO3=" "
   OPCAO0="  "
   REG=0
   pesquisaERRO=0
   variavelACAO=SPACE(1) 
   variavelACAO2=SPACE(1) 
   vACAO3=SPACE(1) 
   lREFNT=0
   lREFEMS=SPACE(8)
   

********* FINAL 

        *
        SELE 4
        USE dbCLI1 SHARED 
        SELE 3
        USE dbCLI2 SHARED
        SELE 2
        USE dbNOT2 EXCLUSIVE
                REG2=RECCOUNT()
        SELE 1
        USE dbNOT1 EXCLUSIVE 
                REG1=RECCOUNT()

                 SAVE SCRE TO INICIO
                        SET COLOR TO W/B
                           @ 01,00 SAY "EXCLUSÇO| DIGITE O NéMERO DA NOTA FISCAL.                  "
                           varREG=(REG1+REG2)
                           @ 01,68 SAY varREG
                           @ 01,62 SAY "Registros:"

SET COLOR TO W/N
   @ 02,00 CLEAR TO 24,80                    
   @ 02,00 SAY "NF N§:"GET lNTNUM PICT "9999"
                READ
                IF lntnum=0
                        CLOSE ALL
                        RESTSCREEN(00,00,24,80,SUB4)
                        return
                endif
        
************* INICIO DA PESQUISA NO BANCO DE DADOS
              SELE 1
                  USE dbNOT1 INDEX ntxNNF1 EXCLUSIVE
                  seek lNTNUM
                  if found()
                        variavelCHECK=1
                  endif
                  IF .NOT. FOUND()
                       SELE 2
                        USE dbNOT2 INDEX ntxNNF2 EXCLUSIVE
                        seek lNTNUM
                           if found()
                                variavelCHECK=2
                           endif
                                IF .NOT. FOUND()
                                        SET COLOR TO W/R
                                        @ 24,01 SAY " NUMERO NAO EXISTE. Pressione qualquer tecla. "
                                        SET CONSOLE OFF
                                        WAIT
                                        LOOP
                                SET CONSOLE ON
                                ENDIF
                  ENDIF
**************** PROCURANDO POR VARIAVEIS
         lEMISSAO   = EMISSAO
         lSAIDA     = SAIDA
         lVENC      = VENC
         lNCLIEN    = NCLIEN
         lOPERACAO  = OPERACAO
         lVARIAVELDIF = DIF
         lOSAIDA    = OSAIDA
         lNTOTAL    = NTOTAL
         lTOTAL     = TOTAL
         lTOTAL1    = TOTAL1
         lTOTAL2    = TOTAL2
         lTOTAL3    = TOTAL3
         lTOTAL4    = TOTAL4
         lTOTAL5    = TOTAL5
         lTOTAL6    = TOTAL6
         lTOTAL7    = TOTAL7
         lTOTAL8    = TOTAL8

         lSTOTAL    = STOTAL
         lSTOTAL1   = STOTAL1
         lSTOTAL2   = STOTAL2
         lSTOTAL3   = STOTAL3
         lSTOTAL4   = STOTAL4
         lSTOTAL5   = STOTAL5
         lSTOTAL6   = STOTAL6
         lSTOTAL7   = STOTAL7

         lDESC1     = DESC1
         lUN1       = UN1
         lQTDA1     = QTDA1
         lUNIT1     = UNIT1
         lDESC2     = DESC2
         lUN2       = UN2
         lQTDA2     = QTDA2
         lUNIT2     = UNIT2
         lDESC3     = DESC3
         lUN3       = UN3
         lQTDA3     = QTDA3
         lUNIT3     = UNIT3
         lDESC4     = DESC4
         lUN4       = UN4
         lQTDA4     = QTDA4
         lUNIT4     = UNIT4
         lDESC5     = DESC5
         lUN5       = UN5
         lQTDA5     = QTDA5
         lUNIT5     = UNIT5

         lDESC6     = DESC6
         lUN6       = UN6
         lQTDA6     = QTDA6
         lUNIT6     = UNIT6
         lDESC7     = DESC7
         lUN7       = UN7
         lQTDA7     = QTDA7
         lUNIT7     = UNIT7
         lDESC8     = DESC8
         lUN8       = UN8
         lQTDA8     = QTDA8
         lUNIT8     = UNIT8

         lSERV1     = SERV1
         lSQTDA1    = SQTDA1
         lSUNIT1    = SUNIT1
         lSERV2     = SERV2
         lSQTDA2    = SQTDA2
         lSUNIT2    = SUNIT2
         lSERV3     = SERV3
         lSQTDA3    = SQTDA3
         lSUNIT3    = SUNIT3
         lSERV4     = SERV4
         lSQTDA4    = SQTDA4
         lSUNIT4    = SUNIT4
         lSERV5     = SERV5
         lSQTDA5    = SQTDA5
         lSUNIT5    = SUNIT5
         lSERV6     = SERV6
         lSQTDA6    = SQTDA6
         lSUNIT6    = SUNIT6
         lSERV7     = SERV7
         lSQTDA7    = SQTDA7
         lSUNIT7    = SUNIT7

         lCFOP      = CFOP
         lICMS      = ICMS
         lCICMS     = CICMS
         lISS       = ISS
         lVALORICMS = VALORICMS
         lFRETE     = FRETE
         lTRANSNOM  = TRANSNOM
         lTRANSPL   = TRANSPL
         lTRANSUF   = TRANSUF
         lTCGCPF    = TCGCPF
         lTRANIE    = TRANIE
         lTRANSEND  = TRANSEND
         lTRANPUF   = TRANPUF
         lTRANSCID  = TRANSCID 
         lTRANSQTD  = TRANSQTD
         lTRANSESP  = TRANSESP
         lTMARCA    = TMARCA
         lTRASNUM    = TRASNUM
         lTRPBRT    = TRPBRT
         lTRPLQ     = TRPLQ
         lNTOBS     = NTOBS
         lNTOBS2    = NTOBS2
         lOBSERV    = OBSERV
         lOBSERV2   = OBSERV2
         
        lICMS1      = ICMS1
        lVALICMS1   = VALICMS1
        lICMS2      = ICMS2
        lVALICMS2   = VALICMS2
        lICMS3      = ICMS3
        lVALICMS3   = VALICMS3
        lICMS4      = ICMS4
        lVALICMS4   = VALICMS4
        lICMS5      = ICMS5
        lVALICMS5   = VALICMS5
        lICMS6      = ICMS6
        lVALICMS6   = VALICMS6
        lICMS7      = ICMS7
        lVALICMS7   = VALICMS7
        lICMS8      = ICMS8
        lVALICMS8   = VALICMS8

*        lTICMS      = TICMS
        lNPEDIDO := NPEDIDO
        lNVENDDOR := NVENDDOR
*******FINAL
checkCLIENTE=NCLIEN
PESQUISA=SAVESCREEN(00,00,24,80)
DO NOTC1         

IF pesquisaERRO=1
   LOOP
ENDIF

** TELA COM INFORMACAO
                                SET COLOR TO (W/N,W/N)
                                @ 05,00 TO 05,80
                                @ 05,02 SAY " EMISSÇO "
                                @ 05,18 SAY " SAIDA "
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
                        
   @ 06,02 say lemissao PICT "99/99/9999"
   @ 06,16 say lsaida PICT "99/99/9999"
   @ 06,30 SAY lvenc pict "99/99/9999"
   @ 06,42 SAY lOPERACAO
   @ 08,00 SAY alltrim("PEDIDO N§:")
   @ 08,col() say " "
   @ 08,col() say lNPEDIDO PICT "99999"
   @ 08,17 SAY alltrim("VENDEDOR(A)")
   @ 08,col() say " "
   @ 08,col() say lNVENDDOR PICT "@!" 
                        SET COLOR TO BG+
                          @ 10,02 SAY alltrim("TOTAL DO PRODUTO:")
                          @ 10,col() say " " 
                          @ 10,COL() say lTOTAL PICT "999,999,999.99"
                          @ 10,40 say alltrim("BASE DE CALCULO DO ICMS:")
                          @ 10,col() say " " 
                          @ 10,col() SAY lCICMS PICT "999,999.99"
                        SET COLOR TO BR+
                          @ 11,02 SAY alltrim("TOTAL DE SERVICO:")
                          @ 11,col() say " " 
                          @ 11,col() say lSTOTAL PICT "999,999,999.99"
                          @ 11,40 SAY alltrim("VALOR DO ISS...........:")
                            lISS=((lSTOTAL*0.5)/100)
                          @ 11,col() say " "
                          @ 11,COL() SAY lISS PICT "999,999.99"
                        SET COLOR TO R+
                          @ 12,02 SAY alltrim("TOTAL DA NOTA...:")
                            lNTOTAL=(lTOTAL+lsTOTAL)
                          @ 12,col() say " "
                          @ 12,col() say lNTOTAL PICT "999,999,999.99" 
                          @ 12,40 SAY alltrim("VALOR DO ICMS..........:")
                          @ 12,col() say " " 
                          @ 12,col() SAY lVALORICMS PICT "999,999.99"
                          SET COLOR TO W
                          @ 14,00 SAY alltrim("OBS:")
                          @ 14,col() say " "
                          @ 14,col() say lNTOBS 
                          @ 15,00 say alltrim(lNTOBS2) 
                          @ 15,col() say " "
                          @ 15,col() say lNTOBS2
                                        @ 16,02 SAY " TRANSPORTADOR "
                                        @ 17,00 SAY alltrim("NOME.:")
                                        @ 17,col() say " " 
                                        @ 17,col() say lTRANSNOM 
                                        @ 17,61 SAY lFRETE
                                        @ 18,00 SAY ALLTRIM("PLACA:")
                                        @ 18,col() say " "
                                        @ 18,col() say lTRANSPL 
                                        @ 18,19 SAY alltrim("UF.:") 
                                        @ 18,col() say " "
                                        @ 18,col() say lTRANPUF 
                                         @ 18,27 SAY alltrim("CNPJ/CPF:")
                                         @ 18,col() say " "
                                         @ 18,col() say lTCGCPF 
                                         @ 18,57 SAY alltrim("I.E.:")
                                         @ 18,col() say " "
                                         @ 18,col() say lTRANIE 
                                         @ 19,00 SAY alltrim("ENDERECO.:")
                                         @ 19,col() say " "
                                         @ 19,col() say lTRANSEND
                                         @ 19,40 SAY alltrim("MUNICIPIO:")
                                         @ 19,col() say " "
                                         @ 19,col() say LTRANSCID 
                                         @ 19,68 SAY alltrim("UF....:")
                                         @ 19,col() say " "
                                         @ 19,col() say lTRANSUF 
                                         @ 20,00 SAY alltrim("QTDA.:")
                                         @ 20,col() say " "
                                         @ 20,col() say lTRANSQTD 
                                         @ 20,16 SAY alltrim("ESPECIE.:")
                                         @ 20,col() say " "
                                         @ 20,col() say lTRANSESP 
                                         @ 20,29 SAY alltrim("MARCA..:")
                                         @ 20,col() say " "
                                         @ 20,col() say lTMARCA 
                                         @ 20,55 SAY alltrim("NUMERO.........:")
                                         @ 20,col() say " "
                                         @ 20,col() say lTRASNUM 
                                         @ 21,00 SAY alltrim("PESO BRUTO...:")
                                         @ 21,col() say " "
                                         @ 21,col() say lTRPBRT 
                                         @ 21,25 SAY alltrim("PESO LIQUIDO.................................:")
                                         @ 21,col() say " "
                                         @ 21,col() say lTRPLQ 
                                SAVE SCRE TO TELA1

******************* 1§ PAUSA
                        SET COLOR TO (W/N,W/N)
                                @ 21,17 CLEAR TO 23,61
                                SET COLOR TO (W/R,W/R)
                                @ 20,16 CLEAR TO 22,60
                                @ 20,16 TO 22,60 DOUBLE
                                @ 21,17 SAY "        Confirma exclusÆo da NF S/N? "
                                
                                DO WHILE variavelACAO2<>"S" .AND. variavelACAO2<>"N"    
                                        WAIT TO variavelACAO2
                                ENDDO

                      if variavelACAO2="S"
                              SET COLOR TO W/R
                                  @ 21,17 SAY "          Excluindo Nota Fiscal ..."
                                  tro_Ani(21,52)
                           RLOCK()
                                        IF variavelCHECK=1
                                                  SELE 1
                                        ENDIF
                                        IF variavelCHECK#1
                                                SELE 2
                                        ENDIF
                                     DBDELETE()
                                 PACK
                          * ENDIF
                       ENDIF
ENDDO

