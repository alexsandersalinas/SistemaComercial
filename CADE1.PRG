************* CADE1.PRG - ARQUIVO DE EXCLUSAO PELO CGC /CPF
* EXCLUSAO * dbCLI1.DFB / dbCLI2.DBF      
* AUTOR: ALEXSANDER SALINAS SANTOS - SALINAS@STARMEDIA.COM
 *DATA: 16/11/1999
*************            

SET DATE BRITISH
SET CONSOLE OFF
SET CENTURY ON
SET EXCLUSIVE ON

DO WHILE .T.

**** CONFIRGARACAO DE TELA **
                        SET COLOR TO W/R,W/R
                        @ 05,02 CLEAR TO 05,77
                        SET COLOR TO W/R
                        @ 05,02 SAY "EXCLUSÇO"
                        SET COLOR TO (W/B,W/B)
                        @ 06,02 CLEAR TO 20,77
                        SET COLOR TO (W/B,W/B)
**** FIM

SELE 2 
USE dbCLI1 EXCLUSIVE
BANCO1      =RECCOUNT()
SELE 1
USE dbCLI2 EXCLUSIVE
BANCO2      =RECCOUNT()


                                           CONTA      =(BANCO1+BANCO2)
                                           lPESSOA   = SPACE(1)
                                           lCGC      = SPACE(18)
                                           lCPF      = SPACE(18)
                                            UM         = 1
                                           OPCAO     = SPACE(1)
                                           ACAO      = SPACE(1)
                                           variavelACAO2=SPACE(1)

   ***NUMERO DE REGISTROS**                                
          SET COLOR TO N+/B
          @ 21,01,21,78 BOX REPL(CHR(177),9)
           SET COLOR TO (W/R,W/R)
           @ 23,61 SAY "Registros"
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
          SET COLOR TO N+/B
          @ 21,01,21,78 BOX REPL(CHR(177),9)
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
                  USE dbCLI1 INDEX ntxCGC1 EXCLUSIVE
                  seek lCGC
                  IF FOUND()
                     variavelCHECK=1
                  ENDIF
                  IF .NOT. FOUND()
                       SELE 1
                                USE dbCLI2 INDEX ntxCGC2 EXCLUSIVE
                                seek lCGC
                                IF FOUND()
                                        variavelCHECK=2
                                ENDIF
                                IF .NOT. FOUND()
                                        SET COLOR TO (W/R,W/R)
                                        @ 23,01 SAY " CNPJ NÇO EXISTE!        "
                                        LOOP
                                ENDIF
                   endif

************* FIM DA PESQUISA

    ** VARIAVEIS DO BANCO DE DADOS
        ***    FINAL
                     SET COLOR TO (W/B,W/B
                                                                @ 07,02 SAY "EMPRESA.:"+emp PICT "@!S43"
                                                                @ 08,02 SAY "ENDERECO:"+end 
                                                                @ 09,02 SAY "BAIRRO..:"+bairro 
                                                                @ 09,31 SAY "CIDADE.:"+cidade PICT "@!S21"
                                                                @ 09,62 SAY "U.F.........:"+uf
                                                                @ 10,02 SAY "CEP.....:"+cep 
                                                                @ 10,22 SAY "DDD.:"+ddd PICT "9999"
                                                                @ 10,34 SAY "FAX.:"+FAX PICT "9999-9999"
                                                                @ 10,50 SAY "TEL....:"+TEL1 PICT "9999-9999"
                                                                @ 10,68 SAY "/"
                                                                @ 10,69 SAY TEL2 PICT "9999-9999"
                                                                @ 11,02 SAY "CONTATO.:"+contato PICT "@!S35"
                                                                @ 11,43 SAY "DEPT.:"+DEPT PICT "@!S16"
                                                                @ 11,67 SAY "RAMAL:"+RAMAL PICT "9999"
                                                                @ 12,02 SAY "E-MAIL..:"+EMAIL PICT "@!s30"
                                                                @ 12,43 SAY "CNPJ...........:"
                                                                @ 12,60 SAY lcgc PICT "99.999.999/9999-99"
                                                                @ 13,02 SAY "IE......:"+ie PICT "@!"
                                                                @ 13,43 SAY "CCM...................:"+ccm PICT "9.999.999-9"
                                                                @ 14,02 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                                                        IF ENDCB="O MESMO"
                                                                                        @ 15,02 SAY "ENDERECO DE COBRANCA/ENTREGA: E' O MESMO"
                                                                         ENDIF
                                                                         IF ENDCB#"O MESMO"
                                                                                        @ 15,02 SAY "ENDERECO DE COBRANCA/ENTREGA: DIFERENTE"
                                                                         ENDIF
                                                                @ 15,52 SAY "ANALISADO EM..:"
                                                                @ 15,68 SAY DANALISE PICT "99/99/99"
                                                                @ 16,02 SAY "VENDEDOR(A):"
                                                                @ 16,15 SAY VENDEDOR
                                                                @ 17,02 Say "OBS..:"
                                                                @ 17,09 SAY COMENT
                                                                @ 18,02 SAY NOTAS
                                                                @ 19,02 SAY NOTAS2
                                                                READ
******************* 1§ PAUSA
                        SET COLOR TO (W/N,W/N)
                                @ 19,17 CLEAR TO 21,61
                                SET COLOR TO (W/R,W/R)
                                @ 18,16 CLEAR TO 20,60
                                @ 18,16 TO 20,60 DOUBLE
                                @ 19,17 SAY "         Confirma ExclusÆo S/N ?   "
                                
                                DO WHILE variavelACAO2<>"S" .AND. variavelACAO2<>"N"    
                                        WAIT TO variavelACAO2
                                ENDDO
                                         IF variavelACAO2="S"                                                
                                                SET COLOR TO W/R
                                                @ 19,17 SAY "           Excluindo Dados ...."
                                                tro_Ani(19,48)
                                                if variavelCHECK=1
                                                               SELE 2
                                                        ENDIF
                                                        IF variavelCHECK#1
                                                               SELE 1
                                                        ENDIF
                                                        RLOCK()
                                                                          DELETE
                                                              PACK
                                               ENDIF
                                                        
                              USE
CASE MN=2
   *************************************                                
   * PESSOA FISICA                    **
   *************************************
                                
                        lPESSOA="F"
                        SET COLOR TO N+/B
                        @ 21,01,21,78 BOX REPL(CHR(177),9)
                          SET COLOR TO W/B,W/B    
                          @ 15,03 CLEAR TO 19,76
                          @ 06,02 SAY "CPF:"GET lCPF PICT "@!"
                          SET COLOR TO  W/R
                          @ 23,01 SAY "Para sair TECLE<ENTER>                        "
                          READ
                                IF lCPF=SPACE(15)
                                   RETURN
                                ENDIF
                               lNCLIEN=lCPF
*----------> pesquisa no banco de dados
                             
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
                               
*---VARIAVEIS DO BANCO DE DADOS
                *****FIM 
                          SET COLOR TO (W/B,W/B)
                                                               @ 06,23 SAY "CLIENTE:"+emp PICT "@!S26"
                                                                @ 07,02 SAY "ENDERECO:"+end PICT "@!S30"
                                                                @ 07,43 SAY "BAIRRO.:"+bairro PICT "@!S26"
                                                                @ 08,02 SAY "CIDADE..:"+cidade PICT "@!"
                                                                @ 08,43 SAY "U.F....:"+uf PICT "@!"
                                                                @ 08,56 SAY "CEP........:"+cep 
                                                                @ 09,02 SAY "DDD.....:"+ddd 
                                                                @ 09,17 SAY "FONE RES......:"+TEL1 
                                                                @ 09,43 SAY "E-MAIL.:"+EMAIL PICT "@!S26"
                                                                @ 10,02 SAY "EMP.....:"+EMPTRAB PICT "@!S30"
                                                                @ 10,43 SAY "FONE COM.:"+TEL2 
                                                                @ 10,64 SAY "RAMAL...:"+RAMAL 
                                                                @ 11,02 SAY "FAX.....:"+FAX 
                                                                @ 11,22 SAY "DEPTO:"+DEPT PICT "@!S21"
                                                                @ 11,51 SAY "DATA NASCIMENTO:"
                                                                @ 11,68 say DNASC 
                                                                @ 12,02 SAY "CPF.....:"
                                                                @ 12,12 SAY lCPF 
                                                                @ 12,28 SAY "RG:"+RG PICT "@!"
                                                                @ 13,02 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
                                                                        IF ENDCB="O MESMO"
                                                                                       @ 14,02 SAY "ENDERECO DE COBRANCA/ENTREGA: E' O MESMO"
                                                                        ENDIF
                                                                        IF ENDCB#"O MESMO"
                                                                                        @ 14,02 SAY "ENDERECO DE COBRANCA/ENTREGA: DIFERENTE"
                                                                       ENDIF
                                                                @ 14,52 SAY "ANALISADO EM..:"
                                                                @ 14,68 SAY DANALISE
                                                                @ 15,02 SAY "VENDEDOR(A):"
                                                                @ 15,15 SAY VENDEDOR
                                                                @ 16,02 Say "OBS..:" 
                                                                @ 16,09 SAY COMENT
                                                                @ 17,02 SAY NOTAS
                                                                @ 18,02 SAY NOTAS2
                                                             READ
******************* 1§ PAUSA
                        SET COLOR TO (W/N,W/N)
                                @ 19,17 CLEAR TO 21,61
                                SET COLOR TO (W/R,W/R)
                                @ 18,16 CLEAR TO 20,60
                                @ 18,16 TO 20,60 DOUBLE
                                @ 19,17 SAY "            Confirma exclusÆo S/N "
                                
                                DO WHILE variavelACAO2<>"S" .AND. variavelACAO2<>"N"    
                                        WAIT TO variavelACAO2
                                ENDDO
                                         IF variavelACAO2="S"                                                
                                                SET COLOR TO W/R
                                                @ 19,17 SAY "                  Excluindo dados  ...  "
                                                tro_Ani(19,56)
                                                        rlock()
                                                        if variavelCHECK=1
                                                                SELE 2
                                                        ENDIF
                                                        IF variavelCHECK#1
                                                                SELE 1
                                                        ENDIF
                                                            DELETE
                                                                pack
                                                 ENDIF
                                                       USE
CASE MN=0    
              RESTSCREEN(00,00,24,80,JLTELA)
              RETURN
ENDCASE
ENDDO

