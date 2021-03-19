*------------------------------------------------------------------* 
* RTLP2.PRG -  LISTA DE PE€AS APLICADAS                          *
* AUTOR: ALEXSANDER SALINAS SANTOS - EMAIL: salinas@starmedia.com  *
* 26/10/1999                                                       *
* ATUALIZADO 18/01/2001
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
*@ 14,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 16,03 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"

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
        @ 14,30 SAY "³"
        @ 14,36 SAY "³"
        @ 14,44 SAY "³"
        @ 14,59 SAY "³"
        @ 14,65 SAY "³"
        @ 15,30 SAY "³"
        @ 15,36 SAY "³"
        @ 15,44 SAY "³"
        @ 15,59 SAY "³"
        @ 15,65 SAY "³"

@ 08,30 SAY "Â"
@ 08,36 SAY "Â"
@ 08,44 SAY "Â"
@ 08,59 SAY "Â"
*@ 14,30 SAY "Á"
*@ 14,36 SAY "Á"
*@ 14,44 SAY "Á"
*@ 14,59 SAY "Å"
@ 16,30 SAY "Á"
@ 16,36 SAY "Á"
@ 16,44 SAY "Á"
@ 16,59 SAY "Á"

*-----> FIM
        SET COLOR TO (W/R,W/R)
        @ 07,03 SAY " DESCRI€AO DE PE€AS                                          "
       SET COLOR TO (W/R,W/R)
        @ 08,05 SAY " DESCRICAO DO PE€AS "
*       @ 08,31 SAY " UN. "
        @ 08,38 SAY " QTDE "
        @ 08,46 SAY " V. UNIT. "
        @ 08,78 SAY " ICMS "
        @ 08,67 SAY " TOTAL "
           
*---> CAMPO 
                        SET COLOR TO (W/R,W/R)
                        @ 09,03 SAY lSERV1 PICT "@!s27"
                        @ 09,39 SAY lSQTDA1 PICT "9999"
                        @ 09,45 SAY lSUNIT1 PICT "999,999,999.99"
                        @ 09,61 SAY lSTOTAL1 PICT "999,999,999.99"
                        
                        @ 10,03 SAY lSERV2 PICT "@!s27"
                        @ 10,39 SAY lSQTDA2 PICT "9999"
                        @ 10,45 SAY lSUNIT2 PICT "999,999,999.99"
                        @ 10,61 SAY lSTOTAL2 PICT "999,999,999.99"
                        @ 10,61 SAY lSTOTAL2 PICT "999,999,999.99"

                        @ 11,03 SAY lSERV3 PICT "@!s27"
                        @ 11,39 SAY lSQTDA3 PICT "9999"
                        @ 11,45 SAY lSUNIT3 PICT "999,999,999.99"
                        @ 11,61 SAY lSTOTAL3 PICT "999,999,999.99"

                        @ 12,03 SAY lSERV4 PICT "@!s27"
                        @ 12,39 SAY lSQTDA4 PICT "9999"
                        @ 12,45 SAY lSUNIT4 PICT "999,999,999.99"
                        @ 12,61 SAY lSTOTAL4 PICT "999,999,999.99"
                        
                        @ 13,03 SAY lSERV5 PICT "@!s27"
                        @ 13,39 SAY lSQTDA5 PICT "9999"
                        @ 13,45 SAY lSUNIT5 PICT "999,999,999.99"
                        @ 13,61 SAY lSTOTAL5 PICT "999,999,999.99"
                        
                        @ 14,03 SAY lSERV6 PICT "@!s27"
                        @ 14,39 SAY lSQTDA6 PICT "9999"
                        @ 14,45 SAY lSUNIT6 PICT "999,999,999.99"
                        @ 14,61 SAY lSTOTAL6 PICT "999,999,999.99"

                        @ 15,03 SAY lSERV7 PICT "@!s27"
                        @ 15,39 SAY lSQTDA7 PICT "9999"
                        @ 15,45 SAY lSUNIT7 PICT "999,999,999.99"
                        @ 15,61 SAY lSTOTAL7 PICT "999,999,999.99"
                        @ 17,55 SAY "TOTAL"
                        @ 17,61 SAY lSTOTAL PICT "999,999,999.99"


                        SET COLOR TO (W/R,W/R)
                        @ 17,03 SAY "TECLE QUALQUER TECLA P/ CONTINUAR"
                        WAIT

                  RESTORE SCREEN FrOM PECAS

