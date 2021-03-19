* NOTTD4.PRG -  INCLUSAO/ALTERACAO DE DESCRICOES 
* AUTOR: ALEXSANDER SALINAS SANTOS  - EMAIL: salinas@starmedia.com
* 27/10/1999

        op4=" "
        SET COLOR TO W
        @ 07,03 CLEAR TO 24,77
        SET COLOR TO (W/R,W/R)
        @ 06,02 CLEAR TO 24,76
        @ 06,02 TO 24,76 DOUBLE

***** MONTADO TELA DE PRODUTO  
@ 08,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
*@ 14,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 14,60 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
        @ 09,30 SAY "³"
        @ 09,36 SAY "³"
        @ 09,44 SAY "³"
        @ 09,59 SAY "³"
        @ 09,65 SAY "³"
        @ 10,30 SAY "³"
        @ 10,36 SAY "³"
        @ 10,44 SAY "³"
        @ 10,59 SAY "³"
        @ 10,65 SAY "³"
        @ 11,30 SAY "³"
        @ 11,36 SAY "³"
        @ 11,44 SAY "³"
        @ 11,59 SAY "³"
        @ 11,65 SAY "³"
        @ 12,30 SAY "³"
        @ 12,36 SAY "³"
        @ 12,44 SAY "³"
        @ 12,59 SAY "³"
        @ 12,65 SAY "³"
        @ 13,30 SAY "³"
        @ 13,36 SAY "³"
        @ 13,44 SAY "³"
        @ 13,59 SAY "³"
        @ 13,65 SAY "³"
        @ 14,59 SAY "³"
           
@ 08,30 SAY "Â"
@ 08,36 SAY "Â"
@ 08,44 SAY "Â"
@ 08,59 SAY "Â"
*@ 14,30 SAY "Á"
*@ 14,36 SAY "Á"
*@ 14,44 SAY "Á"
@ 14,59 SAY "³"
@ 15,59 SAY "³"
@ 16,59 SAY "Á"
****************MONTANDO TELA DE SERVICO
@ 16,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 22,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
        @ 17,30 SAY "³"
        @ 17,36 SAY "³"
        @ 17,44 SAY "³"
        @ 17,59 SAY "³"
        @ 18,30 SAY "³"
        @ 18,36 SAY "³"
        @ 18,44 SAY "³"
        @ 18,59 SAY "³"
        @ 19,30 SAY "³"
        @ 19,36 SAY "³"
        @ 19,44 SAY "³"
        @ 19,59 SAY "³"
        @ 20,30 SAY "³"
        @ 20,36 SAY "³"
        @ 20,44 SAY "³"
        @ 20,59 SAY "³"
        @ 21,30 SAY "³"
        @ 21,36 SAY "³"
        @ 21,44 SAY "³"
        @ 21,59 SAY "³"
        @ 22,30 SAY "³"
        @ 22,36 SAY "³"
        @ 22,44 SAY "³"
        @ 22,59 SAY "Å"
           
@ 16,30 SAY "Â"
@ 16,36 SAY "Â"
@ 16,44 SAY "Â"
@ 16,59 SAY "Â"
@ 22,30 SAY "Á"
@ 22,36 SAY "Á"
@ 22,44 SAY "Á"
*@ 22,59 SAY "Á"
@ 23,59 SAY "³"

****  FIM
        SET COLOR TO W/N
        @ 07,03 SAY " EMISSAO DE NOTA FISCAL - TIPO:                                          "
        @ 07,35 SAY lOPERACAO
        SET COLOR TO W/R,W/R
        @ 08,05 SAY " DESCRICAO DO PRODUTO "
        @ 08,31 SAY " UN. "
        @ 08,38 SAY " QTDE "
        @ 08,46 SAY " V. UNIT. "
        @ 08,78 SAY " ICMS "
        @ 08,67 SAY " TOTAL "
        @ 16,05 SAY " DESCRICAO DE SERVICOS "
*       @ 16,31 SAY " UN. "
        @ 16,38 SAY " QTDA "
        @ 16,47 SAY " V. UNIT. "
        @ 16,64 SAY " TOTAL "
        
SET COLOR TO (W/R,W/R)
        @ 09,03 GET lDESC1 PICT "@!s27"
        @ 09,33 GET lUN1 PICT "@!" 
        @ 09,39 GET lQTDA1 PICT "9999"
        @ 09,45 GET lUNIT1 PICT "999,999,999.99"
        @ 09,61 GET lICMS1 PICT "99" 

        @ 10,03 GET lDESC2 PICT "@!s27"
        @ 10,33 GET lUN2 PICT "@!"
        @ 10,39 GET lQTDA2 PICT "9999"
        @ 10,45 GET lUNIT2 PICT "999,999,999.99"
        @ 10,61 GET lICMS2 PICT "99" 
         
        @ 11,03 GET lDESC3 PICT "@!s27"
        @ 11,33 GET lUN3 PICT "@!"
        @ 11,39 GET lQTDA3 PICT "9999"
        @ 11,45 GET lUNIT3 PICT "999,999,999.99"
        @ 11,61 GET lICMS3 PICT "99" 
           
        @ 12,03 GET lDESC4 PICT "@!s27"
        @ 12,33 GET lUN4 PICT "@!"
        @ 12,39 GET lQTDA4 PICT "9999"
        @ 12,45 GET lUNIT4 PICT "999,999,999.99"
        @ 12,61 GET lICMS4 PICT "99"

        @ 13,03 GET lDESC5 PICT "@!s27"
        @ 13,33 GET lUN5 PICT "@!"
        @ 13,39 GET lQTDA5 PICT "9999"
        @ 13,45 GET lUNIT5 PICT "999,999,999.99"
        @ 13,61 GET lICMS5 PICT "99"
        SKIP
        @ 09,03 GET lDESC6 PICT "@!s27"
        @ 09,33 GET lUN6 PICT "@!" 
        @ 09,39 GET lQTDA6 PICT "9999"
        @ 09,45 GET lUNIT6 PICT "999,999,999.99"
        @ 09,61 GET lICMS6 PICT "99" 

        @ 10,03 GET lDESC7 PICT "@!s27"
        @ 10,33 GET lUN7 PICT "@!"
        @ 10,39 GET lQTDA7 PICT "9999"
        @ 10,45 GET lUNIT7 PICT "999,999,999.99"
        @ 10,61 GET lICMS7 PICT "99" 
         
        @ 11,03 GET lDESC8 PICT "@!s27"
        @ 11,33 GET lUN8 PICT "@!"
        @ 11,39 GET lQTDA8 PICT "9999"
        @ 11,45 GET lUNIT8 PICT "999,999,999.99"
        @ 11,61 GET lICMS8 PICT "99" 
           


        *@ 14,03 SAY "OBS:"GET lNTOBS PICT "@!"
        *@ 15,03 GET lNTOBS2 PICT "@!"

******************
        @ 17,03 GET lSERV1 PICT "@!s27"
*       @ 17,33 GET lSUN1 PICT "@!"
        @ 17,39 GET lSQTDA1 PICT "9999"
        @ 17,45 GET lSUNIT1 PICT "999,999,999.99"

        @ 18,03 GET lSERV2 PICT "@!s27"
*       @ 18,33 GET lSUN2 PICT "@!"
        @ 18,39 GET lSQTDA2 PICT "9999"
        @ 18,45 GET lSUNIT2 PICT "999,999,999.99"
        
        @ 19,03 GET lSERV3 PICT "@!s27"
*       @ 19,33 GET lSUN3 PICT "@!"
        @ 19,39 GET lSQTDA3 PICT "9999"
        @ 19,45 GET lSUNIT3 PICT "999,999,999.99"
        
        @ 20,03 GET lSERV4 PICT "@!s27"
*       @ 20,33 GET lSUN4 PICT "@!"
        @ 20,39 GET lSQTDA4 PICT "9999"
        @ 20,45 GET lSUNIT4 PICT "999,999,999.99"

        @ 21,03 GET lSERV5 PICT "@!s27"
*       @ 21,33 GET lSUN5 PICT "@!"
        @ 21,39 GET lSQTDA5 PICT "9999"
        @ 21,45 GET lSUNIT5 PICT "999,999,999.99"
        SKIP
        @ 17,03 GET lSERV6 PICT "@!s27"
*       @ 17,33 GET lSUN6 PICT "@!"
        @ 17,39 GET lSQTDA6 PICT "9999"
        @ 17,45 GET lSUNIT6 PICT "999,999,999.99"

        @ 18,03 GET lSERV7 PICT "@!s27"
*       @ 18,33 GET lSUN7 PICT "@!"
        @ 18,39 GET lSQTDA7 PICT "9999"
        @ 18,45 GET lSUNIT7 PICT "999,999,999.99"
        

        READ
********************** CALCULANDO VARIAVEIS
                                lTOTAL1=(lUNIT1*lQTDA1)
                                lVALICMS1=((lTOTAL1*lICMS1)/100)
                                        *lICMS=(
                                @ 09,66 SAY lVALICMS1 PICT "999,999.99"
        
                                lTOTAL2=(lUNIT2*lQTDA2)
                                lVALICMS2=((lTOTAL2*lICMS2)/100)
                                @ 10,66 SAY lVALICMS2 PICT "999,999.99"
        
                                lTOTAL3=lUNIT3*lQTDA3
                                lVALICMS3=((lTOTAL3*lICMS3)/100)
                                @ 11,66 SAY lVALICMS3 PICT "999,999.99"
        
                                lTOTAL4=(lUNIT4*lQTDA4)
                                lVALICMS4=((lTOTAL4*lICMS4)/100)
                                @ 12,66 SAY lVALICMS4 PICT "999,999.99"
        
                                lTOTAL5=lUNIT5*lQTDA5
                                lVALICMS5=((lTOTAL5*lICMS5)/100)
                                @ 13,66 SAY lVALICMS5 PICT "999,999.99"
        
                                lTICMS=(lVALICMS1+lVALICMS2+lVALICMS3+lVALICMS4+lVALICMS5+lVALICMS6+lVALICMS7+lVALICMS8)
                                lTOTAL=(lTOTAL1+lTOTAL2+lTOTAL3+lTOTAL4+lTOTAL5+lTOTAL6+lTOTAL7+lTOTAL8)
                                IF lOPERACAO="REMESSA PARA CONSERTO"
                                            lCICMS=0
                                ELSEIF lOPERACAO#"REMESSA PARA CONSERTO"
                                            lCICMS=lTOTAL
                                ENDIF
                                lVALORICMS=(lTICMS)
                                @ 15,61 SAY lTOTAL PICT "999,999,999.99"
 
**********  VARIAVEIS DE CALCAULO DE SERVICO
                                lSTOTAL1=(lSUNIT1*lSQTDA1)
                                @ 17,61 SAY lSTOTAL1 PICT "999,999,999.99"
                                lSTOTAL2=(lSUNIT2*lSQTDA2)
                                @ 18,61 SAY lSTOTAL2 PICT "999,999,999.99"
                                lSTOTAL3=(lSUNIT3*lSQTDA3)
                                @ 19,61 SAY lSTOTAL3 PICT "999,999,999.99"
                                lSTOTAL4=(lSUNIT4*lSQTDA4)
                                @ 20,61 SAY lSTOTAL4 PICT "999,999,999.99"
                                lSTOTAL5=(lSUNIT5*lSQTDA5)
                                @ 21,61 SAY lSTOTAL5 PICT "999,999,999.99"
                                lSTOTAL6=(lSUNIT6*lSQTDA6)
                                @ 17,61 SAY lSTOTAL6 PICT "999,999,999.99"
                                lSTOTAL7=(lSUNIT7*lSQTDA7)
                                @ 18,61 SAY lSTOTAL7 PICT "999,999,999.99"

                                *lTOTAL=(lTOTAL1)
                                lSTOTAL=(lSTOTAL1+lSTOTAL2+lSTOTAL3+lSTOTAL4+lSTOTAL5+lSTOTAL6+lSTOTAL7)
                                @ 23,61 SAY lSTOTAL PICT "999,999,999.99"
                        read
                        SET COLOR TO W/B
                        @ 23,03 SAY "OS DADOS ESTAO CORRETOS Sim / Nao ? "
                                DO WHILE OP4<>"S" .and. OP4<>"N"
                                        WAIT TO OP4
                                ENDDO


              IF OP4="S"
                  SET COLOR TO W/B
                  RESTORE SCREEN FrOM LOGICA
              ENDIF
              IF OP4="N"
                 DO NOTTD4
              ENDIF
  SET COLOR TO W


                      SET COLOR TO W
RESTORE SCREEN FrOM LOGICA

