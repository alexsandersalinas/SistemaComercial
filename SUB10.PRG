* SISTEMA.....: CONTROLE E CADASTRO
* MODULO......: SUBCAD2.PRG - SUBMENU DE CADASTRO 
* DATA INICIO.: 21/04/1999
* AUTOR.......: ALEXSANDER SALINAS SANTOS
* EMPRESA.....: SP SYSTEM PLACE INFORMATICA LTDA


* JLTELA=SAVESCREEN(00,00,24,80)
DO WHILE .T.                        
MEN=0
                        SET COLOR TO W/R,W/R
                        @ 05,02 CLEAR TO 05,77
                        SET COLOR TO W/B,W/B
                        @ 06,02 CLEAR TO 20,77


  set color to w/r
       @ 05,03 PROMPT " Incluir " 
       @ 05,12 PROMPT " Alterar " 
       @ 05,21 PROMPT " Excluir "
       @ 05,54 PROMPT " Consulta "
wait
   MENU TO MEN
       DO CASE
         CASE MEN=1
            DO CADI1 
         CASE MEN=2
            DO CADA11 
         CASE MEN=3
        *    DO CADE1
         CASE MEN=4
            DO SUB12 
         CASE MEN=0    
              RESTSCREEN(00,00,24,80,JLTELA)
              RETURN
    ENDCASE

ENDDO
