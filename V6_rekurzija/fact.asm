main    START 0

        . Sklad
        EXTREF sinit,spop,spush,sp
        +JSUB sinit

        . Std
        EXTREF char,nl,string,num

mainl   +JSUB rdnum     . Branje števila iz datoteke FA

        COMP #0         . Ko pridemo do ničle zaključimo
        JEQ maine

        +JSUB fact      . Izračunamo fakulteto števila

        +JSUB num       . Izpišemo število na stdout
        +JSUB nl

        J mainl

maine   ADD #48
        +JSUB char
        +JSUB nl
halt    J halt

rdnum   +STL @sp
        +JSUB spush
        +STS @sp
        +JSUB spush
        +STT @sp
        +JSUB spush

        LDT #10
rdlp    CLEAR A         . Beremo
        TD in
        RD in
        COMP #0xD       . CR -> konec vrstice
        JEQ numrd

        SUB #48
        MULR T,S
        ADDR A,S

        J rdlp
numrd   RD in           . Preberemo še LF
        RMO S,A

        +JSUB spop
        +LDT @sp
        +JSUB spop
        +LDS @sp
        +JSUB spop
        +LDL @sp
        RSUB

fact    +STL @sp
        +JSUB spush
        +STS @sp
        +JSUB spush

        LDS #1
        JSUB frec

        +JSUB spop
        +LDS @sp
        +JSUB spop
        +LDL @sp
        RSUB

frec    +STL @sp
        +JSUB spush

        COMP #1         . Če smo prišli do 1 lahko nehamo z množenjem
        JEQ frece

        MULR A,S        . Sicer S = S*A, A-- in ponovimo
        SUB #1
        JSUB frec

frece   RMO S,A         . Rezultat vrnemo v A
        +JSUB spop
        +LDL @sp
        RSUB



in      WORD X'FA'

        END main
