main    START 0
        EXTREF sinit,spop,spush,sp

        . Inicializacija sklada
        +JSUB sinit

        . Damo 2 vrednosti na sklad
        LDA #1
        +STA @sp
        +JSUB spush
        LDA #2
        +STB @sp
        +JSUB spush

        +JSUB spop
        
        +JSUB spop

halt    J halt

        END main