
SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF
SET CENTURY ON
SET EXCLUSIVE OFF

DO WHILE .T. 

   lNTNUM       :=0
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
   lprinter     := SET(_SET_PRINTER, .T.)
   lTIPOFATURA  :=0
   SET PRINT OFF


*
        
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
                                SET COLOR TO W
                                @ 02,00 CLEAR TO 24,79
                        SET COLOR TO W/B
                           @ 01,01 SAY "EMISSÇO DE NOTA FISCAL| DIGITE O NéMERO DA NOTA FISCAL. "
                           varREG=(REG1+REG2)
                           @ 01,68 SAY varREG
                           @ 01,62 SAY "Registros:"
                           @ 23,02 SAY " F1  Ajuda"
                           @ 23,64 SAY "ESC -> Sair"
                           
SET COLOR TO (W/N,W/N)
   @ 02,00 CLEAR TO 24,79
   @ 02,00 SAY "NF N§:"GET lNTNUM PICT "99999"
   READ
                 

                IF lntnum=0
                        CLOSE ALL
                        RESTSCREEN(00,00,24,80,SUB45)
                        return
                endif
*LINHA :=0   
// INICIO DA PESQUISA NO BANCO DE DADOS
              SELE 1
                  USE dbNOT1 INDEX ntxNNF1 SHARED
                  seek lNTNUM
                  variavelCHECK=1
                  IF .NOT. FOUND()
                       SELE 2
                        USE dbNOT2 INDEX ntxNNF2 SHARED
                        seek lNTNUM
                        variavelCHECK=2
                                IF .NOT. FOUND()
                                        SET COLOR TO (W/R,W/R)
                                        @ 24,00 SAY " NUMERO NÇO EXISTE. Pressione qualquer tecla. "
                                        SET CONSOLE OFF
                                        WAIT
                                        LOOP
                                SET CONSOLE ON
                                ENDIF
                  ENDIF
        
lNCLIEN = NCLIEN
lCGC=lNCLIEN
lCPF=lNCLIEN

//pesquisando o cliente
        DO NOTC4.PRG
                IF pesquisaERRO=1
                        LOOP
                ENDIF
//ok
                           
    
           SAVE SCRE TO TIPOFATURAMENTO
    DO NOTTIPO
    
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
             SET COLOR TO W/R
             @ 24,00 SAY "Nota fiscal sendo impressa ..."
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


*// banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
      ENDIF
       
   IF lTIPOFATURA=1
            LINHA=LINHA+2
            @ LINHA,167 SAY "X"
   ENDIF 
   IF lTIPOFATURA=2
             LINHA=LINHA+2
             @ LINHA,185 SAY "X"
   ENDIF
            
        @ LINHA,212 SAY NTNUM
        LINHA=LINHA+04

     
*--->dados do banco de cliente IMPRESSAO END. DE ENTREGA
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
* // linha de impressÇo


       LINHA=LINHA+1
              @ LINHA,03 SAY ENDEN
       

*-----> banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
     ENDIF
     @ LINHA,63 SAY OPERACAO
          IF lTIPOFATURA=1
            @ LINHA,115 SAY CFOP
          ENDIF
          IF lTIPOFATURA=2
             IF OPERACAO="REMESSA PARA CONSERTO" 
                    @ LINHA,115 SAY "1.99.9"     
             ENDIF       
             IF OPERACAO="REMESSA PARA CONSERTO F/ESTADO"
                   @ LINHA,115 SAY "2.99.9"     
             ENDIF     
             IF OPERACAO="DEVOLU€ŽO DE TROCA"   
                   @ LINHA,115 SAY "1.99.1"
             ENDIF
             IF OPERACAO="DEVOLU€ŽO DE TROCA F/ESTADO"   
                   @ LINHA,115 SAY "2.99.1"
             ENDIF 
          ENDIF
       
       LINHA=LINHA+1
*---> FIM       
*--->dados do banco de cliente IMPRESSAO END. DE ENTREGA
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
* // linha de impressÇo


       @ LINHA,03 SAY ALLTRIM(BAIRROEN)
       @ LINHA,PCOL() SAY ALLTRIM("-")
       @ LINHA,PCOL() SAY ALLTRIM(CIDADEEN)
       @ LINHA,PCOL() SAY ALLTRIM("-")
       @ LINHA,PCOL() SAY UFEN
*---> FIM       

        LINHA=LINHA+1
*--->dados do banco de cliente IMPRESSAO END. DE ENTREGA
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
* // linha de impressÇo
       @ LINHA,03 SAY "("
       @ LINHA,04 SAY ALLTRIM(DDDEN)
       @ LINHA,PCOL() SAY ")"
       @ LINHA,PCOL() SAY SPACE(1)
       @ LINHA,PCOL() SAY TEL1EN
       LINHA=LINHA+1
*---> FIM       

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

*//final linha de impressÇo
                        @ LINHA,63 SAY EMP
                        IF checkCLIEOK="CPF"
                           @ LINHA,165 SAY RG
                        ENDIF
                        IF checkCLIEOK="CGC"
                           @ LINHA,165 SAY CGC
                        ENDIF

*// banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
      ENDIF

*// linha de impressÇo       
     @ LINHA,212 SAY EMISSAO

*//pular linha
  LINHA=LINHA+1
*-----> banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
     ENDIF
       
       @ linha,36 SAY NPEDIDO     
*// ok
linha=linha+1

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

*//final linha de impressÇo

       @ LINHA,63 SAY ALLTRIM(END)
       *@ LINHA,PCOL() SAY " " 
       @ LINHA,153 SAY BAIRRO
       @ LINHA,185 SAY CEP

*// banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
      ENDIF

*// linha de impressÇo       
       @ LINHA,212 SAY SAIDA
       
*//pular linha
LINHA=LINHA+1
*-----> banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
     ENDIF
       
       @ LINHA,09 SAY NVENDDOR 

*//pular linha
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

*// linha de impressÇo       
       @ LINHA,63 SAY CIDADE
       @ LINHA,132 SAY "("
       @ LINHA,133 SAY ALLTRIM(DDD)
       @ LINHA,PCOL() SAY ")"
       @ LINHA,PCOL() SAY " "
       @ LINHA,PCOL() SAY ALLTRIM(TEL1)
       @ LINHA,156 SAY UF

            IF checkCLIEOK="CPF"
                    @ LINHA,165 SAY CPF
            ENDIF                    
            IF checkCLIEOK="CGC"
                    IF IE="000.000.000.000"  
                          @ LINHA,165 SAY "ISENTO"
                    ENDIF
                    IF IE#"000.000.000.000" 
                        @ LINHA,165 SAY IE
                    ENDIF
             ENDIF

*// pula linha
LINHA=LINHA+1
*-----> banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
     ENDIF
           
           LINHA=LINHA+0
                        IF REFNT=0
                                  @ LINHA,00 SAY NTOBS
                        //pula linha
                        LINHA=LINHA+1
                                  @ LINHA,00 SAY NTOBS2
                        ELSEIF REFNT#0
                        //pula linha
                        *LINHA=LINHA+1
                                  @ LINHA,0 SAY "NOTA FISCAL COMPLEMENTAR DE ICMS REF. A N/F "
                                  @ LINHA,45 SAY REFNT
                                  @ LINHA,52 SAY "DE"
                                 @ LINHA,55 SAY REFEMS
                        endif

LINHA=LINHA+1

*// banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      elseif variavelCHECK=2
        sele 2
      ENDIF

*// linha de impressÇo       
         IF OPERACAO="DEVOLU€ŽO DE MERCADORIA" .OR. OPERACAO="DEVOLU€ŽO DE MERCADORIA F/ESTADO"; 
           .OR. OPERACAO="DEVOLU€ŽO DE CONSERTO" .OR. OPERACAO="DEVOLU€ŽO DE CONSERTO F/ESTADO";
           .OR. OPERACAO="REMESSA PARA CONSERTO" .OR. OPERACAO="REMESSA PARA CONSERTO F/ESTADO";
           .OR. OPERACAO="REMESSA PARA DEMONSTRA€ŽO" .OR. OPERACAO="REMESSA PARA DEMONSTRA€ŽO F/ESTADO";
           .OR. REFNT#0 .OR. OPERACAO="SIMPLES REMESSA" .OR. OPERACAO="SIMPLES REMESSA F/ESTADO"
        
        *// pula linha                       
        LINHA=LINHA+1
        
                         @ LINHA,138 SAY "    "
                         *//linha de impressÇo

       @ LINHA,83 SAY " " 
       @ LINHA,107 SAY " " 

*// pula linha                       
    LINHA=LINHA+2
    

       elseIF OPERACAO#"DEVOLU€ŽO DE MERCADORIA" .OR. OPERACAO#"DEVOLU€ŽO DE MERCADORIA F/ESTADO" .OR. OPERACAO#"DEVOLU€ŽO DE CONSERTO"; 
      .OR. OPERACAO#"DEVOLU€ŽO DE CONSERTO F/ESTADO" .OR. OPERACAO#"REMESSA PARA CONSERTO" .OR. OPERACAO#"REMESSA PARA CONSERTO";
      .OR. OPERACAO#"PRESTA€ŽO DE SERVI€O" .OR. OPERACAO#"PRESTA€ŽO DE SERVI€O F/ESTADO" .OR. OPERACAO#"REMESSA PARA LOCA€ŽO"; 
      .OR. OPERACAO#"REMESSA PARA LOCA€ŽO F/ESTADO" .OR. OPERACAO#"REMESSA PARA DEMOSTRA€ŽO" .OR. OPERACAO#"REMESSA PARA DEMOSTRA€ŽO F/ESTADO";
      .OR. REFNT=0 .OR. OPERACAO#"PRESTA€ŽO DE SERVI€O" .OR. OPERACAO#"PRESTACAO DE SERVI€O F/ESTADO" .OR. OPERACAO="REMESSA PARA LOCA€ŽO"; 
      .OR. OPERACAO="REMESSA PARA LOCA€ŽO F/ESTADO"

      
      *// pula linha                       
    LINHA=LINHA+1
        

                      IF VENC=EMISSAO
                           @ LINHA,138 SAY " A VISTA "
                      ENDIF
                      IF VENC#EMISSAO
                            @ LINHA,138 SAY VENC
                       ENDIF

*//linha de impressÇo

       @ LINHA,83 SAY NTNUM
       @ LINHA,107 SAY NTOTAL PICT "@E 999,999,999.99"

*// pula linha                       
    LINHA=LINHA+2
    
*// dados do banco de cliente IMPRESSAO END. DE ENTREGA
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
*// linha de impressÇo

      * @ LINHA,03 SAY CIDADECB
      * @ LINHA,81 SAY ALLTRIM(ENDCB)
      * @ LINHA,PCOL() SAY " " 
      * @ LINHA,PCOL() SAY BAIRROCB


       ENDIF

*// pula linha                       
    LINHA=LINHA+3

*// banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
      ENDIF

       @ LINHA,21 SAY DESC1
       @ LINHA,140 SAY un1
                IF QTDA1=0
                   @ LINHA,145 SAY "  "
                ENDIF
                IF QTDA1#0
                   @ LINHA,145 SAY QTDA1
                ENDIF
               IF UNIT1=0
                   @ LINHA,162 SAY "   "
               ENDIF
               IF UNIT1#0
                       @ LINHA,162 SAY UNIT1 PICT "@E 999,999,999.99"
               ENDIF

               IF TOTAL1=0
                  @ LINHA,186 SAY "   "
               ENDIF
               IF TOTAL1#0
                       @ LINHA,186 SAY TOTAL1 PICT "@E 999,999,999.99"
               ENDIF
               IF ICMS1=0
                    @ LINHA,203 SAY "  "
                ENDIF
               IF ICMS1#0
                     @ LINHA,203 SAY ICMS1
               ENDIF
       
*// pula linha                       
    LINHA=LINHA+1
       @ LINHA,21 SAY DESC2
       @ LINHA,140 SAY UN2
                IF QTDA2=0
                   @ LINHA,145 SAY "  "
                ELSEIF QTDA2#0
                    @ LINHA,145 SAY QTDA2
                ENDIF
                IF UNIT2=0
                    @ LINHA,162 SAY "   "
                ELSEIF UNIT2#0
                   @ LINHA,162 SAY UNIT2 PICT "@E 999,999,999.99"
                ENDIF
                IF TOTAL2=0
                   @ LINHA,186 SAY "   "
                ELSEIF TOTAL2#0
                   @ LINHA,186 SAY TOTAL2 PICT "@E 999,999,999.99"
                ENDIF
               IF ICMS2=0
                    @ LINHA,203 SAY "  "
                ELSEIF ICMS2#0
                     @ LINHA,203 SAY ICMS2
               ENDIF
// pula linha                       
    LINHA=LINHA+1
       
       @ LINHA,21 SAY DESC3
       @ LINHA,140 SAY UN3
                IF QTDA3=0
                   @ LINHA,145 SAY " "
                ELSEIF QTDA3#0
                   @ LINHA,145 SAY QTDA3
                ENDIF
                IF UNIT3=0
                   @ LINHA,162 SAY "   "
                ELSEIF UNIT3#0
                   @ LINHA,162 SAY UNIT3 PICT "@E 999,999,999.99"
                ENDIF
                IF TOTAL3=0
                   @ LINHA,186 SAY "    "
                ELSEIF TOTAL3#0
                   @ LINHA,186 SAY TOTAL3 PICT "@E 999,999,999.99"
                ENDIF
               IF ICMS3=0
                    @ LINHA,203 SAY "  "
                ELSEIF ICMS3#0
                     @ LINHA,203 SAY ICMS3
               ENDIF
// pula linha                       
    LINHA=LINHA+1
       
       @ LINHA,21 SAY DESC4
       @ LINHA,140 SAY UN4
                IF QTDA4=0
                   @ LINHA,145 SAY " "
                ELSEIF QTDA4#0
                   @ LINHA,145 SAY QTDA4
                ENDIF
                IF UNIT4=0
                   @ LINHA,162 SAY "    "
                ELSEIF UNIT4#0
                   @ LINHA,162 SAY UNIT4 PICT "@E 999,999,999.99"
                ENDIF
                IF TOTAL4=0
                   @ LINHA,186 SAY "   "
                ELSEIF TOTAL4#0
                   @ LINHA,186 SAY TOTAL4 PICT "@E 999,999,999.99"
                ENDIF
               IF ICMS4=0
                    @ LINHA,203 SAY "  "
                ELSEIF ICMS4#0
                     @ LINHA,203 SAY ICMS4
               ENDIF
// pula linha                       
    LINHA=LINHA+1

        @ LINHA,21 SAY DESC5
        @ LINHA,140 SAY UN5
               IF QTDA5=0
                  @ LINHA,145 SAY " "
               ELSEIF QTDA5#0
                  @ LINHA,145 SAY QTDA5
               ENDIF
               IF UNIT5=0
                  @ LINHA,162 SAY "    "
               ELSEIF UNIT5#0
                   @ LINHA,162 SAY UNIT5 PICT "@E 999,999,999.99"
               ENDIF
               IF TOTAL5=0
                   @ LINHA,186 SAY "   "
               ELSEIF TOTAL5#0
                   @ LINHA,186 SAY TOTAL5 PICT "@E 999,999,999.99"
               ENDIF
               IF ICMS5=0
                    @ LINHA,203 SAY "  "
                ELSEIF ICMS5#0
                     @ LINHA,203 SAY ICMS5
               ENDIF

// pula linha                       
    LINHA=LINHA+1

        @ LINHA,21 SAY DESC6
        @ LINHA,140 SAY UN6
               IF QTDA6=0
                  @ LINHA,145 SAY " "
               ELSEIF QTDA6#0
                  @ LINHA,145 SAY QTDA6
               ENDIF
               IF UNIT6=0
                  @ LINHA,162 SAY "    "
               ELSEIF UNIT6#0
                   @ LINHA,162 SAY UNIT6 PICT "@E 999,999,999.99"
               ENDIF
               IF TOTAL6=0
                   @ LINHA,186 SAY "   "
               ELSEIF TOTAL6#0
                   @ LINHA,186 SAY TOTAL6 PICT "@E 999,999,999.99"
               ENDIF
               IF ICMS6=0
                    @ LINHA,203 SAY "  "
                ELSEIF ICMS6#0
                     @ LINHA,203 SAY ICMS6
               ENDIF
// pula linha                       
    LINHA=LINHA+1

        @ LINHA,21 SAY DESC7
        @ LINHA,140 SAY UN7
               IF QTDA7=0
                  @ LINHA,145 SAY " "
               ELSEIF QTDA7#0
                  @ LINHA,145 SAY QTDA7
               ENDIF
               IF UNIT7=0
                  @ LINHA,162 SAY "    "
               ELSEIF UNIT7#0
                   @ LINHA,162 SAY UNIT7 PICT "@E 999,999,999.99"
               ENDIF
               IF TOTAL7=0
                   @ LINHA,186 SAY "   "
               ELSEIF TOTAL7#0
                   @ LINHA,186 SAY TOTAL7 PICT "@E 999,999,999.99"
               ENDIF
               IF ICMS7=0
                    @ LINHA,203 SAY "  "
                ELSEIF ICMS7#0
                     @ LINHA,203 SAY ICMS7
               ENDIF
// pula linha                       
    LINHA=LINHA+1

        @ LINHA,21 SAY DESC8
        @ LINHA,140 SAY UN8
               IF QTDA8=0
                  @ LINHA,145 SAY " "
               ELSEIF QTDA8#0
                  @ LINHA,145 SAY QTDA8
               ENDIF
               IF UNIT8=0
                  @ LINHA,162 SAY "    "
               ELSEIF UNIT8#0
                   @ LINHA,162 SAY UNIT8 PICT "@E 999,999,999.99"
               ENDIF
               IF TOTAL8=0
                   @ LINHA,186 SAY "   "
               ELSEIF TOTAL8#0
                   @ LINHA,186 SAY TOTAL8 PICT "@E 999,999,999.99"
               ENDIF
               IF ICMS8=0
                    @ LINHA,203 SAY "  "
                ELSEIF ICMS8#0
                     @ LINHA,203 SAY ICMS8
               ENDIF

// pula linha                       
    LINHA=LINHA+10
       
               IF SQTDA1=0
                  @ LINHA,13 SAY " "
               ELSEIF SQTDA1#0
                  @ LINHA,13 SAY SQTDA1
               ENDIF
             @ LINHA,23 SAY SERV1
                IF SUNIT1=0
                   @ LINHA,162 SAY "   "
                ELSEIF SUNIT1#0
                   @ LINHA,162 SAY SUNIT1 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL1=0
                   @ LINHA,186 SAY  "    "
                ELSEIF STOTAL1#0
                    @ LINHA,186 SAY STOTAL1 PICT "@E 999,999,999.99"
                ENDIF
// pula linha       
LINHA=LINHA+1
       
               IF SQTDA2=0
                  @ LINHA,13 SAY " "
               ELSEIF SQTDA2#0
                  @ LINHA,13 SAY SQTDA2
               ENDIF
                @ LINHA,23 SAY SERV2
                IF SUNIT2=0
                   @ LINHA,162 SAY "   "
                ELSEIF SUNIT2#0
                     @ LINHA,162 SAY SUNIT2 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL2=0
                   @ LINHA,186 SAY "   "
                ELSEIF STOTAL2#0
                   @ LINHA,186 SAY STOTAL2 PICT "@E 999,999,999.99"
                ENDIF
// pula linha
LINHA=LINHA+1

       
               IF SQTDA3=0
                  @ LINHA,13 SAY " "
               ELSEIF SQTDA3#0
                  @ LINHA,13 SAY SQTDA3
               ENDIF
               @ LINHA,23 SAY SERV3
                IF SUNIT3=0
                   @ LINHA,162 SAY "    "
                ELSEIF SUNIT3#0
                   @ LINHA,162 SAY SUNIT3 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL3=0
                   @ LINHA,186 SAY "   "
                  ELSEIF STOTAL3#0
                   @ LINHA,186 SAY STOTAL3 PICT "@E 999,999,999.99"
                ENDIF
// pula linha
   LINHA=LINHA+1

                IF SQTDA4=0
                    @ LINHA,13 SAY " "
                  ELSEIF SQTDA4#0
                   @ LINHA,13 SAY SQTDA4
                ENDIF
                @ LINHA,23 SAY SERV4  
                IF SUNIT4=0
                   @ LINHA,162 SAY "    "
                  ELSEIF SUNIT4#0
                   @ LINHA,162 SAY SUNIT4 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL4=0
                   @ LINHA,186 SAY "   "
                  ELSEIF STOTAL4#0
                   @ LINHA,186 SAY STOTAL4 PICT "@E 999,999,999.99"
                ENDIF
//pula linha       
LINHA=LINHA+1

               IF SQTDA5=0
                  @ LINHA,13 SAY "  "
                 ELSEIF SQTDA5#0
                  @ LINHA,13 SAY SQTDA5
               ENDIF
               @ LINHA,23 SAY SERV5 
                IF SUNIT5=0
                   @ LINHA,162 SAY "    "
                  ELSEIF SUNIT5#0
                   @ LINHA,162 SAY SUNIT5 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL5=0                       
                @ LINHA,186 SAY "   "
                  ELSEIF STOTAL5#0
                       @ LINHA,186 SAY STOTAL5 PICT "@E 999,999,999.99"
                ENDIF
//pula linha       
LINHA=LINHA+1

               IF SQTDA6=0
                  @ LINHA,13 SAY "  "
                 ELSEIF SQTDA6#0
                  @ LINHA,13 SAY SQTDA6
               ENDIF
               @ LINHA,23 SAY SERV6 
                IF SUNIT6=0
                   @ LINHA,162 SAY "    "
                  ELSEIF SUNIT6#0
                   @ LINHA,162 SAY SUNIT6 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL6=0
                   @ LINHA,186 SAY "   "
                  ELSEIF STOTAL6#0
                       @ LINHA,186 SAY STOTAL6 PICT "@E 999,999,999.99"
                ENDIF
//pula linha       
LINHA=LINHA+1

               IF SQTDA7=0
                  @ LINHA,13 SAY "  "
                 ELSEIF SQTDA7#0
                  @ LINHA,13 SAY SQTDA7
               ENDIF
               @ LINHA,23 SAY SERV7 
                IF SUNIT5=0
                   @ LINHA,162 SAY "    "
                  ELSEIF SUNIT7#0
                   @ LINHA,162 SAY SUNIT7 PICT "@E 999,999,999.99"
                ENDIF
                IF STOTAL7=0
                   @ LINHA,186 SAY "   "
                  ELSEIF STOTAL7#0
                       @ LINHA,186 SAY STOTAL7 PICT "@E 999,999,999.99"
                  ENDIF

*--->>>
                IF ISS=0
                   @ LINHA,216 SAY "  "
                  ELSEIF ISS#0
                       @ LINHA,216 SAY ISS PICT "@E 999,999,999.99"
                  ENDIF


// pula linha
   LINHA=LINHA+4
       
                         IF STOTAL=0
                                  @ LINHA,216 SAY "    "
                             ELSEIF STOTAL#0
                                  @ LINHA,216 SAY STOTAL PICT "@E 999,999,999.99"
                         ENDIF
*// pula linha 
*//FINAL DA NOTA

   LINHA=LINHA+05

               IF CICMS=0
                  @ LINHA,03 SAY "   "
                  ELSEIF CICMS#0
                   @ LINHA,03 SAY CICMS  PICT "@E 999,999,999.99"
               ENDIF
                       IF VALORICMS=0
                          @ LINHA,32 SAY "   "
                          ELSEIF VALORICMS#0
                          @ LINHA,32 SAY VALORICMS PICT "@E 999,999,999.99"
                       ENDIF

*// pula linha                                  
*LINHA=LINHA+2

                               IF TOTAL=0
                                  @ LINHA,138 SAY " "
                                   ELSEIF TOTAL#0
                                    @ LINHA,138 SAY TOTAL  PICT "@E 999,999,999.99"
                               ENDIF
//pula linha                                  
LINHA=LINHA+2
                              IF NTOTAL=0
                                       @ LINHA,138 SAY " "
                                    ELSEIF NTOTAL#0
                                        @ LINHA,138 SAY NTOTAL PICT "@E 999,999,999.99"
                              ENDIF
// pula linha
LINHA=LINHA+3

               
               IF OPERACAO="PRESTACAO DE SERVICO"
                               @ LINHA,03 SAY " "
                               @ LINHA,86 SAY " "
                               @ LINHA,94 SAY " "
                               @ LINHA,110 SAY " "
                               @ LINHA,125 SAY " "


              ELSEIF OPERACAO#"PRESTACAO DE SERVICO"
             
                               @ LINHA,01 SAY TRANSNOM
                               @ LINHA,92 SAY FRETE
                               @ LINHA,102 SAY TRANSPL
                               @ LINHA,116 SAY TRANPUF
                               @ LINHA,125 SAY TCGCPF
// pula linha
LINHA=LINHA+2

                               @ LINHA,01 SAY TRANSEND
                               @ LINHA,79 SAY TRANSCID
                               @ LINHA,116 SAY TRANSUF
                               @ LINHA, 125 SAY TRANIE
// pula linha
LINHA=LINHA+2

                                       IF TRANSQTD=0
                                              @ LINHA,01 SAY "  "
                                         ELSEIF TRANSQTD#0
                                              @ LINHA,01 SAY TRANSQTD
                                       ENDIF
                               @ LINHA,18 SAY TRANSESP
                               @ LINHA,42 SAY TMARCA
                                       IF TRASNUM=0
                                          @ LINHA,74 SAY " "
                                         ELSEIF TRASNUM#0
                                          @ LINHA,74 SAY TRASNUM
                                       ENDIF
                               @ LINHA,110 SAY TRPBRT
                               @ LINHA,135 SAY TRPLQ
*// banco de dados DBnot1/2.dbf
      if variavelCHECK=1
         SELE 1
      endif
      if variavelCHECK=2
        sele 2
      ENDIF

LINHA=LINHA+5
if OPERACAO#"TODAS AS NOTAS"
        @ LINHA,212 SAY NTNUM
ENDIF

LINHA=LINHA+3
      @ LINHA,2 SAY "  "
ENDIF
*--FINAL
                      
                        setprc(0,0)      
                        SET (_SET_PRINTER, lprinter)
                        SET PRINT OFF
                        SET DEVICE TO SCREEN

ENDCASE
ENDDO

