* CADC4.PRG - CANSULTA DE PESSOA FISICA 
* AUTOR: ALEXSANDER SALINAS SANTOS -SALINAS@STARMEDIA.COM
* DATA: 16/11/1999
*

* CONFIGURA€åES

CLOSE ALL
SET COLOR TO
SET SCORE OFF
SET TALK OFF
SET WRAP ON
SET DATE BRIT
SET CONSOLE OFF
SET EXCLUSIVE ON
**

DO WHILE .T.                        
MN=0
       SET COLOR TO W/B
       @ 06,02 CLEAR TO 20,78
       SET COLOR TO (W/B,W/R)
       @ 06,02 PROMPT " Banco de Dados 1 " 
       @ 07,02 PROMPT " Banco de Dados 2 " 
       wait
        MENU TO MN
        
        IF MN=1
                CLOSE ALL                                           
                USE dbCLI1 SHARED 
                USE dbCLI1 INDEX ntxEMP1 SHARED 
                               IF NETERR()
                                   SET COLOR TO R
                                   @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    

         ENDIF
         IF MN=2 
              CLOSE ALL
              USE dbCLI2 SHARED 
              USE dbCLI2 INDEX ntxEMP2 SHARED 
                               IF NETERR()
                                   SET COLOR TO R
                                   @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    

          ENDIF
          IF MN=0    
              RESTSCREEN(00,00,24,80,JLTELA)
              RETURN
    ENDIF


                                           lPESSOA   = SPACE(1)
                                           lCGC      = SPACE(18)
                                           lCPF      = SPACE(15)
                                          * UM         = 1
                                           OPCAO     = SPACE(1)
                                           ACAO      = SPACE(1)
                                           NEW=" " 
   
   SIT=SAVESCREEN(00,00,24,80)

   SET COLOR TO N+/B
   @ 04,01,21,78 BOX REPL(CHR(177),9)
   SET COLOR TO W+/R
   @ 23,01 SAY "                                      "
   @ 05,02 CLEAR TO 05,76
   TITULO="Consulta de Cadastro"
   COL1=INT((40)-LEN(TITULO)/2)-1
   @ 05,COL1 SAY TITULO
   SET COLOR TO W+/B
   @ 06,02 CLEAR TO 20,76

        DECLARE M3[reccount()],M4[reccount()]
        FOR I = 1 TO RECCOUNT() 
                M3[I]=EMP
                M4[I]=RECNO()
          SKIP
          tro_Ani(6,2)
          locaTE REST FOR PESSOA="F" 
            NEXT
                               IF NETERR()
                                   SET COLOR TO R
                                   @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    

          
   SET COLOR TO ,W/gR+
   RESP=ACHOICE(06,02,20,76,M3)
      IF RESP=0
         RESTSCREEN(00,00,24,80,SIT)
         RETURN
      ENDIF

   GOTO M4[RESP]

   RESTSCREEN(00,00,24,80,SIT)
   SET COLOR TO N/W
   @ 07,15 SAY EMP
   SET COLOR TO ,N/W
   AGNOME=EMP

*SET KEY -1 TO AGEXCACHOICE
**********


*JLTELASOL=SAVESCREEN(00,00,24,80)


* TELA

*   TELAEXC()


* GETS

   *AGNOME=SPACE(40)

@ 07,10 say AGNOME PICT "@!" 
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
    lPESSOA    = "F"
    lNOTAS     = NOTAS
    lNOTAS2    = NOTAS2
    lCOMENT    = COMENT
    lDNASC     = DNASC
    lDANALISE  = DANALISE
    lEMPTRAB   = EMPTRAB
    *

                                        SET COLOR TO (W/B,W/B)
                                                               @ 06,43 SAY "CLIENTE:"GET lemp PICT "@!S26"
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
                                                                @ 11,22 SAY "DEPTO:"GET lDEPT PICT "@!"
                                                                @ 11,52 SAY "DATA NASCIENTO:"GET lDNASC PICT "99/99/99"
                                                                @ 12,02 SAY "CPF.....:"GET lCPF PICT "@!"
                                                                @ 12,28 SAY "RG:"GET lRG PICT "@!"
                                                                @ 13,02 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                                                        IF lENDCB="O MESMO"
                                                                                       @ 14,02 SAY "ENDERECO DE COBRANCA/ENTREGA: E' O MESMO"
                                                                        ENDIF
                                                                        IF lENDCB#"O MESMO"
                                                                                        @ 14,02 SAY "ENDERECO DE COBRANCA/ENTREGA: DIFERENTE"
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
                                                                        DO CADEND
                                                                        *
                                                                                SET COLOR TO (W/B,W/B)
                                                                                IF lENDCB="O MESMO"
                                                                                        @ 14,02 SAY "ENDERECO DE COBRANCA/ENTREGA: E' O MESMO"
                                                                                ENDIF
                                                                                IF lENDCB#"O MESMO"
                                                                                        @ 14,02 SAY "ENDERECO DE COBRANCA/ENTREGA: DIFERENTE"
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
                                                        REPL VENDEDOR WITH lVENDEDOR
                                                        REPL DNASC WITH lDNASC
                                                        REPL DANALISE WITH lDANALISE
                                                        REPL EMPTRAB WITH lEMPTRAB
                                                        REPL RAMAL WITH lRAMAL
                                                        REPL COMENT WITH lCOMENT
                                                        REPL NOTAS WITH lNOTAS
                                                        REPL NOTAS2 WITH lNOTAS2
                                                        REPL PESSOA WITH lPESSOA

ENDIF
      USE
TELA2=SAVESCREEN(00,00,24,80)
*      DBRLOCK()
ENDDO

    

