std     START 0
        EXTDEF char,nl,string,num

. Izpis znaka v A na stdout
char    WD #1
        RSUB

. Izpis <\n> na stdout
nl      +STL nll
        +STA nla

        LDCH #10
        +JSUB char

        +LDA nla
        +LDL nll
        RSUB

.
. Izpis null-terminated besedila iz pomnilnika na naslovu iz A
. Primer:
.   str     WORD C'Test'
.   null    WORD 0
.
string  +STX strx

        +STA strnas
        CLEAR X
strlp   +LDCH strnas,X
        COMP #0         . Preverimo \0 string terminator
        JEQ strlpe
        WD #1           . Izpis znaka
        TIX #0          . Povečanje odmika za 1B
        J strlp
strlpe  RSUB

. Izpis števila v A
num     +STL numl
        +STS nums
        +STX numx
        CLEAR X

        COMP #0         . Preverimo negativnost
        JLT numneg
        J numpoz
numneg  LDS #1          . Zastavica neg. št. za kasnejši izpis minusa
        +STS nummin
        MUL minena      . Pretvorimo neg. št v pozitivno
numpoz  COMP #10        . Če je samo še ena števka pojdi na izpis
        JLT numprt
        RMO A,S
        DIV #10         . Znebimo se enic
        MUL #10
        SUBR A,S        . V S dobimo zadnjo števko, prestavimo v A, shranimo in obnovimo A
        +STA numtmp
        RMO S,A
        +STCH numrez,X
        CLEAR A
        +LDCH numrez,X
        +LDA numtmp
        TIX #0          . Povečamo odmik za 1B
        DIV #10         . Št brez zadnje števke imamo v A
        J numpoz
numprt  RMO A,S         . Stanje: nummin == 1 -> negativno, vrhnja števka v S, ostale v obratnem vrstem redu WORD po WORD v numrez
                        . Stanje števcev: X bo števec vzvratnega sprehoda po števkah
        +LDA nummin
        COMP #0         . Če je št negativno zapišemo v numstr '-'
        JEQ numprts
        LDA #45
        +JSUB char
numprts RMO S,A         . Izpis največje števke, ki je ostala v A
        ADD #48
        +JSUB char
numprtl RMO X,A         . Odmik nazaj odštevamo po 1B, dokler ne pridemo do začetka
        SUB #1
        COMP #0
        JLT numend
        RMO A,X         . Izpis števke
        +LDCH numrez,X
        ADD #48
        +JSUB char
        J numprtl

numend  +LDX numx
        +LDS nums
        +LDL numl
        RSUB



nla     RESW 1
nll     RESW 1

strnas  RESW 1
strx    RESW 1

numl    RESW 1
nums    RESW 1
numx    RESW 1
numtmp  RESW 1
minena  WORD -1     . #-1 ne deluje
nummin  WORD 0      . Zastavica - negativno število
numrez  RESB 10     . Rezultatne števke

        END std
