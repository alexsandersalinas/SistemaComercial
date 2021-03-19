SET CONSOLE OFF
SET SCOREBOARD OFF
SET DATE BRITISH
SET TALK OFF
* SET WRAP ON
SETCANCEL(.F.)



DO WHILE .T.

**TELA
SET COLOR TO W
@ 02,01 CLEAR TO 21,78
*



SELE 2
USE HISTORIC SHARED

SELE 1
USE SP_CLIEN SHARED

   CONTA      =RECCOUNT()

   UM         = 1

   lCODIGO    = (CONTA+UM)
   *
   lNFA       = SPACE(30)
   lEMP       = SPACE(120)
   lDDD       = SPACE(4)
   lTEL1      = SPACE(9)
   lTEL2      = SPACE(9)
   lEND       = SPACE(60)
   lCEP       = SPACE(9)
   lBAIRRO    = SPACE(30)
   lCIDADE    = SPACE(30)
   lUF        = SPACE(2)
   lCONTATO   = SPACE(30)
   lCGC       = SPACE(18)
   lIE        = SPACE(15)
   lCCM       = SPACE(11)
   ACAO       = " "
   lFAX       = SPACE(9) 
   lDEPTO     = SPACE(30)
   lEMAIL     = SPACE(60)
   lPCONT     = DATE()
   *
   lENDCB     = SPACE(60)
   lBAIRROCB  = SPACE(30)
   lCIDADECB  = SPACE(30)
   lUFCB      = SPACE(2) 
   lCEPCB     = SPACE(9)
   lRG        = SPACE(15)
   lCPF       = SPACE(15)
   lDDDCB     = SPACE(4)
   lTEL1CB    = SPACE(9)
   lFAXCB     = SPACE(9)

   lENDen     = SPACE(60)
   lBAIRROen  = SPACE(30)
   lCIDADEen  = SPACE(30)
   lUFen      = SPACE(2)
   lCEPen     = SPACE(9)
   lDDDEN     = SPACE(4)
   lTEL1EN    = SPACE(9)
   lFAXEN     = SPACE(9)

   lVENDEDOR  = SPACE(10)
   lRAMO      = SPACE(10)
   lMIDIA     = SPACE(10)
   OPCAO      = " "
***
*HIST 

lDATALIGA     = SPACE(8)
lNOTAS        = SPACE(66)
lNOTAS2       = SPACE(66)
lCOMENT       = SPACE(20)
lNCLIEN      = " "
*

SET COLOR TO (W/N,W/N)
   @ 23,01 SAY "DIGITE O PROXIMO NUMERO P/ CADASTRO.           "
   @ 23,59 SAY "Regitros"
   @ 23,68 SAY CONTA
   @ 02,21 SAY "1. CONTATO:"GET lPCONT PICT "99/99/99"
   @ 02,44 SAY "NOME FANT.:"GET lnfa PICT "@!s17"
   READ
   IF lNFA=SPACE(15)
      RETURN
   ENDIF
*

SELE 1
   USE SP_CLIEN INDEX SPNFA SHARED
   SEEK lNFA
   IF .NOT. EOF()
      @ 23,01 SAY "CLIENTE JA EXISTE. Pressione qualquer tecla."
      SET CONSOLE OFF
      WAIT
      LOOP
      SET CONSOLE ON
  ENDIF      

SET COLOR TO W+/N

SET COLOR TO (W/N,W/N)
@ 03,01 CLEAR TO 21,78 

   SET COLOR TO (N/W,N/W)
   @ 11,01 CLEAR TO 11,78
   @ 11,02 SAY "C O B R A N C A"
   @ 15,01 CLEAR TO 15,78
   @ 15,02 SAY "E N T R E G A"
   @ 19,01 CLEAR TO 19,78
   @ 19,02 SAY "O U T R O S"

*
SET COLOR TO (W/N,W/N)
   @ 03,03 SAY "EMPRESA.:"GET lemp PICT "@!S58"
   @ 04,03 SAY "ENDERECO:"GET lend PICT "@!"
   @ 05,03 SAY "BAIRRO..:"GET lbairro PICT "@!s15"
   @ 05,29 SAY "CIDADE...:"GET lcidade PICT "@!s25"
   @ 05,61 SAY "U.F.........:"GET luf PICT "@!"
   @ 06,03 SAY "CEP.....:"GET lcep PICT "99999-999"
   @ 06,23 SAY "DDD.:"GET lddd PICT "9999"
   @ 06,34 SAY "FAX:"GET lFAX PICT "9999-9999"
   @ 06,50 SAY "TEL...:"GET lTEL1 PICT "9999-9999"
   @ 06,67 SAY "/"
   @ 06,68 GET lTEL2 PICT "9999-9999"
   @ 07,03 SAY "CONTATO.:"GET lcontato PICT "@!"
   @ 07,45 SAY "DEPT.:"GET lDEPTO PICT "@!s25"
   @ 08,03 SAY "E-MAIL..:"GET lEMAIL PICT "@!s45"
   @ 09,03 SAY "RG.......:"GET lRG PICT "@!"
   @ 09,31 SAY "CIC:"GET lCPF PICT "@!"
   @ 09,53 SAY "CGC.:"GET lcgc PICT "99.999.999/9999-99"
   @ 10,03 SAY "I.E.....:"GET lie PICT "999.999.999.999"
   @ 10,30 SAY "CCM.:"GET lccm PICT "9.999.999-9"

   @ 12,03 SAY "ENDERECO:"
   @ 13,03 SAY "BAIRRO..:"
   @ 13,29 SAY "CIDADE...:"
   @ 13,61 SAY "U.F.........:"
   @ 14,03 SAY "CEP.....:"
   @ 14,23 SAY "DDD.:"
   @ 14,34 SAY "FAX:"
   @ 14,50 SAY "TELEFONES.:"
                   @ 16,03 SAY "ENDERECO:"
                   @ 17,03 SAY "BAIRRO..:"
                   @ 17,29 SAY "CIDADE...:"
                   @ 17,61 SAY "U.F.........:"
                   @ 18,03 SAY "CEP.....:"
                   @ 18,23 SAY "DDD.:"
                   @ 18,34 SAY "FAX:"
                   @ 18,50 SAY "TELEFONES.:"
   

   @ 20,03 SAY "VENDEDOR(A):"
   @ 20,29 SAY "RAMO DE ATIVIDADE"
   @ 20,61 SAY "MIDIA"

   SET COLOR TO (N/W,N/W)
   @ 11,01 CLEAR TO 11,78
   @ 11,02 SAY "C O B R A N C A"
   @ 15,01 CLEAR TO 15,78
   @ 15,02 SAY "E N T R E G A"
   @ 19,01 CLEAR TO 19,78
   @ 19,02 SAY "O U T R O S"
READ
IF LASTKEY()=27
   RETURN
ENDIF
lDATAHIST=lPCONT
        DO WHILE OPCAO<>"S" .and. OPCAO<>"N"
                 SET COLOR TO W
                   @ 23,01 SAY "Endereco de Cobranca e Entrega e o mesmo? S/N          "
                      STORE ' ' TO MSGERRO
                      WAIT TO OPCAO
         ENDDO

      IF OPCAO="S"
             @ 12,03 SAY "ENDERECO:"
             lENDCB="O MESMO"
             lENDEN="O MESMO"
             @ 12,13 SAY lendCB
             @ 13,03 SAY "BAIRRO..:"
             @ 13,13 SAY lbairrocb pict "@!s15"
             @ 13,29 SAY "CIDADE...:"
             lCIDADECB="O MESMO"
             lCIDADEEN="O MESMO"
             @ 13,40 SAY lcidadecb pict "@!s20"
             @ 13,61 SAY "U.F.........:"
             @ 13,74 SAY lufcb
             @ 14,03 SAY "CEP.....:"
             @ 14,13 SAY lcepcb PICT "99999-999"
             @ 14,23 SAY "DDD.:"
             lDDDCB=lDDD
             lDDDEN=lDDD
             @ 14,29 SAY ldddcb
             @ 14,34 SAY "FAX:"
             lFAXCB=lFAX
             lFAXEN=lFAX
             @ 14,39 SAY lFAXCB PICT "9999-9999"
             @ 14,50 SAY "TELEFONE..:"
             lTEL1CB=lTEL1
             lTEL1EN=lTEL1
             @ 14,62 SAY lTEL1CB PICT "9999-9999"

             @ 16,03 SAY "ENDERECO:"
             @ 16,13 SAY lendEN
             @ 17,03 SAY "BAIRRO..:"
             @ 17,29 SAY "CIDADE...:"
             @ 17,40 SAY lcidadeEN
             @ 17,61 SAY "U.F.........:"
             @ 18,03 SAY "CEP.....:"
             @ 18,13 SAY lcepEN PICT "99999-999"
             @ 18,23 SAY "DDD.:"
             @ 18,29 SAY ldddEN
             @ 18,34 SAY "FAX:"
             @ 18,39 SAY lFAXEN PICT "9999-9999"
             @ 18,50 SAY "TELEFONE..:"
             @ 18,62 SAY lTEL1EN PICT "9999-9999"

       ENDIF 
      
      IF OPCAO="N"    
                SET COLOR TO (W/N,W/N)
                   @ 12,03 SAY "ENDERECO:"GET lendcb PICT "@!"
                   @ 13,03 SAY "BAIRRO..:"GET lbairrocb PICT "@!s15"
                   @ 13,29 SAY "CIDADE...:"GET lcidadecb PICT "@s20!"
                   @ 13,61 SAY "U.F.........:"GET lufcb PICT "@!"
                   @ 14,03 SAY "CEP.....:"GET lcepcb PICT "99999-999"
                   @ 14,23 SAY "DDD.:"GET ldddCB PICT "9999"
                   @ 14,34 SAY "FAX:"GET lFAXCB PICT "9999-9999"
                   @ 14,50 SAY "TELEFONE..:"GET lTEL1CB PICT "9999-9999"


                   @ 16,03 SAY "ENDERECO:"GET lendEN PICT "@!"
                   @ 17,03 SAY "BAIRRO..:"GET lbairroen PICT "@!s15"
                   @ 17,29 SAY "CIDADE...:"GET lcidadeen PICT "@!s20"
                   @ 17,61 SAY "U.F.........:"GET lufen PICT "@!"
                   @ 18,03 SAY "CEP.....:"GET lcepen PICT "99999-999"
                   @ 18,23 SAY "DDD.:"GET ldddEN PICT "9999"
                   @ 18,34 SAY "FAX:"GET lFAXEN PICT "9999-9999"
                   @ 18,50 SAY "TELEFONE..:"GET lTEL1EN PICT "9999-9999"
                   READ
        ENDIF
   SET COLOR TO (W/N,W/N)
   @ 20,03 SAY "VENDEDOR(A):"GET lVENDEDOR PICT "@!"
   @ 20,29 SAY "RAMO DE ATIVIDADE"GET lRAMO PICT "@!"
   @ 20,61 SAY "MIDIA"GET lMIDIA PICT "@!"
*
   SET COLOR TO (N/W,N/W)
   @ 11,01 CLEAR TO 11,78
   @ 11,02 SAY "C O B R A N C A"
   @ 15,01 CLEAR TO 15,78
   @ 15,02 SAY "E N T R E G A"
   @ 19,01 CLEAR TO 19,78
   @ 19,02 SAY "O U T R O S"
SET COLOR TO W
@ 23,01 SAY "Para sair Tecle<F5>                            "
IF LASTKEY()=27
   RETURN
ENDIF
READ
SAVE SCRE TO HIST
DO SP_HIST
   SET COLOR TO W
   @ 23,01 SAY "Grava as informacoes Sim ou Nao?                 "
   DO WHILE ACAO<>"S" .and. ACAO<>"N"
      WAIT TO ACAO
   ENDDO
   IF ACAO="S"

      @ 23,01 SAY "Informacoes sendo Gravandas...                         "
SELE 1
*      DBAPPEND()
      UNLOCK ALL
      APPEND BLANK
            @ 23,01 SAY "1"
            REPL CODIGO WITH lCODIGO, NFA WITH lNFA, EMP WITH lEMP
            @ 23,01 SAY "2"
            REPL END WITH lEND, PCONT WITH lPCONT
            @ 23,01 SAY "3"
            REPL BAIRRO WITH lBAIRRO, CIDADE WITH lCIDADE, UF WITH lUF
            @ 23,01 SAY "4"
            REPL CEP WITH lCEP, DDD WITH lDDD, TEL1 WITH lTEL1, TEL2 WITH lTEL2
            @ 23,01 SAY "5"
            REPL CONTATO WITH lCONTATO, CGC WITH lCGC, IE WITH lIE
            @ 23,01 SAY "6"
            REPL CCM WITH lCCM, RG WITH lRG, CPF WITH lCPF
            @ 23,01 SAY "7"
            REPL FAX WITH lFAX, DEPTO WITH lDEPTO
            @ 23,01 SAY "8"
            REPL ENDCB WITH lENDCB
            @ 23,01 SAY "9"
            REPL BAIRROCB WITH lBAIRROCB, CIDADECB WITH lCIDADECB, UFCB WITH lUFCB
            @ 23,01 SAY "10"
            REPL CEPCB WITH lCEPCB, DDDCB WITH lDDDCB, TEL1CB WITH lTEL1CB
            @ 23,01 SAY "11"
            REPL FAXCB WITH lFAXCB, ENDEN WITH lENDEN
            @ 23,01 SAY "12"
            REPL BAIRROEN WITH lBAIRROEN, CIDADEEN WITH lCIDADEEN, UFEN WITH lUFEN
            @ 23,01 SAY "13"
            REPL CEPEN WITH lCEPEN, DDDEN WITH lDDDEN, TEL1EN WITH lTEL1EN
            @ 23,01 SAY "14"
            REPL FAXEN WITH lFAXEN, EMAIL WITH lEMAIL
            @ 23,01 SAY "15"
            REPL VENDEDOR WITH lVENDEDOR, RAMO WITH lRamo, midia with LMidia

    SELE 2
      *      DBAPPEND()
      UNLOCK ALL
      APPEND BLANK
            @ 23,01 SAY "16"
            REPL DATALIGA WITH lDATALIGA
            @ 23,01 SAY "17"
            REPL DATAHIST WITH lDATAHIST
            @ 23,01 SAY "18"
            REPL NOTAS WITH lNOTAS
            @ 23,01 SAY "19"
            REPL NOTAS2 WITH lNOTAS2
            @ 23,01 SAY "20"
            REPL NCLIEN WITH lNCLIEN
            @ 23,01 SAY "21"
            REPL COMENT WITH lCOMENT

         endif
      CLOSE ALL

*      DBRLOCK()
ENDDO


