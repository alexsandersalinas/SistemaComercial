* CADC5.PRG - CANSULTA DE VENDEDOR 
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
**

DO WHILE .T.                        
MN=0
CAMPO=SPACE(15)
       SET COLOR TO W/B
       @ 06,02 CLEAR TO 20,78
       SET COLOR TO (W/B,W/R)
       @ 06,02 SAY "VENDEDOR"GET CAMPO PICT"@!"
       read
       IF CAMPO=SPACE(15)
          RETURN
       ENDIF
       @ 07,02 PROMPT " Banco de Dados 1 " 
       @ 08,02 PROMPT " Banco de Dados 2 " 
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


                                           *lPESSOA   = SPACE(1)
                                           lCGC      = SPACE(18)
                                           lCPF      = SPACE(15)
                                          * UM         = 1
                                           OPCAO     = SPACE(1)
                                           ACAO      = SPACE(1)
                                           lEMP =SPACE(120)
                                           lPES    = "F"
                                           lPES2   = SPACE(1)


SIT=SAVESCREEN(00,00,24,80)
  SET COLOR TO N+/B
   @ 04,01,21,78 BOX REPL(CHR(177),9)
   SET COLOR TO W+/R
   @ 23,01 SAY "                                      "
   @ 05,02 CLEAR TO 05,76
   TITULO="Consulta de Cadastro"
   @ 05,02 SAY CAMPO
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
          LOCATE REST FOR VENDEDOR=CAMPO
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
                        
*@ 07,10 say AGNOME PICT "@!" 
   
 *   lCODIGO    = CODIGO
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
    lCCM        = CCM 
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
    lPESSOA    = "J"
    lNOTAS     = NOTAS
    lNOTAS2    = NOTAS2
    lCOMENT    = COMENT
    lDNASC     = DNASC
    lDANALISE  = DANALISE
    lEMPTRAB   = EMPTRAB
                        *
                         
                         SET COLOR TO (W/B,W/B)
                         @ 06,02 CLEAR TO 20,77
                                                                @ 07,02 SAY "NOME....:"
                                                                @ 07,12 SAY lemp PICT "@!S66"
                                                                @ 08,02 SAY "ENDERECO:" 
                                                                @ 08,12 SAY lend 
                                                                @ 09,02 SAY "BAIRRO..:"
                                                                @ 09,13 SAY lbairro PICT "@!S18"
                                                                @ 09,31 SAY "CIDADE.:"
                                                                @ 09,40 SAY lcidade PICT "@!S21"
                                                                @ 09,62 SAY "U.F.........:"
                                                                @ 09,76 SAY luf PICT "@!"
                                                                @ 10,02 SAY "CEP.....:"
                                                                @ 10,12 SAY lcep PICT "99999-999"
                                                                @ 10,22 SAY "DDD.:"
                                                                @ 10,28 SAY lddd PICT "9999"
                                                                @ 10,34 SAY "FAX.:"
                                                                @ 10,40 SAY lFAX PICT "9999-9999"
                                                                @ 10,50 SAY "TEL....:"
                                                                @ 10,59 SAY lTEL1 PICT "9999-9999"
                                                                *@ 10,68 SAY "/"
                                                                *@ 10,69 GET lTEL2 PICT "9999-9999"
                                                                @ 11,02 SAY "CONTATO.:"
                                                                @ 11,12 SAY lcontato PICT "@!S35"
                                                                @ 11,43 SAY "DEPT.:"
                                                                @ 11,50 SAY lDEPT PICT "@!S16"
                                                                @ 11,67 SAY "RAMAL:"
                                                                @ 11,74 SAY lRAMAL PICT "9999"
                                                                @ 12,02 SAY "E-MAIL..:"
                                                                @ 12,12 SAY lEMAIL PICT "@!s30"
                                                                IF lCGC=SPACE(18) .OR. lCPF#SPACE(18)
                                                                   @ 12,43 SAY "RG.:"+lRG
                                                                   @ 13,02 SAY "CPF.....:"+lCPF
                                                                ENDIF
                                                                IF lCGC#SPACE(18) .OR. lCPF=SPACE(18)
                                                                   @ 12,43 SAY "CNPJ.:"+lCGC
                                                                   @ 13,02 SAY "I.E.....:"+lIE
                                                                   @ 13,43 SAY "CCM...................:"+lccm 
                                                                ENDIF
                                                                @ 14,02 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                                                        IF lENDCB="O MESMO"
                                                                                        @ 15,02 SAY "ENDERECO DE COBRANCA/ENTREGA: E' O MESMO"
                                                                         ENDIF
                                                                         IF lENDCB#"O MESMO"
                                                                                        @ 15,02 SAY "ENDERECO DE COBRANCA/ENTREGA: DIFERENTE"
                                                                         ENDIF
                                                                @ 15,52 SAY "ANALISADO EM..:"
                                                                @ 15,68 SAY lDANALISE PICT "99/99/99"
                                                                @ 16,02 SAY "VENDEDOR(A):"
                                                                @ 16,15 SAY lVENDEDOR
                                                                @ 17,02 Say "OBS..:"
                                                                @ 17,09 SAY lCOMENT
                                                                @ 18,02 SAY lNOTAS
                                                                @ 19,02 SAY lNOTAS2
                                                                WAIT
                                                                TELA2=SAVESCREEN(00,00,24,80)
                         USE
ENDDO


