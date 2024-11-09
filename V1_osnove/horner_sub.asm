prog    START 0
        CLEAR X
inloop  LDS in,X

        JSUB horner

        .Naslednja točka polinoma
        LDA #3
        ADDR A,X
        LDA #inlen
        COMPR X,A
        JLT inloop

halt    J halt


horner  STX savex
        CLEAR X

        .a_n
        LDT cf,X

        .Naslednji koeficient
hloop   LDA #3
        ADDR A,X
        LDA #cflen
        COMPR X,A
        JEQ hend

        MULR S,T
        LDA cf,X
        ADDR A,T
        J hloop

hend    LDX savex
        STT in,X
        RSUB



savex   RESW 1

cf      WORD 1
        WORD 2
        WORD 3
        WORD 4
        WORD 5
cflast  EQU *
cflen   EQU cflast-cf

in      WORD 0
        WORD 5
        WORD 42
inlast  EQU *
inlen   EQU inlast-in

        END prog