* ************ CADI1.PRG - ARQUIVO DE INCLUSAO PELO CGC /CPF
* INCLUSAO *** DBF - DBCLI1.DBF / DBCLI2.DBF
**************


SET DATE BRITISH
SET CONSOLE OFF
SET CENTURY ON

DO WHILE .T.

**** CONFIRGARACAO DE TELA **
                        SET COLOR TO W/R,W/R
                        @ 05,02 CLEAR TO 05,77
                        SET COLOR TO W/R
                        @ 05,02 SAY "INCLUS�O"
                        SET COLOR TO (W/B,W/B)
                        @ 06,02 CLEAR TO 20,77
                        SET COLOR TO (W/B,W/B)
**** FIM

SELE 2 
USE dbCLI1 SHARED
BANCO1      =RECCOUNT()
SELE 1
USE dbCLI2 SHARED
BANCO2      =RECCOUNT()

                                           UM         = 1
                                          *lNFA       = SPACE(15)
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
                                           lIE        = SPACE(18)
                                           lCCM       = SPACE(11)
                                           ACAO       = " "
                                           lFAX       = SPACE(9) 
                                           lDEPT      = SPACE(22)
                                           lRAMAL     = SPACE(4)
                                           lEMAIL     = SPACE(45)
                                           *lPCONT     = DATE()
                                           lENDCB     = SPACE(60)
                                           lBAIRROCB  = SPACE(30)
                                           lCIDADECB  = SPACE(30)
                                           lUFCB      = SPACE(2) 
                                           lCEPCB     = SPACE(9)
                                           lRG        = SPACE(20)
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
                                           lVENDEDOR  = SPACE(25)
                                           *lRAMO      = SPACE(20)
                                           *lMIDIA     = SPACE(20)
                                           lPESSOA    = SPACE(1)
                                           OPCAO      = " "
                                           MESMO      = " "
                                           *lDATALIGA   = CTOD("  /  /    ")
                                           lNOTAS        = SPACE(76)
                                           lNOTAS2       = SPACE(76)
                                           lCOMENT       = SPACE(69)
                                           * lLIXO         = SPACE(1)
                                           lDNASC        = CTOD("  /  /    ")
                                           lDANALISE     = CTOD("  /  /    ")
                                           lEMPTRAB      = SPACE(55)
   ***NUMERO DE REGISTROS**                                
           SET COLOR TO (W/R,W/R)
           @ 23,61 SAY "REGISTROS"
           CONTA=(BANCO1+BANCO2)
           lCODIGO    = (CONTA+UM)
           @ 23,69 SAY CONTA
 ****           
 
MN=0
  SET COLOR TO W/B
       @ 05,12 PROMPT " Fisica " 
       @ 05,20 PROMPT " Juridica " 

  MENU TO MN
  DO CASE
  CASE MN=2
  
  *************************************                                
  * PESSOA FISICA                    **
  *************************************
                                
             lPESSOA="F"
                   SET COLOR TO W/B,W/B    
                       @ 15,03 CLEAR TO 19,76
                      *@ 06,10 SAY "FISICA"
                       @ 06,02 SAY "CPF:"GET lCPF PICT "999.999.999-99"
                         SET COLOR TO  W/R
                            @ 23,01 SAY "Para sair TECLE<ENTER>                        "
                            READ
                               IF lCPF=SPACE(15)
                                  RETURN
                               ENDIF
                           lNCLIEN=lCPF
                           SELE 2
                              USE dbCLI1 INDEX ntxCPF1 SHARED
                                SEEK lCPF
                                   IF .NOT. EOF()
                                       SET COLOR TO W/R,W/R
                                       @ 23,01 SAY "CPF JA EXISTE!        "
                                       LOOP
                                    ENDIF
                           SELE 1 
                                USE dbCLI2 INDEX ntxCPF2 SHARED
                                SEEK lCPF
                                        IF .NOT. EOF()
                                            SET COLOR TO W/R,W/R
                                            @ 23,01 SAY "CPF JA EXISTE!        "
                                             LOOP
                                        ENDIF
                                        SET COLOR TO (W/B,W/B)
                                                               @ 06,23 SAY "CLIENTE:"GET lemp PICT "@!S46"
                                                                @ 07,02 SAY "ENDERECO:"GET lend PICT "@!S30"
                                                                @ 07,43 SAY "BAIRRO.:"GET lbairro PICT "@!S26"
                                                                @ 08,02 SAY "CIDADE..:"GET lcidade PICT "@!"
                                                                @ 08,43 SAY "U.F....:"GET luf PICT "@!"
                                                                @ 08,56 SAY "CEP........:"GET lcep PICT "99999-999"
                                                                @ 09,02 SAY "DDD.....:"GET lddd PICT "9999"
                                                                @ 09,17 SAY "FONE RES......:"GET lTEL1 PICT "9999-9999"
                                                                @ 09,43 SAY "E-MAIL.:"GET lEMAIL PICT "@!S26"
                                                                @ 10,02 SAY "EMP.....:"GET lEMPTRAB PICT "@!S30"
                                                                @ 10,43 SAY "FONE COM.:"GET lTEL2 PICT "9999-9999"
                                                                @ 10,64 SAY "RAMAL...:"GET lRAMAL PICT "9999"
                                                                @ 11,02 SAY "FAX.....:"GET lFAX PICT "9999-9999"
                                                                @ 11,22 SAY "DEPTO:"GET lDEPT PICT "@!S21"
                                                                @ 11,51 SAY "DATA NASCIMENTO:"GET lDNASC PICT "99/99/99"
                                                                @ 12,02 SAY "CPF.....:"
                                                                @ 12,12 SAY lCPF 
                                                                @ 12,28 SAY "RG:"GET lRG PICT "@!"
                                                                @ 13,02 SAY "����������������������������������������������������������������������������"
                                                                @ 14,02 SAY "ENDERECO DE COBRAN�A/ENTREGA:"
                                                                @ 14,52 SAY "ANALISADO EM..:"
                                                                @ 15,02 SAY "VENDEDOR(A):"
                                                                @ 16,02 Say "OBS..:" 
                                                                READ
                                                                TELA2=SAVESCREEN(00,00,24,80)
                                                                        *
                                                                        DO CADEND
                                                                        *
                                                                                SET COLOR TO (W/B,W/B)
                                                                                IF lENDCB="O MESMO"
                                                                                        @ 14,02 SAY "ENDERE�O DE COBRAN�A/ENTREGA: E' O MESMO"
                                                                                ENDIF
                                                                                IF lENDCB#"O MESMO"
                                                                                        @ 14,02 SAY "ENDERE�O DE COBRAN�A/ENTREGA: DIFERENTE"
                                                                                ENDIF
                                                                        @ 14,52 SAY "ANALISADO EM..:"GET lDANALISE PICT "99/99/99"
                                                                        @ 15,02 SAY "VENDEDOR(A):"GET lVENDEDOR PICT "@!"                      
                                                                        @ 16,02 Say "OBS..:"GET lCOMENT PICT "@!"
                                                                        @ 17,02 GET lNOTAS PICT "@!"                    
                                                                        @ 18,02 GET lNOTAS2 PICT "@!"
                                                                        READ
                                        SET COLOR TO (W/R,W/R)
                                        @ 23,01 SAY "Grava as informacoes Sim ou Nao?                 "
                                        DO WHILE ACAO<>"S" .and. ACAO<>"N"
                                           WAIT TO ACAO
                                        ENDDO
                                                IF ACAO="S"
                                                        @ 23,01 SAY "Informacoes sendo Gravandas...                         "
                                               SELE 1
                                                     UNLOCK ALL
                                                        APPEND BLANK
                                                        REPL CODIGO WITH lCODIGO,  EMP WITH lEMP
                                                        REPL END WITH lEND, BAIRRO WITH lBAIRRO
                                                        REPL CIDADE WITH lCIDADE, UF WITH lUF
                                                        REPL CEP WITH lCEP, DDD WITH lDDD
                                                        REPL TEL1 WITH lTEL1, TEL2 WITH lTEL2
                                                        REPL CONTATO WITH lCONTATO, CGC WITH lCGC, IE WITH lIE
                                                        REPL CCM WITH lCCM, RG WITH lRG, CPF WITH lCPF
                                                        REPL FAX WITH lFAX, DEPT WITH lDEPT
                                                        REPL ENDCB WITH lENDCB
                                                        REPL BAIRROCB WITH lBAIRROCB, CIDADECB WITH lCIDADECB, UFCB WITH lUFCB
                                                        REPL CEPCB WITH lCEPCB, DDDCB WITH lDDDCB, TEL1CB WITH lTEL1CB
                                                        REPL FAXCB WITH lFAXCB, ENDEN WITH lENDEN
                                                        REPL BAIRROEN WITH lBAIRROEN, CIDADEEN WITH lCIDADEEN, UFEN WITH lUFEN
                                                        REPL CEPEN WITH lCEPEN, DDDEN WITH lDDDEN, TEL1EN WITH lTEL1EN
                                                        REPL FAXEN WITH lFAXEN, EMAIL WITH lEMAIL
                                                        REPL VENDEDOR WITH lVENDEDOR, DNASC WITH lDNASC
                                                        REPL DANALISE WITH lDANALISE, EMPTRAB WITH lEMPTRAB
                                                        REPL PESSOA WITH lPESSOA
                                                        REPL RAMAL WITH lRAMAL
                                                        REPL COMENT WITH lCOMENT
                                                        REPL NOTAS WITH lNOTAS
                                                        REPL NOTAS2 WITH lNOTAS2
                       ENDIF
        USE
   
**** PROXIMO JURIDICO

 CASE MN=1
   ******************************                                
   * PESSOA JURIDICA            *
   ******************************
                                
           lPESSOA="J"
               SET COLOR TO W/B,W/B    
               *@ 06,02 SAY "JURIDICA"
               @ 06,02 SAY "CNPJ:"GET lcgc PICT "99.999.999/9999-99"
               SET COLOR TO (W/R,W/R)
                    @ 23,01 SAY "Para sair TECLE<TUDO 0>                        "
                   READ
                     IF lCGC="00.000.000/0000-00" 
                        RETURN
                     ENDIF
                     lNCLIEN=lCGC
                       
                       SELE 1 
                         USE dbCLI2 INDEX ntxCGC2 SHARED
                         SEEK lCGC
                            IF .NOT. EOF()
                                 SET COLOR TO (W/R,W/R)
                                 @ 23,01 SAY "CGC JA EXISTE!        "
                                 LOOP
                            ENDIF
                         SELE 2
                         USE dbCLI1 INDEX ntxCGC1 SHARED 
                         SEEK lCGC
                         IF .NOT. EOF()
                                 SET COLOR TO (W/R,W/R)
                                 @ 23,01 SAY "CNPJ EXISTENTE!        "
                                 LOOP
                               ENDIF

                                        SET COLOR TO (W/B,W/B)
                                        *  @ 02,30 SAY "1. CONTATO:"GET lPCONT PICT "99/99/99"
                                                                @ 07,02 SAY "EMPRESA.:"GET lemp PICT "@!S66"
                                                                @ 08,02 SAY "ENDERECO:"GET lend PICT "@!"
                                                                @ 09,02 SAY "BAIRRO..:"GET lbairro PICT "@!S18"
                                                                @ 09,31 SAY "CIDADE.:"GET lcidade PICT "@!S21"
                                                                @ 09,62 SAY "U.F.........:"GET luf PICT "@!"
                                                                @ 10,02 SAY "CEP.....:"GET lcep PICT "99999-999"
                                                                @ 10,22 SAY "DDD.:"GET lddd PICT "9999"
                                                                @ 10,34 SAY "FAX.:"GET lFAX PICT "9999-9999"
                                                                @ 10,50 SAY "TEL....:"GET lTEL1 PICT "9999-9999"
                                                                @ 10,68 SAY "/"
                                                                @ 10,69 GET lTEL2 PICT "9999-9999"
                                                                @ 11,02 SAY "CONTATO.:"GET lcontato PICT "@!S35"
                                                                @ 11,43 SAY "DEPT.:"GET lDEPT PICT "@!S16"
                                                                @ 11,67 SAY "RAMAL:"GET lRAMAL PICT "9999"
                                                                @ 12,02 SAY "E-MAIL..:"GET lEMAIL PICT "@!s30"
                                                                @ 12,43 SAY "CNPJ...........:"
                                                                @ 12,60 SAY lcgc PICT "99.999.999/9999-99"
                                                                @ 13,02 SAY "IE......:"GET lie PICT "@!"
                                                                @ 13,43 SAY "CCM...................:"GET lccm PICT "9.999.999-9"
                                                                @ 14,02 SAY "����������������������������������������������������������������������������"
                                                                @ 15,02 SAY "ENDERE�O DE COBRAN�A/ENTREGA:"
                                                                @ 15,52 SAY "ANALISADO EM..:"
                                                                @ 16,02 SAY "VENDEDOR(A):"
                                                                @ 17,02 Say "OBS..: "
                                                                READ
                                                                TELA2=SAVESCREEN(00,00,24,80)
                                                                
                                                                *
                                                                DO CADEND
                                                                *
                                                                        SET COLOR TO (W/B,W/B)
                                                                                IF lENDCB="O MESMO"
                                                                                        @ 15,02 SAY "ENDERE�O DE COBRAN�A/ENTREGA: E' O MESMO"
                                                                                ENDIF
                                                                                IF lENDCB#"O MESMO"
                                                                                        @ 15,02 SAY "ENDERE�O DE COBRAN�A/ENTREGA: DIFERENTE"
                                                                                ENDIF
                                                                        @ 15,52 SAY "ANALISADO EM..:"GET lDANALISE PICT "99/99/99"
                                                                        @ 16,02 SAY "VENDEDOR(A):"GET lVENDEDOR PICT "@!"                      
                                                                        @ 17,02 Say "OBS..:"GET lCOMENT PICT "@!"
                                                                        @ 18,02 GET lNOTAS PICT "@!"                                           
                                                                        @ 19,02 GET lNOTAS2 PICT "@!"
                                                                               READ
                                        SET COLOR TO (W/R,W/R)
                                        @ 23,01 SAY "Grava as informacoes Sim ou Nao?                 "
                                        DO WHILE ACAO<>"S" .and. ACAO<>"N"
                                           WAIT TO ACAO
                                        ENDDO
                                                IF ACAO="S"
                                                        @ 23,01 SAY "Informacoes sendo Gravandas...                         "
                                               SELE 1
                                                     UNLOCK ALL
                                                        APPEND BLANK
                                                        REPL CODIGO WITH lCODIGO,  EMP WITH lEMP
                                                        REPL END WITH lEND, BAIRRO WITH lBAIRRO
                                                        REPL CIDADE WITH lCIDADE, UF WITH lUF
                                                        REPL CEP WITH lCEP, DDD WITH lDDD
                                                        REPL TEL1 WITH lTEL1, TEL2 WITH lTEL2
                                                        REPL CONTATO WITH lCONTATO, CGC WITH lCGC, IE WITH lIE
                                                        REPL CCM WITH lCCM, RG WITH lRG, CPF WITH lCPF
                                                        REPL FAX WITH lFAX, DEPT WITH lDEPT
                                                        REPL ENDCB WITH lENDCB
                                                        REPL BAIRROCB WITH lBAIRROCB, CIDADECB WITH lCIDADECB, UFCB WITH lUFCB
                                                        REPL CEPCB WITH lCEPCB, DDDCB WITH lDDDCB, TEL1CB WITH lTEL1CB
                                                        REPL FAXCB WITH lFAXCB, ENDEN WITH lENDEN
                                                        REPL BAIRROEN WITH lBAIRROEN, CIDADEEN WITH lCIDADEEN, UFEN WITH lUFEN
                                                        REPL CEPEN WITH lCEPEN, DDDEN WITH lDDDEN, TEL1EN WITH lTEL1EN
                                                        REPL FAXEN WITH lFAXEN, EMAIL WITH lEMAIL
                                                        REPL VENDEDOR WITH lVENDEDOR, DNASC WITH lDNASC
                                                        REPL DANALISE WITH lDANALISE, EMPTRAB WITH lEMPTRAB
                                                        REPL PESSOA WITH lPESSOA
                                                        REPL RAMAL WITH lRAMAL
                                                        REPL COMENT WITH lCOMENT
                                                        REPL NOTAS WITH lNOTAS
                                                        REPL NOTAS2 WITH lNOTAS2
                       ENDIF
        USE

*lDATAHIST=lPCONT
   CASE MN=0    
              RESTSCREEN(00,00,24,80,JLTELA)
              RETURN
    ENDCASE
ENDDO

