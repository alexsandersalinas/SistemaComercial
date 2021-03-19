#include "Gra.ch" 

procedure MAIN

        SET CURSOR ON

       SETMOUSE(.T.) 

CLS

        GraBox(NIL,{72,176},{200,256},GRA_FILL,30,30) 


   SET COLOR TO N+/N
   @ 06,05,13,26 BOX REPL(CHR(176),9)
   SET COLOR TO R/B
   DATA=DATE()
   ANO=YEAR(DATA)
   @ 05,04 SAY REPL(CHR(196),21)
   @ 12,04 SAY REPL(CHR(196),21)
   SET COLOR TO GR+/B
   @ 05,05 SAY " MENU GERAL "
   JL=0
   SET COLOR TO W/B,R/W
   @ 06,04 SAY " ³"
   @ 07,04 SAY " ³"
   @ 08,04 SAY " ³"
   @ 09,04 SAY " ³"       
   @ 10,04 SAY " ³"
   @ 11,04 SAY " ³"

   @ 06,06 PROMPT "A - Cadastros    "+CHR(16)+" "
   @ 07,06 PROMPT "B - Pedidos      "+CHR(16)+" "
   @ 08,06 PROMPT "C - Estoque      "+CHR(16)+" " 
   @ 09,06 PROMPT "D - Nota Fiscal  "+CHR(16)+" "
   @ 10,06 PROMPT "E - Dolar        "+CHR(16)+" "
   @ 11,06 PROMPT "F - Util         "+CHR(16)+" "

wait

RETURN

