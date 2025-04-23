#include <stdio.h>
#include <assert.h>

int last_element(int elements[], size_t size);


int main()
{
    int elements[] = {1,2,3,4,9,13};

    int last = last_element(
        elements,
        sizeof(elements) / sizeof(elements[0])
    );

    assert(last == 13);

    return 0;
}


int last_element(int elements[], size_t size)
{
    return elements[size -1];
}
