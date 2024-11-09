main    START 0

        +LDA #scrcols
        +LDA #scrrows
        +LDA #scrlen
        CLEAR A

        . Napiši 'a' v 2. vrstico 3. stolpec
        LDA #2
        STA row
        LDA #3
        STA col
        LDCH #97
        JSUB prntch

        . Izpiši 'b' čez cel naslov
        LDCH #98
        JSUB fill

        . Pobriši zaslon
        LDCH #0
        JSUB fill

halt    J halt

fill    +STCH screen,X
        TIX #scrlen
        JLT fill
        JEQ fill
        CLEAR X
        RSUB

prntch  +STX prntx
        +STS prnts
        RMO A,S
        +LDA row
        +MUL #scrcols
        +ADD col
        RMO A,X
        RMO S,A
        +STCH screen,X
        +LDX prntx
        +LDS prnts
        RSUB



scrcols EQU 80
scrrows EQU 25
scrlen  EQU scrcols*scrrows

row     RESW 1
col     RESW 1
prntx   RESW 1
prnts   RESW 1

        ORG 0xb800
screen  RESB scrlen

        END main
