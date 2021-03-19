* RTC1.PRG CONSULTA DO TIPO DE CLIENTE
* AUTOR: ALEXSANDER SALINAS SANTOS - EMAIL: salinas@starmedia.com
* DATA: 27/10/1999
* ATUALIZADO: 11/01/2001


acao=" "
OP=0
              
              SELE 4
                  USE dbCLI1 INDEX ntxCGC1 SHARED
                  seek checkCLIENTE
                  checkCLIEOK="CGC"
                  variavelCHECK=1
                  IF .NOT. FOUND()
                         USE dbCLI1 INDEX ntxCPF1 SHARED
                         seek checkCLIENTE
                         checkCLIEOK="CPF"
                         variavelCHECK=1
                         IF .NOT. FOUND()
                            SELE 3
                            USE dbCLI2 INDEX ntxCGC2 SHARED
                            seek checkCLIENTE
                            checkCLIEOK="CGC"
                            variavelCHECK=2
                            IF .NOT. FOUND()
                                USE dbCLI2 INDEX ntxCPF2 SHARED
                                seek checkCLIENTE
                                checkCLIEOK="CPF"
                                variavelCHECK=2
                                   IF .NOT. FOUND()
                                                        pesquisaERRO=1
                                                        SET COLOR TO (W/N,W/N)
                                                        @ 12,17 CLEAR TO 14,61
                                                        SET COLOR TO (W/R,W/R)
                                                        @ 11,16 CLEAR TO 13,60
                                                        @ 11,16 TO 13,60 DOUBLE
                                                        @ 12,17 SAY "            ERRO DE REGISTRO ...         "
                                                        INKEY(2)
                                                         RETURN
                                                ENDIF
                                         ENDIF
                          ENDIF
                    ENDIF
**************** PEGADO OS DADOS E COLOCANDO NAS VARIAVEIS
        *
        *lCPF = CPF
        *   lNFA = NFA
        *   lEMP = EMP
        *   lend = END
        *   lNUM = nUM
        *   lDDD = lDDD
        *   lTELEF = lTELEF
        *
                        IF checkCLIEOK="CPF"
                                @ 02,12 SAY "CPF N§:"
                                @ 02,20 SAY checkCLIENTE
                        endif
                        IF checkCLIEOK="CGC"
                                @ 02,12 SAY "CNPJ N§:"
                                @ 02,20 SAY checkCLIENTE
                        ENDIF
                      SET COLOR TO W+
                        @ 02,col() say " "
                        @ 02,col() SAY alltrim("CLIENTE:")
                        @ 02,col() say " "
                        @ 02,col() say emp PICT "@!S40"
                        set color to w
                        @ 03,00 SAY "END..:" 
                        set color to w+
                        @ 03,07 SAY alltrim(end) PICT "@!S35"
                        @ 03,col() SAY " - "
                        @ 03,col() SAY alltrim(bairro) PICT "@!S20"
                        @ 03,col() SAY " - "
                        @ 03,col() SAY alltrim(cidade) PICT "@!S15"
                        @ 03,col() SAY " - "
                        @ 03,col() SAY UF
                        set color to w
                        @ 04,00 say "CEP..:"
                        set color to w+
                        @ 04,07 say alltrim(cep) pict "99999-999"
                        @ 04,col() say " - "
                        @ 04,col() say alltrim(DDD) 
                        @ 04,col() say " - "
                        @ 04,col() say alltrim(TEL1)
                        @ 04,col() say " - "
                        
