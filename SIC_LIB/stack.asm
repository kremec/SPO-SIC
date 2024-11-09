stack   START 0
        EXTDEF sinit,spush,spop,sp

. Nastavi sp na začetek sklada
sinit   STA stka      . Shranimo A

        LDA #stk      . sp nastavimo na začetek sklada
        STA sp

        LDA stka      . Obnovimo A
        RSUB

. Poveča sp za eno besedo
spush   STA stka      . Shranimo A
        LDA sp          . Povečamo sp
        ADD #3
        STA sp
        LDA stka      . Obnovimo A
        RSUB

. Zmanjša sp za eno besedo
spop    STA stka      . Shranimo A
        LDA sp          . Zmanjšamo sp
        SUB #3
        STA sp
        LDA stka      . Obnovimo A
        RSUB



sp      WORD 0
stka    RESW 1
stk     RESW 1000

        END stack
