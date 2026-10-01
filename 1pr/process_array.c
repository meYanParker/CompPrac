#include "process_array.h"
// сдвиг элементов влево для удаления первого числа > 0
int removeFirstPositive(int *arr, int size) {
    int index = -1;
    for (int i = 0; i < size; i++) {
        if (arr[i] > 0) {
            index = i;
            break;
        }
    }
    if (index != -1) {
        for (int i = index; i < size - 1; i++) {
            arr[i] = arr[i + 1];
        }
        return size - 1; // Возвращаем новый размер массива
    }

    return size; // Если положительных не было, размер прежний
}
//четные в квадрат, нечетные умножить на 2
void changAndDel(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        if (arr[i] % 2 == 0) {
            arr[i] = arr[i] * arr[i];
        } else {
            arr[i] = arr[i] * 2;
        }
    }
}