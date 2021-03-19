* SUB61.PRG - ORGANIZANDO DADOS
* AUTOR - ALEXSANDER SALINAS SANTOS - E-mail: salina@starmedia.com
* DATA - 13/12/99
* EMAIL


SET TALK OFF
SET CONSOLE OFF
SET EXCLUSIVE OFF

*
*O SC_CHR3
*
SET COLOR TO N
   @ 15,35 CLEAR TO 18,61
SET COLOR TO W/R
   @ 14,34 CLEAR TO 14,60
   @ 14,34 SAY "  ORGANIZADO REGISTROS  "
SET COLOR TO W/B
   @ 15,34 CLEAR TO 17,60
   @ 15,34 TO 17,60
   @ 16,35 SAY " Aguarde um minuto... "
   *

tro_Ani(16,58)
USE dbCFG1 SHARED
 lCFG=0
 RLOCK()
 REPL CFG WITH lCFG

tro_Ani(16,58)

USE dbCLI1 SHARED
 INDEX ON CGC TO ntxCGC1 
 INDEX ON CPF TO ntxCPF1
 INDEX ON EMP TO ntxEMP1 
 INDEX ON PESSOA TO ntxPES1
      IF NETERR()
         SET COLOR TO R
             @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
             @ 05,00 SAY "ERRO N. 0001"
      ENDIF

tro_Ani(16,58)
USE dbCLI2 SHARED
    INDEX ON CGC TO ntxCGC2 
    INDEX ON CPF TO ntxCPF2
    INDEX ON EMP TO ntxEMP2 
    INDEX ON PESSOA TO ntxPES2
          IF NETERR()
             SET COLOR TO R
                 @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                 @ 05,00 SAY "ERRO N. 0002"
          ENDIF    
*                        
*                        
*tro_Ani(16,58)
*USE dbNOT1 SHARED
*    INDEX ON NTNUM TO ntxNNF1
*         IF NETERR()
*             SET COLOR TO R
*                  @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
*                  @ 05,00 SAY "ERRO N. 0003"
*          ENDIF    
*
*tro_Ani(16,58)
*USE dbNOT2 SHARED
*    INDEX ON NTNUM TO ntxNNF2
*         IF NETERR()
*            SET COLOR TO R
*                 @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
*                  @ 05,00 SAY "ERRO N. 0004"
*          ENDIF    
*
tro_Ani(16,58)
USE dbDLR1 SHARED
    INDEX ON DAT TO ntxDLR1
          IF NETERR()
             SET COLOR TO R
                @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                @ 05,00 SAY "ERRO N. 0006"
          ENDIF    


SET COLOR TO W/B
@ 16,36 SAY "                       "
@ 16,36 SAY "    Pronto ..."
INKEY(2)
RESTSCREEN(00,00,24,80,SUB6)
