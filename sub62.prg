SET CONSOLE OFF
DataBKP = DATE()
ACAO    = SPACE(1)

*
SET COLOR TO W
CLEAR
SET COLOR TO W/R
@ 00,00 clear to 00,79
@ 00,00 SAY "Iniciando backup..."
set color to w
@ 02,00 SAY "Continua S/N ? "
   DO WHILE ACAO<>"S" .and. ACAO<>"N"
      WAIT TO ACAO
   ENDDO

   IF ACAO="S"
       @ 03,00 say "Coloque o disquete em branco no driver e tecle <enter>..."
         WAIT
         !ARJ a -va a:BACK.ARJ *.DBF
         SET COLOR TO W/R
         @ 00,00 SAY "Backup concluido !!!"
         inkey(3)
   ENDIF
 
RESTSCREEN(00,00,24,80,SUB6)


