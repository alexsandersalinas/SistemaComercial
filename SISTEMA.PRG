* SISTEMA.....: CADASTRO 
* MODULO......: MENU
* DATA INICIO.: 21/04/1999
* AUTOR.......: ALEXSANDER SALINAS SANTOS
* EMPRESA.....: SP SYSTEM PLACE INFORMATICA LTDA

* CONFIGURAÄÂES

       CLOSE ALL
       USE SP_CLIEN SHARED
       INDEX ON CGC TO SPCGC 
       INDEX ON CPF TO SPCPF
       *INDEX ON NFA TO SPNFA 
       *INDEX ON CODIGO TO SPC_COD 
       *INDEX ON NFA TO SPC_NFA 

       *USE SP_BOLET SHARED
       *INDEX ON BOLETO TO SPC_BOL

       *USE SP_NT SHARED
       *INDEX ON NTNUM TO SPC_NTN
       *USE HISTORIC SHARED
       *INDEX ON DATALIGA TO DATAL
       *INDEX ON NCLIEN TO N
       *USE

SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF
SET CENTURY ON


* TELA DO SISTEMA

TELA()

* CONTROLE DE USO

**IF .NOT. FILE ("C:\WINDOWS\WIN.INI")
**   SET COLOR TO R+*/N+
**   CLEAR
**   @ ROW(),02   SAY "Alerta..."
**   @ ROW()+1,02 SAY "O Programa foi PIRATEADO..."
**   @ ROW()+1,02 SAY "Seu computador sera reiniciado..."
**   @ ROW()+1,02 SAY "<ENTER> para continuar..."
**   WAIT
  ** RUN C:\WINDOWS\COMMAND\REBOOT.COM
**   QUIT
**ENDIF

*DATA1=DATE()
*DATA2=CTOD("20/07/99")

*IF DATA1 >= DATA2
*   set color to
*   clear
*   quit
*ENDIF

DO WHILE .T.
   SET KEY 28 TO AJUDA
   SET COLOR TO N+/N
   @ 06,05,12,26 BOX REPL(CHR(176),9)
   SET COLOR TO R/B
   DATA=DATE()
   ANO=YEAR(DATA)
   @ 05,04 SAY REPL(CHR(196),21)
   @ 11,04 SAY REPL(CHR(196),21)
   SET COLOR TO GR+/B
   @ 05,05 SAY " MENU GERAL "
   JL=0
   SET COLOR TO W/B,R/W
   @ 06,04 SAY " ≥"
   @ 07,04 SAY " ≥"
   @ 08,04 SAY " ≥"
   @ 09,04 SAY " ≥"       
   @ 10,04 SAY " ≥"

   @ 06,06 PROMPT "A - Cadastros    "+CHR(16)+" "
   @ 07,06 PROMPT "B - Notas        "+CHR(16)+" "
   @ 08,06 PROMPT "C - Boletos      "+CHR(16)+" " 
   @ 09,06 PROMPT "D - **********   "+CHR(16)+" "
   @ 10,06 PROMPT "E - **********   "+CHR(16)+" "
   wait
   MENU TO JL
      DO CASE
         CASE JL=0
            SAVE SCRE TO SAIR
            SET COLOR TO W+/R,B/W
            @ 23,16 CLEAR TO 23,78
            FIM=0
            @ 23,02 SAY CHR(16)+" Encerrar programaá∆o"
            @ 23,27 PROM " SIM "
            @ 23,35 PROM " NAO "
              MENU TO FIM
                 DO CASE
                    CASE FIM=0
                       SET COLOR TO N/W,W/R
                       @ 23,16 CLEAR TO 23,76
                       REST SCRE FROM SAIR
                       LOOP
                    CASE FIM=1
                       SET COLOR TO
                       CLEAR
                       @ 02,01 SAY "Aguarde organizando pedidos..."
                       INKEY(1)
**                     RUN XCOPY *.DBF D:\PQF\COPIASEG >NUL
                       ULTIMATELA()
                    CASE FIM=2
                       SET COLOR TO N/W,W/R
                       @ 23,16 CLEAR TO 23,76
                       REST SCRE FROM SAIR
                       LOOP
                 ENDCASE
        CASE JL=1      
                DO SUBCAD  
       CASE JL=2
       *    DO AGSUBALT
         CASE JL=3
       *    DO AGSUBEXC
         CASE JL=4
       *    DO AGSUBREL
         CASE JL=5
            *DO SUBCAD5

      ENDCASE

ENDDO


FUNCTION TELA

* VARIAVEIS

HOJE=DATE()
SEMANA=CDOW(HOJE)
DIA=DAY(HOJE)
MES=CMONTH(HOJE)
ANO=YEAR(HOJE)
EMP1="SISTEMA"
EMP2="    "
TIT1="SP SYSTEM PLACE INFORMATICA      -     V.2.05/99"      
COL1=INT((08)-LEN(EMP1)/2)-1
COL2=INT((08)-LEN(EMP2)/2)-1
COL3=INT((48)-LEN(TIT1)/2)-2
SEG:="Segunda-feira,"
TER:="Teráa-feira,"
QUA:="Quarta-feira,"
QUI:="Quinta-feira,"
SEX:="Sexta-feira,"
SAB:="Sabado,"
DOM:="Domingo,"
JAN="Janeiro de"
FEV="Fevereiro de"
MAR="Maráo de"
ABR="Abril de"
MAI="Maio de"
JUN="Junho de"
JUL="Julho de"
AGO="Agosto de"
SET="Setembro de"
OUT="Outubro de"
NOV="Novembro de"
DEZ="Dezembro de"

* TELA

SET COLOR TO W+/B
CLEAR
@ 00,00 TO 24,79
@ 00,00 TO 03,12
@ 03,00 TO 03,79
@ 22,00 TO 22,79
@ 00,12 SAY CHR(194)
@ 03,12 SAY CHR(193)
@ 03,00 SAY CHR(195)
@ 03,79 SAY CHR(180)
@ 22,00 SAY CHR(195)
@ 22,79 SAY CHR(180)

SET COLOR TO N+/B
@ 04,01,21,78 BOX REPL(CHR(177),9)

SET COLOR TO GR+/B
@ 01,COL1 SAY EMP1
@ 02,COL2 SAY EMP2

SET COLOR TO W+/R
@ 01,13 CLEAR TO 01,78
@ 01,COL3 SAY TIT1
@ 23,01 CLEAR TO 23,78
@ 23,02 SAY " F1  Ajuda"
@ 23,64 SAY "ESC -> Sair"

SET COLOR TO W/B
IF SEMANA="Sunday"
   @ 02,17 SAY dom
ENDIF
IF SEMANA="Monday"
   @ 02,17 SAY SEG
ENDIF
IF SEMANA="Tuesday"
   @ 02,17 SAY TER
ENDIF
IF SEMANA="Wednesday"
   @ 02,17 SAY QUA
ENDIF
IF SEMANA="Thursday"
   @ 02,17 SAY QUI
ENDIF
IF SEMANA="Friday"
   @ 02,17 SAY SEX
ENDIF
IF SEMANA="Saturday"
   @ 02,17 SAY SAB
ENDIF
IF SEMANA="Sunday"
   @ 02,17 SAY DOM
ENDIF

@ 02,COL() SAY DIA
@ 02,COL()+1 SAY "de "

IF MES="July"
   @ 02,COL() SAY JUL
ENDIF
IF MES="August"
   @ 02,COL() SAY AGO
ENDIF
IF MES="September"
   @ 02,COL() SAY SET
ENDIF
IF MES="October"
   @ 02,COL() SAY OUT 
ENDIF
IF MES="November"
   @ 02,COL() SAY NOV
ENDIF
IF MES="December"
   @ 02,COL() SAY DEZ
ENDIF
IF MES="January"
   @ 02,COL() SAY JAN
ENDIF
IF MES="February"
   @ 02,COL() SAY FEV
ENDIF
IF MES="March"
   @ 02,COL() SAY MAR
ENDIF
IF MES="April"
   @ 02,COL() SAY ABR
ENDIF
IF MES="May"
   @ 02,COL() SAY MAI
ENDIF
IF MES="June"
   @ 02,COL() SAY JUN
ENDIF

@ 02,COL() SAY ANO
@ 02,COL() SAY " - $T=     / $C="

PROCEDURE AJUDA

SAVE SCRE TO AJUDA
DO WHILE .T.
   ARQ="AJUDA.AGO"
      IF .NOT. FILE("&ARQ")
         SET COLOR TO W+/R
         @ 23,02 CLEAR TO 23,78
         @ 23,02 SAY chr(16)+" Arquivo de Ajuda ao usu†rio n∆o encontrado..."
         TONE(10,10)
         INKEY(1)
         REST SCRE FROM AJUDA
         SET COLOR TO W/B,R/W
         RETURN
      ENDIF
   SET COLOR TO W+/R
   @ 23,02 SAY "Use as setas "+chr(24)+chr(25)+" ou <PGDN> - <PGUP> para se mover no texto..."
   SET COLOR TO B/W
   @ 04,01 CLEAR TO 21,78
   TEXEDIT=MEMOREAD(ARQ)
   TEXEDIT=MEMOEDIT(TEXEDIT,04,01,21,78,.F.)
      IF LASTKEY()=27
         SET COLOR TO W+/R
         @ 23,02 CLEAR TO 23,78
         @ 23,02 SAY chr(16)+" Abandonando arquivo de ajuda ao usu†rio. Aguarde..."
         TONE(10,10)
         INKEY(1)
         REST SCRE FROM AJUDA
         SET COLOR TO W/B,R/W
         RETURN
      ENDIF
ENDDO

FUNCTION EXIT
SAVE SCRE TO SAIR
SET COLOR TO W+/R,B/W
@ 23,16 CLEAR TO 23,78
FIM=1
@ 23,02 SAY CHR(16)+" Encerrar programacao"
@ 23,27 PROM " SIM "
@ 23,35 PROM " NAO "
  MENU TO FIM
    DO CASE
       CASE FIM=1
          SET COLOR TO
          CLEAR
          QUIT
       CASE FIM=2
          SET COLOR TO N/W,W/R
          @ 23,16 CLEAR TO 23,76
          REST SCRE FROM SAIR
          SET COLOR TO W/B,R/W
          RETURN
    ENDCASE


FUNCTION ULTIMATELA
SET COLOR TO
CLEAR
SET COLOR TO W+/B
@ 00,00 CLEAR TO 11,79
SETCOLOR("W+/B")
@ 00 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 01 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 02 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 03 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 04 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 05 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 06 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 07 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 08 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 09 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 10 , 0 SAY "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 0,0 TO 11, 79 DOUBLE 
@ 4 ,1 SAY   "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞    SP System Place Informatica Ltda    ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 5 ,1 SAY   "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞          Sistema de Controle Interno         ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 6 ,1 SAY   "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞      Fone: 5031-0877 R:110     ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
SET COLOR TO
@ Row()+15,00 say space(01)
INKEY(5)
QUIT

