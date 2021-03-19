* SISTEMA.....: SISTEMA DE CADASTRO
* MODULO......: MENU1.PRG C
* DATA INICIO.: 18/10/1999
* AUTOR.......: ALEXSANDER SALINAS SANTOS
* EMPRESA.....: SP SYSTEM PLACE INFORMATICA LTDA

* CONFIGURAÄÂES

       CLOSE ALL

* INDEX
DO PCFG2
*
CLEAR

SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF
SET CENTURY ON
SET EXCLUSIVE OFF
TELA()

DO WHILE .T.
   *
   checkDOL=0
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
   @ 07,06 PROMPT "B - Pedidos      "+CHR(16)+" "
   @ 08,06 PROMPT "D - Estoque      "+CHR(16)+" " 
   @ 09,06 PROMPT "E - Dolar        "+CHR(16)+" "
   @ 10,06 PROMPT "F - Util         "+CHR(16)+" "
SAVE SCRE TO JLTELA   
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
                      SAVE SCRE TO JLTELA   
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
           DO SUB1  
        CASE JL=2
           *  DO SUB2
        CASE JL=3
          *   DO SUB3
        CASE JL=4
            DO SUB5
        CASE JL=7
            DO SUB6
        ENDCASE

ENDDO


FUNCTION TELA

* VARIAVEIS

HOJE=DATE()
SEMANA=CDOW(HOJE)
DIA=DAY(HOJE)
MES=CMONTH(HOJE)
ANO=YEAR(HOJE)
*EMP1="SISTEMA"
*EMP2="    "
*TIT1="SP SYSTEM PLACE INFORMATICA      -     V.3.06/00"      
*COL1=INT((08)-LEN(EMP1)/2)-1
*COL2=INT((08)-LEN(EMP2)/2)-1
*COL3=INT((48)-LEN(TIT1)/2)-2
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

SET COLOR TO W/R
@ 00,00 CLEAR TO 00,79

SET COLOR TO W/B
@ 01,00 CLEAR TO 01,79

*@ 00,00  24,79
*@ 00,00 TO 03,12
*@ 03,00 TO 03,79
*@ 22,00 TO 22,79
*@ 00,12 SAY CHR(194)
*@ 03,12 SAY CHR(193)
*@ 03,00 SAY CHR(195)
*@ 03,79 SAY CHR(180)
*@ 22,00 SAY CHR(195)
*@ 22,79 SAY CHR(180)

*SET COLOR TO N+/B
*@ 04,01,21,78 BOX REPL(CHR(177),9)

*SET COLOR TO GR+/B
*@ 00,COL1 SAY EMP1
*@ 02,COL2 SAY EMP2
*
*SET COLOR TO W+/R
*@ 01,13 CLEAR TO 01,78
*@ 01,COL3 SAY TIT1
*@ 23,01 CLEAR TO 23,78
@ 23,02 SAY " F1  Ajuda"
@ 23,64 SAY "ESC -> Sair"

SET COLOR TO W/R
IF SEMANA="Sunday"
   @ 00,01 SAY dom
ENDIF
IF SEMANA="Monday"
   @ 00,01 SAY SEG
ENDIF
IF SEMANA="Tuesday"
   @ 00,01 SAY TER
ENDIF
IF SEMANA="Wednesday"
   @ 00,01 SAY QUA
ENDIF
IF SEMANA="Thursday"
   @ 00,01 SAY QUI
ENDIF
IF SEMANA="Friday"
   @ 00,01 SAY SEX
ENDIF
IF SEMANA="Saturday"
   @ 00,01 SAY SAB
ENDIF
IF SEMANA="Sunday"
   @ 00,01 SAY DOM
ENDIF

@ 00,COL() SAY DIA
@ 00,COL()+1 SAY "de "

IF MES="July"
   @ 00,COL() SAY JUL
ENDIF
IF MES="August"
   @ 00,COL() SAY AGO
ENDIF
IF MES="September"
   @ 00,COL() SAY SET
ENDIF
IF MES="October"
   @ 00,COL() SAY OUT 
ENDIF
IF MES="November"
   @ 00,COL() SAY NOV
ENDIF
IF MES="December"
   @ 00,COL() SAY DEZ
ENDIF
IF MES="January"
   @ 00,COL() SAY JAN
ENDIF
IF MES="February"
   @ 00,COL() SAY FEV
ENDIF
IF MES="March"
   @ 00,COL() SAY MAR
ENDIF
IF MES="April"
   @ 00,COL() SAY ABR
ENDIF
IF MES="May"
   @ 00,COL() SAY MAI
ENDIF
IF MES="June"
   @ 00,COL() SAY JUN
ENDIF
@ 00,COL() SAY ANO
*        
*
SAVE SCRE TO JLTELA   
        USE dbDLR1 INDEX ntxDLR1 SHARED
        LOCATE FOR DAT=DATE()
          IF .NOT. EOF()
                   @ 00,COL() SAY " - $T="
                   @ 00,col() say DT
                   @ 00,COL() SAY " - $C=" 
                   @ 00,col() say DC
            
            ELSEIF EOF()
                checkDOL=1
                SAVE SCRE TO ANTSDOLA
                DO DOLI1
           ENDIF

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
@ 6 ,1 SAY   "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞      Fone: 5042-4400 R:127     ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
SET COLOR TO
@ Row()+15,00 say space(01)
INKEY(3)
QUIT

*----------- ESPERA

Function Tro_Ani(aLin,aCol,aTip)
static aValTro
local atela, aCur
aCur = setcursor(0)

if aValTro = nil
   aValTro = 0
endif

if aTip = nil
   aTip = .f.
endif


aTela = savescreen(aLin,aCol,aLin,aCol)
aTela = substr(aTela,2,1)

if aTip = .t.
   aTela = " "+aTela
   restscreen(aLin,aCol,aLin,aCol,aTela)
   setcursor(aCur)
   return(nil)
endif

aValTro++
if aValTro >= 9
   aValTro = 1
endif
if aValTro = 1
   aTela= "|"+aTela
elseif aValTro = 2
   aTela= "/"+aTela
elseif aValTro = 3
   aTela= "-"+aTela
elseif aValTro = 4
   aTela= "\"+aTela
elseif aValTro = 5
   aTela= "|"+aTela
elseif aValTro = 6
   aTela= "/"+aTela
elseif aValTro = 7
   aTela= "-"+aTela
elseif aValTro = 8
   aTela= "\"+aTela
endif
restscreen(aLin,aCol,aLin,aCol,aTela)
setcursor(aCur)
return(nil)

function f_inkey(aTempo,aLin,aCol)
local aConta, nTecla, aCur
aCur = setcursor(0)

aConta = 0
nTecla = 0

do while aConta <= aTempo .and. nTecla = 0
   tro_Ani(aLin,aCol)
   nTecla = inkey(.1)
   if aTempo > 0
      aConta=aConta+.1
   endif
enddo

tro_Ani(aLin,aCol,.t.)
setcursor(aCur)
return(nTecla)


