** NOTTD1.PRG - TELA P/ INCLUSAO DE DESCRICAO DA NOTAS DE VENDAS/REMESSA P/ CONSERTO
** AUTOR: ALEXSANDER SALINAS SANTOS - E-MAIL: salinas@starmedia.com
** 26/10/1999

op4=" "
*SETCOLOR()
*corSBTELA:="W/R"
*corTELA:="W/R,W/R"
SET COLOR TO W
@ 07,03 CLEAR TO 19,77
SET COLOR TO (W/R,W/R)
@ 06,02 CLEAR TO 18,76
@ 06,02 TO 18,76 DOUBLE

***** MONTADO TELA             
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
****  FIM

        SET COLOR TO W/N
        @ 07,03 SAY " EMISSAO DE NOTA FISCAL - TIPO:                                          "
        @ 07,35 SAY lOPERACAO
        SET COLOR TO W/R,W/R
        @ 08,05 SAY " DESCRICAO DO PRODUTO "
        @ 08,31 SAY " UN. "
        @ 08,38 SAY " QTDE "
        @ 08,46 SAY " V. UNIT. "
        @ 08,59 SAY " ICMS "
        @ 08,67 SAY " TOTAL "
        
        ******  VARIAVEIS

        @ 09,03 GET lDESC1 PICT "@!S27"
        @ 09,33 GET lUN1 PICT "@!" 
        @ 09,39 GET lQTDA1 PICT "9999"
        @ 09,45 GET lUNIT1 PICT "999,999,999.99"
        @ 09,61 GET lICMS1 PICT "99" 

        @ 10,03 GET lDESC2 PICT "@!S27"
        @ 10,33 GET lUN2 PICT "@!"
        @ 10,39 GET lQTDA2 PICT "9999"
        @ 10,45 GET lUNIT2 PICT "999,999,999.99"
        @ 10,61 GET lICMS2 PICT "99" 
         
        @ 11,03 GET lDESC3 PICT "@!S27"
        @ 11,33 GET lUN3 PICT "@!"
        @ 11,39 GET lQTDA3 PICT "9999"
        @ 11,45 GET lUNIT3 PICT "999,999,999.99"
        @ 11,61 GET lICMS3 PICT "99" 

        @ 12,03 GET lDESC4 PICT "@!S27"
        @ 12,33 GET lUN4 PICT "@!"
        @ 12,39 GET lQTDA4 PICT "9999"
        @ 12,45 GET lUNIT4 PICT "999,999,999.99"
        @ 12,61 GET lICMS4 PICT "99"

        @ 13,03 GET lDESC5 PICT "@!S27"
        @ 13,33 GET lUN5 PICT "@!"
        @ 13,39 GET lQTDA5 PICT "9999"
        @ 13,45 GET lUNIT5 PICT "999,999,999.99"
        @ 13,61 GET lICMS5 PICT "99"
           
        *lTOTAL=(lTOTAL1+lTOTAL2+lTOTAL3+lTOTAL4+lTOTAL5)
        *@ 15,61 SAY lTOTAL PICT "999,999,999.99"
        *@ 15,03 SAY "OBS:"GET lNTOBS PICT "@!"
        *@ 16,03 GET lNTOBS2 PICT "@!"
        
      * SAVE SCRE TO telaDESC
      * READ
          SKIP
        
        @ 09,03 GET lDESC6 PICT "@!S27"
        @ 09,33 GET lUN6 PICT "@!"
        @ 09,39 GET lQTDA6 PICT "9999"
        @ 09,45 GET lUNIT6 PICT "999,999,999.99"
        @ 09,61 GET lICMS6 PICT "99" 
        *AVE SCRE TO telaDESC
        *EAD
          SKIP

        @ 10,03 GET lDESC7 PICT "@!S27"
        @ 10,33 GET lUN7 PICT "@!"
        @ 10,39 GET lQTDA7 PICT "9999"
        @ 10,45 GET lUNIT7 PICT "999,999,999.99"
        @ 10,61 GET lICMS7 PICT "99"
        *AV0 SCRE TO telaDESC
       *READ
         SKIP

        @ 11,03 GET lDESC8 PICT "@!S27"
        @ 11,33 GET lUN8 PICT "@!"
        @ 11,39 GET lQTDA8 PICT "9999"
        @ 11,45 GET lUNIT8 PICT "999,999,999.99"
        @ 11,61 GET lICMS8 PICT "99"
        *AV1 SCRE TO telaDESC
        SAVE SCRE TO telaDESC
        READ
        
        lTOTAL=(lTOTAL1+lTOTAL2+lTOTAL3+lTOTAL4+lTOTAL5+lTOTAL6+lTOTAL7+lTOTAL8)
        @ 15,61 SAY lTOTAL PICT "999,999,999.99"
        *@ 15,03 SAY "OBS:"GET lNTOBS PICT "@!"
        *@ 16,03 GET lNTOBS2 PICT "@!"
        
       



        
***************** CAMPOS COM CALCULO DO ICMS
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

                        lTOTAL6=(lUNIT6*lQTDA6)
                        lVALICMS6=((lTOTAL6*lICMS6)/100)
                        *lICMS=(
                        @ 09,66 SAY lVALICMS6 PICT "999,999.99"
        
                        lTOTAL7=(lUNIT7*lQTDA7)
                        lVALICMS7=((lTOTAL7*lICMS7)/100)
                        @ 10,66 SAY lVALICMS7 PICT "999,999.99"
                
                        lTOTAL8=lUNIT8*lQTDA8
                        lVALICMS8=((lTOTAL8*lICMS8)/100)
                        @ 11,66 SAY lVALICMS8 PICT "999,999.99"
        

        
****************** TOTAL DO CALCULO DO ICMS
                        lTICMS=(lVALICMS1+lVALICMS2+lVALICMS3+lVALICMS4+lVALICMS5+lVALICMS6+lVALICMS7+lVALICMS8)
                        lTOTAL=(lTOTAL1+lTOTAL2+lTOTAL3+lTOTAL4+lTOTAL5+lTOTAL6+lTOTAL7+lTOTAL8)
                       IF lOPERACAO="REMESSA PARA CONSERTO"
                                    lCICMS=0
                       ELSEIF lOPERACAO#"REMESSA PARA CONSERTO"
                                    lCICMS=lTOTAL
                       ENDIF
                       lVALORICMS=(lTICMS)
********* FIM DO CALCULO DO ICMS

********* TOTAL GERAL
                @ 15,61 SAY lTOTAL PICT "999,999,999.99"
               * @ 15,08 SAY lNTOBS 
               * @ 16,03 SAY lNTOBS2 
                READ
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
                                        DO NOTTD1
                                ENDIF

*****FIM
