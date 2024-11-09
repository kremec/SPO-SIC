prog    START  0

        LDS x
        LDT y

        .sum
        RMO S,A
        ADDR T,A
        STA sum

        .diff
        RMO S,A
        SUBR T,A
        STA diff

        .prod
        RMO S,A
        MULR T,A
        STA prod

        .quot
        RMO S,A
        DIVR T,A
        STA quot

        .rem
        RMO S,A
        DIVR T,A
        MULR T,A
        SUBR A,S
        STS rem

halt    J halt



x       WORD 15
y       WORD 6
sum     RESW 1
diff    RESW 1
prod    RESW 1
quot    RESW 1
rem     RESW 1
        END prog