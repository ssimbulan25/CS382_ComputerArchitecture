
/*  
    Name: Sarah Simbulan
    Pledge: I plege my honor that I have abided by the Stevens Honor System.
 */

.global itoascii

itoascii:
   ADR X1, buffer // stores address of buffer
   MOV X2, 10     // stores 10 for dividing and multiplying
   MOV X3, 0      // stores counter for integer length
   MOV X7, 0      // stores counter for string address offset
   MOV X4, X0     // moves a copy of the integer into X4 to count length
loop1: 
   UDIV X4, X4, X2   // divides passed integer by 10
   CBZ X4, loop2    // if the value of the quotient is 0, exit the loop
   ADD X3, X3, 1     // increments length counter by 1
   B loop1           // repeats loop1 until quotient equals 0
loop2:
   CBZ X3, exitloop2
   MOV X5, X3     // copy the value of the integer length counter into X5
   MOV X6, 1     // move 1 into X6
loop3:
   MUL X6, X6, X2     // multiply value in X6 by 10
   SUB X5, X5, 1  // decrease the counter in X5 by 1
   CBZ X5, exitloop3  // exits loop3 if X5 is zero
   B loop3            // repeat loop3 (calculating powers of 10)
exitloop3: 
   SUB X3, X3, 1  // decrease overall length by 1
   UDIV X8, X0, X6   // divides integer by power of 10 in X6 to get the corresponding digit
   ADD X9, X8, 48    // convert digit to ASCII
   STRB W9, [X1, X7]   // store digit string in buffer address
   ADD X7, X7, 1        // increment string counter by 1
   MUL X8, X8, X6       // get value of digit with correct base 10 weight value
   SUB X0, X0, X8       // subtract the accounted for value from the original passed value
   CBZ X3, exitloop2 // if overall length reaches 0, exit loop
   B loop2           // loop back to repeat the process for the rest of the integer
exitloop2: 
   ADD W0, W0, 48    // convert the last digit to ASCII
   STRB W0, [X1, X7]    // stores the last digit
   ADD X7, X7, 1     // increment string counter by one more for null pointer
   STRB WZR, [X1, X7]   // store null pointer in the final position
   MOV X0, X1           // move address of buffer into X0 to return
   RET                  // return to main           

.data
    /* Put the converted string into buffer,
       and return the address of buffer */
    buffer: .fill 128, 1, 0


