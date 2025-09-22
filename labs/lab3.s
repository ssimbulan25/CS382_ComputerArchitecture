// Name: Sarah Simbulan
// Pledge: I pledge my honor that I have abided by the Stevens Honor System.
.text
.global _start
_start:             // starting point
    MOV X0, 1       // stores destination for printing
    ADR X1, msg     // stores the address of the string in X1
    ADR X3, length  // stores address of the string's length in X3
    LDR X2, [X3]    // loads the value of the address in X3 in X2
    MOV X8, 64      // puts system call 64 in X8
    SVC 0           // system call 0
    MOV X0, 0       //move 0 to X0
    MOV X8, 93      //move 93 to X8
    SVC 0           //System call 0
.data
msg: .string "Hello World!\n"
length: .quad 13
