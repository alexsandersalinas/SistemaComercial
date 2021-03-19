* NOTP1V.PRG * VARIVEIS DO PROGRAMA NOTP1.PRG
* AUTOR: ALEXSANDER SALINAS - salinas@querove.com.br
* DATA: 04/05/2000

* VARIAVEIS DE NOTA    
   
   lNTNUM       :=0
   lPESSOA      := SPACE(1)
   lCPF         :=SPACE(15)
   ACAO         :=SPACE(1)
   ACAO2        :=SPACE(1)
   ACAO3        :=SPACE(1)
   ACAO5        :=SPACE(1)
   ACAO4        :=SPACE(1)
   OPCAO6       :=SPACE(1)
   LINHA        :=1
   checkCLIENTE :=SPACE(18)
   checkCLIEOK  :=SPACE(3)
   checkval     :=0
   pesquisaERRO :=0
   EJETADOR     :=0
   varreg       :=0
*
        
        SELE 4
        USE dbCLI1 SHARED 
        SELE 3
        USE dbCLI2 SHARED
        SELE 2
        USE dbNOT2 SHARED
                REG2=RECCOUNT()
        SELE 1
        USE dbNOT1 SHARED
                REG1=RECCOUNT()
