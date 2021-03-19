* SISTEMA.....: CONTROLE E CADASTRO
* MODULO......: SUB42.PRG - SUBMENU DO CADASTRO/CONSULTA
* DATA INICIO.: 25/11/1999
* AUTOR.......: ALEXSANDER SALINAS SANTOS
* EMPRESA.....: SP SYSTEM PLACE INFORMATICA LTDA


*CNTELA=SAVESCREEN(00,00,24,80)
DO WHILE .T.                        
MN=0
                        SET COLOR TO W/R,W/R
                        @ 05,02 CLEAR TO 05,77
                       SET COLOR TO W/R
                        @ 05,02 SAY "IMPRESSÇO:"
                         SET COLOR TO (W/B,W/B)
                         @ 06,02 CLEAR TO 20,77
*

                        SET COLOR TO W/R,W/R
                        @ 05,19 CLEAR TO 05,77
               
  SET COLOR TO (W/R,W/B)
       @ 05,13 PROMPT " N/F " 
       @ 05,19 PROMPT " Boleto " 

SUB42=SAVESCREEN(00,00,24,80)       
       wait
   
   MENU TO MN
       DO CASE
         CASE MN=1
            DO NOTP1 
         CASE MN=2
            DO NOTP2 
         CASE MN=0    
              RESTSCREEN(00,00,24,80,JLTELA)
              RETURN
    ENDCASE

ENDDO
