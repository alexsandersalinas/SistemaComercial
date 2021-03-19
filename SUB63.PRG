SET CONSOLE OFF
DataBKP = DATE()
ACAO    = SPACE(1)

*
SET COLOR TO W
CLEAR
SET COLOR TO W/R
@ 00,00 clear to 00,79
@ 00,00 SAY "Recuperando backup..."
set color to w
@ 02,00 SAY "Continua S/N ? "
   DO WHILE ACAO<>"S" .and. ACAO<>"N"
      WAIT TO ACAO
   ENDDO

   IF ACAO="S"
       @ 03,00 say "Coloque o 1§ disquete para recupera‡„o do backup..."
         WAIT
         !Y:
         !COPY *.DBF Y:\DADOS
         !A:ARJ X -va * Y:\
         SET COLOR TO W/R
         @ 00,00 SAY "Restaura‡„o concluido !!!"
         inkey(3)
   ENDIF
 
RESTSCREEN(00,00,24,80,SUB6)


