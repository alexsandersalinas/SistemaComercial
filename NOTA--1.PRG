***************************************
* NOTA1.PRG - ALTERA DE NOTA FISCAL
* AUTOR: ALEXSANDER SALINAS SANTOS - SALINAS@STARMEDIA.COM
* DATA: 12-11-1999
*****************************************
*-----------LIMPANDO TELA

SET COLOR TO (W/R,W/B)
    @ 04,01 CLEAR TO 04,78
SET COLOR TO (W/B,W/B)
    @ 05,01 CLEAR TO 23,78
SET DATE BRITISH
SET EXCLUSIVE OFF
SET CENTURY ON
SET CONSOLE OFF
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
        USE dbNOT2 SHARED
                REG2=RECCOUNT()
        SELE 1
        USE dbNOT1 SHARED
                REG1=RECCOUNT()

                 SAVE SCRE TO INICIO
                        SET COLOR TO (W/R,W/R)
                           @ 04,01 SAY "ALTERA€ÇO| DIGITE O NéMERO DA NOTA FISCAL.                  "
                           varREG=(REG1+REG2)
                           @ 04,68 SAY varREG
                           @ 04,62 SAY "Registros:"

SET COLOR TO (W/B,W/B)
   @ 05,01 SAY "NF N§:"GET lNTNUM PICT "9999"
   @ 05,13 CLEAR TO 05,78
   @ 06,01 CLEAR TO 23,78
************ CARREGANDO TELA 
                        SET COLOR TO (W/B,W/B)
                        @ 08,01 TO 08,78
                        @ 08,02 SAY " EMISSÇO "
                        @ 08,18 SAY " SAIDA "
                        @ 08,29 SAY " VENCIMENTO "
                        @ 08,52 SAY " OPERA€ÇO "
                        @ 10,01 TO 10,78
                        @ 10,37 SAY "Â"
                                @ 11,37 SAY "³"
                                @ 12,37 SAY "³"
                                @ 13,37 SAY "³"
                                *@ 14,37 SAY "³"
                                        @ 14,01 TO 14,78
                                @ 14,37 SAY "Á"
                                        @ 17,01 TO 17,78
                                @ 17,02 SAY " TRANSPORTADOR "
                                READ
                IF lntnum=0
                        CLOSE ALL
                        RESTSCREEN(00,00,24,80,SUB40)
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
                                        SET COLOR TO (W/R,W/R)
                                        @ 04,10 SAY " NUMERO NÇO EXISTE. Pressione qualquer tecla. "
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
         lSTOTAL    = STOTAL
         lSTOTAL1   = STOTAL1
         lSTOTAL2   = STOTAL2
         lSTOTAL3   = STOTAL3
         lSTOTAL4   = STOTAL4
         lSTOTAL5   = STOTAL5
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
*        lTICMS      = TICMS
*******FINAL


*************** FIM DA PESQUISA
checkCLIENTE=NCLIEN
PESQUISA=SAVESCREEN(00,00,24,80)
DO NOTC1         

IF pesquisaERRO=1
         LOOP
ENDIF

************** TELA DE CONSULTA
                           SET COLOR TO (W/B,W/B)
                                @ 07,01 SAY "                                            "
                                @ 08,01 TO 08,78
                                @ 05,01 SAY "NF N§:"GET lNTNUM PICT "9999"
                                @ 08,02 SAY " EMISSÇO "
                                @ 09,02 SAY lEMISSAO PICT "99/99/9999"
                                @ 08,18 SAY " SAIDA "
                                @ 09,16 SAY lSAIDA PICT "99/99/9999"
                                @ 08,29 SAY " VENCIMENTO "
                                @ 09,30 SAY lVENC PICT "99/99/9999"
                                @ 08,52 SAY " OPERA€ÇO "
                                @ 09,49 SAY lOPERACAO

****************                        
                        SET COLOR TO (W/B,W/B)
                        @ 11,02 SAY "TOTAL DO PRODUTO"
                        @ 11,20 SAY lTOTAL PICT "999,999,999.99"
                        @ 12,02 SAY "TOTAL DE SERVICO"
                        @ 12,20 SAY lSTOTAL PICT "999,999,999.99"
                                @ 11,40 SAY "VALOR DO ISS...........:"
                                @ 11,68 SAY lISS PICT "999,999.99"
                                @ 12,40 say "BASE DE CALCULO DO ICMS:"
                                @ 13,40 SAY "VALOR DO ICMS..........:"
                                @ 12,68 SAY lCICMS PICT "999,999.99"
                                @ 13,68 SAY lVALORICMS PICT "999,999.99"
                                @ 15,02 SAY "TOTAL DA NOTA:"
                                @ 15,20 SAY lNTOTAL PICT "999,999,999.99"
                                @ 10,37 SAY "Â"
                                @ 11,37 SAY "³"
                                @ 12,37 SAY "³"
                                @ 13,37 SAY "³"
                                *@ 14,37 SAY "³"
                                @ 14,01 TO 14,78
                                @ 14,37 SAY "Á"
                                @ 17,01 TO 17,78
                                @ 17,02 SAY " TRANSPORTADOR "
                                        @ 18,02 SAY "NOME.:"
                                        @ 18,09 SAY lTRANSNOM 
                                        @ 18,45 SAY "FRETE P/CONTA.:"
                                        @ 18,61 SAY lFRETE
                                        @ 19,02 SAY "PLACA:"
                                        @ 19,09 SAY lTRANSPL 
                                        @ 19,19 SAY "UF.:"
                                        @ 19,24 SAY lTRANPUF 
                                         @ 19,27 SAY "CGC/CPF.:"
                                         @ 19,36 SAY lTCGCPF 
                                         @ 19,57 SAY "I.E.:"
                                         @ 19,63 SAY lTRANIE 
                                         @ 20,02 SAY "ENDERECO.:"
                                         @ 20,13 SAY lTRANSEND 
                                         @ 20,40 SAY "MUNICIPIO:"
                                         @ 20,51 SAY lTRANSCID 
                                         @ 20,68 SAY "UF....:"
                                         @ 20,76 SAY lTRANSUF 
                                         @ 21,02 SAY "QTDE.:"
                                         @ 21,08 SAY lTRANSQTD 
                                         @ 21,16 SAY "ESPECIE.:"
                                         @ 21,26 SAY lTRANSESP 
                                         @ 21,29 SAY "MARCA..:"
                                         @ 21,38 SAY lTMARCA 
                                         @ 21,55 SAY "NUMERO.........:"
                                         @ 21,72 SAY lTRASNUM 
                                         @ 22,02 SAY "PESO BRUTO...:"
                                         @ 22,17 SAY lTRPBRT 
                                         @ 22,25 SAY "PESO LIQUIDO.................................:"
                                         @ 22,72 SAY lTRPLQ 
                                SAVE SCRE TO TELA1

******************* 1§ PAUSA
                        SET COLOR TO (W/N,W/N)
                                @ 21,17 CLEAR TO 23,61
                                SET COLOR TO (W/R,W/R)
                                @ 20,16 CLEAR TO 22,60
                                @ 20,16 TO 22,60 DOUBLE
                                @ 21,17 SAY "                CONTINUA S/N       "
                                
                                DO WHILE variavelACAO2<>"S" .AND. variavelACAO2<>"N"    
                                        WAIT TO variavelACAO2
                                ENDDO

                      if variavelACAO2="N"
                         RESTORE SCREEN FROM TELA1
                         LOOP
                      ENDIF

********************** FIM
RESTORE SCREEN FROM TELA1

   SET COLOR TO (W/B,W/B)   
   @ 09,02 GET lemissao PICT "99/99/99"
   @ 09,16 GET lsaida PICT "99/99/99"
   @ 09,30 GET lvenc PICT "99/99/99"
   
   READ
   SAVE SCRE TO atoperacao
   
******************* 2§ PAUSA
                        SET COLOR TO (W/N,W/N)
                                @ 21,17 CLEAR TO 23,61
                                SET COLOR TO (W/R,W/R)
                                @ 20,16 CLEAR TO 22,60
                                @ 20,16 TO 22,60 DOUBLE
                                @ 21,17 SAY "      ALTERA O TIPO DA OPERA€ÇO S/N "
                                
                                DO WHILE vACAO3<>"S" .AND. vACAO3<>"N"    
                                   WAIT TO vACAO3
                                ENDDO
                                                if vACAO3="S"
                                                        DO NOTT2           
                                                ENDIF

*----------------------> FIM

*----------> VARIAVEL OPERACAO
                                SET COLOR TO (W/B,W/B)
                                 @ 09,49 SAY lOPERACAO
                                 SAVE SCRE TO TELA3
*--------------------------->                                

                                SET COLOR TO (W/N,W/N)
                                @ 21,17 CLEAR TO 23,61
                                SET COLOR TO (W/R,W/R)
                                @ 20,16 CLEAR TO 22,60
                                @ 20,16 TO 22,60 DOUBLE
                                @ 21,17 SAY " Abrindo tela,aguarde um minuto por favor! "
                                INKEY(2)
                                        RESTORE SCRE FROM TELA3
                   
*--------> TELA



*-------------> ESTRUTURA P/ DESCRICAO DO PRODUTO
SAVE SCRE TO LOGICA

*------> NOTTD1.PRG  - DESCRICAO DE VENDAS E REMESSA P/ CONSERTO

     IF lOPERACAO="VENDA" .OR. lOPERACAO="VENDA FORA DO ESTADO" .OR. lOPERACAO="REMESSA PARA CONSERTO"
            DO NOTTD1
                *lTOTAL=(lTOTAL12+lTOTAL3+lTOTAL4+lTOTAL5)
                *lSTOTAL=(lSTOTAL1+lSTOTAL2+lSTOTAL3+lSTOTAL4+lSTOTAL5)
                *lCICMS=lTOTAL
             
             ENDIF
*------> FIM NOTTD1

*------>  NOTTD2.PRG  - NOTA DE SOFTWARE C/ SUPORTE FISICO DIFERENCA - NORMAL
             IF lvariavelDIF="NORMAL"
                        DO NOTTD2
             ENDIF
*------>  NOTTD3.PRG - DESCRICAO DE PSERVICO-REMESSA LOC - NOTA SOFTWARE MLP
        IF lOPERACAO="PRESTACAO DE SERVICO" .OR. lOPERACAO="REMESSA PARA LOCACAO" .OR. lOPERACAO="REMESSA PARA DEMOSTRACAO";
        .OR. lvariavelDIF="MOLP"
            DO NOTTD3
               lSTOTAL=(lSTOTAL1+lSTOTAL2+lSTOTAL3+lSTOTAL4+lSTOTAL5)
               lCICMS=lTOTAL
        ENDIF
*-------> FIM NOTTD3
***** NOTTD4
      SAVE SCRE TO LOGICA
      IF lOPERACAO="DEVOLUCAO DE MERCADORIA" .OR. lOPERACAO="DEVOLUCAO DE CONSERTO";
      .OR. lOPERACAO="SIMPLES REMESSA"
             DO NOTTD4
      ENDIF
***** FIM NOTTD4
                        
                        SET COLOR TO (W/B,W/B)
                        @ 11,02 SAY "TOTAL DO PRODUTO"
                        @ 11,20 SAY lTOTAL PICT "999,999,999.99"
                        @ 12,02 SAY "TOTAL DE SERVICO"
                        @ 12,20 SAY lSTOTAL PICT "999,999,999.99"
                                @ 11,40 SAY "VALOR DO ISS...........:"
                                        lISS=((lSTOTAL*0.5)/100)
                                @ 11,68 SAY lISS PICT "999,999.99"
                                @ 12,40 say "BASE DE CALCULO DO ICMS:"
                                @ 13,40 SAY "VALOR DO ICMS..........:"
                                @ 12,68 SAY lCICMS PICT "999,999.99"
                                @ 13,68 SAY lVALORICMS PICT "999,999.99"
             
                  @ 15,02 SAY "TOTAL DA NOTA:"
                        lNTOTAL=(lTOTAL+lsTOTAL)
                 @ 15,20 SAY lNTOTAL PICT "999,999,999.99"

** FINALIZANDO **
*---> NOTTD5 - INCLUSAO NOTA COMPLEMENTAR                        
      IF lOPERACAO="NOTA FISCAL COMPLEMENTAR"
           DO NOTTD5
IF pesquisaERRO=1
   LOOP
ENDIF
IF pesquisaERRO#1
     SET COLOR TO W/B
        @ 09,30 SAY lVENC
        @ 12,40 say "BASE DE CALCULO DO ICMS:"
        @ 12,68 GET lCICMS PICT "999,999.99"
        @ 13,40 SAY "VALOR DO ICMS..........:"
        @ 13,68 GET lVALORICMS PICT "999,999.99"
        @ 16,02 SAY "NOTA FISCAL COMPLEMENTAR DE ICMS REF. A N/F "
        @ 16,46 SAY lREFNT
        @ 16,51 SAY "DE"
        @ 16,54 SAY lREFEMS
        *lNTNUM=lGARDA
ENDIF
       ENDIF


********** TRANSPORTE DA NOTA FISCAL
                
                        SET COLOR TO W/B
                        @ 18,02 SAY "NOME.:"
                        @ 18,45 SAY "FRETE P/CONTA.:"                        
                                DO NOTT3
                
*********** TELA DE PERGUNTA SALVA S/N
                        variavelACAO=SPACE(1)
                        
                        SET COLOR TO W/B
                        @ 16,66 CLEAR TO 17,78
                        @ 17,01 TO 17,78
                        @ 17,02 SAY " TRANSPORTADOR "
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
                                *UNLOCK ALL
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
                              REPL DIF WITH lvariavelDIF
                              USE
                ENDIF 
ENDDO
                
