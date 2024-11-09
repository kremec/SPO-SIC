prog    START  0

        LDS x
        LDB x

        .a0
        LDT a0

        .a1
        LDA a1
        MULR B,A
        ADDR A,T

        .a2
        LDA a2
        MULR S,B
        MULR B,A
        ADDR A,T

        .a3
        LDA a3
        MULR S,B
        MULR B,A
        ADDR A,T

        .a4
        LDA a4
        MULR S,B
        MULR B,A
        ADDR A,T

halt    J halt



x       WORD 2
a0      WORD 5
a1      WORD 4
a2      WORD 3
a3      WORD 2
a4      WORD 1
        END prog