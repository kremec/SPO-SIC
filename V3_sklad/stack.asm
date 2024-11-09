prog    START 0

        . Inicializacija sklada
        JSUB sinit

        LDA #1      . Damo 2 vrednosti na sklad
        LDA #2
        STA @sp
        JSUB spush
        STB @sp
        JSUB spush

        JSUB spop
        
        JSUB spop

halt    J halt

. Nastavi sp na začetek sklada
sinit   STA stacka      . Shranimo A

        LDA #stack      . sp nastavimo na začetek sklada
        STA sp

        LDA stacka      . Obnovimo A
        RSUB

. Poveča sp za eno besedo
spush   STA stacka      . Shranimo A
        LDA sp          . Povečamo sp
        ADD #3
        STA sp
        LDA stacka      . Obnovimo A
        RSUB

. Zmanjša sp za eno besedo
spop    STA stacka      . Shranimo A
        LDA sp          . Zmanjšamo sp
        SUB #3
        STA sp
        LDA stacka      . Obnovimo A
        RSUB



sp      WORD 0
stacka  RESW 1
stack   RESW 1000

        END prog