SET COLOR TO (W/R,W/R)
@ 11,04 CLEAR TO 17,75
@ 11,04 TO 17,75
@ 12,05 SAY "ENDERECO DE COBRAN€A/ENTREGA E' O MESMO? S/N:"GET OPCAO PICT "!"
READ
        DO WHILE OPCAO<>"S" .and. OPCAO<>"N"
                WAIT TO OPCAO
        ENDDO

        IF OPCAO="S"
                        @ 12,50 SAY "SIM" 
                        lENDCB="O MESMO"
                        lENDEN="O MESMO"
                        lCIDADECB="O MESMO"                                                          
                        lCIDADEEN="O MESMO"
                        lDDDCB=lDDD                                                                  
                        lDDDEN=lDDD             
                        lFAXCB=lFAX                                                                  
                        lFAXEN=lFAX
                        lTEL1CB=lTEL1                                                                
                        lTEL1EN=lTEL1
         ENDIF 

        IF OPCAO="N"    
                        @ 12,50 SAY "NAO" 
                        SET COLOR TO (W/R,W/R)
                        @ 13,05 SAY "COBRAN€A:"GET lendcb PICT "@!S20"
                        @ 13,36 SAY "BAIRRO:"GET lbairrocb PICT "@!s15"
                        @ 13,60 SAY "CID.:"GET lcidadecb PICT "@!s09"
                        @ 14,05 SAY "UF:"GET lufcb PICT "@!"
                        @ 14,12 SAY "CEP:"GET lcepcb PICT "99999-999"
                        @ 14,29 SAY "DDD:"GET ldddCB PICT "9999"
                        *@ 18,34 SAY "FAX:"GET lFAXCB PICT "9999-9999"
                        @ 14,40 SAY "FONE:"GET lTEL1CB PICT "9999-9999"
                        @ 15,05 SAY "ENTREGA:"GET lendEN PICT "@!S20"
                        @ 15,36 SAY "BAIRRO:"GET lbairroen PICT "@!s15"
                        @ 15,60 SAY "CID.:"GET lcidadeen PICT "@!s09"
                        @ 16,05 SAY "UF:"GET lufen PICT "@!"
                        @ 16,12 SAY "CEP:"GET lcepen PICT "99999-999"
                        @ 16,29 SAY "DDD.:"GET ldddEN PICT "9999"
                        *@ 21,34 SAY "FAX:"GET lFAXEN PICT "9999-9999"
                        @ 16,40 SAY "FONE:"GET lTEL1EN PICT "9999-9999"
                        READ
        *lDATAHIST=lPCONT
                ENDIF

RESTSCREEN(00,00,24,80,TELA2)

