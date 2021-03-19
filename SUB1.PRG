* SISTEMA.....: CONTROLE E cadastro
* MODULO......: SUB1.PRG - SUBMENU DE NOTA FISCAL
* DATA INICIO.: 10/05/2000
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


SET COLOR TO N+/N
   @ 06,33,11,57 BOX REPL(CHR(176),9)
   SET COLOR TO R/B
   @ 05,31 SAY REPL(CHR(196),25)
   @ 10,31 SAY REPL(CHR(196),25)
   SET COLOR TO GR+/B
   @ 05,32 SAY " CADASTRO "
   AG=0
   SET COLOR TO W/B,R/W
   @ 06,31 SAY " ³"
   @ 07,31 SAY " ³"
   @ 08,31 SAY " ³"
   @ 09,31 SAY " ³"
  * @ 10,31 SAY " ³"

       @ 06,33 PROMPT " Incluir               " 
       @ 07,33 PROMPT " Alterar               " 
       @ 08,33 PROMPT " Excluir               "
       @ 09,33 PROMPT " Consultar             "
      * @ 10,33 PROMPT " Impressao           "+CHR(16)+" "
     SUB1=SAVESCREEN(00,00,24,80)
     MENU TO AG
      DO CASE
         CASE AG=0
            RESTSCREEN(00,00,24,80,JLTELA)
            RETURN
         CASE AG=1
            DO CADI1 
         CASE AG=2
            DO SUB12 
         CASE AG=3
        *    DO CADE1
         CASE AG=4
        *    DO SUB12 
    ENDCASE
ENDDO

