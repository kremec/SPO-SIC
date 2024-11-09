prog    START  0

        .sum
        LDA x
        ADD y
        STA sum

        .diff
        LDA x
        SUB y
        STA diff

        .prod
        LDA x
        MUL y
        STA prod

        .quot
        LDA x
        DIV y
        STA quot

        .rem
        LDA y
        MUL quot
        STA temp
        LDA x
        SUB temp
        STA rem

halt    J halt



temp    RESW 1
x       WORD 9
y       WORD 4
sum     RESW 1
diff    RESW 1
prod    RESW 1
quot    RESW 1
rem     RESW 1
        END prog