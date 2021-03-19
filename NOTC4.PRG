/*
  NOTC4.PRG CONSULTA DO CLIENTE P/ IMPRESSÇO
  AUTOR: ALEXSANDER SALINAS SANTOS - EMAIL: salinas@starmedia.com
  DATA: 25/11/1999
  */


acao=" "
OP=0
checkval=0
checkCLIENTE=lNCLIEN

              SELE 4
                  USE dbCLI1 INDEX ntxCGC1 SHARED
                  seek checkCLIENTE
                  checkCLIEOK="CGC"
                  checkVal=1
                  IF .NOT. FOUND()
                         USE dbCLI1 INDEX ntxCPF1 SHARED
                         seek checkCLIENTE
                         checkCLIEOK="CPF"
                         checkval=1
                         IF .NOT. FOUND()
                            SELE 3
                            USE dbCLI2 INDEX ntxCGC2 SHARED
                            seek checkCLIENTE
                            checkCLIEOK="CGC"
                            checkval=2
                            IF .NOT. FOUND()
                                USE dbCLI2 INDEX ntxCPF2 SHARED
                                seek checkCLIENTE
                                checkCLIEOK="CPF"
                                checkval=2
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
// fim da pesquisa


