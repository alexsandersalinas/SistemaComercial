* SUB23.PRG - CONSULTA DE OS
* AUTOR - ALEXSANDER SALINAS SANTOS - E-mail: salina@starmedia.com
* DATA - 12/01/2001
* EMAIL

USE dbRT SHARED
     INDEX ON RTNUM TO ntxRT1
     INDEX ON NS TO ntxRT2
     INDEX ON ID TO ntxRT3   
     INDEX ON idnome to ntxRT4
                            IF NETERR()
                                   SET COLOR TO R
                                   @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    

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
   @ 14,40 SAY " CONSULTA DE RT "
   AG=0
   SET COLOR TO W/B,R/W
   @ 15,35 SAY " ³"
   @ 16,35 SAY " ³"
   @ 17,35 SAY " ³"
   @ 18,35 SAY " ³"
  * @ 10,31 SAY " ³"

       @ 15,36 clear to 18,59             
       @ 15,36 PROMPT " OSs. ABERTAS           " 
       @ 16,36 PROMPT " OSs. CONCLUIDAS        "
       @ 17,36 PROMPT " BUSCA PELO N/S         " 
       @ 18,36 PROMPT " BUSCA PELO NOME        "
    *   @ 18,36 PROMPT " Consultar             "
      * @ 10,33 PROMPT " Impressao           "+CHR(16)+" "
     SUB23=SAVESCREEN(00,00,24,80)
     MENU TO AG
      DO CASE
         CASE AG=0
            RESTSCREEN(00,00,24,80,SUB21)
            RETURN
         CASE AG=1
            DO RTC4 
         CASE AG=2
            DO RTC5
         CASE AG=3
            DO RTC2 
         CASE AG=4
            DO RTC3
         CASE AG=5
         *   DO SUB12 
    ENDCASE
ENDDO


