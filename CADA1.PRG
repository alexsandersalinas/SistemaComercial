************* CADA1.PRG - ARQUIVO DE ALTERACAO PELO CGC /CPF
* ALTERACAO * dbCLI1.DFB / dbCLI2.DBF      
*************            

SET DATE BRITISH
SET CONSOLE OFF
SET CENTURY ON
*SET EXCLUSIVE ON 
DO WHILE .T.

**** CONFIRGARACAO DE TELA **
                        SET COLOR TO W/R,W/R
                        @ 05,02 CLEAR TO 05,77
                        SET COLOR TO W/R
                        @ 05,02 SAY "ALTERA€ÇO"
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


                                           CONTA      =(BANCO1+BANCO2)
                                           lPESSOA   = SPACE(1)
                                           lCGC      = SPACE(18)
                                           lCPF      = SPACE(15)
                                            UM         = 1
                                           OPCAO     = SPACE(1)
                                           ACAO      = SPACE(1)
   ***NUMERO DE REGISTROS**                                
           SET COLOR TO (W/R,W/R)
           @ 23,61 SAY "REGISTROS"
           *lCODIGO    = *(CONTA+UM)
           @ 23,69 SAY CONTA
 ****           
variavelCHECK=0 
MN=0
  SET COLOR TO W/B
       @ 05,14 PROMPT " Fisica " 
       @ 05,22 PROMPT " Juridica " 
MENU TO MN
  DO CASE
  CASE MN=1
  ********************************                                
  * PESSOA JURIDICA              *
  ********************************
                                
          lPESSOA="J"
           SET COLOR TO W/B,W/B    
           @ 06,02 SAY "CNPJ:"GET lcgc PICT "99.999.999/9999-99"
           SET COLOR TO (W/R,W/R)
           @ 23,01 SAY "Para sair TECLE<TUDO 0>                "
           READ
                 IF lCGC="00.000.000/0000-00" 
                    RETURN
                 ENDIF
                 lNCLIEN=lCGC

************* INICIO DA PESQUISA NO BANCO DE DADOS
              SELE 2
                  USE dbCLI1 INDEX ntxCGC1 SHARED
                  seek lCGC
                  variavelCHECK=1
                  IF EOF()
                       SELE 1
                   USE dbCLI2 INDEX ntxCGC2 SHARED
                   seek lCGC
                   variavelCHECK=2
                   IF EOF()
                      SET COLOR TO (W/R,W/R)
                      @ 23,01 SAY "CNPJ NAO EXISTE!        "
                      LOOP
                   ENDIF
                   endif

************* FIM DA PESQUISA

    ** VARIAVEIS DO BANCO DE DADOS
        lCODIGO    = CODIGO
        lEMP       = EMP
        lDDD       = DDD
        lTEL1      = TEL1
        lTEL2      = TEL2
        lEND       = END
        lCEP       = CEP
        lBAIRRO    = BAIRRO
        lCIDADE    = CIDADE
        lUF        = UF
        lCONTATO   = CONTATO
        lCGC       = CGC
        lIE        = IE
        lCCM       = CCM 
        lFAX       = FAX
        lDEPT      = DEPT
        lRAMAL     = RAMAL
        lEMAIL     = EMAIL
        lENDCB     = ENDCB
        lBAIRROCB  = BAIRRO
        lCIDADECB  = CIDADECB
        lUFCB      = UFCB
        lCEPCB     = CEPCB
        lRG        = RG
        lCPF       = CPF
        lDDDCB     = DDDCB
        lTEL1CB    = TEL1CB
        lFAXCB     = FAXCB
        lENDen     = ENDEN
        lBAIRROen  = BAIRROEN
        lCIDADEen  = CIDADEEN
        lUFen      = UFEN
        lCEPen     = CEPEN
        lDDDEN     = DDDEN
        lTEL1EN    = TEL1EN
        lFAXEN     = FAXEN
        lVENDEDOR  = VENDEDOR
        lPESSOA    = PESSOA
        lNOTAS     = NOTAS
        lNOTAS2    = NOTAS2
        lCOMENT    = COMENT
        lDNASC     = DNASC
        lDANALISE  = DANALISE
        lEMPTRAB   = EMPTRAB
        ****    FINAL
                     SET COLOR TO (W/B,W/B)
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
                                                                @ 12,43 SAY "CNPJ...........:"GET lcgc PICT "99.999.999/9999-99"
                                                                @ 13,02 SAY "IE......:"GET lie PICT "@!"
                                                                @ 13,43 SAY "CCM...................:"GET lccm PICT "9.999.999-9"
                                                                @ 14,02 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                                                        IF lENDCB="O MESMO"
                                                                                        @ 15,02 SAY "ENDERE€O DE COBRAN€A/ENTREGA: E' O MESMO"
                                                                         ENDIF
                                                                         IF lENDCB#"O MESMO"
                                                                                        @ 15,02 SAY "ENDERE€O DE COBRAN€A/ENTREGA: DIFERENTE"
                                                                         ENDIF
                                                                @ 15,52 SAY "ANALISADO EM..:"
                                                                @ 15,68 SAY lDANALISE PICT "99/99/99"
                                                                @ 16,02 SAY "VENDEDOR(A):"
                                                                @ 16,15 SAY lVENDEDOR
                                                                @ 17,02 Say "OBS..:"
                                                                @ 17,09 SAY lCOMENT
                                                                @ 18,02 SAY lNOTAS
                                                                @ 19,02 SAY lNOTAS2
                                                                READ
                                                                TELA2=SAVESCREEN(00,00,24,80)
                                                                
                                                                *
                                                                DO CADEND2
                                                                *
                                                                        SET COLOR TO (W/B,W/B)
                                                                                IF lENDCB="O MESMO"
                                                                                        @ 15,02 SAY "ENDERE€O DE COBRAN€A/ENTREGA: E' O MESMO"
                                                                                ENDIF
                                                                                IF lENDCB#"O MESMO"
                                                                                        @ 15,02 SAY "ENDERE€O DE COBRAN€A/ENTREGA: DIFERENTE"
                                                                                ENDIF
                                                                        @ 15,52 SAY "ANALISADO EM..:"GET lDANALISE PICT "99/99/99"
                                                                        @ 16,02 SAY "VENDEDOR(A):"GET lVENDEDOR PICT "@!"                      
                                                                        @ 17,02 Say "OBS..:"GET lCOMENT PICT "@!"
                                                                        @ 18,02 GET lNOTAS PICT "@!"                                           
                                                                        @ 19,02 GET lNOTAS2 PICT "@!"
                                                                               READ
                                                                                        *lDATAHIST=lPCONT
                                        SET COLOR TO (W/R,W/R)
                                        @ 23,01 SAY "Grava as informacoes Sim ou Nao?                 "
                                        DO WHILE ACAO<>"S" .and. ACAO<>"N"
                                        WAIT TO ACAO
                                        ENDDO
                                                IF ACAO="S"
                                                        @ 23,01 SAY "Informacoes sendo Gravandas...          "
                                                        if variavelCHECK=1

                                                                SELE 2
                                                                RLOCK()
                                                                REPL CODIGO WITH lCODIGO
                                                                REPL EMP WITH lEMP
                                                                REPL END WITH lEND, BAIRRO WITH lBAIRRO
                                                                REPL CIDADE WITH lCIDADE, UF WITH lUF
                                                                REPL CEP WITH lCEP, DDD WITH lDDD
                                                                REPL TEL1 WITH lTEL1, TEL2 WITH lTEL2
                                                                REPL CONTATO WITH lCONTATO, CGC WITH lCGC, IE WITH lIE
                                                                REPL CCM WITH lCCM
                                                                REPL FAX WITH lFAX
                                                                REPL DEPT WITH lDEPT
                                                                REPL ENDCB WITH lENDCB
                                                                REPL BAIRROCB WITH lBAIRROCB
                                                                REPL CIDADECB WITH lCIDADECB
                                                                REPL UFCB WITH lUFCB
                                                                REPL CEPCB WITH lCEPCB
                                                                REPL DDDCB WITH lDDDCB
                                                                REPL TEL1CB WITH lTEL1CB
                                                                REPL FAXCB WITH lFAXCB
                                                                REPL ENDEN WITH lENDEN
                                                                REPL BAIRROEN WITH lBAIRROEN
                                                                REPL CIDADEEN WITH lCIDADEEN
                                                                REPL UFEN WITH lUFEN
                                                                REPL CEPEN WITH lCEPEN
                                                                REPL DDDEN WITH lDDDEN
                                                                REPL TEL1EN WITH lTEL1EN
                                                                REPL FAXEN WITH lFAXEN
                                                                REPL EMAIL WITH lEMAIL
                                                                *REPL VENDEDOR WITH lVENDEDOR
                                                                *REPL DNASC WITH lDNASC
                                                                REPL DANALISE WITH lDANALISE
                                                                *REPL EMPTRAB WITH lEMPTRAB
                                                                REPL RAMAL WITH lRAMAL
                                                                REPL COMENT WITH lCOMENT
                                                                REPL NOTAS WITH lnotas
                                                                REPL NOTAS2 WITH lNOTAS2
                                                         ENDIF
                                                        
                                                        if variavelCHECK=2
                                                                SELE 1
                                                                RLOCK()
                                                                REPL CODIGO WITH lCODIGO
                                                                REPL EMP WITH lEMP
                                                                REPL END WITH lEND, BAIRRO WITH lBAIRRO
                                                                REPL CIDADE WITH lCIDADE, UF WITH lUF
                                                                REPL CEP WITH lCEP, DDD WITH lDDD
                                                                REPL TEL1 WITH lTEL1, TEL2 WITH lTEL2
                                                                REPL CONTATO WITH lCONTATO, CGC WITH lCGC, IE WITH lIE
                                                                REPL CCM WITH lCCM
                                                                REPL FAX WITH lFAX
                                                                REPL DEPT WITH lDEPT
                                                                REPL ENDCB WITH lENDCB
                                                                REPL BAIRROCB WITH lBAIRROCB
                                                                REPL CIDADECB WITH lCIDADECB
                                                                REPL UFCB WITH lUFCB
                                                                REPL CEPCB WITH lCEPCB
                                                                REPL DDDCB WITH lDDDCB
                                                                REPL TEL1CB WITH lTEL1CB
                                                                REPL FAXCB WITH lFAXCB
                                                                REPL ENDEN WITH lENDEN
                                                                REPL BAIRROEN WITH lBAIRROEN
                                                                REPL CIDADEEN WITH lCIDADEEN
                                                                REPL UFEN WITH lUFEN
                                                                REPL CEPEN WITH lCEPEN
                                                                REPL DDDEN WITH lDDDEN
                                                                REPL TEL1EN WITH lTEL1EN
                                                                REPL FAXEN WITH lFAXEN
                                                                REPL EMAIL WITH lEMAIL
                                                               * REPL VENDEDOR WITH lVENDEDOR
                                                                *REPL DNASC WITH lDNASC
                                                                REPL DANALISE WITH lDANALISE
                                                                *REPL EMPTRAB WITH lEMPTRAB
                                                                REPL RAMAL WITH lRAMAL
                                                                REPL COMENT WITH lCOMENT
                                                                REPL NOTAS WITH lnotas
                                                                REPL NOTAS2 WITH lNOTAS2
                                                           ENDIF
                              USE
                                                     ENDIF
CASE MN=2
   *************************************                                
   * PESSOA FISICA                    **
   *************************************
                                
                        lPESSOA="F"
                          SET COLOR TO W/B,W/B    
                          @ 15,03 CLEAR TO 19,76
                          @ 06,02 SAY "CPF:"GET lCPF PICT "999.999.999-99"
                          SET COLOR TO  W/R
                          @ 23,01 SAY "Para sair TECLE<ENTER>                        "
                          READ
                                IF lCPF=SPACE(15)
                                   RETURN
                                ENDIF
                               lNCLIEN=lCPF
                             
                             SELE 2
                                USE dbCLI1 INDEX ntxCPF1 EXCLUSIVE
                                SEEK lCPF
                                IF FOUND()
                                   variavelCHECK=1
                                ENDIF
                                IF .NOT. FOUND()
                                     SELE 1
                                        USE dbCLI2 INDEX ntxCPF2 EXCLUSIVE
                                        SEEK lCPF
                                        IF FOUND()
                                           variavelCHECK=2
                                        ENDIF
                                        IF .NOT. FOUND()
                                           SET COLOR TO (W/R,W/R)
                                                @ 23,01 SAY " CPF NÇO EXISTE!           " 
                                                LOOP
                                        ENDIF
                                ENDIF
                             
        **** VARIAVEIS DO BANCO DE DADOS
                lCODIGO    = CODIGO
                lEMP       = EMP
                lDDD       = DDD
                lTEL1      = TEL1
                lTEL2      = TEL2
                lEND       = END
                lCEP       = CEP
                lBAIRRO    = BAIRRO
                lCIDADE    = CIDADE
                lUF        = UF
                lCONTATO   = CONTATO
                lCGC       = CGC
                lIE        = IE
                CCM        = CCM 
                lFAX       = FAX
                lDEPT      = DEPT
                lRAMAL     = RAMAL
                lEMAIL     = EMAIL
                lENDCB     = ENDCB
                lBAIRROCB  = BAIRRO
                lCIDADECB  = CIDADECB
                lUFCB      = UFCB
                lCEPCB     = CEPCB
                lRG        = RG
                lCPF       = CPF
                lDDDCB     = DDDCB
                lTEL1CB    = TEL1CB
                lFAXCB     = FAXCB
                lENDen     = ENDEN
                lBAIRROen  = BAIRROEN
                lCIDADEen  = CIDADEEN
                lUFen      = UFEN
                lCEPen     = CEPEN
                lDDDEN     = DDDEN
                lTEL1EN    = TEL1EN
                lFAXEN     = FAXEN
                lVENDEDOR  = VENDEDOR
                lPESSOA    = PESSOA
                lNOTAS     = NOTAS
                lNOTAS2    = NOTAS2
                lCOMENT    = COMENT
                lDNASC     = DNASC
                lDANALISE  = DANALISE
                lEMPTRAB   = EMPTRAB
                ****FIM 
                          SET COLOR TO (W/B,W/B)
                                                               @ 06,23 SAY "CLIENTE:"GET lemp PICT "@!S26"
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
                                                                @ 12,02 SAY "CPF.....:"GET lCPF PICT "999.999.999-99"
                                                                @ 12,28 SAY "RG:"GET lRG PICT "@!"
                                                                @ 13,02 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                                                        IF lENDCB="O MESMO"
                                                                                       @ 14,02 SAY "ENDERE€O DE COBRAN€A/ENTREGA: E' O MESMO"
                                                                        ENDIF
                                                                        IF lENDCB#"O MESMO"
                                                                                        @ 14,02 SAY "ENDERE€O DE COBRAN€A/ENTREGA: DIFERENTE"
                                                                        ENDIF
                                                                @ 14,52 SAY "ANALISADO EM..:"
                                                                @ 14,68 SAY lDANALISE
                                                                @ 15,02 SAY "VENDEDOR(A):"
                                                                @ 15,15 SAY lVENDEDOR
                                                                @ 16,02 Say "OBS..:" 
                                                                @ 16,09 SAY lCOMENT
                                                                @ 17,02 SAY lNOTAS
                                                                @ 18,02 SAY lNOTAS2
                                                                READ
                                                                TELA2=SAVESCREEN(00,00,24,80)
                                                                        *
                                                                        DO CADEND2
                                                                        *
                                                                                SET COLOR TO (W/B,W/B)
                                                                                IF lENDCB="O MESMO"
                                                                                        @ 14,02 SAY "ENDERE€O DE COBRAN€A/ENTREGA: E' O MESMO"
                                                                                ENDIF
                                                                                IF lENDCB#"O MESMO"
                                                                                        @ 14,02 SAY "ENDERE€O DE COBRAN€A/ENTREGA: DIFERENTE"
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
                                                        if variavelCHECK=1
                                                                SELE 2
                                                                RLOCK()
                                                                *REPL CODIGO WITH lCODIGO
                                                                REPL EMP WITH LEMP
                                                                REPL END WITH lEND
                                                                REPL BAIRRO WITH lBAIRRO
                                                                REPL CIDADE WITH lCIDADE, UF WITH lUF
                                                                REPL CEP WITH lCEP, DDD WITH lDDD
                                                                REPL TEL1 WITH lTEL1, TEL2 WITH lTEL2
                                                                REPL CONTATO WITH lCONTATO
                                                                REPL RG WITH lRG, CPF WITH lCPF
                                                                REPL FAX WITH lFAX, DEPT WITH lDEPT
                                                                REPL ENDCB WITH lENDCB
                                                                REPL BAIRROCB WITH lBAIRROCB
                                                                REPL CIDADECB WITH lCIDADECB
                                                                REPL UFCB WITH lUFCB
                                                                REPL CEPCB WITH lCEPCB
                                                                REPL DDDCB WITH lDDDCB
                                                                REPL TEL1CB WITH lTEL1CB
                                                                REPL FAXCB WITH lFAXCB
                                                                REPL ENDEN WITH lENDEN
                                                                REPL BAIRROEN WITH lBAIRROEN
                                                                REPL CIDADEEN WITH lCIDADEEN
                                                                REPL UFEN WITH lUFEN
                                                                REPL CEPEN WITH lCEPEN
                                                                REPL DDDEN WITH lDDDEN
                                                                REPL TEL1EN WITH lTEL1EN
                                                                REPL FAXEN WITH lFAXEN
                                                                REPL EMAIL WITH lEMAIL
                                                                *REPL VENDEDOR WITH lVENDEDOR
                                                                REPL DNASC WITH lDNASC
                                                                REPL DANALISE WITH lDANALISE
                                                                REPL EMPTRAB WITH lEMPTRAB
                                                                REPL RAMAL WITH lRAMAL
                                                                REPL COMENT WITH lCOMENT
                                                                REPL NOTAS WITH lNOTAS
                                                                REPL NOTAS2 WITH lNOTAS2

                                                        ENDIF

                                                        if variavelCHECK=2
                                                        SELE 1
                                                                RLOCK()
                                                                *REPL CODIGO WITH lCODIGO
                                                                REPL EMP WITH LEMP
                                                                REPL END WITH lEND
                                                                REPL BAIRRO WITH lBAIRRO
                                                                REPL CIDADE WITH lCIDADE, UF WITH lUF
                                                                REPL CEP WITH lCEP, DDD WITH lDDD
                                                                REPL TEL1 WITH lTEL1, TEL2 WITH lTEL2
                                                                REPL CONTATO WITH lCONTATO
                                                                REPL RG WITH lRG, CPF WITH lCPF
                                                                REPL FAX WITH lFAX, DEPT WITH lDEPT
                                                                REPL ENDCB WITH lENDCB
                                                                REPL BAIRROCB WITH lBAIRROCB
                                                                REPL CIDADECB WITH lCIDADECB
                                                                REPL UFCB WITH lUFCB
                                                                REPL CEPCB WITH lCEPCB
                                                                REPL DDDCB WITH lDDDCB
                                                                REPL TEL1CB WITH lTEL1CB
                                                                REPL FAXCB WITH lFAXCB
                                                                REPL ENDEN WITH lENDEN
                                                                REPL BAIRROEN WITH lBAIRROEN
                                                                REPL CIDADEEN WITH lCIDADEEN
                                                                REPL UFEN WITH lUFEN
                                                                REPL CEPEN WITH lCEPEN
                                                                REPL DDDEN WITH lDDDEN
                                                                REPL TEL1EN WITH lTEL1EN
                                                                REPL FAXEN WITH lFAXEN
                                                                REPL EMAIL WITH lEMAIL
                                                                *REPL VENDEDOR WITH lVENDEDOR
                                                                REPL DNASC WITH lDNASC
                                                                REPL DANALISE WITH lDANALISE
                                                                REPL EMPTRAB WITH lEMPTRAB
                                                                REPL RAMAL WITH lRAMAL
                                                                REPL COMENT WITH lCOMENT
                                                                REPL NOTAS WITH lNOTAS
                                                                REPL NOTAS2 WITH lNOTAS2
                                                             ENDIF
                                                       USE
                                        ENDIF
CASE MN=0    
              RESTSCREEN(00,00,24,80,JLTELA)
              RETURN
ENDCASE
ENDDO

