* CADC2.PRG - CANSULTA PELO NUMERO DE SERIE
* AUTOR: ALEXSANDER SALINAS SANTOS -SALINAS@STARMEDIA.COM
* DATA: 16/11/1999
* ALTERADO: 12/01/2001
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
SET COLOR TO W
@ 02,00 CLEAR TO 24,80
pesquisaERRO=0
MN=0
                CLOSE ALL                                           
                USE dbRT SHARED 
                USE dbRT INDEX ntxRT2 SHARED 
                               IF NETERR()
                                   SET COLOR TO R
                                   @ 04,00 SAY "ERRO NAO ORGANIZA€ÇO DE DADOS!!!"
                               ENDIF    


   
   SIT=SAVESCREEN(00,00,24,80)

   SET COLOR TO N+/B
   @ 04,01,21,78 BOX REPL(CHR(177),9)
   SET COLOR TO W+/R
   @ 05,02 CLEAR TO 05,76
   TITULO="Consulta de Aparelho pelo N/S"
   COL1=INT((40)-LEN(TITULO)/2)-1
   @ 05,COL1 SAY TITULO
   SET COLOR TO W+/B
   @ 06,02 CLEAR TO 20,76

        DECLARE M3[reccount()],M4[reccount()]
        FOR I = 1 TO RECCOUNT() 
                M3[I]=NS
                M4[I]=RECNO()
          SKIP
          tro_Ani(6,2)
          *locaTE REST FOR PESSOA="J" .OR. PESSOA=" "
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
   @ 07,15 SAY NS
   SET COLOR TO ,N/W
   AGNOME=NS

*SET KEY -1 TO AGEXCACHOICE
**********


*JLTELASOL=SAVESCREEN(00,00,24,80)


* TELA

*   TELAEXC()


* GETS

   *AGNOME=SPACE(40)

   @ 07,10 say AGNOME PICT "@!" 
                
                
                lRTNUM  = RTNUM
                lENTRADA = ENTRADA
                lSAIDA   = SAIDA
                lPRONTO  = SAIDA
                lAP      = AP
                lMODELO  = MODELO       
                lNS      = NS
                lMARCA   = MARCA
                lACESS   = ACESS
                lDEF     = DEFEITO
                lOBS     = OBS
                lVISITA  = VISITA
                lMOBRA   = MOBRA
                lDIAS    =  0
                lPRIORIDADE = PRIORIDADE
                lNCLIEN = ID
                lSTOTAL  = STOTAL
                lTOTAL   = TOTAL
        
checkCLIENTE=lNCLIEN
PESQUISA=SAVESCREEN(00,00,24,80)
SET COLOR TO W
@ 02,00 CLEAR TO 24,80
DO RTC1         

IF pesquisaERRO=1
   LOOP
ENDIF
IF pesquisaERRO#1

************** CAMPOS DE DATAS
   SET COLOR TO (W/N,W/N)
   @ 02,00 SAY "OS N§:"
   @ 02,07 SAY lRTNUM PICT "9999"
   @ 06,00 SAY "ENTRADA...............:"
   @ 06,28 SAY lentrada PICT "99/99/9999"
   @ 07,00 SAY "APARELHO..............:"
   @ 07,28 SAY lAP PICT "@!" 
   @ 08,00 SAY "MODELO................:"
   @ 08,28 SAY lMODELO PICT "@!"
   @ 09,00 SAY "N/S...................:"
   @ 09,28 SAY lNS PICT "@!" 
   @ 10,00 SAY "MARCA.................:"
   @ 10,28 SAY lMARCA PICT "@!"
   @ 11,00 SAY "ACESSORIOS............:"
   @ 11,28 SAY lACESS PICT "@!"
   @ 12,00 SAY "DEFEITO RECLAMADO.....:"
   @ 12,28 SAY lDEF PICT "@!"
   @ 13,00 SAY "OBS...................:"
   @ 13,28 SAY lOBS PICT "@!"
   @ 14,00 SAY "TAXA DE VISITA........:"
   @ 14,28 SAY lVISITA PICT "999,999,999.99"
   @ 15,00 SAY "MAO DE OBRA...........:"
   @ 15,28 SAY lMOBRA PICT "999,999,999.99"
   @ 16,00 SAY "PRIORIDADE............:"
   @ 16,28 SAY lPRIORIDADE PICT "99/99/9999"
   @ 17,00 SAY "PRONTO................:"
   @ 17,25 SAY lPRONTO PICT "99/99/9999"
   @ 18,00 SAY "SAIDA.................:"
   @ 18,25 SAY lSAIDA PICT "99/99/9999"
   @ 19,00 SAY "TOTAL DO SERVI€O......:"
   @ 19,25 SAY lTOTAL PICT "999,999,999.99"

        WAIT
        TELA2=SAVESCREEN(00,00,24,80)
                         USE

                         ENDIF

ENDDO


