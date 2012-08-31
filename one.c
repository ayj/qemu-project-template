#include <common.h>

uint32_t one_count = 1;

void one_reset(void)
{
    one_count = 0;
}

void one_add(uint32_t n)
{
    one_count += n;
}

uint32_t one_get(void)
{
    return one_count;
}
