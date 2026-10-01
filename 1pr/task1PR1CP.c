#include <stdio.h>

int main(void) {
    unsigned long long n;
    printf("Enter a natural number: ");
    if (scanf("%llu", &n) != 1 || n == 0) {
        printf("Invalid input!\n");
        return 1;
    }

    unsigned long long temp = n;
    while (temp >= 10) {
        temp /= 10;
    }

    printf("The first digit of %llu is %llu\n", n, temp);
    return 0;
}