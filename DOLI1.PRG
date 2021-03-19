* DOL1.PRG - ARQUIVO DE INCLUSAO DO DOLAR
* **************************************


CLOSE ALL
USE dbDLR1 SHARED
INDEX ON DAT TO ntxDLR1 
USE

SET DATE BRITISH
SET CONSOLE OFF
SET CENTURY ON


*DO WHILE .T.

     SET COLOR TO W/R,W/R
     @ 05,02 CLEAR TO 05,77
     SET COLOR TO W/R
     @ 05,02 SAY "INCLUSÇO| DOLAR "
     SET COLOR TO (W/B,W/B)
     @ 06,02 CLEAR TO 20,77
     SET COLOR TO (W/B,W/B)


                                           lDAT   = CTOD("  /  /    ")
                                           lFONTE  = SPACE(15)
                                           lLOG    = SPACE(15)
                                           lDT     = 0
                                           lDC     = 0
                                           ACAO = SPACE(1)


                                          
                        SET COLOR TO (W/R,W/R)
                                
                        SET COLOR TO (W/B,W/B)
                        @ 07,02 SAY "COTA€ÇO: "GET lDAT PICT "99/99/99"    
                        READ 

                                IF lDAT>DATE() .OR. lDAT=CTOD("  /  /    ")
                                       RESTSCREEN(00,00,24,80,JLTELA)
                                    RETURN
                                ENDIF

                                USE dbDLR1 INDEX ntxDLR1 SHARED
                                SEEK lDAT
                                IF FOUND()
                                       SET COLOR TO (W/R,W/R)
                                            @ 23,02 SAY "JA EXISTE UM REGISTRO NESTA DATA..." 
                                                INKEY(3)
                                   RESTSCREEN(00,00,24,80,ANTSDOLA)
                                    RETURN

                   ENDIF
                                 
                                 @ 08,02,08,77 BOX REPL(CHR(196),9)
                                 @ 12,02,12,77 BOX REPL(CHR(196),9)
                                 @ 16,02,16,77 BOX REPL(CHR(196),9)
                                 
                                 @ 10,07 SAY "VALOR DO DOLAR TURISMO"
                                 @ 10,58 GET lDT PICT "9,999.999"
                                 @ 14,07 SAY "VALOR DO DOLAR COMERCIAL"
                                 @ 14,58 GET lDC PICT "9,999.999"
                                 @ 17,02 SAY "FONTE..:"GET lFONTE PICT "@!"
                                 @ 19,02 SAY "PESSOA.:"GET lLOG PICT "@!"
                                 READ
                                        SET COLOR TO (W/R,W/R)
                                        @ 23,01 SAY "Grava as informacoes Sim ou Nao?                 "
                                        DO WHILE ACAO<>"S" .and. ACAO<>"N"
                                           WAIT TO ACAO
                                        ENDDO
                                                IF ACAO="S"
                                                        @ 23,01 SAY "Informacoes sendo Gravandas...                         "
                                                        * DBAPPEND()
                                                        *        UNLOCK ALL
                                                        APPEND BLANK
                                                        RLOCK()
                                                        REPL DAT WITH lDAT
                                                        REPL FONTE WITH lFONTE
                                                        REPL LOG WITH lLOG
                                                        REPL DC WITH lDC
                                                        REPL DT WITH lDT
                                                 endif
                                 use
                                                RESTSCREEN(00,00,24,80,antsDOLA)


*


