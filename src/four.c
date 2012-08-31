#include <common.h>

uint32_t four_count = 0;

void four_reset(void)
{
    four_count = 0;
}

void four_add(uint32_t n)
{
    four_count += n;
}

uint32_t four_get(void)
{
    return four_count;
}

