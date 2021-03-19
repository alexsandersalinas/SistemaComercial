* SUB24.PRG - FINALIZA RT
* AUTOR - ALEXSANDER SALINAS SANTOS - E-mail: salina@starmedia.com
* DATA - 12/01/2001
* ATUALIZADO : 12/03/2001
* EMAIL




* CONFIGURA€åES

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
   @ 14,40 SAY " IMPRESSAO "
   AG=0
   SET COLOR TO W/B,R/W
   @ 15,35 SAY " ³"
   @ 16,35 SAY " ³"
   @ 17,35 SAY " ³"
   @ 18,35 SAY " ³"
  * @ 10,31 SAY " ³"

       @ 15,36 clear to 18,59             
       @ 15,36 PROMPT "CLIENTE                " 
       @ 16,36 PROMPT "TECNICO/MANUAL         " 
       @ 17,36 PROMPT "CONCLUSAO              " 
     *  @ 18,36 PROMPT "OS FINAL              "
       SUB24=SAVESCREEN(00,00,24,80)
     MENU TO AG
      DO CASE
         CASE AG=0
            RESTSCREEN(00,00,24,80,SUB21)
            RETURN
         CASE AG=1
            DO RTP1
         CASE AG=2
            DO RTP2 
        CASE AG=3
            DO RTP3
  *       CASE AG=4
        *    DO SUB12 
    ENDCASE
ENDDO


