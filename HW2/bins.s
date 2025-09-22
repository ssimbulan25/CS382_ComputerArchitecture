/**
 * Name: Sarah Simbulan
 * Pledge: I pledge my honor that I have abided by the Stevens Honor System.
*/


.text
.global _start

_start:
    ADR X1, arr     // load address of arr into X1
    ADR X2, length  // load address of length into X2
    ADR X3, target  // load address of the target into X3
    LDR X2, [X2]  // load value of length into X2
    SUB X2, X2, 1   // subtract length value by 1
    LDR X3, [X3]  // load value of target into X3 

loop:
    LDR X10, [X1]   // loads value of first value in the array
    LDR X11, [X1, X2]   // load value of arr[5] into X11
    CMP X3, X10     // compare target and beginning value
    B.EQ yes        // branch to yes if equal
    CMP X3, X11     // compare target and end value
    B.EQ yes        // branch to no if equal
    LSR X2, X2, 1   // right shift length to divide by 2
    CBZ X2, no      // checks if the length is zero 
    MOV X7, 8       // stores 8 into X7
    MUL X4, X2, X7   // multiply X2 by 8 to get address offset
    LDR X5, [X1, X4]    // load the value of the array[i] into X5
    CMP X3, X5      // compare target and value
    B.EQ yes        // compare if they are equal, branch yes
    B.LT loop       // repeats loop if target is less than new midpoint
    B.GT more       // if more than, branch to more 
more: 
    ADD X1, X1, X4  // add offset to the address of arr
    ADD X1, X1, 8   // add another 8 to get the value after midpoint
    B loop          // branch to the beginning of the loop
yes: 
    MOV X0, 1       // move 1 to X0 for print
    ADR X1, msg1    // load address of success message into X1
    MOV X2, 24      // move length of msg1 into X2
    MOV X8, 64      // move system call 64 to X8
    SVC 0           // Invoke syscall
    B exit          // exit 
no:    
    MOV X0, 1       // move 1 to X0 for print
    ADR X1, msg2    // load address of fail message into X1
    MOV X2, 28      // move length of msg2 into X2
    MOV X8, 64      // move system call 64 to X8
    SVC 0           // Invoke syscall
    B exit          // exit
exit: 
    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall



    









/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */