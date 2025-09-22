
/*  Name: Sarah Simbulan
    Pledge: I pledge my honor that I have abided by the Stevens Honor System.
 */

.text
.global count_specs


count_specs:
    MOV X1, 0       // establish counter for string offset
    MOV X2, 0       // counter for specifiers
    MOV X4, 37      // ASCII value for %
    MOV X5, 97      // ASCII value for a
loop: 
    LDRB W3, [X0, X1]   // load character into X3 to compare
    CBZ X3, exit    // if you reach the null pointer, exit loop
    ADD X1, X1, 1   // increase the string offset by 1
    CMP X3, X4      // check if character is the beginning of the specifier
    B.EQ checkA     // branch to check if the immediate next character is a
    B loop          // branch back to the loop to check the next character
checkA: 
    LDRB W3, [X0, X1]   // load the next character into X3
    ADD X1, X1, 1       // change string offset for next iteration
    CMP X3, X5          // check if character is a
    B.NE loop           // move on if not a
    ADD X2, X2, 1       // if equal to a, increment counter by 1 
    B loop              // return to loop
exit: 
    MOV X0, X2          // move specifier count to X0 to return
    RET                 // return to main function



/*
    Declare .data here if you need.
*/

