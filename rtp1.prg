* ATUALIZADO : 29/01/2001


SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF
SET CENTURY ON
SET EXCLUSIVE OFF


   epDesativar   =chr(27)+chr(64)
   epNegrito     =chr(27)+chr(69)
   epDesNegrito  =chr(27)+chr(70)
   epExpande     =chr(27)+chr(87)+chr(1)
   epDesExpande  =chr(27)+chr(87)+chr(2)


DO WHILE .T. 

   lNTNUM       :=space(4)
   lPESSOA      := SPACE(1)
   lCPF         :=SPACE(15)
   ACAO         :=SPACE(1)
   ACAO2        :=SPACE(1)
   ACAO3        :=SPACE(1)
   ACAO5        :=SPACE(1)
   ACAO4        :=SPACE(1)
   OPCAO6       :=SPACE(1)
   menuAG       :=0
   LINHA        :=0
   checkCLIENTE :=SPACE(18)
   checkCLIEOK  :=SPACE(3)
   checkval     :=0
   pesquisaERRO :=0
   lEMISSAO     :=date()
   lprinter     := SET(_SET_PRINTER, .T.)



   SET PRINT OFF


*
        
        SELE 4
        USE dbCLI1 SHARED 
        SELE 3
        USE dbCLI2 SHARED
        SELE 1
        USE dbRT SHARED
                REG1=RECCOUNT()

                 SAVE SCRE TO INICIO
                                SET COLOR TO W
                                @ 02,00 CLEAR TO 24,79
                        SET COLOR TO W/B
                           @ 01,01 SAY "IMPRESS?O DA ORDEM DE SERVI?O| FICHA DO CLIENTE. "
                           varREG=(REG1)
                           @ 01,68 SAY varREG
                           @ 01,62 SAY "Registros:"
                           @ 23,02 SAY " F1  Ajuda"
                           @ 23,64 SAY "ESC -> Sair"
                           
SET COLOR TO (W/N,W/N)
   @ 02,00 CLEAR TO 24,79
   @ 02,00 SAY "OS N?:"GET lNTNUM PICT "99999"
   READ
                 

                IF lntnum=space(4)
                        CLOSE ALL
                        RESTSCREEN(00,00,24,80,SUB21)
                        return
                endif
*LINHA :=0   
// INICIO DA PESQUISA NO BANCO DE DADOS
              SELE 1
                  USE dbRT INDEX ntxRT1 SHARED
                  seek lNTNUM
                  variavelCHECK=1
                  IF .NOT. FOUND()
                                        SET COLOR TO (W/R,W/R)
                                        @ 24,00 SAY " NUMERO N?O EXISTE. Pressione qualquer tecla. "
                                        SET CONSOLE OFF
                                        WAIT
                                        LOOP
                                SET CONSOLE ON
                   ENDIF
                  
lNCLIEN = ID
lCGC=lNCLIEN
lCPF=lNCLIEN

//pesquisando o cliente
        DO NOTC4.PRG
                IF pesquisaERRO=1
                        LOOP
                ENDIF
//ok
                           
    SET COLOR TO N/W
    @ 23,00 SAY "Antes de imprimir verifique a impressora " 
          SET COLOR TO W/R
          @ 24,00 CLEAR TO 24,80
          @ 24,00 SAY "IMPRIME ESTA O.S." 
          SET COLOR TO (W/R,R/W)
          @ 24,22 PROMPT "S"
          @ 24,23 SAY "/"
          @ 24,24 PROMPT "N"
          @ 24,26 SAY "?"
         *SUB4=SAVESCREEN(00,00,24,80)
         MENU TO menuAG
         DO CASE
         CASE menuAG=2
              LOOP
         CASE menuAG=1
             SET COLOR TO W/R
             @ 24,00 SAY "O.S. sendo impressa ..."
                SET DEVICE TO PRINT   
                  IF .NOT. ISPRINTER()
                        IMP=SAVESCREEN(00,00,24,80)
                        SET PRINT ON
                        SET COLOR TO W/R
                                @ 10,10 CLEAR TO 14,68
                                @ 10,10 TO 14,68
                                @ 11,13 SAY "A IMPRESSORA ESTA SEM PAPEL OU DESLIGADA.  POR FAVOR"
                                @ 12,13 SAY "VERIFIQUE.  PRESSIONE <ENTER> QUANDO ESTIVER PRONTO"
                                @ 13,13 SAY "OU <F2> PARA CANCELAR"
                                INKEY(0)
                        IF LASTKEY()=-1              
                                RESTSCREEN(00,00,24,80,SUB21)
                        SET PRINT OFF
                        SET DEVICE TO SCREEN
                        RETURN
                        ENDIF
                   ENDIF


*// banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
      ENDIF
       
    
       LINHA=LINHA+01
          @ linha,01 say "Emissao"
          @ linha,09 say lEMISSAO PICT "99/99/9999"
        ?? epExpande
           @ LINHA,33 SAY "SP SYSTEM PLACE INFORMATICA LTDA"
        ?? epDesExpande
      * LINHA=LINHA+1
           *@ linha,01 saY "CNPJ 03.791.819/0001-02                       INSCR. EST. 115.663.837.110"
       linha=linha+1
           @ LINHA,01 SAY "Rua Alvares Rodrigues, 182 Cj. 33 Brooklin - SP - Telefax: 5042-4400      "
       linha=linha+1
          @ linha,01 say "==============================================================================="

       linha=linha+1
          @ LINHA,01 SAY alltrim("OS N?")
          @ linha,pcol() say " "
          @ LINHA,pcol() SAY RTNUM 
          @ linha,60 say alltrim("Entrada:")
          @ linha,pcol() say ENTRADA pict "99/99/9999"
       LINHA=LINHA+1

*// dados do banco de cliente
                        IF checkCLIEOK="CPF"
                           IF checkval=1
                              sele 4
                           endif
                           if checkval=2 
                              sele 3
                           endif
                        endif
                        IF checkCLIEOK="CGC"
                           IF checkval=1                                                                             
                              sele 4
                           endif
                           if checkval=2 
                              sele 3
                           endif
                        endif

*//final linha de impress?o
                @ LINHA,01 SAY alltrim("Nome:")
                @ linha,pcol() say EMP PICT "@!S30"
                @ LINHA,PCOL() SAY alltrim("Fone:")
                @ linha,pcol() Say Tel1

             LINHA=LINHA+1
                @ linha,01 say alltrim("Endereco:")
                @ linha,pcol() say end
             linha=linha+2

*// banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
      ENDIF
             
             @ LINHA,01 SAY alltrim("AP:")
             @ LINHA,pcol() SAY AP
             @ linha,pcol() say "   " 
             @ linha,pcol() say alltrim("Marca:")
             @ linha,pcol() say alltrim(MARCA)
             @ linha,pcol() say "   " 
             @ linha,pcol() say alltrim("Mod:")
             @ linha,pcol() say alltrim(MODELO)
             @ linha,pcol() say "   "
             @ linha,pcol() say alltrim("N/Serie:")
             @ linha,pcol() say NS

        LINHA=LINHA+2
          @ linha,01 say alltrim("Acessorio:")
          @ linha,pcol() say ACESS
        linha=linha+2
          @ linha,01 say Alltrim("Defeito:")
          @ linha,pcol() say DEFEITO
        LINHA=LINHA+2
          @ LINha,01 say alltrim("Obs:")
          @ linha,pcol() say OBS 
        LINHA=LINHA+2
          @ LINHA,01 SAY alltrim("Prioridade para:")
          @ linha,pcol() say PRIORIDADE pict "99/99/9999"
       LINHA=LINHA+2
         @ LINHA,01 SAY "Valor:  ______________________"
         @ linha,38 say "Ass.:  _______________________________"
     linha=linha+2
         @ linha,01 say "==============================================================================="
     linha=linha+1
         @ LINHA,02 SAY "CONDI?OES:"

     LINHA=LINHA+4
     @ linha,01 say "==============================================================================="
     LINHA=LINHA+1
     @ LINHA,01 SAY " "
     LINHA=LINHA+1
     @ LINHA,01 SAY " "
     LINHA=LINHA+1
     @ LINHA,01 SAY " "

                       
         
        *--FINAL
                      
                        setprc(0,0)      
                        SET (_SET_PRINTER, lprinter)
                        SET PRINT OFF
                        SET DEVICE TO SCREEN

ENDCASE
ENDDO

