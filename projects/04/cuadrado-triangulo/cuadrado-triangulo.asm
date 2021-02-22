(START)
    @24576
    D = M
    @84
    D = D - A
    @TRIANGLE
    D;JEQ
    @24576
    D = M
    @67
    D = D - A
    @SQUARE
    D;JEQ
    @R1
    M = 0
    (LOOP1)
        @24576
        D = M
        @84
        D = D - A
        @TRIANGLE
        D;JEQ
        @24576
        D = M
        @67
        D = D - A
        @SQUARE
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
(TRIANGLE)
    @R1 // Contador de Loop
    M = 0
    @R2 // Row en la que va el triangulo, multiplos de 32
    M = 0
    @R3 // Lo que se le debe asignar a cada 16-bit word
    M = 0
    (LOOP2)
        @24576
        D = M
        @START
        D;JEQ
        @24576
        D = M
        @67
        D = D - A
        @SQUARE
        D;JEQ
        @R2
        D = M
        @20496
        D = A + D
        @R4 // POsicion de la pantalla a rellenar
        M = D
        @R3
        D = M
        @R4
        A = M
        M = D
        @R3
        D = M
        D = D + M
        D = D + 1
        M = D
        @R2
        D = M
        @32
        D = D + A
        @R2
        M = D
        @R1
        M = M + 1
        D = M
        @16
        D = D - A
        @LOOP2
        D;JLT
    @R1 // Contador de LOOP
    M = 0
    @R2 // Row en la que va el cuadrado
    M = 0
    (LOOP3)
        @24576
        D = M
        @67
        D = D - A
        @SQUARE
        D;JEQ
        @24576
        D = M
        @START
        D;JEQ
        @R2
        D = M
        @21008
        A = A + D
        M = -1
        @R2
        D = M
        @32
        D = D + A
        @R2
        M = D
        @R1
        M = M + 1
        D = M
        @16
        D = D - A
        @LOOP3
        D;JLT
    @R1 // Contador de Loop
    M = 0
    @R2 // Row en la que va el triangulo, multiplos de 32
    M = 0
    @R3 // Lo que se le debe asignar a cada 16-bit word
    M = 0
    (LOOP4)
        @24576
        D = M
        @START
        D;JEQ
        @24576
        D = M
        @67
        D = D - A
        @SQUARE
        D;JEQ
        @R2
        D = M
        @21009
        D = A + D
        @R4 // POsicion de la pantalla a rellenar
        M = D
        @R3
        D = M
        @R4
        A = M
        M = D
        @R3
        D = M
        D = D + M
        D = D + 1
        M = D
        @R2
        D = M
        @32
        D = D + A
        @R2
        M = D
        @R1
        M = M + 1
        D = M
        @16
        D = D - A
        @LOOP4
        D;JLT
    @START
    0;JMP
(SQUARE)
    @R1 // Contador de LOOP
    M = 0
    @R2 // Row en la que va el cuadrado
    M = 0
    (LOOP5)
        @24576
        D = M
        @84
        D = D - A
        @TRIANGLE
        D;JEQ
        @24576
        D = M
        @START
        D;JEQ
        @R2
        D = M
        @20496
        A = A + D
        M = -1
        A = A + 1
        M = - 1
        @R2
        D = M
        @32
        D = D + A
        @R2
        M = D
        @R1
        M = M + 1
        D = M
        @16
        D = D - A
        @LOOP5
        D;JLT
    @R1 // Contador de LOOP
    M = 0
    @R2 // Row en la que va el cuadrado
    M = 0
    (LOOP6)
        @24576
        D = M
        @84
        D = D - A
        @TRIANGLE
        D;JEQ
        @24576
        D = M
        @START
        D;JEQ
        @R2
        D = M
        @21008
        A = A + D
        M = -1
        A = A + 1
        M = -1
        @R2
        D = M
        @32
        D = D + A
        @R2
        M = D
        @R1
        M = M + 1
        D = M
        @16
        D = D - A
        @LOOP6
        D;JLT
    @START
    0;JMP