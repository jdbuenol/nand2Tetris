// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(START)
    @24576
    D = M
    @FILL
    D;JNE
    @R1
    M = 0
    (LOOP1)
        @24576
        D = M
        @FILL
        D;JNE
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
(FILL)
    @32767
    D = A
    @16384
    M = D
    @R1
    M = 0
    (LOOP2)
        @R1
        D = M
        @16384
        D = A + D
        @R2
        M = D
        @32767
        D = A
        @R2
        M = D
        @R1
        M = M + 1
        D = M
        @8192
        D = D - A
        @LOOP2
        D;JLT
    @START
    0;JMP