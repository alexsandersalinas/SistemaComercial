* NOTC1.PRG ***   
* CAMPOS P/ TRANSPORTE P/ NOTA FISCAL
* AUTOR: ALEXSANDER SALINAS SANTOS - EMAIL: salinas@starmedia.com
* 27/10/1999
OPCAO0=0
* ---------TELA MENU                

               *SET COLOR TO W/R
               *@ 17,61 TO 20,76 DOUBLE
                SET COLOR TO (W/N,W/R)
                @ 17,00 SAY "NOME.:"
                @ 17,07 PROMPT "EMITENTE SPSYSTEM                    "
                @ 17,07 PROMPT "EMITENTE SPSERVICE                   "
                @ 17,07 PROMPT "EMITENTE RRS                         "
                @ 17,07 PROMPT "DESTINATARIO                         "  
                MENU TO OPCAO0
                 DO CASE
                  CASE OPCAO0=1
                      lTRANSNOM="SP SYSTEM PLACE INFORMATICA LTDA"
                  CASE OPCAO0=2
                      lTRANSNOM="SP SERVICE INFORMATICA LTDA"
                  CASE OPCAO0=3
                      lTRANSNOM="RRS COMERCIO IMPORTACAO E EXPORTACAO LTDA"
                   CASE OPCAO0=4                                

                                       SET COLOR TO (W/N,W/N)
                                       * @ 16,66 CLEAR TO 17,78
                                       * @ 16,00 TO 16,78
                                        @ 16,02 SAY " TRANSPORTADOR "
                                        @ 17,61 clear to 23,76
                                        @ 17,00 SAY "NOME.:"GET lTRANSNOM PICT "@!"
                                        @ 17,61 GET lFRETE PICT "9"
                                        @ 18,00 SAY "PLACA:"GET lTRANSPL PICT "@!"
                                        @ 18,19 SAY "UF.:"GET lTRANPUF PICT "@!"
                                         @ 18,27 SAY "CNPJ/CPF:"GET lTCGCPF PICT "@!"
                                         @ 18,57 SAY "I.E.:"GET lTRANIE PICT "@!"
                                         @ 19,00 SAY "ENDERECO.:"GET lTRANSEND PICT "@!"
                                         @ 19,40 SAY "MUNICIPIO:"GET lTRANSCID PICT "@!"
                                         @ 19,68 SAY "UF....:"GET lTRANSUF PICT "@!"
                                         @ 20,00 SAY "QTDA.:"GET lTRANSQTD PICT "9999"
                                         @ 20,16 SAY "ESPECIE.:"GET lTRANSESP PICT "@!"
                                         @ 20,29 SAY "MARCA..:"GET lTMARCA PICT "@!"
                                         @ 20,55 SAY "NUMERO.........:"GET lTRASNUM PICT "9999"
                                         @ 21,00 SAY "PESO BRUTO...:"GET lTRPBRT PICT "@!"
                                         @ 21,25 SAY "PESO LIQUIDO.................................:"GET lTRPLQ PICT "@!"
                                         READ
                                         
               

                *CASE OPCAO0=0
                *                        SET COLOR TO W/B
                *                        @ 16,66 CLEAR TO 17,78
                *                        @ 17,01 TO 17,78
                *                        @ 17,02 SAY " TRANSPORTADOR "
                *                        @ 18,61 clear to 23,76
                                        
               ENDCASE

                      lTRANSPL=" "
                      lTRANPUF=" "
                      lTCGCPF=" "
                      lTRANIE=" "
                      lTRANSEND=" "
                      lTRANSCID=" "
                      lTRANSUF=" "
                      lTRANSQTD=0
                      lTRANSESP=" "
                      lTMARCA=" "
                      lTRASNUM=0
                      lTRPBRT=" "
                      lTRPLQ=" "

                     SET COLOR TO W/N
                      @ 17,00 clear to 21,76
                      @ 17,00 SAY "NOME.:"
                      @ 17,45 SAY "FRETE P/CONTA.:"GET lFRETE PICT "9"
                      @ 17,09 SAY lTRANSNOM
                      *@ 17,61 SAY lFRETE
                      READ

