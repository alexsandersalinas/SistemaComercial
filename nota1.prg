*---------------------------------------------------*
* NOTA1.PRG - ALTERACAO DE NOTA FISCAL
* AUTOR: ALEXSANDER SALINAS - SALINAS@STARMEDIA.COM
* DATA: 12-11-1999
* ATUALIZADO - 25/08/2000
*---------------------------------------------------*
*--->limpando tela

        SET COLOR TO (W/R,W/B)
                @ 04,01 CLEAR TO 04,78
        SET COLOR TO (W/B,W/B)
                @ 05,01 CLEAR TO 23,78

SET DATE BRITISH
SET EXCLUSIVE OFF
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
   variavelACAO3=SPACE(1) 
   vACAO4=SPACE(1)
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
     *                   @ 08,18 SAY " SAIDA "
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
************* INICIO DA PESQUISA NO BANCO DE DADOS
              SELE 1
                  USE dbNOT1 INDEX ntxNNF1 SHARED
                  seek lNTNUM
                  variavelCHECK=1
                  IF .NOT. FOUND()
                       SELE 2
                        USE dbNOT2 INDEX ntxNNF2 SHARED
                        seek lNTNUM
                        variavelCHECK=2
                                IF .NOT. FOUND()
                                        set color to (w,r)
                                        @ 24,00 SAY " NUMERO NÇO EXISTE. Pressione qualquer tecla. "
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
IF pesquisaERRO#1

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
                        
   @ 02,00 SAY "NF N§:"GET lNTNUM PICT "9999"
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
                                @ 24,00 CLEAR TO 24,80
                                @ 21,17 CLEAR TO 23,61
                                SET COLOR TO (W/R,W/R)
                                @ 20,16 CLEAR TO 22,60
                                @ 20,16 TO 22,60 DOUBLE
                                @ 21,17 SAY "                CONTINUA S/N       "
                                DO WHILE variavelACAO2<>"S" .AND. variavelACAO2<>"N"    
                                        WAIT TO variavelACAO2
                                ENDDO

                      if variavelACAO2="N"
                         *RESTORE SCREEN FROM TELA1
                         LOOP
                      ENDIF

******************* 2§ PAUSA
*                        SET COLOR TO (W/R,W/R)
*                                @ 24,00 CLEAR TO 24,80
*                                @ 24,00 SAY " ALTERAR DE CLIENTE "
*                                DO WHILE variavelACAO3<>"S" .AND. variavelACAO3<>"N"    
*                                        WAIT TO variavelACAO3
*                                ENDDO
*
*                      if variavelACAO3="S"
*                         DO NOTC0
*                      ENDIF
*
*
********************** FIM
RESTORE SCREEN FROM TELA1

*IF pesquisaERRO=1
*   LOOP
*ENDIF
*IF pesquisaERRO#1

************** CAMPOS DE DATAS
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
                        
   @ 06,02 GET lemissao PICT "99/99/9999"
   @ 06,16 GET lsaida PICT "99/99/9999"
   @ 06,30 GET lvenc pict "99/99/9999" 
          SAVE SCRE TO atoperacao
        READ
******************* 3§ PAUSA
                        SET COLOR TO W/R
                                @ 24,00 CLEAR TO 24,80
                                @ 24,00 SAY " ALTERA O TIPO E OPERACAO S/N "
                                DO WHILE vACAO4<>"N" .AND. vACAO4<>"S"    
                                        WAIT TO vACAO4
                                ENDDO

                      if vACAO4="S"
                          DO NOTT2
                      ENDIF

SET COLOR TO W/R
@ 24,00 CLEAR TO 24,80
SET COLOR TO W
@ 06,42 SAY lOPERACAO
SET COLOR TO (W/N,W/N)
 @ 08,00 SAY "PEDIDO N§:"GET lNPEDIDO PICT "99999"
 @ 08,17 SAY "VENDEDOR(A)"GET lNVENDDOR PICT "@!" 
 SAVE SCRE TO LOGICA
 READ
************* ESTRUTURA P/ DESCRICAO DO PRODUTO

***** NOTTD1.PRG  - DESCRICAO DE VENDAS E REMESSA P/ CONSERTO
            IF lOPERACAO="VENDA" .OR. lOPERACAO="VENDA FORA DO ESTADO" .OR. lOPERACAO="REMESSA PARA CONSERTO"
            DO NOTTD1
             
             ENDIF
***** FIM NOTTD1

****** NOTTD2.PRG  - NOTA DE SOFTWARE C/ SUPORTE FISICO DIFERENCA - NORMAL
             IF lvariavelDIF="NORMAL"
                        DO NOTTD2
             ENDIF

***** NOTTD3.PRG - SERVi€OS -REMESSA LOC - NOTA SOFTWARE MLP
        IF lOPERACAO="PRESTA€ŽO DE SERVI€O" .OR. lOPERACAO="PRESTA€ŽO DE SERVI€O F/ESTADO"; 
        .OR.lOPERACAO="REMESSA PARA LOCA€ŽO" .OR.lOPERACAO="REMESSA PARA LOCA€ŽO F/ESTADO";
        .OR. lOPERACAO="REMESSA PARA DEMONSTRA€ŽO" .OR. lOPERACAO="REMESSA PARA DEMONSTRA€ŽO";
        .OR. lOPERACAO="REMESSA PARA TROCA" .OR. lOPERACAO="REMESSA PARA TROCA F/ESTADO";
        .OR. lOPERACAO="DEVOLU€ŽO PARA LOCA€ŽO" .OR. lOPERACAO=" DEVOLU€ŽO PARA LOCA€ŽO F/ESTADO";
        .OR. lOPERACAO="DEVOLU€ŽO PARA DEMOSTRA€ŽO" .OR. lOPERACAO="DEVOLU€ŽO PARA DEMOSTRA€ŽO F/ESTADO";
        .OR. lOPERACAO="REMESSA PARA DEMOSTRA€ŽO" .OR. lOPERACAO="REMESSA PARA DEMOSTRA€ŽO F/ESTADO";
        .OR. lOPERACAO="DEVOLU€ŽO DE SOFTWARE" .OR. lOPERACAO="DEVOLU€ŽO DE SOFTWARE F/ESTADO";
        .OR. lOPERACAO="DEVOLU€ŽO DE TROCA" .OR. lOPERACAO="DEVOLU€ŽO DE TROCA F/ESTADO";
        .OR. lvariavelDIF="MOLP" .OR. lOPERACAO="COMISSAO DE VENDA" 
        DO NOTTD3
               lSTOTAL=(lSTOTAL1+lSTOTAL2+lSTOTAL3+lSTOTAL4+lSTOTAL5+lSTOTAL6+lSTOTAL7)
               lCICMS=lTOTAL
       ENDIF
***** FIM NOTTD3
***** NOTTD4
      SAVE SCRE TO LOGICA
      IF lOPERACAO="DEVOLU€ŽO DE MERCADORIA" .OR. lOPERACAO="DEVOLU€ŽO DE MERCADORIA F/ESTADO";
      .OR. lOPERACAO="DEVOLU€ŽO DE CONSERTO" .OR. lOPERACAO="DEVOLU€ŽO DE CONSERTO F/ESTADO";
      .OR. lOPERACAO="SIMPLES REMESSA" .OR. lOPERACAO="SIMPLES REMESSA F/ESTADO";
      .OR. lOPERACAO="DEVOLU€ÇO DE TROCA" .OR. lOPERACAO="DEVOLU€ÇO DE TROCA F/ESTADO";
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
                              RLOCK() 
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

