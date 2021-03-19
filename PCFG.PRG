*#lib c:\clip53\lib\dbfnsx.lib

SET DATE BRIT
SET CONSOLE OFF
SET CENTURY ON
SET EXCLUSIVE OFF
*******
* CONTROLE DE USO

*IF .NOT. FILE ("C:\WINDOWS\WIN.INI")
**   SET COLOR TO R+*/N+
**   CLEAR
**   @ ROW(),02   SAY "Alerta..."
**   @ ROW()+1,02 SAY "O Programa foi PIRATEADO..."
**   @ ROW()+1,02 SAY "Seu computador sera reiniciado..."
**   @ ROW()+1,02 SAY "<ENTER> para continuar..."
**   WAIT
  ** RUN C:\WINDOWS\COMMAND\REBOOT.COM
**   QUIT
**ENDIF

*DATA1=DATE()
*DATA2=CTOD("20/04/2003")

*IF DATA1 >= DATA2
*   set color to
*   clear
*   quit
*ENDIF

**************
USE dbCFG1 SHARED

UM=1
lCALC=CFG

                IF lCALC=4
                           lCFG=0
                   RLOCK()
                   REPL CFG WITH lCFG
                               @ 24,00 SAY "þ"
                               USE dbCLI1 SHARED
                               INDEX ON CGC TO ntxCGC1 
                               @ 24,00 SAY "þþþþþ"
                               INDEX ON CPF TO ntxCPF1
                               @ 24,00 SAY "þþþþþþ"
                               INDEX ON EMP TO ntxEMP1 
                               @ 24,00 SAY "þþþþþþþþþþ"
                               INDEX ON PESSOA TO ntxPES1
                               @ 24,00 SAY "þþþþþþþþþþþþþþþ"
                               IF NETERR()
                                   SET COLOR TO R
                                   @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    
                               
                               USE dbCLI2 SHARED
                               INDEX ON CGC TO ntxCGC2 
                               @ 24,00 SAY "þþþþþþþþþþþþþþþþþ"
                               INDEX ON CPF TO ntxCPF2
                               @ 24,00 SAY "þþþþþþþþþþþþþþþþþþþ"
                               INDEX ON EMP TO ntxEMP2 
                               @ 24,00 SAY "þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ"
                               INDEX ON PESSOA TO ntxPES2
                               @ 24,00 SAY "þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ" 
                               IF NETERR()
                                   SET COLOR TO R
                                   @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    
                        
                        
                        *INDEX ON NFA TO SPC_NFA 

                        *USE SP_BOLET SHARED
                        *INDEX ON BOLETO TO SPC_BOL

                         USE dbNOT1 SHARED
                      *      INDEX ON NTNUM TO ntxNNF1
                            @ 24,00 SAY "þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ" 
                         USE dbNOT2 SHARED
                      *      INDEX ON NTNUM TO ntxNNF2
                            @ 24,00 SAY "þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ" 
                               IF NETERR()
                                   SET COLOR TO R
                                   @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    
                        
                        *USE HISTORIC SHARED
                        *INDEX ON DATALIGA TO DATAL
                        *INDEX ON NCLIEN TO N

                        USE dbDLR1 SHARED
                            INDEX ON DAT TO ntxDLR1
                            @ 24,00 SAY "þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ"
                               IF NETERR()
                                   SET COLOR TO R
                                   @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    

                            ENDIF
                
                IF lCALC#4
                                lCFG=(lCALC+UM)
                          RLOCK()
                          REPL CFG WITH lCFG
                ENDIF

USE

*PROCEDURE TELAERRO

