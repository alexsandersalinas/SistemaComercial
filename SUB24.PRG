* SUB24.PRG - FINALIZA RT
* AUTOR - ALEXSANDER SALINAS SANTOS - E-mail: salina@starmedia.com
* DATA - 12/01/2001
* EMAIL




* CONFIGURA��ES

CLOSE ALL
SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF

DO WHILE .T.


SET COLOR TO N+/N
   @ 15,36,20,60 BOX REPL(CHR(176),9)
   SET COLOR TO R/B
   @ 14,35 SAY REPL(CHR(196),25)
   @ 19,35 SAY REPL(CHR(196),25)
   SET COLOR TO GR+/B
   @ 14,40 SAY " FINALIZA RT "
   AG=0
   SET COLOR TO W/B,R/W
   @ 15,35 SAY " �"
   @ 16,35 SAY " �"
   @ 17,35 SAY " �"
   @ 18,35 SAY " �"
  * @ 10,31 SAY " �"

       @ 15,36 clear to 18,59             
       @ 15,36 PROMPT " POSSI�AO              " 
       @ 16,36 SAY  " *********             " 
       @ 17,36 PROMPT " CONSULTAS             "
       @ 18,36 SAY " *********             "
     SUB24=SAVESCREEN(00,00,24,80)
     MENU TO AG
      DO CASE
         CASE AG=0
            RESTSCREEN(00,00,24,80,SUB21)
            RETURN
         CASE AG=1
            DO RTIP1 
         CASE AG=2
            DO RTC2 
         CASE AG=3
       *     DO RTC3
         CASE AG=4
        *    DO SUB12 
    ENDCASE
ENDDO


