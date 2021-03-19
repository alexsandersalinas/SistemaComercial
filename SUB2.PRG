* SISTEMA.....: MENU DE R.T.
* MODULO......: SUB2.PRG - SUBMENU DE RELARIO TêCNICO
* DATA INICIO.: 10/05/2000
* AUTOR.......: ALEXSANDER SALINAS SANTOS
* ATUALIZADO..: 10/01/2001


* CONFIGURAÄÂES

CLOSE ALL
SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF

DO WHILE .T.


SET COLOR TO N+/N
   @ 06,33,13,57 BOX REPL(CHR(176),9)
   SET COLOR TO R/B
   @ 05,31 SAY REPL(CHR(196),25)
   @ 12,31 SAY REPL(CHR(196),25)
   SET COLOR TO GR+/B
   @ 05,32 SAY " O.S. "
   AG=0
   SET COLOR TO W/B,R/W
   @ 06,31 SAY " ≥"
   @ 07,31 SAY " ≥"
   @ 08,31 SAY " ≥"
   @ 09,31 SAY " ≥"
   @ 10,31 SAY " ≥"
   @ 11,31 SAY " ≥"

       @ 06,33 PROMPT " Incluir               " 
       @ 07,33 PROMPT " Alterar               " 
       @ 08,33 PROMPT " Excluir               "
       @ 09,33 PROMPT " Consultar           "+CHR(16)+" "
       @ 10,33 PROMPT " PosiÄao            "+CHR(16)+" "
       @ 11,33 PROMPT " Impressao           "+CHR(16)+" "
     SUB21=SAVESCREEN(00,00,24,80)
     MENU TO AG
      DO CASE
         CASE AG=0
            RESTSCREEN(00,00,24,80,JLTELA)
            RETURN
         CASE AG=1
            DO RTI1 
         CASE AG=2
            DO RTA1 
         CASE AG=3
            DO RTE1
         CASE AG=4
            DO SUB23 
         CASE AG=5
            DO RTIP1 
         CASE AG=6
            DO SUB25

    ENDCASE
ENDDO

