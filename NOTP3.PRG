*****************************************
// emiss�o de boleto em sequincia

       DO WHILE .T.
                      LINHA      :=0
                      lNTNUM     :=0
                      ACAO       :=SPACE(1)
                      ACAO2      :=SPACE(1)
                      ACAO3      :=SPACE(1)
                      ACAO5      :=SPACE(1)
                      OPCAO6     :=SPACE(1)
                      OP         :=0
                      checkINST  :=0
                      pesquisaERRO=0
                      checkCLIEOK  :=SPACE(3)
                      checkval     :=0
                      ntINICIO   :=0
                      ntFINAL    :=0
                      menuAG       :=0
                      lprinter     := SET(_SET_PRINTER, .T.)
                      SET PRINT OFF

                      *
                       SET COLOR TO W/B
                       @ 05,01 CLEAR TO 21,78
        
        // carregando banco de dados
                SELE 4
                USE dbCLI1 SHARED 
                SELE 3
                USE dbCLI2 SHARED
                SELE 2
                USE dbNOT2 SHARED
                        REG2=RECCOUNT()
                SELE 1
                USE dbNOT1 SHARED
                REG1=RECCOUNT()

                 SAVE SCRE TO INICIO
                        SET COLOR TO W/b
                           @ 01,00 SAY "EMISS�O DE BOLETO| DIGITE O N�MERO DA NOTA FISCAL. "
                           varREG=(REG1+REG2)
                           @ 01,68 SAY varREG
                           @ 01,62 SAY "Registros:"

SET COLOR TO W
   @ 02,00 CLEAR TO 24,80
   SET COLOR TO (W/N,W/R)
   @ 02,00 SAY "NF INICIO N�:"GET ntINICIO PICT "9999"
                READ
                IF ntINICIO=0
                        CLOSE ALL
                        RESTSCREEN(00,00,24,80,SUB45)
                        return
                endif
   
   @ 02,20 SAY "NF FINAL N�:"GET ntFINAL PICT "9999"
   READ
                
                IF ntFINAL=0
                        CLOSE ALL
                        RESTSCREEN(00,00,24,80,SUB45)
                        return
                endif
LINHA        :=0        

// pesquisa no index
              SELE 1
                  USE dbNOT1 INDEX ntxNNF1 SHARED
                  seek ntINICIO
                  variavelCHECK=1
                  IF .NOT. FOUND()
                       SELE 2
                        USE dbNOT2 INDEX ntxNNF2 SHARED
                        seek ntINICIO
                        variavelCHECK=2
                                IF .NOT. FOUND()
                                        SET COLOR TO (W/R,W/R)
                                        @ 04,10 SAY " NUMERO N�O EXISTE. Pressione qualquer tecla. "
                                        SET CONSOLE OFF
                                        WAIT
                                        LOOP
                                SET CONSOLE ON
                                ENDIF
                  ENDIF
        
                lNCLIEN = NCLIEN
                lCGC=lNCLIEN
                lCPF=lNCLIEN
           
                set color to W/B
                
                @ 07,02 PROMPT " COM INSTRU��O " 
                @ 08,02 PROMPT " SEM INSTRU��O " 
                @ 09,02 PROMPT " CONTRA REPRESENTA��O "
                wait
                   MENU TO OP
        
                        IF OP=1
                           checkINST :=1
                        endif
                        IF OP=2
                           checkINST :=2
                        endif
                        IF OP=3
                           checkINST :=3
                        ENDIF

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
          @ 24,00 SAY "IMPRIME A NOTA FISCAL" 
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
                 SET COLOR to w/r
                 @ 24,00 CLEAR TO 24,80
                tro_Ani(24,36)
                @ 24,00 SAY "Boleto sendo emitido...     "
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
                                RESTSCREEN(00,00,24,80,SUB45)
                        SET PRINT OFF
                        SET DEVICE TO SCREEN
                        RETURN
                        ENDIF
                   ENDIF

               IF NTFINAL >NTFINAL
                        SET PRINT OFF
                        SET DEVICE TO SCREEN
                        RETURN
               ENDIF
    
    LINHA=0
    // impress�o do Boleto

    // pula linha
    LINHA=LINHA+02
       
    // banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
      ENDIF
   
   IF checkINST=3 
        @ LINHA,12 SAY " " 
        @ LINHA,107 SAY "CONTRA RESPR."
   ELSEIF checkINST#3 
        @ LINHA,12 SAY "ATE O VENCIMENTO PAGAVEL EM QUALQUER BANCO"
        @ LINHA,107 SAY VENC
   Endif
   
       
    // pula linha
    LINHA=LINHA+3
       
       @ LINHA,12 SAY EMISSAO
       @ LINHA,45 SAY NTNUM
       @ LINHA,67 SAY "DUP"
       @ LINHA,76 SAY "N"

    // pula linha
    LINHA=LINHA+2
       
       @ LINHA,113 SAY NTOTAL PICT "@E 999,999,999.99"

      IF checkINST=1
                // pula linha
                LINHA=LINHA+2
       
               @ LINHA,03 SAY "APOS O VENCIMENTO COBRAR JUROS DE 0,5% AO DIA."

               // pula linha
               LINHA=LINHA+1

                @ LINHA,03 SAY "APOS 3 DIAS DE ATRASO, SUJEITO A PROTESTO."

                // pula linha
                LINHA=LINHA+5
       endif
      IF checkINST#1
                // pula linha
                LINHA=LINHA+3
       
               @ LINHA,03 SAY " "

               // pula linha
               LINHA=LINHA+1

                @ LINHA,03 SAY " "

                // pula linha
                LINHA=LINHA+5
       endif
       
    // dados do banco de cliente
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

    // linha de impress�o       
       @ LINHA,05 SAY EMP
       
    // pula linha
    LINHA=LINHA+1
       
              IF ENDCB="O MESMO"
                 @ LINHA,05 SAY ALLTRIM(END)
                 @ LINHA,PCOL() SAY " "
                 @ LINHA,PCOL() SAY ALLTRIM(BAIRRO)
                 @ LINHA,PCOL() SAY " "
                 @ LINHA,PCOL() SAY ALLTRIM(CIDADE) 
                 @ LINHA,PCOL() SAY ALLTRIM("-")
                 @ LINHA,PCOL() SAY ALLTRIM(UF)
                 @ LINHA,PCOL() SAY " "
                 @ LINHA,PCOL() SAY ALLTRIM("CEP:") 
                 @ LINHA,PCOL() SAY CEP
              ELSEIF ENDCB#"O MESMO"
                 @ LINHA,05 SAY ALLTRIM(ENDCB)
                 @ LINHA,PCOL() SAY " "
                 @ LINHA,PCOL() SAY ALLTRIM(BAIRROCB)
                 @ LINHA,PCOL() SAY " "
                 @ LINHA,PCOL() SAY ALLTRIM(CIDADECB) 
                 @ LINHA,PCOL() SAY ALLTRIM("-")
                 @ LINHA,PCOL() SAY ALLTRIM(UFCB)
                 @ LINHA,PCOL() SAY " "
                 @ LINHA,PCOL() SAY ALLTRIM("CEP:") 
                 @ LINHA,PCOL() SAY CEPCB
              ENDIF

      // pula linha
      LINHA=LINHA+1
                        IF checkCLIEOK="CPF"
                           @ LINHA,05 SAY "RG:"
                           @ LINHA,09 SAY ALLTRIM(RG)
                           @ LINHA,PCOL() SAY " "
                           @ LINHA,PCOL() SAY ALLTRIM("CPF:")
                           @ LINHA,PCOL() SAY CPF
                        // pula linha
                        LINHA=LINHA+6         
                        
                        ENDIF
                        IF checkCLIEOK="CGC"
                           @ LINHA,05 SAY "CGC:"
                           @ LINHA,10 SAY ALLTRIM(CGC) 
                           @ LINHA,PCOL() SAY " "
                          *@ LINHA,PCOL() SAY ALLTRIM("IE:")
                          *@ LINHA,PCOL() SAY IE
                        // pula linha
                        LINHA=LINHA+6         
                        ENDIF
                              SKIP
                        setprc(0,0)      
                        SET (_SET_PRINTER, lprinter)
                        SET DEVICE TO SCREEN
            endcase
*       ENDIF
ENDDO


