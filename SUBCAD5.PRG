* SISTEMA.....: DOLAR 
* MODULO......: SUBCAD5.PRG - MENU UTIL/DOLAR
* DATA INICIO.: 21/04/1999
* AUTOR.......: ALEXSANDER SALINAS SANTOS
* EMPRESA.....: SP SYSTEM PLACE INFORMATICA LTDA

* CONFIGURA€åES

CLOSE ALL
SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF

DO WHILE .T.
*TELA=" " 
SET COLOR TO N+/N
   @ 06,33,10,57 BOX REPL(CHR(176),9)
   SET COLOR TO R/B
   @ 05,31 SAY REPL(CHR(196),25)
   @ 09,31 SAY REPL(CHR(196),25)
   SET COLOR TO GR+/B
   @ 05,32 SAY " SUBMENU DOLAR "
   AG=0
   SET COLOR TO W/B,R/W
   @ 06,31 SAY " ³"
   @ 07,31 SAY " ³"
   @ 08,31 SAY " ³"
   @ 06,33 PROMPT "A - Consultas          "
   @ 07,33 PROMPT "B - Inclusao           "
   @ 08,33 PROMPT "C - Alteracao          "
                        SAVE SCRE TO TLDOLAR

MENU TO AG
      DO CASE
         CASE AG=0
            RESTSCREEN(00,00,24,80,JLTELA)            
            RETURN
         CASE AG=1
  *              DO DOL3
         CASE AG=2
                DO DOL1
         CASE AG=3
                DO DOL2
         ENDCASE
ENDDO

