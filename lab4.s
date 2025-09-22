// Name: Sarah Simbulan
// Pledge: I pledge my honor that I have abided by the Stevens Honor System.

.text
.global _start
_start:  
    ADR X3, vec1    //loads address of vec1 into X3
    ADR X4, vec2    //loads address of vec2 into X4
    ADR X5, dot     //loads address of dot into X5

    LDR X6, [X3, 0]    //loads data from vec1[0] into X6
    LDR X7, [X4, 0]    //loads data from vec2[0] into X7
    MUL X8, X6, X7     //multiplies vec1[0] and vec2[0] and stores in X8

    LDR X6, [X3, 8]    //loads vec1[1] into X6
    LDR X7, [X4, 8]    //loads vec2[1] into X7
    MUL X9, X6, X7     //multiplies X6, X7 and stores result in X9

    LDR X6, [X3, 16]    //loads vec1[2] into X6
    LDR X7, [X4, 16]    //loads vec2[2] into X7
    MUL X10, X6, X7     //multiplies X6, X7 and stores result in X10

    ADD X11, X8, X9       //stores sum of X8 and X9 in X11
    ADD X11, X11, X10     //stores sum of X11 and X10 in X11
    STR X11, [X5, 0]     //stores the value of X11 (dot product) into the address at X5

    MOV X0, 0       //move 0 to X0
    MOV X8, 93      //move 93 to X8
    SVC 0           //System call 0

.data
vec1: .quad 10, 20, 30
vec2: .quad 1, 2, 3
dot: .quad 0
