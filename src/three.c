#include <common.h>

uint32_t three_count = 0;

void three_reset(void)
{
    three_count = 0;
}

void three_add(uint32_t n)
{
    three_count += n;
}

uint32_t three_get(void)
{
    return three_count;
}

