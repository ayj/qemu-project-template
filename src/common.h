#include <inttypes.h>
#include <stdbool.h>

static inline uint32_t ioread32(volatile uint32_t *addr)
{
    return (uint32_t)(*addr);
}

static inline void iowrite32(volatile uint32_t *addr, uint32_t value)
{
    *addr = value;
}

