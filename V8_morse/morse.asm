main    START 0

        . Sklad
        EXTREF sinit,spop,spush,sp
        +JSUB sinit

        TD in
        TD out

mainl   RD in
        COMP #0
        JEQ halt
        COMP #13
        JEQ mainl
        COMP #10
        JEQ prtlf

        JSUB getch
        JSUB prtch

        WD out
        J mainl

prtlf   CLEAR A
        LDA #10
        WD out
        J mainl

halt    J halt

getch   +STL @sp
        +JSUB spush
        +STS @sp
        +JSUB spush

        RMO A,S
checkc  LDCH a
        COMPR A,S
        JEQ isa

        LDCH b
        COMPR A,S
        JEQ isb

        LDCH c
        COMPR A,S
        JEQ isc

        LDCH d
        COMPR A,S
        JEQ isd

        LDCH e
        COMPR A,S
        JEQ ise

        LDCH f
        COMPR A,S
        JEQ isf

        LDCH g
        COMPR A,S
        JEQ isg

        LDCH h
        COMPR A,S
        JEQ ish

        LDCH i
        COMPR A,S
        JEQ isi

        LDCH j
        COMPR A,S
        JEQ isj

        LDCH k
        COMPR A,S
        JEQ isk

        LDCH l
        COMPR A,S
        JEQ isl

        LDCH m
        COMPR A,S
        JEQ ism

        LDCH n
        COMPR A,S
        JEQ isn

        LDCH o
        COMPR A,S
        JEQ iso

        LDCH p
        COMPR A,S
        JEQ isp

        LDCH q
        COMPR A,S
        JEQ isq

        LDCH r
        COMPR A,S
        JEQ isr

        LDCH s
        COMPR A,S
        JEQ iss

        LDCH t
        COMPR A,S
        JEQ ist

        LDCH u
        COMPR A,S
        JEQ isu

        LDCH v
        COMPR A,S
        JEQ isv

        LDCH w
        COMPR A,S
        JEQ isw

        LDCH x
        COMPR A,S
        JEQ isx

        LDCH y
        COMPR A,S
        JEQ isy

        LDCH z
        COMPR A,S
        JEQ isz

isa     LDA #a
        J printe
isb     LDA #b
        J printe
isc     LDA #c
        J printe
isd     LDA #d
        J printe
ise     LDA #e
        J printe
isf     LDA #f
        J printe
isg     LDA #g
        J printe
ish     LDA #h
        J printe
isi     LDA #i
        J printe
isj     LDA #j
        J printe
isk     LDA #k
        J printe
isl     LDA #l
        J printe
ism     LDA #m
        J printe
isn     LDA #n
        J printe
iso     LDA #o
        J printe
isp     LDA #p
        J printe
isq     LDA #q
        J printe
isr     LDA #r
        J printe
iss     LDA #s
        J printe
ist     LDA #t
        J printe
isu     LDA #u
        J printe
isv     LDA #v
        J printe
isw     LDA #w
        J printe
isx     LDA #x
        J printe
isy     LDA #y
        J printe
isz     LDA #z
        J printe


printe  +JSUB spop
        +LDS @sp
        +JSUB spop
        +LDL @sp
        RSUB


prtch   +STL @sp
        +JSUB spush
        +STX @sp
        +JSUB spush

        STA currch

prtl    LDA currch
        ADD #1
        STA currch
        CLEAR A

        +LDCH @currch
        COMP #32
        JEQ printe
        WD out
        TIX #0
        J prtl

prtche  +JSUB spop
        +LDX @sp
        +JSUB spop
        +LDL @sp
        RSUB



in      WORD X'A1'
out     WORD X'A0'

currch  RESW 1
a       BYTE C'a·- '
b       BYTE C'b-··· '
c       BYTE C'c-·-· '
d       BYTE C'd-·· '
e       BYTE C'e· '
f       BYTE C'f··-· '
g       BYTE C'g--· '
h       BYTE C'h···· '
i       BYTE C'i·· '
j       BYTE C'j·--- '
k       BYTE C'k-·- '
l       BYTE C'l·-·· '
m       BYTE C'm-- '
n       BYTE C'n-· '
o       BYTE C'o--- '
p       BYTE C'p·--· '
q       BYTE C'q--·- '
r       BYTE C'r·-· '
s       BYTE C's··· '
t       BYTE C't- '
u       BYTE C'u··- '
v       BYTE C'v···- '
w       BYTE C'w·-- '
x       BYTE C'x-··- '
y       BYTE C'y-·-- '
z       BYTE C'z--·· '

        END main
