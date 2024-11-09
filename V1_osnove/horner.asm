prog    START  0

        LDS x
        LDT a4

        MULR S,T
        LDA a3
        ADDR A,T

        MULR S,T
        LDA a2
        ADDR A,T

        MULR S,T
        LDA a1
        ADDR A,T

        MULR S,T
        LDA a0
        ADDR A,T

halt    J halt



x       WORD 2
a0      WORD 5
a1      WORD 4
a2      WORD 3
a3      WORD 2
a4      WORD 1
        END prog