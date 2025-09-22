// Name: Sarah Simbulan
// Partner's name if any:
// Pledge: I pledge my honor that I have abided by the Stevens Honor System.


.text
.global _start
.extern scanf

_start:
    
    ADR   X0, fmt_str   // Load address of formated string
    ADR   X1, left      // Load &left
    ADR   X2, right     // Load &right
    ADR   X3, target    // Load &target
    BL    scanf         // scanf("%ld %ld %ld", &left, &right, &target);
    ADR   X1, left      // Load &left
    LDR   X1, [X1]      // Store left in X1
    ADR   X2, right     // Load &right
    LDR   X2, [X2]      // Store right in X2
    ADR   X3, target    // Load &target
    LDR   X3, [X3]      // Store target in X3


    CMP X1, X3          // compares values in X1 and X3
    B.EQ n              // if they are equal, branch to n
    B.LT left_yes       // if X1 < X3, go left_yes
    B.GT n              // if X1 > X3 go to n

left_yes: 
    CMP X2, X3          // compare values in X2 and X3
    B.EQ n              // if they are equal, branch to n
    B.GT y              // if X2 > X3, branch to y
    B.LT n

y: 
    MOV X0, 1       // stores print into X0
    ADR X1, yes     // stores address of yes message in X1
    ADR X2, len_yes // stores address of the length of the message in X2
    LDR X2, [X2]    // loads the value of the length into X2
    MOV X8, 64      // puts system call 64 in X8
    SVC 0           // system call 0
    B exit          // branches to the end code

n: 
    MOV X0, 1       // stores print into X0
    ADR X1, no      // stores address of no message in X1
    ADR X2, len_no  // stores address of the length of the message in X2
    LDR X2, [X2]    // laods the value of the length in to X2
    MOV X8, 64      // puts system call 64 in X8
    SVC 0           // system call 0
    B exit          // branches to the end code


exit:
    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall

.data
    left:    .quad     0
    right:   .quad     0
    target:  .quad     0
    fmt_str: .string   "%ld%ld%ld"
    yes:     .string   "Target is in range\n"
    len_yes: .quad     . - yes  // Calculate the length of string yes
    no:      .string   "Target is not in range\n"
    len_no:  .quad     . - no   // Calculate the length of string no

