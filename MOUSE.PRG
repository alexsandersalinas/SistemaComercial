#include "Gra.ch" 

procedure MAIN

        LOCAL cvar1 := "Ola "

        LOCAL cvar2 := "Mundo...!"

        SET COLOR TO N/W,W+/B 

        SET CURSOR ON

       SETMOUSE(.T.) 

CLS

        GraBox(NIL,{72,176},{200,256},GRA_FILL,30,30) 
        
@ 10,10 say "Ola..."GET cvar1
@ 12,10 say "Mundo."GET cvar2
READ
    ? cvar1, cvar2
    
RETURN

    
