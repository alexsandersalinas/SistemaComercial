SET CONSOLE OFF
*****
* REF. DE NT /COMPLEMENTAR  - SP_NTICP.PRG
*********

SELE 1
acao=" "
nota=0
 
 SET COLOR TO W/B
                        
                        SET COLOR TO BG+
                        @ 10,02 SAY alltrim("TOTAL DO PRODUTO:")
                        @ 10,col() say " " 
                        @ 10,COL() say lTOTAL PICT "999,999,999.99"
                        *
                          @ 10,40 say alltrim("BASE DE CALCULO DO ICMS:")
                          @ 10,col() say " " 
                          @ 10,col() GET lCICMS PICT "999,999.99"

                        
                 SET COLOR TO BR+
                          @ 11,40 SAY alltrim("VALOR DO ICMS..........:")
                          @ 11,col() say " " 
                          @ 11,col() GET lVALORICMS PICT "999,999.99"
                 SET COLOR TO R+
                          @ 12,40 SAY alltrim("N§  DA N/F .........:")
                          @ 12,col() say " " 
                          @ 12,col() get nota pict "99999"
                          @ 12,col() say " "
                          @ 12,col() say alltrim("DE")
                          @ 12,col() say " " 
                          *@ 12,col() say lREFEMS
READ
   IF nota=0
     * CLOSE ALL
      DO noti1
   ENDIF
 
************* INICIO DA PESQUISA NO BANCO DE DADOS
              SELE 1
                  USE dbNOT1 INDEX ntxNNF1 SHARED
                  seek nota
                  variavelCHECK=1
                  IF .NOT. FOUND()
                       SELE 2
                        USE dbNOT2 INDEX ntxNNF2 SHARED
                        seek nota
                        variavelCHECK=2
                                IF .NOT. FOUND()
                                        SET COLOR TO W/R
                                        @ 24,00 CLEAR TO 24,80
                                        @ 24,10 SAY "NUMERO NÇO EXISTE. Pressione qualquer tecla. "
                                        SET CONSOLE OFF
                                        WAIT
                                        DO NOTTD5
                                        SET CONSOLE ON
                                ENDIF
                  ENDIF


        lREFNT=nota
        lREFEMS=EMISSAO
                       

