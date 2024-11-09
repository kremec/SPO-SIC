main    START 0

        . Sklad
        EXTREF sinit,spop,spush,sp
        +JSUB sinit

        . Std
        EXTREF char,nl,string

loop    LDCH ciph,X
        SUB #97
        RMO A,S
        LDCH key,X
        SUB #97
        ADDR S,A

        COMP #26
        JLT print
        SUB #26

print   ADD #97
        +JSUB char

        TIX ciphl
        JEQ loope

        J loop

loope   +JSUB nl
halt    J halt



in      WORD C'CI'
ciph    BYTE C'hello'
ciphe   EQU *
ciphl   EQU ciphe-ciph
key     BYTE C'keyke'
out     RESB 10

        END main
