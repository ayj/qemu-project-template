#include <common.h>

uint32_t two_count = 0;

void two_reset(void)
{
    two_count = 0;
}

void two_add(uint32_t n)
{
    two_count += n;
}

uint32_t two_get(void)
{
    return two_count;
}
