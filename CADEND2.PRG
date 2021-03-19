OP=SPACE(1)
        SET COLOR TO (W/N,W/N)
        @ 12,17 CLEAR TO 14,61
        SET COLOR TO (W/R,W/R)
        @ 11,16 CLEAR TO 13,60
        @ 11,16 TO 13,60 DOUBLE
        @ 12,17 SAY "ALTERA O ENDERECO DE COBRAN€A/ENTREGA S/N?"
        DO WHILE OP<>"S" .AND. OP<>"N"    
                 WAIT TO OP
        ENDDO
        IF OP="S"
               SET COLOR TO (W/R,W/R)
                @ 11,04 CLEAR TO 17,75
                @ 11,04 TO 17,75
                @ 12,05 SAY "ENDERECO DE COBRAN€A/ENTREGA E' O MESMO? S/N:"GET OPCAO PICT "!"

                                        SET COLOR TO (W/R,W/R)
                                        @ 13,05 SAY "COBRAN€A:"
                                          IF endCB=END
                                             @ 13,15 SAY "O MESMO"
                                             @ 13,36 SAY "BAIRRO:"
                                              @ 13,60 SAY "CID.:"
                                              @ 14,05 SAY "UF:"
                                              @ 14,12 SAY "CEP:"
                                              @ 14,29 SAY "DDD:"
                                              @ 14,40 SAY "FONE:"
                                              @ 15,05 SAY "ENTREGA: O MESMO"
                                              @ 15,36 SAY "BAIRRO:"
                                              @ 15,60 SAY "CID.:"
                                              @ 16,05 SAY "UF:"
                                              @ 16,12 SAY "CEP:"
                                              @ 16,29 SAY "DDD.:"
                                              @ 16,40 SAY "FONE:"
                                           ENDIF
                                           IF endCB#END
                                                @ 13,15 SAY endcb PICT "@!S20"
                                           @ 13,36 SAY "BAIRRO:"
                                                @ 13,44 SAY bairrocb PICT "@!s15"
                                           @ 13,60 SAY "CID.:"
                                                @ 13,66 SAY cidadecb PICT "@!s09"
                                           @ 14,05 SAY "UF:"
                                                @ 14,09 SAY ufcb PICT "@!"
                                           @ 14,12 SAY "CEP:"
                                                @ 14,17 SAY cepcb PICT "99999-999"
                                           @ 14,29 SAY "DDD:"
                                                @ 14,34 SAY dddCB PICT "9999"
                                                *@ 18,34 SAY "FAX:"+lFAXCB PICT "9999-9999"
                                           @ 14,40 SAY "FONE:"
                                                @ 14,46 SAY TEL1CB PICT "9999-9999"
                                           @ 15,05 SAY "ENTREGA:"
                                                @ 15,15 SAY endEN PICT "@!S20"
                                           @ 15,36 SAY "BAIRRO:"
                                                @ 15,44 SAY bairroen PICT "@!s15"
                                           @ 15,60 SAY "CID.:"
                                                @ 15,66 SAY cidadeen PICT "@!s09"
                                           @ 16,05 SAY "UF:"
                                                @ 16,09 SAY ufen PICT "@!"
                                           @ 16,12 SAY "CEP:"
                                                @ 16,17 SAY cepen PICT "99999-999"
                                           @ 16,29 SAY "DDD.:"
                                                @ 16,35 SAY dddEN PICT "9999"
                                                *@ 21,34 SAY "FAX:"+lFAXEN PICT "9999-9999"
                                           @ 16,40 SAY "FONE:"
                                                @ 16,46 SAY TEL1EN PICT "9999-9999"
                                        ENDIF
                
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
    ENDIF
    
    IF OP="N"
                        RESTSCREEN(00,00,24,80,TELA2)
    ENDIF



