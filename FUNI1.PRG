* PROG : FUNI1.PRG - INCLUSAO DE FUNCIONARIO
* DATA : 20/04/2000 
* AUTOR: ALEXSANDER SALINAS SANTOS - salinas@querove.com.br


SET DATE BRITISH
SET CONSOLE OFF
SET CENTURY ON

DO WHILE .T.

**** CONFIRGARACAO DE TELA **
                        SET COLOR TO W/B
                        @ 01,01 SAY "INCLUSÇO DE FUNCIONARIO" 
                       
                        SET COLOR TO W
                        @ 02,00 CLEAR TO 21,79
**** FIM

SELE 1 
USE dbfun1 SHARED
BANCO1      =RECCOUNT()

                                           UM         = 1
                                           ACAO       = SPACE(1)
                                           OPCAO      = " "
                                           MESMO      = " "
                                           *
                                           lNOME      = space(50)
                                           lEND       = SPACE(50)
                                           lCEP       = SPACE(9)
                                           lBAIRRO    = SPACE(30)
                                           lCIDADE    = SPACE(30)
                                           lUF        = SPACE(2)
                                           lDDD       = SPACE(4)
                                           lTEL       = SPACE(9)
                                           lCELULAR   = SPACE(9)
                                           lFAX       = SPACE(9) 
                                           lEMAIL     = SPACE(45)
                                           lRG        = SPACE(20)
                                           lCPF       = SPACE(14)
                                           lECIVIL    = SPACE(1)
                                           lCONJUNGUE = SPACE(50)
                                           lFILHO1    = SPACE(50)
                                           lFILHO2    = SPACE(50)
                                           lFILHO3    = SPACE(50)
                                           lF_DNASC1  = CTOD("  /  /    ")
                                           lF_DNASC2  = CTOD("  /  /    ")
                                           lF_DNASC3  = CTOD("  /  /    ")
                                           lDNASC     = CTOD("  /  /    ")
                                           lCART_TRAB  = SPACE(7)
                                           lCART_SERIE = SPACE(6)
                                           lCART_EST   = SPACE(2)
                                           lPIS        = SPACE(12)
                                           lTITULO     = SPACE(15)
                                           lTITULO_Z   = SPACE(10)
                                           lTITULO_SES = SPACE(3)
                                           lADMISSAO   = CTOD("  /  /    ")
                                           lHORARIO    = SPACE(19)
                                           lFUNCAO     = SPACE(20)
                                           lSALARIO    = 14
                                           lCAR_MOTOR  = SPACE(14)
                                           lREGISTRADO = CTOD("  /  /    ")
                                           lCONTA_BAN  = SPACE(10)
                                           lCONTA_AG   = SPACE(4)
                                           lCONTA_CC   = SPACE(11)
                                           lRG_EXP     = CTOD("  /  /    ")
                                           lNOMEPAI    = SPACE(40)
                                           lNOMEMAE    = SPACE(50)
                                           lNASC_LOCAL = SPACE(20)
                                           lOBS        = SPACE(50 )
                                           lOBS2       = SPACE(50)

                                           lEMPTRAB      = SPACE(55)
   ***NUMERO DE REGISTROS**                                
           SET COLOR TO W/R
           @ 23,61 SAY "REGISTROS"
           CONTA=BANCO1
           lCODIGO    = (CONTA+UM)
           @ 23,69 SAY CONTA
*                                
             SET COLOR TO (W/N,W/N)    
                       *@ 15,03 CLEAR TO 19,76
                       @ 02,00 SAY "CPF:"GET lCPF PICT "999.999.999-99"
                         SET COLOR TO  W/R
                            @ 23,01 SAY "Para sair TECLE<ENTER>                        "
                            READ
                               IF lCPF=SPACE(14)
                                  RETURN
                               ENDIF
                           lNCLIEN=lCPF
                           SELE 1
                              USE dbFUN1 INDEX ntxfun1 SHARED
                                SEEK lCPF
                                   IF .NOT. EOF()
                                       SET COLOR TO W/R,W/R
                                       @ 23,01 SAY "CPF JA EXISTE !        "
                                       LOOP
                                    ENDIF 
             *//ok
                                       SET COLOR TO (W/N,W/N)   

                                                                @ 02,16 SAY "NOME:"GET lnome PICT "@!"
                                                                @ 03,00 SAY "ENDERE€O:"GET lend PICT "@!S30"
                                                                @ 03,32 SAY "BAIRRO:"GET lbairro PICT "@!S26"
                                                                @ 08,02 SAY "CIDADE..:"GET lcidade PICT "@!"
                                                                @ 08,43 SAY "UF.....:"GET luf PICT "@!"
                                                                @ 08,56 SAY "CEP........:"GET lcep PICT "99999-999"
                                                                @ 09,02 SAY "DDD.....:"GET lddd PICT "9999"
                                                                @ 09,17 SAY "FONE RES......:"GET lTEL1 PICT "9999-9999"
                                                                @ 09,43 SAY "E-MAIL.:"GET lEMAIL PICT "@!S26"
                                                              *  @ 10,02 SAY "EMP.....:"GET lEMPTRAB PICT "@!S30"
                                                              *  @ 10,43 SAY "FONE COM.:"GET lTEL2 PICT "9999-9999"
                                                              *  @ 10,64 SAY "RAMAL...:"GET lRAMAL PICT "9999"
                                                                @ 11,02 SAY "FAX.....:"GET lFAX PICT "9999-9999"
                                                              *  @ 11,22 SAY "DEPTO:"GET lDEPT PICT "@!S21"
                                                                @ 11,51 SAY "DATA NASCIMENTO:"GET lDNASC PICT "99/99/99"
                                                                @ 12,02 SAY "CPF.....:"
                                                                @ 12,12 SAY lCPF 
                                                                @ 12,28 SAY "RG:"GET lRG PICT "@!"
                                                                @ 13,02 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                                                @ 14,02 SAY "ENDERECO DE COBRAN€A/ENTREGA:"
                                                                @ 14,52 SAY "ANALISADO EM..:"
                                                                @ 15,02 SAY "VENDEDOR(A):"
                                                                @ 16,02 Say "OBS..:" 
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
  
RESTSCREEN(00,00,24,80,JLTELA)
              RETURN
ENDDO

