 * SISTEMA.....: CONTROLE E CADASTRO
* MODULO......: SUBCAD2.PRG - SUBMENU DE CADASTRO 
* DATA INICIO.: 21/04/1999
* AUTOR.......: ALEXSANDER SALINAS SANTOS
* EMPRESA.....: SP SYSTEM PLACE INFORMATICA LTDA


* CNTELA=SAVESCREEN(00,00,24,80)
DO WHILE .T.                        
MN=0
                        SET COLOR TO W/R,W/R
                        @ 05,02 CLEAR TO 05,77
                       SET COLOR TO W/R
                        @ 05,02 SAY "CONSULTA PESSOA:"
                         SET COLOR TO (W/B,W/B)
                         @ 06,02 CLEAR TO 20,77
*

                        SET COLOR TO W/R,W/R
                        @ 05,19 CLEAR TO 05,77
               
  set color to w/B
       @ 05,19 PROMPT " Fisica " 
       @ 05,28 PROMPT " Juridica " 
wait
   MENU TO MN
       DO CASE
         CASE MN=1
            DO CADC11 
         CASE MN=2
            DO CADC21 
         CASE MN=0    
              RESTSCREEN(00,00,24,80,JLTELA)
              RETURN
    ENDCASE

ENDDO
