(START)
    @R1
    M = 0
    @20496
    D = A
    @R13
    M = D
    (LOOP1)
        @24576
        D = M
        @49
        D = D - A
        @INVADER1
        D;JEQ
        @24576
        D = M
        @50
        D = D - A
        @INVADER2
        D;JEQ
        @24576
        D = M
        @51
        D = D - A
        @INVADER3
        D;JEQ
        @24576
        D = M
        @52
        D = D - A
        @INVADER4
        D;JEQ
        @24576
        D = M
        @53
        D = D - A
        @INVADER5
        D;JEQ
        @24576
        D = M
        @54
        D = D - A
        @INVADER6
        D;JEQ
        @24576
        D = M
        @55
        D = D - A
        @INVADER7
        D;JEQ
        @24576
        D = M
        @56
        D = D - A
        @INVADER8
        D;JEQ
        @24576
        D = M
        @57
        D = D - A
        @INVADER9
        D;JEQ
        @24576
        D = M
        @48
        D = D - A
        @INVADER10
        D;JEQ
        @R1
        D = M
        @16384
        A = A + D
        M = 0
        @R1
        M = M + 1
        D = M
        @8192
        D = D - A
        @LOOP1
        D;JLT
    @START
    0;JMP
(INVADER1)
    @20490
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER2)
    @20491
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER3)
    @20492
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER4)
    @20493
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER5)
    @20494
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER6)
    @20495
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER7)
    @20496
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER8)
    @20497
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER9)
    @20498
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER10)
    @20499
    D = A
    @R13
    M = D
    @INVADER
    0;JMP
(INVADER)
    @R1 // COntador de loop
    M = 0
    @R2 // ROw en la que va el triangulo, multiplos de 32
    M = 0
    @5
    D = A
    @R3 // Lo que se le debe asignar a cada 16-bit word
    M = D
    @260
    D = A
    @R5
    M = D
    @136
    D = A
    @R6
    M = D
    @508
    D = A
    @R7
    M = D
    @886
    D = A
    @R8
    M = D
    @2047
    D = A
    @R9
    M = D
    @1533
    D = A
    @R10
    M = D
    @1285
    D = A
    @R11
    M = D
    @216
    D = A
    @R12
    M = D
    (LOOP2)
        @24576
        D = M
        @START
        D;JEQ
        @R2
        D = M
        @R13
        D = M + D
        @R4 // POsicion de la pantalla a rellenar
        M = D
        @R3
        A = M
        D = M
        @R4
        A = M
        M = D
        @R3
        M = M + 1
        @R2
        D = M
        @32
        D = D + A
        @R2
        M = D
        @R1
        M = M + 1
        D = M
        @8
        D = D - A
        @LOOP2
        D;JLT
    @START
    0;JMP