
/*  Name:   Sarah Simbulan
    Pledge: I pledge my honor that I have abided by the Stevens Honor System.
 */

.global concat_array

concat_array:
   SUB sp, sp, 48       // allocate space on stack
   STR X30, [sp]        // store return address for pringle onto stack
   STR X19, [sp, 8]     // store X19 on stack
   MOV X19, X0          //  move address of original string to callee register
   STR X20, [sp, 16]    // store X20 on stack
   MOV X20, 0           // counter for string offset in X20
   STR X21, [sp, 24]    // store X21 on stack
   MOV X21, X1          // move parameter value into callee to save the value
   SUB X21, X21, 1      // subtract 1 from length for 0 indexing
   STR X22, [sp, 32]    // store X22 on stack
   MOV X22, 0           // store integer offset in callee register
   STR X23, [sp, 40]    // store X23 on stack
   ADR X23, concat_array_outstr  // store address of outstring
   MOV X7, 0            // counter for string offset to clear
   B clear              // loops through outstring to ensure it's empty
loop1: 
   LDR X0, [X19, X22]    // load integer value
   BL itoascii          // call integer to ascii function
   MOV X2, 0            // counter for second loop
loop2: 
   LDRB W3, [X0, X2]    // load digit from itoascii
   CBZ W3, exitloop2    // if null pointer is reached, exit loop2
   STRB W3, [X23, X20]  // store digit in the outstring exit the loop
   ADD X20, X20, 1      // increase string offset by 1
   ADD X2, X2, 1        // increase second loop counter by 1
   B loop2
exitloop2:
   MOV X4, 32           // ascii value for space
   STR X4, [X23, X20]   // store space into outstring after last digit
   ADD X20, X20, 1      // increment counter for next interation
   CBZ X21, exitloop1   // if length is 0, exit the loop
   SUB X21, X21, 1      // decrease length by 1
   ADD X22, X22, 8      // store offset for next integer in the array
   B loop1              // branch back to loop1
exitloop1:
   STRB WZR, [X23, X20] // store null pointer in the space after the last digit
   MOV X0, X23          // move outstring address into X0 to return

   LDR X30, [sp]        // load return address for pringle back to X30
   LDR X19, [sp, 8]     // restore X19 to original value
   LDR X20, [sp, 16]    // restore X20 to original value
   LDR X21, [sp, 24]    // restore X21 to original value
   LDR X22, [sp, 32]    // restore X22 to original value
   LDR X23, [sp, 40]    // restore X23 to original value
   ADD sp, sp, 48       // deallocate the stack space
   RET                  // return address of outstring

clear: 
   LDRB W8, [X23, X7]   // load value from outstring
   CBZ W8, loop1        // if value is null, proceed to rest of the function
   STRB WZR, [X23, X7]  // replace value with null pointer
   ADD X7, X7, 1        // increase string offset by 1
   B clear              // repeat until string is empty



.data
    /* Put the converted string into concat_array_outstrer,
       and return the address of concat_array_outstr */
    concat_array_outstr:  .fill 1024, 1, 0

