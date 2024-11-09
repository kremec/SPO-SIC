prog    START 0

        J loop


halt    J halt

loop    RD #0
        WD #1
        J loop


        END prog