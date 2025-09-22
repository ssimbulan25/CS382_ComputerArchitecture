/**
Name: Sarah Simbulan
Partner (if any):
Pledge: I pledge my honor that I have abided by the Stevens Honor System. 
 */


#include <stdio.h>
#include <stdlib.h>

void int_to_nibble(int intarr[], int nint, unsigned char nibarr[], int nnibs) {
    int counter = 0;
        for(int i = 0; i < nint; i++) {
            for(int j = 7; j >= 0; j--) {
                nibarr[counter] = intarr[i] >> (j * 4) & 0xF;
                counter++;
            }
        }
}

int main(int argc, char const *argv[]) {
    int arr[3] = {0x12BFDA09, 0x9089CDBA, 0x56788910};
    unsigned char nibs[24] = {0}; // Initialize all elements to 0;
    int_to_nibble(arr, 3, nibs, 24);
    for (int i = 0; i < 24; i ++) printf("%1hhX ", nibs[i]); // Print each nibble in hex
    return 0;
}