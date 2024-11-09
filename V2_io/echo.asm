prog    START 0

        .LDA #65         . Testiranje char
        .JSUB char
        .JSUB nl

        .LDA #str        . Testiranje string
        .JSUB string
        .JSUB nl

        LDA numst        . Testiranje num
        JSUB num
        JSUB nl

halt    J halt

char    WD #1
        RSUB

nl      STA nla         . Shranimo A in L
        STL nll
        LDCH #10        . Izpišemo znak \n
        JSUB char
        LDA nla         . Obnovimo A in L
        LDL nll
        RSUB

string  RMO A,X         . Odmik je naslov niza
loop    LDCH prog,X
        COMP #0         . Premerimo če je naložen byte \0
        JEQ loope
        WD #1           . Izpis znaka
        RMO X,A         . Povečanje odmika (naslova) za 1B
        ADD #1
        RMO A,X
        J loop
loope   RSUB

num     STL numret
        COMP #0         . Preverimo negativnost
        JLT numneg
        J numpoz
numneg  RMO A,B         . Shranimo 1 v nummin za kasnejši izpis minusa
        CLEAR A
        ADD #1
        STA nummin
        RMO B,A
        MUL minena      . Pretvorimo negativno št v pozitivno
        CLEAR B
numpoz  COMP #10        . Če je samo še ena števka nehaj z deljenjem
        JLT nummprt
        RMO A,S
        DIV #10         . Št delimo z 10
        RMO A,T
        RMO S,A
        LDB #10         . Kvocient množimo z 10
        MULR B,T
        SUBR T,A        . Št odštejemo množen kvocient, dobimo zadnjo števko
        STA numrez,X    . Shranimo števko
        CLEAR A         . Povečamo števec za 3B (WORD)
        RMO X,A
        ADD #3
        RMO A,X
        RMO T,A         . Št brez zadnje cifre shranimo v A
        DIV #10
        J numpoz
nummprt RMO A,S         . Stanje: nummin == 1 -> negativno, vrhnja števka v S, ostale v obratnem vrstem redu WORD po WORD v numrez
                        . Stanje števcev: X bo števec vzvratnega sprehoda po števkah
        LDA nummin
        COMP #0         . Če je št negativno zapišemo v numstr '-'
        JEQ numprt
        LDA #45         . Izpišemo '-'
        JSUB char
numprt  RMO S,A         . Izpis prve števke
        ADD #48
        JSUB char
numprtl RMO X,A
        SUB #3
        COMP #0
        JLT numend
        RMO A,X
        LDA numrez,X
        ADD #48
        JSUB char
        J numprtl
numend  LDL numret
        RSUB



nla     RESW 1
nll     RESW 1
stra RESW 1

str     WORD C'Test'
null    WORD 0

minena  WORD -1
numst   WORD -28541
nummin  WORD 0
numrez  RESW 10
numret  RESW 1

        END prog