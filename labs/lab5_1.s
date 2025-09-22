// Name: Sarah Simbulan
// Partner's name if any:
// Pledge: I pledge my honor that I have abided by the Stevens Honor System.

.text
.global _start

_start:
    ADR X1, side_a  // loads address of side_a into X1
    ADR X2, side_b  // loads address of side_b into X2
    ADR X3, side_c   // loads address of side_c into X3

    LDR X1, [X1]    // overwrites value of side_a into X1
    LDR X2, [X2]    // overwrites value of side_b into X2
    LDR X3, [X3]    // overwrites value of side_c into X3

    MUL X1, X1, X1  // overwrites value of X1 with a^2
    MUL X2, X2, X2  // overwrites value of X2 with b^2
    MUL X3, X3, X3  // overwrites value of X3 with c^2

    ADD X4, X1, X2  // stores sum of a^2 and b^2 in X4
    SUB X5, X3, X4  // stores difference of a^2 + b^2 and c^2
    MOV X0, 1       // stores system call to print in X0
    CBZ X5, y       // branches to y if X5 is zero
    CBNZ X5, n      // branches to n if X6 is not zero

y: 
    ADR X1, yes     // stores address of yes message in X1
    ADR X2, len_yes // stores address of the length of the message in X2
    LDR X2, [X2]    // loads the value of the length into X2
    MOV X8, 64      // puts system call 64 in X8
    SVC 0           // system call 0
    B end           // branches to the end code

n: 
    ADR X1, no      // stores address of no message in X1
    ADR X2, len_no  // stores address of the length of the message in X2
    LDR X2, [X2]    // laods the value of the length in to X2
    MOV X8, 64      // puts system call 64 in X8
    SVC 0           // system call 0
    B end           // branches to the end code

end: 
    MOV X0, 0       //move 0 to X0
    MOV X8, 93      //move 93 to X8
    SVC 0           //System call 0

.data
    side_a: .quad 3
    side_b: .quad 4
    side_c: .quad 5
    yes: .string "It is a right triangle.\n"
    len_yes: .quad . - yes // Calculate the length of string yes
    no: .string "It is not a right triangle.\n"
    len_no: .quad . - no // Calculate the length of string no
