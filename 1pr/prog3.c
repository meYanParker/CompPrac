#include <stdio.h>
#include "io_array.h"
#include "process_array.h"

#define SIZE 20

int main(void) {
    int a[SIZE];
    printf("Enter %d elements for array A:\n", SIZE);
    inputArray(a, SIZE);

    changAndDel(a, SIZE); //Меняем и выводим
    printf("Result array A:\n");
    printArray(a, SIZE);
    return 0;
}