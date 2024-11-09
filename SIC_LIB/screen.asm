screen  START 0
        EXTDEF fill,prntch,row,col

. Po celem zaslonu izpiše znak iz A
fill    +STCH scr,X
        TIX #scrlen
        JLT fill
        JEQ fill
        CLEAR X
        RSUB

. Izpis znaka iz A na <row>:<col> mesto zaslona
prntch  +STX prntx
        +STS prnts
        RMO A,S
        +LDA row
        +MUL #scrcols
        +ADD col
        RMO A,X
        RMO S,A
        +STCH scr,X
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
scr     RESB scrlen

        END screen
