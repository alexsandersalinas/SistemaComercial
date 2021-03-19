* CADC2.PRG - CANSULTA DE PESSOA FISICA 
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

   SIT=SAVESCREEN(00,00,24,80)

   SET COLOR TO N+/B
   @ 04,01,21,78 BOX REPL(CHR(177),9)
   SET COLOR TO W+/R
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
    lPESSOA    = PESSOA
    lNOTAS     = NOTAS
    lNOTAS2    = NOTAS2
    lCOMENT    = COMENT
    lDNASC     = DNASC
    lDANALISE  = DANALISE
    lEMPTRAB   = EMPTRAB
                        *
                         
                         SET COLOR TO (W/B,W/B)
                         @ 06,02 CLEAR TO 20,77
                                                                @ 06,02 SAY "CLIENTE.:"
                                                                @ 06,12 SAY lemp PICT "@!S66"
                                                                @ 07,02 SAY "ENDERE€O:"
                                                                @ 07,12 SAY lend PICT "@!S30"
                                                                @ 07,43 SAY "BAIRRO.:"
                                                                @ 07,52 SAY lbairro PICT "@!S26"
                                                                @ 08,02 SAY "CIDADE..:"
                                                                @ 08,12 SAY  lcidade PICT "@!"
                                                                @ 08,43 SAY "U.F....:"
                                                                @ 08,52 SAY luf PICT "@!"
                                                                @ 08,56 SAY "CEP........:"
                                                                @ 08,69 SAY lcep PICT "99999-999"
                                                                @ 09,02 SAY "DDD.....:"
                                                                @ 09,12 SAY lddd PICT "9999"
                                                                @ 09,17 SAY "FONE RES......:"
                                                                @ 09,33 SAY lTEL1 PICT "9999-9999"
                                                                @ 09,43 SAY "E-MAIL.:"
                                                                @ 09,52 SAY lEMAIL PICT "@!S26"
                                                                @ 10,02 SAY "EMP.....:"
                                                                @ 10,12 SAY lEMPTRAB PICT "@!S30"
                                                                @ 10,43 SAY "FONE COM.:"
                                                                @ 10,54 SAY lTEL2 PICT "9999-9999"
                                                                @ 10,64 SAY "RAMAL...:"
                                                                @ 10,74 SAY lRAMAL PICT "9999"
                                                                @ 11,02 SAY "FAX.....:"
                                                                @ 11,12 SAY lFAX PICT "9999-9999"
                                                                @ 11,22 SAY "DEPTO:"
                                                                @ 11,29 SAY lDEPT PICT "@!"
                                                                @ 11,52 SAY "DATA NASCIENTO:"
                                                                @ 11,68 SAY lDNASC PICT "99/99/99"
                                                                @ 12,02 SAY "CPF.....:"
                                                                @ 12,12 SAY lCPF 
                                                                @ 12,28 SAY "RG:"
                                                                @ 12,32 SAY lRG PICT "@!"
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
                                                                WAIT
                                                                TELA2=SAVESCREEN(00,00,24,80)
                         USE
    ENDDO

