
* CONFIGURA€åES

CLOSE ALL
SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF

DO WHILE .T.

   SELE 2
   USE dbNOT2 SHARED 
   USE dbNOT2 INDEX TO ntxNNF2 SHARED
   GOTO TOP

   SELE 1
   USE dbNOT1 SHARED 
   USE dbNOT1 INDEX TO ntxNNF1 SHARED
   GOTO TOP

   *SELE 3
   *USE JL013DEV ALIAS DEVOLVE
   *INDEX ON CODIGOFOR+DTOS(DATADEV) TO JL013QUA
   *GOTO TOP

      
*********** IDENTIFICANDO O PERIODO A SER PESQUISADO PARA QUALIFICA€ÇO **************
      
    GETS
   
   JLDATAINI=CTOD("  /  /    ")
   JLDATAFIM=CTOD("  /  /    ")

   @ 12,27 GET JLDATAINI PICT "99/99/9999" VALID ! EMPTY(JLDATAINI)
   @ 12,45 GET JLDATAFIM PICT "99/99/9999" VALID ! EMPTY(JLDATAFIM)
   READ

      IF LASTKEY()=27
         SET KEY -9 TO
         CLOSE ALL
         RESTSCREEN(00,00,24,80,JLTELA)
         RETURN
       ENDIF

   DO CASE
      CASE JLDATAINI=CTOD("").AND.JLDATAFIM=CTOD("")
         TESTADATA=0
      CASE JLDATAINI<>CTOD("").AND.JLDATAFIM=CTOD("")
         TESTADATA=1
      CASE JLDATAINI=CTOD("").AND.JLDATAFIM<>CTOD("")
         TESTADATA=2
      CASE JLDATAINI<>CTOD("").AND.JLDATAFIM<>CTOD("")
         TESTADATA=3
   ENDCASE
   
   SELE 2
   ACHOU=.F.

  /* DO WHILE .NOT. ACHOU
   
      JLCODIGO=SPACE(10)
      @ 07,28 GET JLCODIGO PICT "@!" VALID ! EMPTY(JLCODIGO)
      READ
   
         IF LASTKEY()=27
            CLOSE ALL
            RESTSCREEN(00,00,24,80,JLTELA)
            RETURN
          ENDIF
   
      SELE PEDIDO
      LOCATE FOR CODIGOFOR=JLCODIGO 
      IF .NOT. FOUND()
         JLMENS=SAVESCREEN(00,00,24,80)
         SET COLOR TO W+/R
         @ 23,01 CLEAR TO 23,78
         @ 23,02 Say "NÆo existem Pedidos efetuados para este Fornecedor..."
         INKEY(2)
         RESTSCREEN(00,00,24,80,JLMENS)
         loop
      ENDIF
         
      IF FOUND()
         AVFOR=FORPED
         SET COLOR TO N/W
         @ 08,32 SAY PADR(FORPED,25)
         INKEY(3)
         ACHOU=.T.
      ELSE
         LOOP
      ENDIF
   ENDDO

   I=09


****** MOSTRA TODOS OS PEDIDOS EFETUADOS E MARCA O CAMPO SELECT COM "S" ******


   JLLISTA()

   DO WHILE CODIGOFOR=JLCODIGO
      IF I>20
         INKEY(0)
         JLLISTA()
         I=09
      ENDIF

      DO CASE
         CASE (TESTADATA=1 .OR. TESTADATA=3).AND. DATAENT <JLDATAINI
            SKIP
         CASE (TESTADATA=2 .OR. TESTADATA=3).AND. DATAENT >JLDATAFIM
            SKIP
         OTHERWISE
         
         @ I,03      SAY CODIGOFOR
         @ I,COL()+1 SAY STRZERO(NUMEROPED,6)
         @ I,COL()+1 SAY PADR(DESCITEM,30)
         @ I,COL()+2 SAY QTDEITEM 
         @ I,COL()+2 SAY DATAENT
         JLOK="S"
         REPL SELECT WITH JLOK
         SKIP
         I++
      ENDCASE
   ENDDO

   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   @ 23,02 Say "Pressione <ENTER> para continuar..."
   INKEY(0)

   COPY TO JL010QFP FIELDS FORPED,FORNECEDOR,NUMEROPED,CODPRODT,DESCITEM,QTDEITEM,DATAENT,DEVOLVIDO,SELECT;
   FOR SELECT="S"




*** ROTINA PARA LIMPAR O CAMPO SELECT ****************************************

   SELE PEDIDO
   INDEX ON SELECT TO JLSELECT

   JLOK="S"
   LOCATE FOR SELECT=JLOK
   JLBRANCO=" "

   DO WHILE SELECT=JLOK
      REPL SELECT WITH JLBRANCO
      SKIP
   ENDDO




*** GERA ARQUIVO JL010QFP, QUALIFICACAO POR PEDIDOS EFETUADOS ****************

   JLMENS=SAVESCREEN(23,00,24,80)
   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   @ 23,02 Say "Aguarde, gerando dados para Qualifica‡Æo..."
   INKEY(1)
   RESTSCREEN(23,00,24,80,JLMENS)

      IF FILE('JL010QFP.DBF')
         JLMENS=SAVESCREEN(23,00,24,80)
         SET COLOR TO W+/R
         @ 23,01 CLEAR TO 23,78
         @ 23,02 Say "Arquivo gerado com sucesso..."
         INKEY(1)
         RESTSCREEN(23,00,24,80,JLMENS)
      ELSE
         JLMENS=SAVESCREEN(23,00,24,80)
         @ 23,01 CLEAR TO 23,78
         @ 23,02 Say "Erro ao gerar o Arquivo..."
         TONE(100,10)
         INKEY(1)
         RESTSCREEN(23,00,24,80,JLMENS)
      ENDIF



*** MOSTRA TODOS AS ENTRADAS REGISTRADAS MARCANDO O CAMPO SELECT *************

&& RETORNO

   SELE RETORNO
   LOCATE FOR CODIGOFOR=JLCODIGO
      IF .NOT. FOUND()
         JLMENS=SAVESCREEN(00,00,24,80)
         SET COLOR TO W+/R
         @ 23,01 CLEAR TO 23,78
         @ 23,02 Say "NÆo existem dados para processar..."
         INKEY(2)
         RESTSCREEN(00,00,24,80,JLMENS)
         RETURN
      ENDIF
         
   I=09
   JLOK="S"

   JLLISTARET()

   SELE RETORNO
   LOCATE FOR CODIGOFOR=JLCODIGO
   DO WHILE CODIGOFOR=JLCODIGO
      DO CASE
         CASE (TESTADATA=1 .OR. TESTADATA=3).AND. DATAENT <JLDATAINI
            SKIP
         CASE (TESTADATA=2 .OR. TESTADATA=3).AND. DATAENT >JLDATAFIM
            SKIP
         OTHERWISE
         
         IF I>20
            WAIT
            JLLISTARET()
            I=09
         ENDIF

         JCODPROD=CODPRODT
         JNUMPED =NUMEROPED
         JDESCPRO=DESCRICAO
         JQTDREC =QTDENT
         JDATAREC=DATAENT

         @ I,03 SAY CODIGOFOR
         @ I,COL()+1 SAY STRZERO(JNUMPED,6)
         @ I,COL()+1 SAY PADR(JDESCPRO,30)
         @ I,COL()+2 SAY JQTDREC
         @ I,COL()+2 SAY JDATAREC

         JLOK="S"
         REPL SELECT WITH JLOK
         SKIP
         I++

      ENDCASE
   ENDDO

   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   @ 23,02 Say "Pressione <ENTER> para continuar..."
   INKEY(0)




*** GERA ARQUIVO JL010QFR, QUALIFICACAO POR ENTRADAS EFETUADAS ***************

   COPY TO JL010QFR FIELDS FORPED,FORNECEDOR,NUMEROPED,CODPRODT,DESCRICAO,QTDENT,DATAENT,DEVOLVIDO,SELECT;
   FOR SELECT="S"

   SELE RETORNO
   INDEX ON SELECT TO JLSELECT

   LOCATE FOR SELECT=JLOK
   JLBRANCO=" "

   DO WHILE SELECT=JLOK
      REPL SELECT WITH JLBRANCO
      SKIP
   ENDDO

   JLMENS=SAVESCREEN(00,00,24,80)
   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   @ 23,02 Say "Aguarde, gerando dados para Qualifica‡Æo..."
   INKEY(1)

      IF FILE('JL010QFR.DBF')
         @ 23,01 CLEAR TO 23,78
         @ 23,02 Say "Arquivo gerado com sucesso..."
         INKEY(1)
      ELSE
         @ 23,01 CLEAR TO 23,78
         @ 23,02 Say "Erro ao gerar o Arquivo..."
         INKEY(1)
         RESTSCREEN(00,00,24,80,JLMENS)
         RETURN
      ENDIF
      FILTRO()
ENDDO



******************************************************************************
&& FILTRO ENTRE PEDIDOS E ENTRADAS

FUNCTION FILTRO

   JLMENS=SAVESCREEN(00,00,24,80)
   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   JLESTORNO="N"
   @ 23,02 Say "Voce gostaria de estornar alguma das entrada efetuadas (S/N)..." GET JLESTORNO;
   PICT "@!" VALID !EMPTY(JLESTORNO)
   READ
      IF JLESTORNO="N"
         RESTSCREEN(00,00,24,80,JLMENS)
         DEVOLUCOES()
      ENDIF
      IF JLESTORNO="S"
         DO WHILE .T.
            USE JL010QFR
            INDEX ON NUMEROPED TO FILTROR
            JLMENS=SAVESCREEN(00,00,24,80)
            SET COLOR TO W+/R
            @ 23,01 CLEAR TO 23,78
            JLPED=0
            @ 23,02 Say "Digite o Numero do Pedido a estornar..." GET JLPED;
            PICT "999999"
            READ
               IF LASTKEY()=27
                  RESTSCREEN(00,00,24,80,JLMENS)
                  DEVOLUCOES()
               ENDIF
      
               IF JLPED=0
                  RESTSCREEN(00,00,24,80,JLMENS)
                  DEVOLUCOES()
               ENDIF
               
            GOTO TOP
            LOCATE FOR NUMEROPED=JLPED
               IF .NOT. FOUND()
                  JLMENS=SAVESCREEN(00,00,24,80)
                  SET COLOR TO W+/R
                  @ 23,01 CLEAR TO 23,78
                  @ 23,02 Say "Numero de Pedido Invalido ou nao encontrado..."
                  INKEY(2)
                  RESTSCREEN(00,00,24,80,JLMENS)
                  LOOP
               ENDIF
               IF FOUND()
                  DO WHILE NUMEROPED=JLPED
                     DELETE
                     PACK
                  ENDDO
               ENDIF

            JLMENS=SAVESCREEN(00,00,24,80)
            SET COLOR TO W+/R
            @ 23,01 CLEAR TO 23,78
            JLCONT="N"
            @ 23,02 Say "Voce gostaria de continuar a estornar (S/N)..." GET JLCONT;
            PICT "@!" VALID !EMPTY(JLCONT)
            READ
               IF JLCONT="N"
                  RESTSCREEN(00,00,24,80,JLMENS)
                  DEVOLUCOES()
                  RETURN
               ENDIF
               IF JLCONT="S"
                  RESTSCREEN(00,00,24,80,JLMENS)
                  LOOP
               ENDIF
         ENDDO
      ENDIF




******************************************************************************
&& DEVOLUCOES

FUNCTION DEVOLUCOES

   SELE DEVOLVE
   LOCATE FOR CODIGOFOR=JLCODIGO
      IF .NOT. FOUND()
         JLMENS=SAVESCREEN(00,00,24,80)
         SET COLOR TO W+/R
         @ 23,01 CLEAR TO 23,78
         @ 23,02 Say "NÆo existem dados para processar..."
         INKEY(1)
      ENDIF
         
   I=09
   JLOK="S"

   JLLISTADEV()

   SELE DEVOLVE
   LOCATE FOR CODIGOFOR=JLCODIGO
      DO WHILE CODIGOFOR=JLCODIGO
         DO CASE
            CASE (TESTADATA=1 .OR. TESTADATA=3).AND. DATADEV <JLDATAINI
               SKIP
            CASE (TESTADATA=2 .OR. TESTADATA=3).AND. DATADEV >JLDATAFIM
               SKIP
            OTHERWISE

               IF I>20
                  INKEY(0)
                  JLLISTADEV()
                  I=09
               ENDIF

            @ I,03 SAY CODIGOFOR
            @ I,COL()+1 SAY STRZERO(REFNFNUM,6)
            @ I,COL()+1 SAY PADR(DESCRICAO,30)
            @ I,COL()+2 SAY QTDREC 
            @ I,COL()+2 SAY QTDDEV
            JLOK="S"
            REPL SELECT WITH JLOK
            SKIP
            I++
         ENDCASE
      ENDDO

   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   @ 23,02 Say "Pressione <ENTER> para continuar..."
   INKEY(0)
   
   SELE DEVOLVE
   COPY TO JL010QFD FIELDS FORNECEDOR,REFNFNUM,CODPRODT,DESCRICAO,QTDDEV,DATADEV;
   FOR SELECT="S"

   INDEX ON SELECT TO JLSELECT

   LOCATE FOR SELECT=JLOK
   JLBRANCO=" "

      DO WHILE SELECT=JLOK
         REPL SELECT WITH JLBRANCO
         SKIP
      ENDDO

   JLMENS=SAVESCREEN(00,00,24,80)
   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   @ 23,02 Say "Aguarde, gerando dados para Qualifica‡Æo..."
   INKEY(1)

      IF FILE('JL010QFD.DBF')
         @ 23,01 CLEAR TO 23,78
         @ 23,02 Say "Arquivo gerado com sucesso..."
         INKEY(1)
      ELSE
         @ 23,01 CLEAR TO 23,78
         @ 23,02 Say "Erro ao gerar o Arquivo..."
         INKEY(1)
      ENDIF

   CLOSE ALL
   RELACQTDE()
   RESTSCREEN(00,00,24,80,JLTELAQUA)
   RETURN




******************************************************************************
&& RELACAO ENTRE AS QUANTIDADES

FUNCTION RELACQTDE

   CLOSE ALL

   USE JL010QFP
   INDEX ON CODPRODT+STR(NUMEROPED) TO IQFPED          && ALTERADO

   USE JL010QFR NEW
   INDEX ON CODPRODT+STR(NUMEROPED) TO IQFREC          && ALTERADO

   USE IQF_QTDE NEW
   ZAP
   
   TELAQTDE()

   SELE JL010QFP

   L=9
   C=3   

   DO WHILE .NOT. EOF()

      IF L > 20
         INKEY(0)
         TELAQTDE()
         L=9
      ENDIF

      @ L,C  SAY NUMEROPED
      @ L,15 SAY CODPRODT
      @ L,29 SAY QTDEITEM PICT "999,999.999"

      QTPED=QTDEITEM
      CHAVE1=CODPRODT+STR(NUMEROPED)  && ALTERADO
      JNUMPED=NUMEROPED

      SELE JL010QFR

      SEEK CHAVE1

         IF FOUND()

            JFOR=FORNECEDOR
            JCOD=CODPRODT
            DESC=DESCRICAO
            QTREC=QTDENT

            @ L,43 SAY QTREC PICT "999,999.999"

            DESCRICAO=DESCRICAO
            DIF=QTPED-QTREC
            DEV=DEVOLVIDO

               IF DIF>0
                  SET COLOR TO R+/B
                  @ L,56 SAY (DIF) PICT "999,999.999"
                  SET COLOR TO W/B
               ENDIF

               IF DIF<0
                  SET COLOR TO G+/B
                  @ L,56 SAY (DIF) PICT "999,999.999"
                  SET COLOR TO W/B
               ENDIF

               IF DIF=0
                  SET COLOR TO W/B
                  @ L,56 SAY (DIF) PICT "999,999.999"
                  SET COLOR TO W/B
               ENDIF
         ELSE
         
            JFOR=FORNECEDOR
            JCOD=CODPRODT
            DEV=DEVOLVIDO
            DESC=DESCRICAO
            QTREC=0

            @ L,43 SAY QTREC
            SET COLOR TO R+/B
            DIF=QTPED-QTREC
            @ L,56 SAY DIF PICT "999,999.999"
            SET COLOR TO W/B
         
         ENDIF

      SELE IQF_QTDE

      APPEN BLANK
      REPL FORNECEDOR WITH JFOR
      REPL CODPRODT   WITH JCOD
      REPL PRODUTO    WITH DESC
      REPL QTDEPED    WITH QTPED
      REPL QTDEREC    WITH QTREC
      REPL DIFERENCA  WITH DIF
      REPL DEVOLVIDO  WITH DEV
      
      SELE JL010QFP
      L++
      SKIP
   ENDDO

   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   @ 23,02 Say "Pressione <ENTER> para continuar..."
   INKEY(0)
   RELACDATA()




******************************************************************************
&& RELACAO ENTRE AS DATAS

FUNCTION RELACDATA

   CLOSE ALL
   USE JL010QFP
   INDEX ON CODPRODT+STR(NUMEROPED) TO JLQUADTP
   USE JL010QFR NEW
   INDEX ON CODPRODT+STR(NUMEROPED) TO JLQUADTR
   USE IQF_DATA NEW
   ZAP

   TELADATA()

   SELE JL010QFP

   L=9
   C=3

   DO WHILE .NOT. EOF()

      IF L > 20
         INKEY(0)
         TELADATA()
         L=9
      ENDIF

      @ L,C  SAY NUMEROPED
      @ L,15 SAY CODPRODT
      @ L,28 SAY DATAENT

      JDATAENT=DATAENT
      CHAVE1=CODPRODT+STR(NUMEROPED)

      SELE JL010QFR

      SEEK CHAVE1

         IF FOUND()

            JFORNECEDOR=FORNECEDOR
            JCOD=CODPRODT
            JDATAREC=DATAENT

            @ L,42 SAY JDATAREC

            DESCRICAO=DESCRICAO

            DIF="NAO"
               IF JDATAREC>JDATAENT          &&JDATAENT=DATA PREVISTA
                  SET COLOR TO R+/B
                  DIF="SIM"
                  @ L,55 SAY DIF
                  SET COLOR TO W/B
               ENDIF
            @ L,55 SAY DIF
         ELSE     
            SET COLOR TO R+/B
            JFORNECEDOR=FORNECEDOR
            JCOD=CODPRODT
            JDATAREC=CTOD("  /  /    ")
            DESCRICAO=DESCRICAO
            DIF="SIM"
            @ L,55 SAY DIF
            SET COLOR TO W/B
         ENDIF

         SELE IQF_DATA

         APPEN BLANK

         REPL FORNECEDOR WITH JFORNECEDOR
         REPL CODPRODT   WITH JCOD
         REPL PRODUTO    WITH DESCRICAO
         REPL DATAPED    WITH JDATAENT
         REPL DATAREC    WITH JDATAREC
         REPL DIFERENCA  WITH DIF

      SELE JL010QFP
      L++
      SKIP
   ENDDO

   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   @ 23,02 Say "Pressione <ENTER> para continuar..."
   INKEY(0)
   AVAQTDE()




******************************************************************************
&& AVALIACAO DAS QUANTIDADES

FUNCTION AVAQTDE

   CLOSE ALL

   SET COLOR TO W/B
   TELAVAL()

   SELE 1
   USE IQF_QTDE
   INDEX ON CODPRODT TO IQF_QTDE
   GOTO TOP

   NAOCONFORME=0

   SELE 1
   LOCATE FOR DIFERENCA<>0
     IF FOUND()
        DO WHILE .NOT. EOF()
           YQTD=QTDEPED
           TOL1=(YQTD*0.10)
           TOL2=(YQTD*(-0.10))

           IF DIFERENCA > TOL1
              NAOCONFORME++
           ENDIF

           IF DIFERENCA < TOL2
              NAOCONFORME++
           ENDIF
           SKIP
        ENDDO
     ENDIF

   REG=LASTREC()

   QTDEDBF=DIFERENCA

   IF NAOCONFORME=0
      QVALOR=10
   ENDIF

   IF NAOCONFORME<>0
      FINAL=(((REG-NAOCONFORME)*0.1)/REG)*100
      QVALOR=FINAL
   ENDIF

   IF REG=0
      QVALOR=0
   ENDIF

   NAOCONFORME=(REG-NAOCONFORME)

   @ 07,17 SAY AVFOR
   @ 08,17 SAY JLDATAINI
   SET COLOR TO W+/B
   @ 08,COL()+1 SAY "ate"
   SET COLOR TO W/B
   @ 08,COL()+1 SAY JLDATAFIM

   @ 11,47 SAY (QVALOR) PICT "@E 999.99"

   SELE 1

   NAOCONFORME=0

   LOCATE FOR DEVOLVIDO<>0
      IF FOUND()
         NAOCONFORME++
         SKIP
      ENDIF

   REG=LASTREC()
   QTDEDBF=DEVOLVIDO
   FINAL =(((REG-NAOCONFORME)*0.4)/REG)*100
   IF FINAL<0
      DVALOR=(-1*(FINAL))
   ENDIF
   IF FINAL>0
      DVALOR=FINAL   
   ENDIF
   IF FINAL=0
      DVALOR=FINAL   
   ENDIF

   NAOCONFORME=REG-(NAOCONFORME)

   @ 12,47 SAY (DVALOR) PICT "@E 999.99"



&& AVALIACAO DAS DATAS

   CLOSE ALL

   SELE 1
   USE IQF_DATA
   INDEX ON CODPRODT TO IQF_DATA
   GOTO TOP

   SELE 1

   NAOCONFORME=0

   LOCATE FOR DIFERENCA="SIM" 
      IF .NOT. FOUND()
         NAOCONFORME=0
      ENDIF
      IF FOUND()
         NAOCONFORME=0

         DO WHILE DIFERENCA="SIM"
            NAOCONFORME++
            SKIP
         ENDDO
      ENDIF

   REG=LASTREC()
   QTDEDBF=DIFERENCA
   FINAL=(((REG-NAOCONFORME)*0.1)/REG)*100

   IF FINAL < 0
      DTVALOR=(-1*(FINAL))
   ENDIF
   IF FINAL > 0
      DTVALOR=FINAL
   ENDIF
   IF FINAL=0
      DTVALOR=0
   ENDIF

   NAOCONFORME=REG-NAOCONFORME

   @ 13,47 SAY (DTVALOR) PICT "@E 999.99"


* VALOR DA AUDITORIA EXTERNA ************************

   AUDITA=0
   @ 15,47 GET AUDITA PICT "@E 999.99"
   READ

   VRAUDITA=(AUDITA*20)/100
   @ 15,47 SAY VRAUDITA PICT "@E 999.99"


* VALOR DA AUDITORIA PROCESSO ***********************

   PROCESSO=0
   @ 16,47 GET PROCESSO PICT "@E 999.99"
   READ

   VRPROCESSO=(PROCESSO*10)/100
   @ 16,47 SAY VRPROCESSO PICT "@E 999.99"


* VALOR DA AUDITORIA PRODUTO ************************

   AUDPRODUTO=0
   @ 17,47 GET AUDPRODUTO PICT "@E 999.99"
   READ

   VRPRODUTO=(AUDPRODUTO*10)/100
   @ 17,47 SAY VRPRODUTO PICT "@E 999.99"


* VALOR TOTAL DO SISTEMA ***********************

   VRTOTAL=QVALOR + DVALOR + DTVALOR + VRAUDITA + VRPROCESSO + VRPRODUTO

   @ 19,47 SAY (VRTOTAL) PICT "999.99"

   SET COLOR TO W+/R
   @ 23,01 CLEAR TO 23,78
   @ 23,02 Say "Pressione <ENTER> para continuar..."
   INKEY(0)

   USE IQF_TOT
   ZAP
   APPEND BLANK
   REPL FORNECEDOR WITH AVFOR
   REPL QTDE       WITH QVALOR
   REPL DEVOLUCAO  WITH DVALOR
   REPL DATA       WITH DTVALOR
   REPL AUDITORIA  WITH VRAUDITA
   REPL PROCESSO   WITH VRPROCESSO
   REPL PRODUTO    WITH VRPRODUTO
   REPL TOTAL      WITH VRTOTAL
   REPL INICIO     WITH JLDATAINI
   REPL FINAL      WITH JLDATAFIM

   APROV=SPACE(25)

   IF VRTOTAL < 50
      APROV="DESQUALIFICADO"
   ENDIF

   IF VRTOTAL >50 .AND. VRTOTAL <96
      APROV="APROVADO"
   ENDIF

   IF VRTOTAL > 95
      APROV="QUALIDADE ASSEGURADA"
   ENDIF

   USE IQF_LFA
   GOTO TOP
   LOCATE FOR FORNECEDOR=AVFOR

      IF FOUND()
         REPL FORNECEDOR WITH AVFOR
         REPL INICIO     WITH JLDATAINI
         REPL FINAL      WITH JLDATAFIM
         REPL IQF        WITH VRTOTAL
         REPL STATUS     WITH APROV
      ENDIF

      IF .NOT. FOUND()
         APPEND BLANK
         REPL FORNECEDOR WITH AVFOR
         REPL INICIO     WITH JLDATAINI
         REPL FINAL      WITH JLDATAFIM
         REPL IQF        WITH VRTOTAL
         REPL STATUS     WITH APROV
      ENDIF

   CLOSE ALL
   RESTSCREEN(00,00,24,80,JLTELAQUA)
   RETURN
   RETURN




*****************************  TELAS DO SISTEMA ******************************
                            
FUNC TELAQTDE
SET COLOR TO N+/N
@ 06,04,21,78 BOX REPL(CHR(177),9)
SET COLOR TO W+/R
@ 05,02 CLEAR TO 05,76
TITULO="Relacao entre Pedidos e Recebimentos - (QUANTIDADE)"
COL1=INT((40)-LEN(TITULO)/2)-1
@ 05,COL1 SAY TITULO
SET COLOR TO W+/B
@ 06,02 CLEAR TO 20,76
@ 07,03 SAY "Pedido      Cod.Prod.     Qtde Ped.     Qtde Rec.    Nao Conforme"
@ 08,02 TO 08,76
SET COLOR TO W/B


FUNC TELADATA
SET COLOR TO N+/N
@ 06,04,21,78 BOX REPL(CHR(177),9)
SET COLOR TO W+/R
@ 05,02 CLEAR TO 05,76
TITULO="Relacao entre Pedidos e Recebimentos - (DATA)"
COL1=INT((40)-LEN(TITULO)/2)-1
@ 05,COL1 SAY TITULO
SET COLOR TO W+/B
@ 06,02 CLEAR TO 20,76
@ 07,03 SAY "Pedido      Cod.Prod.    Data Prev.    Data Rec.    Nao Conforme"
@ 08,02 TO 08,76
SET COLOR TO W/B


FUNCTION TELA010
SET COLOR TO N+/N
@ 06,20,18,62 BOX REPL(CHR(177),9)
SET COLOR TO W+/R
@ 05,18 CLEAR TO 05,60
TITULO="Qualifica‡Æo de Fornecedores"
COL1=INT((40)-LEN(TITULO)/2)-1
@ 05,COL1 SAY TITULO
SET COLOR TO W/B
@ 06,18 CLEAR TO 17,60

* MASCARA - OS GETS DEVERAO COME€AR NA COLUNA 16

@ 07,19 SAY "C¢digo.: "
@ 08,19 SAY "Fornecedor.: "

@ 10,30 SAY "De                At‚"
@ 12,19 SAY "Datas.: "


FUNC JLLISTA
SET COLOR TO N+/N
@ 06,04,21,78 BOX REPL(CHR(177),9)
SET COLOR TO W+/R
@ 05,02 CLEAR TO 05,76
TITULO="Listagem dos Pedidos Efetuados"
COL1=INT((40)-LEN(TITULO)/2)-1
@ 05,COL1 SAY TITULO
SET COLOR TO W+/B
@ 06,02 CLEAR TO 20,76
@ 07,03 SAY "Cod.For    Pedido Descri‡Æo Produto                 Qtde Ped    Entrega"
@ 08,02 TO 08,76
SET COLOR TO W/B


FUNC JLLISTARET
SET COLOR TO N+/N
@ 06,04,21,78 BOX REPL(CHR(177),9)
SET COLOR TO W+/R
@ 05,02 CLEAR TO 05,76
TITULO="Listagem das Entradas Efetuadas"
COL1=INT((40)-LEN(TITULO)/2)-1
@ 05,COL1 SAY TITULO
SET COLOR TO W+/B
@ 06,02 CLEAR TO 20,76
@ 07,03 SAY "Cod.For    Pedido Descri‡Æo Produto                 Qtde Rec    Entrega"
@ 08,02 TO 08,76
SET COLOR TO W/B


FUNC TELAVAL
SET COLOR TO N+/N
@ 06,04,21,78 BOX REPL(CHR(177),9)
SET COLOR TO W+/R
@ 05,02 CLEAR TO 05,76
TITULO="Nota Final Obtida no Perido"
COL1=INT((40)-LEN(TITULO)/2)-1
@ 05,COL1 SAY TITULO
SET COLOR TO W+/B
@ 06,02 CLEAR TO 20,76
@ 07,03 SAY "Fornecedor..: "
@ 08,03 SAY "Periodo de..: "
@ 09,02 TO 09,76
@ 11,03 SAY "Nota Final Obtida ref. a Quantidade......: "
@ 12,03 SAY "Nota Final Obtida ref. a Devolucäes......: "
@ 13,03 SAY "Nota Final Obtida ref. a Data de Entrega.: "
@ 15,03 SAY "Nota Final Obtida na Auditoria Externa...: "
@ 16,03 SAY "Nota Final Obtida na Auditoria Processo..: "
@ 17,03 SAY "Nota Final Obtida na Auditoria Produto...: "
@ 19,03 SAY "Nota Final Obtida no Periodo.............: "
SET COLOR TO W/B



FUNC JLLISTADEV
SET COLOR TO N+/N
@ 06,04,21,78 BOX REPL(CHR(177),9)
SET COLOR TO W+/R
@ 05,02 CLEAR TO 05,76
TITULO="Listagem das Devolu‡äes Efetuadas"
COL1=INT((40)-LEN(TITULO)/2)-1
@ 05,COL1 SAY TITULO
SET COLOR TO W+/B
@ 06,02 CLEAR TO 20,76
@ 07,03 SAY "Cod.For    Pedido Descri‡Æo Produto                Qtde Ped    Qtde Dev"
@ 08,02 TO 08,76
SET COLOR TO W/B


