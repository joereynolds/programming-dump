#include <stdio.h>
#include <assert.h>

void reverse (int list[], size_t size);

int main()
{

    int elements[] = {1,3,5,7,9};
    int size = sizeof(elements) / sizeof(elements[0]);

    reverse(elements, size);

    assert(elements[0] == 9);
    assert(elements[1] == 7);
    assert(elements[2] == 5);
    assert(elements[3] == 3);
    assert(elements[4] == 1);

    return 0;
}

void reverse (int list[], size_t size)
{
    int start = 0;
    int end = size - 1;

    while (start < end) {
        int temp = list[start];
        list[start] = list[end];
        list[end] = temp;
        start++;
        end--;
    }
}
