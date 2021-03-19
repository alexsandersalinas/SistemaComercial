DO WHILE .T.

USE SP_CLIEN SHARED
USE SP_CLIEN INDEX SPPES
ll = SELECT

                        LOCATE REST FOR PESSOA="J" .OR. PESSOA=" "
              NEXT
              REPL SELECT WITH LL


ENDDO

              
