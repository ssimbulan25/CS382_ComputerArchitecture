#include <stdio.h>

/*
   Name: Sarah Simbulan
   Pledge: I pledge my honor that I have abided by the Stevens Honor System.
   Algorithim: Bubble Sort
   I do not want to be considered for extra credit. 
*/

/*
uses goto statements to copy each character from src to the dst string, one by one.
*/
void copy_str(char* src, char* dst) {
    int i = 0; 

    L2: if(src[i] == '\0' || src == NULL || dst == NULL) {
            goto L3;
    }
        dst[i] = src[i];
        i++;
        goto L2;
    L3: 
}
 
/*
takes integers from the char vector and produces the dot product of the two vectors
*/
int dot_prod(char* vec_a, char* vec_b, int length, int size_elem) {
    int result = 0; 
    int counter = 0; 
    L3: if(counter < length) {
        goto L1; 
    } else {
        goto L2; 
    }
    L1: 
        result += *(int*)(vec_a + (counter * size_elem)) * *(int*)(vec_b + (counter * size_elem));
        counter++; 
        goto L3;

    L2: return result; 
}

/*
sorts the nibbles of the array of integers in ascending order
*/
void sort_nib(int* arr, int length) {
    /*
    puts int array into char array by nibble of data
    */
    char nibs[length * 8]; 
    int c1 = 0;
    if(arr == NULL || length < 0) {
        return;
    }
        for(int i = 0; i < length; i++) {
            for(int j = 7; j >= 0; j--) {
                nibs[c1] = 0; 
                nibs[c1] = arr[i] >> (j * 4) & 0xF;
                c1++;
            }
        }
    /*
    bubble sort algorithim to sort numbers
    */

    for(int i = 0; i < (length * 8 - 1); i++) {
        for(int j = 0; j < (length * 8 - i - 1); j++) {
            if(nibs[j] > nibs[j+1]) {
                char temp = nibs[j]; 
                nibs[j] = nibs[j + 1]; 
                nibs[j+1] = temp; 
            }
        }
    }
    /*
    puts nibble array back into int array form.
    */
    int c2 = 0;
    for(int i = 0; i < length; i++) {
        arr[i] = 0;
        for(int j = 7; j >= 0; j--) {
            arr[i] += (nibs[c2] | 0x0) << (j * 4);
            c2++;
    }
    }
}


int main(int argc, char** argv) {

    /**
     * Task 1
     */

    char str1[] = "382 is the best!";
    char str2[100] = {0};

    copy_str(str1,str2);
    puts(str1);
    puts(str2);

    /**
     * Task 2
     */

    int vec_a[] = {};
    int vec_b[] = {};
    int dot = dot_prod((char*)vec_a, (char*)vec_b, 3, sizeof(int));
    
    printf("%d\n",dot);

    /**
     * Task 3
     */

    int arr[3] = {0x12BFDA09, 0x9089CDBA, 0x56788910};


    sort_nib(arr, 0);
    for(int i = 0; i<3; i++) {
        printf("0x%x ", arr[i]);
    }
    puts(" ");

    return 0;
}