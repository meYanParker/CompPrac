#include <stdio.h>
#include "io_array.h"
#include "process_array.h"

#define SIZE 26

int main(void) {
    int m[SIZE];
    printf("Enter %d elements for array M:\n", SIZE);
    inputArray(m, SIZE);

    int newSize = removeFirstPositive(m, SIZE);// обрезка с новым размером 

    printf("Result array M:\n");
    printArray(m, newSize);
    return 0;
}