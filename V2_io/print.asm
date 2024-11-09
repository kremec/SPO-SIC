prog    START 0

        LDCH   #83      . S
        WD     out

        LDCH   #73      . I
        WD     out

        LDCH   #67      . C
        WD     out

        LDCH   #47      . /
        WD     out

        LDCH   #88      . X
        WD     out

        LDCH   #69      . E
        WD     out

        LDCH   #10      . \n
        WD     out

halt    J halt



out     WORD X'AA'
        END prog