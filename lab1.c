/********************************* 
* Author: Sarah Simbulan
* I pledge my honor that I have abided by the Stevens Honor System.
* Date: 09/12/2024
**********************************/



#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

void display(int8_t bit) {
    putchar(bit + 48);
}

void display_32(int32_t num) {
    
    for (int i = 31; i >= 0; i--) {
        display(num >> i & 1); 
    }

}

int main(int argc, char const *argv[]) {
    display_32(382);
    return 0;
}