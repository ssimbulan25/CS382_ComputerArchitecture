/**
 * Name: Sarah Simbulan
 * Pledge: I pledge my honor that I have abided by the Stevens Honor System.
*/

.text
.global _start

_start:
    ADR X2, src_str     // loads address of source string into X0
    ADR X1, dst_str     // loads address of dst string into X1
    MOV X3, 0           // X2 holds counter for loop
loop: 
    LDRB W4, [X2, X3]   // loads character from string with the offset in X3 into W4
    STRB W4, [X1, X3]   // stores the character in W4 to the position in the dst string
    ADD X3, X3, 1       // adds 1 to the counter
    CBNZ W4, loop       // compares counter to 0 and branches to the beginning of the loop if not
    MOV X0, 1           // moves system call 1 to X0 for printing
    MOV X2, X3          // moves counter into X2 for length 
    MOV X8, 64          // stores system call 64 in X8
    SVC 0               // invoke syscall
    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall

    
