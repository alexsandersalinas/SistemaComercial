* NOTTD2.PRG - 
* AUTOR: ALEXSANDER SALINAS SANTOS - EMAIL: salinas@starmedia.com
* DATA: 27/10/1999
***


OP4=" "
************  CONFIGURACAO DE TELA
SET COLOR TO W
@ 07,03 CLEAR TO 22,77
SET COLOR TO (W/R,W/R)
@ 06,02 CLEAR TO 21,76
@ 06,02 TO 21,76 DOUBLE
@ 08,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 10,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
        @ 08,30 SAY "³"
        @ 08,36 SAY "³"
        @ 08,44 SAY "³"
        @ 08,59 SAY "³"
        @ 08,64 SAY "³"
        @ 09,30 SAY "³"
        @ 09,36 SAY "³"
        @ 09,44 SAY "³"
        @ 09,59 SAY "³"
        @ 09,64 SAY "³"
           
@ 08,30 SAY "Â"
@ 08,36 SAY "Â"
@ 08,44 SAY "Â"
@ 08,59 SAY "Â"
@ 08,64 SAY "Â"
@ 10,30 SAY "Á"
@ 10,36 SAY "Á"
@ 10,44 SAY "Á"
* @ 05,59 SAY "³"
*       @ 05,64 SAY "³"

@ 12,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 18,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
        @ 13,30 SAY "³"
        @ 13,36 SAY "³"
        @ 13,44 SAY "³"
        @ 13,59 SAY "³"
        @ 14,30 SAY "³"
        @ 14,36 SAY "³"
        @ 14,44 SAY "³"
        @ 14,59 SAY "³"
        @ 15,30 SAY "³"
        @ 15,36 SAY "³"
        @ 15,44 SAY "³"
        @ 15,59 SAY "³"
        @ 16,30 SAY "³"
        @ 16,36 SAY "³"
        @ 16,44 SAY "³"
        @ 16,59 SAY "³"
        @ 17,30 SAY "³"
        @ 17,36 SAY "³"
        @ 17,44 SAY "³"
        @ 17,59 SAY "³"
           
@ 12,30 SAY "Â"
@ 12,36 SAY "Â"
@ 12,44 SAY "Â"
@ 12,59 SAY "Â"
@ 18,30 SAY "Á"
@ 18,36 SAY "Á"
@ 18,44 SAY "Á"
@ 18,59 SAY "Á"
********* FINAL DA TELA
        SET COLOR TO W/N
        @ 07,03 SAY " EMISSAO DE NOTA FISCAL - TIPO:                                          "
        @ 07,35 SAY lOPERACAO
        
        SET COLOR TO (W/R,W/R)
        @ 08,05 SAY " DESCRICAO DO PRODUTO "
        @ 08,31 SAY " UN. "
        @ 08,38 SAY " QTDE "
        @ 08,46 SAY " V. UNIT. "
        @ 08,59 SAY " ICMS "
           
        @ 12,05 SAY " DESCRICAO DE SERVICOS "
*       @ 12,31 SAY " UN. "
        @ 12,38 SAY " QTDE "
        @ 12,47 SAY " V. UNIT. "
        @ 12,64 SAY " TOTAL "

***
SET COLOR TO (W/R,W/R)
lDESC1="SUPORTE FISICO INF."
lUN1="PC"
lUNIT1=2.00

*********** CAMPOS DE 
        SET COLOR TO (W/R,W/R)
        @ 09,03 SAY lDESC1 
        @ 09,33 SAY lUN1 
        @ 09,39 GET lQTDA1 PICT "9999"
        @ 09,45 SAY lUNIT1 PICT "999,999,999.99"
        @ 09,62 get lICMS1 pict "99"

        @ 13,03 GET lSERV1 PICT "@!S27"
*       @ 13,33 GET lSUN1 PICT "@!"
        @ 13,39 GET lSQTDA1 PICT "9999"
        @ 13,45 GET lSUNIT1 PICT "999,999,999.99"

        @ 14,03 GET lSERV2 PICT "@!S27"
*       @ 14,33 GET lSUN2 PICT "@!"
        @ 14,39 GET lSQTDA2 PICT "9999"
        @ 14,45 GET lSUNIT2 PICT "999,999,999.99"
        
        @ 15,03 GET lSERV3 PICT "@!S27"
*       @ 15,33 GET lSUN3 PICT "@!"
        @ 15,39 GET lSQTDA3 PICT "9999"
        @ 15,45 GET lSUNIT3 PICT "999,999,999.99"
        
        @ 16,03 GET lSERV4 PICT "@!S27"
*       @ 16,33 GET lSUN4 PICT "@!"
        @ 16,39 GET lSQTDA4 PICT "9999"
        @ 16,45 GET lSUNIT4 PICT "999,999,999.99"

        @ 17,03 GET lSERV5 PICT "@!S27"
*       @ 17,33 GET lSUN5 PICT "@!"
        @ 17,39 GET lSQTDA5 PICT "9999"
        @ 17,45 GET lSUNIT5 PICT "999,999,999.99"
        
        SKIP

        @ 13,03 GET lSERV6 PICT "@!S27"
*       @ 13,33 GET lSUN6 PICT "@!"
        @ 13,39 GET lSQTDA6 PICT "9999"
        @ 13,45 GET lSUNIT6 PICT "999,999,999.99"

        @ 14,03 GET lSERV7 PICT "@!S27"
*       @ 14,33 GET lSUN7 PICT "@!"
        @ 14,39 GET lSQTDA7 PICT "9999"
        @ 14,45 GET lSUNIT7 PICT "999,999,999.99"
        READ
                
************ FINAL DE INCLUSAO CAMPOS

*********** CALCULO DO ICMS
                lTOTAL1=(lUNIT1*lQTDA1)
                lCICMS=(lTOTAL1*2)
                lVALORICMS=((lCICMS*lICMS1)/100)
                @ 09,65 SAY lVALORICMS PICT "999,999.99"

                lSTOTAL1=(lSUNIT1*lSQTDA1)
                @ 13,61 SAY lSTOTAL1 PICT "999,999,999.99"
                lSTOTAL2=(lSUNIT2*lSQTDA2)
                @ 14,61 SAY lSTOTAL2 PICT "999,999,999.99"
                lSTOTAL3=(lSUNIT3*lSQTDA3)
                @ 15,61 SAY lSTOTAL3 PICT "999,999,999.99"
                lSTOTAL4=(lSUNIT4*lSQTDA4)
                @ 16,61 SAY lSTOTAL4 PICT "999,999,999.99"
                lSTOTAL5=(lSUNIT5*lSQTDA5)
                @ 17,61 SAY lSTOTAL5 PICT "999,999,999.99"
                
                lSTOTAL6=(lSUNIT6*lSQTDA6)
                @ 13,61 SAY lSTOTAL6 PICT "999,999,999.99"
                lSTOTAL7=(lSUNIT7*lSQTDA7)
                @ 14,61 SAY lSTOTAL7 PICT "999,999,999.99"

                lTOTAL=(lTOTAL1)
                lSTOTAL=(lSTOTAL1+lSTOTAL2+lSTOTAL3+lSTOTAL4+lSTOTAL5+lSTOTAL6+lSTOTAL7)
                @ 19,61 SAY lSTOTAL PICT "999,999,999.99"

                SET COLOR TO W/B
                @ 20,05 SAY "OS DADOS ESTAO CORRETOS Sim / Nao ? "
                DO WHILE OP4<>"S" .and. OP4<>"N"
                   WAIT TO OP4
                ENDDO
                   IF OP4="S"
                        SET COLOR TO W
                        RESTORE SCREEN FrOM LOGICA
                   ENDIF
                   IF OP4="N"
                        DO NOTTD2
                   ENDIF
                SET COLOR TO W

                      SET COLOR TO W
RESTORE SCREEN FrOM LOGICA

