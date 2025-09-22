/**
 * Name: Sarah Simbulan
 * Pledge: I pledge my honor that I have abided by the Stevens Honor System.
 */

.text
.global _start

_start:
    ADR X0, numstr  // store address of numstr in X0
    ADR X1, number  // store address of number in X1
    MOV X2, 0       // X2 holds counter (later used to hold powers)
    MOV X6, 10      // X6 holds 10  
    MOV X7, 1       // will later hold the multiplier for the integers
    MOV X8, 0       // counter for string offset
    MOV X9, 0        // holds final integer result
loop1: 
    LDRB W3, [X0, X2]   // load character into X3
    ADD X2, X2, 1       // increment counter by 1
    CBNZ X3, loop1       // if X3 does not have null pointer, run loop again
    SUB X2, X2, 2      // subtract 2 from the X4 to hold the index/powers
    MOV X5, 0          // new counter for powers
loop2: 
    CMP X5, X2         // compares the two counters
    B.EQ loop3         // if equal, loop2 stops running and X7 holds the correct power of 10
    MUL X7, X7, X6     // multiplies value in X7 by 10
    ADD X5, X5, 1      // increments counter by 1
    B loop2            // repeat process until power counter equals X2
loop3: 
    LDRB W10, [X0, X8]  // loads character[i] into W10
    SUB W10, W10, 48    // converts ASCII to integer
    MUL X11, X10, X7    // multiply value in W10 by X7
    ADD X9, X9, X11     // add value in X11 into result register
    CBZ X2, end         // check if power is 0
    ADD X8, X8, 1       // increment offset counter by 1
    MOV X7, 1           // reset multiplier for integers
    MOV X5, 0           // reset power counter
    SUB X2, X2, 1       // subtract powers by 1
    B loop2             // branch back to loop2
end: 
    STR X9, [X1]        // store the integer in the result in the int variable






/* Add your code here */

/* Do not change any part of the following code */
exit:
    MOV  X0, 1
    ADR  X1, number
    MOV  X2, 8
    MOV  X8, 64
    SVC  0
    MOV  X0, 0
    MOV  X8, 93
    SVC  0
    /* End of the code. */


/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */






