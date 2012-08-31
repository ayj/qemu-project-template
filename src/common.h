#include <inttypes.h>
#include <stdbool.h>

static inline uint32_t ioread32(uint32_t addr)
{
    return *(volatile uint32_t*)(addr);
}

static inline void iowrite32(uint32_t addr, uint32_t value)
{
    *(volatile uint32_t*)addr = value;
}

