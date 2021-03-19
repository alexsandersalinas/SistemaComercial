* CONFIGURA€åES

CLOSE ALL
SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF
**

DO WHILE .T.
CLOSE ALL

                                           lPESSOA   = SPACE(1)
                                           lCGC      = SPACE(18)
                                           lCPF      = SPACE(15)
                                          * UM         = 1
                                           OPCAO     = SPACE(1)
                                           ACAO      = SPACE(1)
                                           ldata     = date()


MN=0
       SET COLOR TO (W/N,W/R)
       @ 02,00 CLEAR TO 24,80
       @ 02,00 PROMPT alltrim(" Banco de Dados ANTIGO ")
       @ 02,col() say " " 
       @ 02,col() PROMPT " Banco de Dados ATUAL " 
       wait
        MENU TO MN
        
        IF MN=1
                CLOSE ALL                                           
                USE dbNOT1 SHARED 
                USE dbNOT1 INDEX ntxNNF1 SHARED 
                               IF NETERR()
                                   SET COLOR TO W/R
                                   @ 24,00 clear to 24,80
                                   @ 24,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    
                        
         ENDIF
         IF MN=2 
              CLOSE ALL
              USE dbNOT2 SHARED 
              USE dbNOT2 INDEX ntxNNF2 SHARED 
                               IF NETERR()
                                   SET COLOR TO W/R
                                   @ 24,00 clear to 24,80
                                   @ 24,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    

          ENDIF
          IF MN=0    
              RESTSCREEN(00,00,24,80,SUB44)
              RETURN
    ENDIF

   
   SIT=SAVESCREEN(00,00,24,80)

   SET COLOR TO N+/B
   @ 04,01,21,78 BOX REPL(CHR(177),9)
   @ 05,02 CLEAR TO 05,76
   TITULO="Consulta de Vencimento"
   COL1=INT((40)-LEN(TITULO)/2)-1
   @ 05,COL1 SAY TITULO
   SET COLOR TO W+/B
   @ 06,02 CLEAR TO 20,76

        DECLARE M3[reccount()],M4[reccount()]
        FOR I = 1 TO RECCOUNT() 
                M3[I]=ntnum
                M4[I]=RECNO()
          SKIP
          tro_Ani(6,2)
          *locaTE REST FOR lvenc=date()          
           LOCATE REST FOR venc = ldata
          *          LOCATE REST FOR PESSOA=SPACE(1)
          
 NEXT
    
   SET COLOR TO ,W/gR+
   RESP=ACHOICE(06,02,20,76,M3)
      IF RESP=0
         RESTSCREEN(00,00,24,80,SIT)
         RETURN
      ENDIF

   GOTO M4[RESP]

   RESTSCREEN(00,00,24,80,SIT)
   SET COLOR TO N/W
   @ 07,15 SAY ntnum
   SET COLOR TO ,N/W
   AGNOME=EMP

*SET KEY -1 TO AGEXCACHOICE
**********


*JLTELASOL=SAVESCREEN(00,00,24,80)


* TELA

*   TELAEXC()


* GETS

   *AGNOME=SPACE(40)

   @ 07,10 say AGNOME PICT "@!" 
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
   
                        WAIT
                        ENDIF
      USE
ENDDO



