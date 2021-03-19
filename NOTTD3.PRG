*------------------------------------------------------------------* 
* NOTTD3.PRG -  INCLUSAO DA DESCRICOES                             *
* AUTOR: ALEXSANDER SALINAS SANTOS - EMAIL: salinas@starmedia.com  *
* 26/10/1999                                                       *
*------------------------------------------------------------------*
*-----> limpando tela

op4=" "
SET COLOR TO W
@ 07,03 CLEAR TO 19,77
SET COLOR TO (W/R,W/R)
@ 06,02 CLEAR TO 18,76
@ 06,02 TO 18,76 DOUBLE

*----> MONTADO TELA             
@ 08,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 14,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 16,60 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
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
@ 14,30 SAY "Á"
@ 14,36 SAY "Á"
@ 14,44 SAY "Á"
@ 14,59 SAY "Å"
@ 15,61 SAY "³"
@ 16,59 SAY "À"
*-----> FIM
        SET COLOR TO W/N
        @ 07,03 SAY " EMISSAO DE NOTA FISCAL - TIPO:                                          "
        @ 07,35 SAY lOPERACAO
        SET COLOR TO W/R,W/R
        @ 08,05 SAY " DESCRICAO DO SERVICO "
*       @ 08,31 SAY " UN. "
        @ 08,38 SAY " QTDE "
        @ 08,46 SAY " V. UNIT. "
        @ 08,78 SAY " ICMS "
        @ 08,67 SAY " TOTAL "
           
*---> CAMPO 
                        SET COLOR TO (W/R,W/R)
                        @ 09,03 GET lSERV1 PICT "@!s27"
                        @ 09,39 GET lSQTDA1 PICT "9999"
                        @ 09,45 GET lSUNIT1 PICT "999,999,999.99"
                        
                        @ 10,03 GET lSERV2 PICT "@!s27"
                        @ 10,39 GET lSQTDA2 PICT "9999"
                        @ 10,45 GET lSUNIT2 PICT "999,999,999.99"
                 
                        @ 11,03 GET lSERV3 PICT "@!s27"
                        @ 11,39 GET lSQTDA3 PICT "9999"
                        @ 11,45 GET lSUNIT3 PICT "999,999,999.99"

                        @ 12,03 GET lSERV4 PICT "@!s27"
                        @ 12,39 GET lSQTDA4 PICT "9999"
                        @ 12,45 GET lSUNIT4 PICT "999,999,999.99"

                        @ 13,03 GET lSERV5 PICT "@!s27"
                        @ 13,39 GET lSQTDA5 PICT "9999"
                        @ 13,45 GET lSUNIT5 PICT "999,999,999.99"
                        
                        SKIP
                        
                        @ 09,03 GET lSERV6 PICT "@!s27"
                        @ 09,39 GET lSQTDA6 PICT "9999"
                        @ 09,45 GET lSUNIT6 PICT "999,999,999.99"
                        
                        @ 10,03 GET lSERV7 PICT "@!s27"
                        @ 10,39 GET lSQTDA7 PICT "9999"
                        @ 10,45 GET lSUNIT7 PICT "999,999,999.99"
                 

*------> bunscanda de variaveis
                        @ 09,61 SAY lSTOTAL1 PICT "999,999,999.99"
                        @ 10,61 SAY lSTOTAL2 PICT "999,999,999.99"
                        @ 11,61 SAY lSTOTAL3 PICT "999,999,999.99"
                        @ 12,61 SAY lSTOTAL4 PICT "999,999,999.99"
                        @ 13,61 SAY lSTOTAL5 PICT "999,999,999.99"
                        SKIP
                        @ 09,61 SAY lSTOTAL6 PICT "999,999,999.99"
                        @ 10,61 SAY lSTOTAL7 PICT "999,999,999.99"

                                
                                lTOTAL=(lTOTAL1+lTOTAL2+lTOTAL3+lTOTAL4+lTOTAL5+lTOTAL6+lTOTAL7+lTOTAL8)
                        @ 15,61 SAY lTOTAL PICT "999,999,999.99"
                        *@ 15,08 SAY lNTOBS 
                        *@ 16,03 SAY lNTOBS2
*-------> FECHANDO BUSCA
*                        @ 15,03 SAY "OBS:"GET lOBSERV PICT "@!"
*                        @ 16,03 GET lOBSERV2 PICT "@!"
                        SAVE SCRE TO TEST
                        READ

************** CALCULO DE VARIAVEIS
                        lSTOTAL1=(lSUNIT1*lSQTDA1)
                                @ 09,61 SAY lSTOTAL1 PICT "999,999,999.99"
                        lSTOTAL2=(lSUNIT2*lSQTDA2)
                                @ 10,61 SAY lSTOTAL2 PICT "999,999,999.99"
                        lSTOTAL3=(lSUNIT3*lSQTDA3)
                                @ 11,61 SAY lSTOTAL3 PICT "999,999,999.99"
                        lSTOTAL4=(lSUNIT4*lSQTDA4)
                                @ 12,61 SAY lSTOTAL4 PICT "999,999,999.99"
                        lSTOTAL5=lSUNIT5*lSQTDA5
                                @ 13,61 SAY lSTOTAL5 PICT "999,999,999.99"
                        lSTOTAL6=(lSUNIT6*lSQTDA6)
                                @ 09,61 SAY lSTOTAL6 PICT "999,999,999.99"
                        lSTOTAL7=(lSUNIT7*lSQTDA7)
                                @ 10,61 SAY lSTOTAL7 PICT "999,999,999.99"

                        
                        lSTOTAL=(lSTOTAL1+lSTOTAL2+lSTOTAL3+lSTOTAL4+lSTOTAL5+lSTOTAL6+lSTOTAL7)
                        @ 15,61 SAY lSTOTAL PICT "999,999,999.99"
                        *@ 15,03 SAY "OBS:"GET lOBSERV PICT "@!"
                        *@ 17,03 GET lOBSERV2 PICT "@!"
                        READ
**************** FECHANDO CALCULOS                        
                        SET COLOR TO W/B
                        @ 17,03 SAY "OS DADOS ESTAO CORRETOS Sim / Nao ? "
                        DO WHILE OP4<>"S" .and. OP4<>"N"
                                WAIT TO OP4
                        ENDDO
              IF OP4="S"
                  SET COLOR TO W
                  RESTORE SCREEN FrOM LOGICA
              ENDIF
              IF OP4="N"
                 DO NOTTD3
              ENDIF
  SET COLOR TO W

