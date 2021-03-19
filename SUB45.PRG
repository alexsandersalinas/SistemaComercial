* SUB45.PRG - menu de impressao
* AUTOR - ALEXSANDER SALINAS SANTOS - E-mail: salina@starmedia.com
* DATA - 10/05/2000
* EMAIL

CLOSE ALL
SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF

DO WHILE .T.
SET COLOR TO N
   @ 15,34 CLEAR TO 20,61
SET COLOR TO W/R
   @ 14,33 CLEAR TO 14,60
   @ 14,33 SAY "  IMPRESSAO  "
SET COLOR TO N+/N
   @ 15,34,20,61 BOX REPL(CHR(176),9)
SET COLOR TO W/B
   @ 15,33 CLEAR TO 19,60
   @ 15,33 TO 19,60
   
*   SET COLOR TO R/B
*   @ 05,31 SAY REPL(CHR(196),25)
*   @ 09,31 SAY REPL(CHR(196),25)
   SET COLOR TO GR+/B
   AG=0
   
   SET COLOR TO W/B,R/W
   @ 16,34 SAY " ³"
   @ 17,34 SAY " ³"
   @ 18,34 SAY " ³"
   @ 16,36 PROMPT "A - Boleto             "
   @ 17,36 PROMPT "B - Nota Fiscal        "
   @ 18,36 PROMPT "C - ****************** "
   SUB45=SAVESCREEN(00,00,24,80)
      MENU TO AG
      DO CASE
         CASE AG=0
            RESTSCREEN(00,00,24,80,SUB4)
            RETURN
         CASE AG=1
               DO notp2
         CASE AG=2
               DO notp1
         CASE AG=3
            *   DO notp3
      ENDCASE
ENDDO

